package com.muldini.mylook.service;

import java.io.File;
import java.io.InputStream;

import org.json.JSONException;

import com.qiniu.api.auth.AuthException;

public interface UploadService {
    
	boolean uploadFile(String fileName,InputStream in)
			throws AuthException, JSONException;
	
	boolean uploadFile(File file) throws AuthException, JSONException;
	
	String getFileResourceUrl(String filename) throws Exception;
	
	void delete(String fileName);
	
	String qiNiuTransCodeToAny(String fileName, String format);
	
}
