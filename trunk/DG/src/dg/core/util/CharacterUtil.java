package dg.core.util;

import java.util.Random;

/**
 * 字符处理实用工具类
 * 
 * @author Nanlei
 * 
 */
public class CharacterUtil {
	/**
	 * 用于生成随机字符串的方法的简单实现
	 */
	public static String getRandomString(int length) {
		String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			int number = random.nextInt(62);// 返回[0,62)之间的一个随机数
			sb.append(str.charAt(number));
		}
		return sb.toString();
	}

	/**
	 * 用于生成随机字符串的方法
	 */
	public static String getRandomString2(int length) {
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			int number = random.nextInt(3);// //返回[0,3)之间的一个随机数
			long result = 0;
			switch (number) {
			case 0:
				result = Math.round(Math.random() * 25 + 65);// 返回[65,90)之间的一个随机数，然后向上取整
				sb.append(String.valueOf((char) result));// 根据ASCII码生成随机大写字母
				break;
			case 1:
				result = Math.round(Math.random() * 25 + 97);// 返回[97,122)之间的一个随机数，然后向上取整
				sb.append(String.valueOf((char) result));// 根据ASCII码生成随机小写字母
				break;
			case 2:
				sb.append(String.valueOf(new Random().nextInt(10)));// 返回[0,9)之间的一个随机数，然后向上取整
				break;
			}
		}
		return sb.toString();
	}

	/**
	 * 测试方法
	 */
	public static void main(String[] args) {
		System.out.println("Random String(10):" + getRandomString(10));
		System.out.println("Random String(15):" + getRandomString(15));
		System.out.println("Random String2(10):" + getRandomString(10));
		System.out.println("Random String2(15):" + getRandomString2(15));
	}
}
