package com.muldini.mylook.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import com.muldini.mylook.common.ResultUtils;
import com.muldini.mylook.common.StringConstant;
import com.muldini.mylook.common.UserUtils;

/**
 * Servlet Filter implementation class VideoRequireLoginFilter
 */

@WebFilter(urlPatterns = {"/follow.do","/thumbsUp.do", "/collection.do", "/comment.do"})
public class VideoRequireLoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public VideoRequireLoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, 
	        FilterChain chain) throws IOException, ServletException {
	    
	    HttpServletRequest httpReq = (HttpServletRequest) request; // 为用getSession方法
        HttpServletResponse httpResp = (HttpServletResponse) response; // 为用sendRedirect方法
        HttpSession session = httpReq.getSession(false);
        
        String userStatus = (String) session.getAttribute(StringConstant.SESSION_LOGIN_STATUS_MSG);
        String userId = (String) session.getAttribute(StringConstant.SESSION_USER_ID);
        
        String urlString = httpReq.getQueryString();
        
//        String path = UserUtils.resultPath(urlString);
        
        List pathList = UserUtils.resultPathArray(urlString, "&");
        String strOne = UserUtils.resultPath(pathList.get(0).toString());
        String strTwo = ".do?videoId=";
        String strThree = UserUtils.resultPath(pathList.get(1).toString());
        String beforePath = UserUtils.resultString(strOne, strTwo, strThree);
        
        session.setAttribute(StringConstant.SESSION_RESULT_PATH, strOne);
        session.setAttribute(StringConstant.SESSION_VIDEO_BEFOREPATH, beforePath);
        
        if(StringUtils.isEmpty(userStatus)  || !"10".equals(userStatus)){
            String result = ResultUtils.jsonValue(false);
            response.getWriter().write(result);
            return;
        }else{
            session.setAttribute(StringConstant.SESSION_RESULT_PATH, "");
        }
        
        if(StringUtils.isEmpty(userId)){
            String result = ResultUtils.jsonValue(false);
            response.getWriter().write(result);
            return;
        }else{
            session.setAttribute(StringConstant.SESSION_RESULT_PATH, "");
        }
		
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
