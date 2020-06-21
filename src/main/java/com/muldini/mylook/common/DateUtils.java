package com.muldini.mylook.common;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public final class DateUtils {
	
	private DateUtils(){
		
	}
    
	public final static String getNowTime(){
		
		Calendar calendar = Calendar.getInstance(); 
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowTime = formatter.format(calendar.getTime());
		
		return nowTime;
	}
}
