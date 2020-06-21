package com.muldini.mylook.common;

import java.util.Map;

import org.json.simple.JSONObject;

public class ResultUtils {
	
	private ResultUtils(){
		
	}
	
	public final static String jsonValue(boolean isValue){
		JSONObject jsonObj = new JSONObject();
        jsonObj.put("result", isValue);
        String result = jsonObj.toString();
		return result;
	}
	
	public final static String jsonValue(Map<String,Object> resultMap){
	    JSONObject jsonObj = new JSONObject();
	    jsonObj.put("result", resultMap);
	    String result = jsonObj.toString();
	    return result;
	}

}
