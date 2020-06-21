package com.muldini.mylook.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import com.muldini.mylook.common.StringConstant;


/**
 * 登陆后拦截登陆注册
 * Servlet Filter implementation class LoginRequiredFilter
 */
@WebFilter(urlPatterns = {"/register.view","/login.view","/register.do","/login.do"})
public final class DisableLoginFilter implements Filter {
    
    /**
     * Default constructor. 
     */
    public DisableLoginFilter() {
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
        
        if(StringUtils.isNotEmpty(userStatus)  && "10".equals(userStatus)){
        	httpResp.sendRedirect("index.do"); 
            return;
        }
        
        if(StringUtils.isNotEmpty(userId)){
        	httpResp.sendRedirect("index.do"); 
            return;
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
