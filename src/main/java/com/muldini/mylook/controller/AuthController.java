package com.muldini.mylook.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.muldini.mylook.common.DateUtils;
import com.muldini.mylook.common.ResultUtils;
import com.muldini.mylook.common.StringConstant;
import com.muldini.mylook.common.UserUtils;
import com.muldini.mylook.entity.User;
import com.muldini.mylook.service.AuthService;

@Controller
public class AuthController {
	
	@Autowired
	private Producer producer;
	
	@Autowired
	private AuthService authService;
    
	
	/**
	 * 验证码
	 * @param response
	 * @param session
	 * @throws ServletException
	 * @throws IOException
	 * @author:lianss
	 * @createTime:2020年5月23日 下午8:11:15
	 */
	@RequestMapping(value = "/code.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void captcha(HttpServletResponse response,HttpSession session) throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-store, no-cache");
        response.setContentType("image/jpeg");

        // 生成文字验证码
        String text = producer.createText();
        // 生成图片验证码
        BufferedImage image = producer.createImage(text);
        // 保存到shiro session
        session.setAttribute(Constants.KAPTCHA_SESSION_KEY, text);

        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(image, "jpg", out);
        IOUtils.closeQuietly(out);
        
    }
	
	
	/**
	 * 注册
	 * @param modelMap
	 * @param user
	 * @param confirmPassword
	 * @param authCode
	 * @param session
	 * @param response
	 * @return
	 * @author:lianss
	 * @createTime:2020年5月23日 下午8:11:31
	 */
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String authRegister(ModelMap modelMap, User user, String confirmPassword, String authCode,
			HttpSession session,HttpServletResponse response){
		
		
		String username = user.getUsername();
		String password = user.getPassword();
		String validCode = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
		
		if(validCode == null || validCode.isEmpty()){
			throw new RuntimeException("验证码获取失败");
		}
		
		
		//判断只包含英文,数字和中文
		boolean iscnValid = UserUtils.checkString("^[a-zA-Z0-9\u4E00-\u9FA5]+$", username);
		//判断英文大小写，数字，#?!@$%^&*-]，8-16
		boolean ispwdValid = UserUtils.checkString("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$", password);
		//判断中文
		boolean ispwdValidTwo = UserUtils.checkString("^[^\u4e00-\u9fa5]+$", password);
		//判断是否登陆的变量
		boolean isRegister = true;
		
		
		
		//每局if条件都return "register";虽然能提高效率，但用户体验有点差
		//判断用户名
		if(username == null || username.isEmpty()){
			modelMap.put(StringConstant.REQ_REGISTER_NAME_MSG, "请您输入用户名");
			isRegister = false;
		}else if(username.length() < 6 || username.length() > 8){
			modelMap.put(StringConstant.REQ_REGISTER_NAME_MSG, "用户名的长度要6~12位");
			isRegister = false;
		}else if(!iscnValid){
			modelMap.put(StringConstant.REQ_REGISTER_NAME_MSG, "用户名只包含英文,数字和中文");
			isRegister = false;
		}else{
			modelMap.put(StringConstant.REQ_REGISTER_NAME_MSG, "");
		}
		
		//判断密码
		if(password == null || password.isEmpty()){
			modelMap.put(StringConstant.REQ_REGISTER_PWD_MSG, "请您输入密码");
			isRegister = false;
		}else if(password.length() < 8 || password.length() > 16){
			modelMap.put(StringConstant.REQ_REGISTER_PWD_MSG, "密码的长度要8~16位");
			isRegister = false;
		}else if(!ispwdValid){
			modelMap.put(StringConstant.REQ_REGISTER_PWD_MSG, "密码不符合要求");
			isRegister = false;
		}else if(password.indexOf(" ") != -1){
			modelMap.put(StringConstant.REQ_REGISTER_PWD_MSG, "密码不能包含空格");
			isRegister = false;
		}else if(!ispwdValidTwo){
			modelMap.put(StringConstant.REQ_REGISTER_PWD_MSG, "密码不能包含中文");
			isRegister = false;
		}else{
			modelMap.put(StringConstant.REQ_REGISTER_PWD_MSG, "");
		}
		
		//判断确认密码
		if(confirmPassword == null || confirmPassword.isEmpty()){
			modelMap.put(StringConstant.REQ_REGISTER_CONFIRM_MSG, "请您再次输入密码");
			isRegister = false;
		}else if(!confirmPassword.equals(password)){
			modelMap.put(StringConstant.REQ_REGISTER_CONFIRM_MSG, "密码不一样");
			isRegister = false;
		}else{
			modelMap.put(StringConstant.REQ_REGISTER_CONFIRM_MSG, "");
		}
		
		//判断验证码
		if(authCode == null || authCode.isEmpty()){
			modelMap.put(StringConstant.REQ_REGISTER_CODE_MSG, "请您输入验证码");
			isRegister = false;
		}else if(!validCode.equals(authCode)){
			modelMap.put(StringConstant.REQ_REGISTER_CODE_MSG, "验证码输入有误");
			isRegister = false;
		}else{
			modelMap.put(StringConstant.REQ_REGISTER_CODE_MSG, "");
		}
		
		
		if(isRegister == true){
		    
			user.setCreateTime(DateUtils.getNowTime()); 
			// 调用后台模块保存注册信息
			boolean result = authService.createUser(user);
			if (result) {
				modelMap.put(StringConstant.REQ_REGISTER_SUCCESS_MSG, "注册成功");
			} else {
				modelMap.put(StringConstant.REQ_REGISTER_NAME_MSG, "用户名已存在");
			}
		}
		
		return "register";
	}
	
	
	/**
	 * 注册时用户输入完用户名，ajax请求是否用户名存在
	 * @param modelMap
	 * @param name
	 * @param response
	 * @throws IOException
	 * @author:lianss
	 * @createTime:2020年5月23日 下午8:08:46
	 */
	@RequestMapping(value = "/registerNameCheck.do", method = RequestMethod.GET)
	public void registerNameCheck(ModelMap modelMap,String name,HttpServletResponse response) throws IOException{
		
		List userList = authService.retrieveAllUser();
		boolean isExisted = UserUtils.checkIfFanExists(userList, name);
		String result = ResultUtils.jsonValue(isExisted);
		response.getWriter().write(result);
		return;
	}
	
	
	
    /**
     * 登陆和拦截后的登陆
     * @param medolMap
     * @param user
     * @param session
     * @return 
     * @author:lianss
     * @createTime:2020年5月23日 下午8:03:26
     */
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String authLogin(ModelMap medolMap, User user,HttpSession session){
	    String username = user.getUsername();
	    String password = user.getPassword();
	    
	    boolean isLogin = true;
		
	    if(username == null || username.isEmpty()){
	    	medolMap.put(StringConstant.REQ_LOGIN_NAME_MSG, "请您输入用户名");
	    	isLogin = false;
	    }
	    
	    if(password == null || password.isEmpty()){
	    	medolMap.put(StringConstant.REQ_LOGIN_PWD_MSG, "请您输入密码");
	    	isLogin = false;
	    }
	    
	    Map<String, String> result = null;
	    String status = null;
	    String loginMsg = null;
	    String userId = null;
	    String hobbyId = null;
	    String header = null;
	    
	    if(isLogin == true){
	    	result = authService.login(user);
	    	status = (String) result.get("STATUS_CODE");
		    loginMsg = (String) result.get("MSG");
		    userId = (String) result.get("USERID");
		    hobbyId = (String) result.get("HOBBYID");
		    header = result.get("HEADER");
	    }
	    
	    if("10".equals(status)){
	        
	        medolMap.put(StringConstant.REQ_LOGIN_SUCCESS_MSG, loginMsg);
	        
	        //后面模块需要的用到的session
	    	session.setAttribute(StringConstant.SESSION_LOGIN_STATUS_MSG, status);//登陆状态
	    	session.setAttribute(StringConstant.SESSION_USER_ID, userId);//用户Id
	    	session.setAttribute(StringConstant.SESSION_USER_NAME, username);//用户名
	    	session.setAttribute(StringConstant.SESSION_USER_HOBBYID, hobbyId);//用户的爱好，暂时首页用到
	    	session.setAttribute(StringConstant.SESSION_USER_HEADER, header);//用户的头像
	    	
	    	
	    	String resultPath = (String) session.getAttribute(StringConstant.SESSION_RESULT_PATH);
	    	
	    	String beforePath = (String)session.getAttribute(StringConstant.SESSION_VIDEO_BEFOREPATH);
	    	
	    	//拦截器拦截后，登陆完该返回哪里
	    	if(StringUtils.isNotEmpty(resultPath) && !"login".equals(resultPath) && !"register".equals(resultPath)
	    	        && !"index".equals(resultPath) && !"video".equals(resultPath) && !"hobbyclass".equals(resultPath)){
	    		session.setAttribute(StringConstant.SESSION_RESULT_PATH, "");
	    		return "redirect:" + resultPath;
	    	}else if(StringUtils.isNotEmpty(resultPath) && "hobbyclass".equals(resultPath)){
                session.setAttribute(StringConstant.SESSION_RESULT_PATH, "");
                return "redirect:hobbyclass.do";
            }else if(StringUtils.isNotEmpty(resultPath) && "video".equals(resultPath)){
	    	    session.setAttribute(StringConstant.SESSION_RESULT_PATH, "");
	    	    session.setAttribute(StringConstant.SESSION_VIDEO_BEFOREPATH, "");
	    	    return "redirect:" + beforePath;
	    	}else{
	    	    session.setAttribute(StringConstant.SESSION_RESULT_PATH, "");
	    	    return "redirect:index.do";
	    	}
	    	
	    }else if("11".equals(status)){
	    	medolMap.put(StringConstant.REQ_LOGIN_NAME_MSG, loginMsg);
	    }else if("12".equals(status)){
	    	medolMap.put(StringConstant.REQ_LOGIN_PWD_MSG, loginMsg);
	    }
	    
	    
		return "login";
	}
	
	
	/**
	 * 用户退出登陆
	 * @param session
	 * @param path
	 * @return
	 * @author:lianss
	 * @createTime:2020年5月23日 下午8:07:58
	 */
	@RequestMapping(value = "/signout.do" , method = RequestMethod.GET)
	public String signout(HttpSession session,String path){
	    
	    //清除用户的session
		session.setAttribute(StringConstant.SESSION_LOGIN_STATUS_MSG, "");//登陆状态
        session.setAttribute(StringConstant.SESSION_USER_ID, "");//用户Id
        session.setAttribute(StringConstant.SESSION_USER_NAME, "");//用户名
        session.setAttribute(StringConstant.SESSION_USER_HOBBYID, "");//用户的爱好，暂时首页用到
        session.setAttribute(StringConstant.SESSION_USER_HEADER, "");//用户的头像
        
        
        //当前页面退出
		if("usercore".equals(path) || "index".equals(path)){
		    return "redirect:index.do";
		}else if("hobbyclass".equals(path)){
		    return "redirect:hobbyclass.do";
		}else{
			return "redirect:" + path;
		}
	    
	}

}
