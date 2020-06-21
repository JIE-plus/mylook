package com.muldini.mylook.service;

import java.util.List;
import java.util.Map;

import com.muldini.mylook.entity.User;

public interface AuthService {
	
	
	boolean createUser(User user);
	
	Map<String, String> login(User user);
	
	List retrieveAllUser();

}
