package com.muldini.mylook.access;

import java.util.List;

import com.muldini.mylook.entity.User;

public interface AuthMapper {
     
	User retrieveUserByName(String username);
	 
	int createUser(User user);
	 
	List<User> retrieveAllUser();
	
}
