package neo.core.util;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.ObjectUtils;

public class XmlUtil {
	private static final char[] LT = "&lt;".toCharArray();
	private static final char[] GT = "&gt;".toCharArray();
	private static final char[] AMP = "&amp;".toCharArray();
	private static final char[] QUOT = "&quot;".toCharArray();
	private static final char[] APOS = "&apos;".toCharArray();

	public static String getXmlFromArray(String[] array, String root, String node) {
		StringBuffer sb = new StringBuffer();
		sb.append("<" + root + ">");
		for (int i = 0; i < array.length; i++) {
			sb.append("<" + node + ">");
			sb.append(escapeXml(array[i]));
			sb.append("</" + node + ">");
		}
		sb.append("</" + root + ">");
		return sb.toString();
	}

	/**
	 * 将Map转换为XML，Key作为节点名
	 */
	public static String getXmlFromMap(Map xmlMap, String root) {
		StringBuffer sb = new StringBuffer(128);
		sb.append("<" + root + ">");
		Object key = null;
		Iterator it = xmlMap.keySet().iterator();
		while (it.hasNext()) {
			key = it.next();
			sb.append("<" + key.toString() + ">");
			sb.append("<![CDATA[");
			sb.append(ObjectUtils.defaultIfNull(xmlMap.get(key), "").toString());
			sb.append("]]>");
			sb.append("</" + key.toString() + ">");
		}
		sb.append("</" + root + ">");
		return sb.toString();
	}

	/**
	 * 将List转换为XML
	 */
	public static String getXmlFromList(List xmlList, String root, String item) {
		StringBuffer sb = new StringBuffer(128);
		sb.append("<" + root + ">");
		for (int i = 0; i < xmlList.size(); i++) {
			Object listItem = xmlList.get(i);
			if (listItem instanceof Map) {
				sb.append(getXmlFromMap((Map) listItem, item));
			} else {
				sb.append("<" + item + ">");
				sb.append("<![CDATA[");
				sb.append(ObjectUtils.defaultIfNull(listItem, "").toString());
				sb.append("]]>");
				sb.append("</" + item + ">");
			}
		}
		sb.append("</" + root + ">");
		return sb.toString();
	}

	public static String escapeXml(String text) {
		char[] textChars = text.toCharArray();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < textChars.length; i++) {
			char c = textChars[i];
			switch (c) {
			case '<':
				sb.append(LT, 0, 4);
				break;
			case '>':
				sb.append(GT, 0, 4);
				break;
			case '&':
				sb.append(AMP, 0, 5);
				break;
			case '"':
				sb.append(QUOT, 0, 6);
				break;
			case '\'':
				sb.append(APOS, 0, 6);
				break;
			default:
				sb.append(c);
			}
		}
		return sb.toString();
	}
}
