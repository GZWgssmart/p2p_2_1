package com.p2p.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

	public static final String DEFAULT_PATTERN = "yyyy-MM-dd HH:mm:ss";
	
	public static java.sql.Date convert(Date date) {
		return new java.sql.Date(date.getTime()); 
	}

	public static Date parseDate(String dateStr, String pattern) {
		SimpleDateFormat df = new SimpleDateFormat(pattern);
		try {
			return df.parse(dateStr); 
		} catch (ParseException e) {
			e.printStackTrace();
		} 
		return null;
	}
	
}
