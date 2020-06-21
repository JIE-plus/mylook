package com.muldini.mylook.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.muldini.mylook.access.AuthMapper;
import com.muldini.mylook.entity.User;
import com.muldini.mylook.service.AuthService;

@Service
@Transactional
public final class AuthServiceImpl implements AuthService {
    
	@Autowired
    private AuthMapper authMapper;

	private AuthServiceImpl() {
	}

	@Override
	public boolean createUser(User user) {

		User existingUser = authMapper.retrieveUserByName(user.getUsername());
		if (existingUser == null) {
			authMapper.createUser(user);
		} else {
			return false;
		}

		return true;

	}

	@Transactional(readOnly = true)
	public Map<String, String> login(User user) {
		Map<String, String> result = new HashMap<>();

		User existingUser = authMapper.retrieveUserByName(user.getUsername());

		if (existingUser == null) {
			result.put("STATUS_CODE", "11");
			result.put("MSG", "用户名不存在");
			result.put("USERID", "");
			result.put("HOBBYID", "");
			result.put("HEADER", "");
		} else if (!existingUser.getPassword().equals(user.getPassword())) {
			result.put("STATUS_CODE", "12");
			result.put("MSG", "密码不正确");
			result.put("USERID", "");
			result.put("HOBBYID", "");
			result.put("HEADER", "");
		} else {
			String userId = existingUser.getUserId() + "";
			String hobbyId = existingUser.getHobby().getHobbyId() + "";
			String header = existingUser.getHeader();
			result.put("STATUS_CODE", "10");
			result.put("MSG", "登录成功");
			result.put("USERID", userId);
			result.put("HOBBYID", hobbyId);
			result.put("HEADER", header);
		}

		return result;
	}

	@Transactional(readOnly = true)
	public List retrieveAllUser() {
		List result = null;

		result = authMapper.retrieveAllUser();

		return result;
	}
}
