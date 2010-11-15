package dg.core.util.taobao;

import java.security.MessageDigest;
import java.util.Set;
import java.util.TreeMap;
import java.util.Map.Entry;

import org.apache.commons.lang.StringUtils;

/**
 * 生成淘宝API中的签名密码
 * 
 * @author Nanlei
 * 
 */
public class SignatureGenerator {
	/**
	 * 获取MD5加密结果
	 * 
	 * @param params
	 *            参数集合
	 * @param secret
	 *            申请得到的APP_SECRET
	 * @return
	 */
	public static String getMD5Signature(TreeMap<String, String> params,
			String secret) {
		// 存储签名的StringBuffer
		StringBuilder sign = new StringBuilder();
		// 获取参数的项集合
		Set<Entry<String, String>> paramSet = params.entrySet();
		// 组合要编码的串
		StringBuilder query = new StringBuilder(secret);
		// 遍历参数集合，获取参数值，形式key+value
		for (Entry<String, String> param : paramSet) {
			if (StringUtils.isNotEmpty(param.getKey())
					&& StringUtils.isNotEmpty(param.getValue())) {
				query.append(param.getKey()).append(param.getValue());
			}
		}
		try {
			// 使用MD5加密
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			byte[] bytes = md5.digest(query.toString().getBytes("UTF-8"));
			// 把二进制转化为大写的十六进制
			for (int i = 0; i < bytes.length; i++) {
				String hex = Integer.toHexString(bytes[i] & 0xFF);
				if (hex.length() == 1) {
					sign.append("0");
				}
				sign.append(hex.toUpperCase());
			}
		} catch (Exception e) {
			throw new java.lang.RuntimeException("Signature Generate Error!");
		}
		return sign.toString();
	}
}
