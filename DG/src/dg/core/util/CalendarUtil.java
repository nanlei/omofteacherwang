package dg.core.util;

import java.text.*;
import java.util.*;

/**
 * 用于日期处理的实用类
 * 
 * @author Nanlei
 * 
 */
public class CalendarUtil {
	private static Calendar cal = Calendar.getInstance();

	/**
	 * 返回每周的当前星期1-7对应周日-周六
	 */
	public static int getCurrentWeek() {
		return cal.get(Calendar.DAY_OF_WEEK);
	}

	/**
	 * 返回每天的当前小时
	 */
	public static int getCurrentHour() {
		return cal.get(Calendar.HOUR_OF_DAY);
	}

	/**
	 * 返回当前年份
	 */
	public static int getCurrentYear() {
		return cal.get(Calendar.YEAR);
	}

	/**
	 * 返回当前月份
	 */
	public static int getCurrentMonth() {
		return cal.get(Calendar.MONTH) + 1;
	}

	/**
	 * 返回当前月中的某天
	 */
	public static int getCurrentDay() {
		return cal.get(Calendar.DAY_OF_MONTH);
	}

	/**
	 * 返回当前年份和月份，按yyyyMM
	 */
	public static String getCurrentYearAndMonth() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMM");
		return formatter.format(new Date());
	}

	/**
	 * 返回当前日期，按yyyyMMdd
	 */
	public static String getCurrentDate() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		return formatter.format(new Date());
	}

	/**
	 * 返回当前日期，按yyyy-MM-dd
	 */
	public static String getCurrentUsualDate() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		return formatter.format(new Date());
	}

	/**
	 * 返回当前时间，按yyyyMMddHHmmss
	 */
	public static String getCurrentTime() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		return formatter.format(new Date());
	}

	/**
	 * 返回当前时间，按HH:mm:ss
	 */
	public static String getCurrentDayTime() {
		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
		return formatter.format(new Date());
	}
}
