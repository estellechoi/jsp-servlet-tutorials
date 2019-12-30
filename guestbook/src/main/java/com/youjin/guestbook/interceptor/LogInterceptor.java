package com.youjin.guestbook.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LogInterceptor extends HandlerInterceptorAdapter {

	// Controller 메소드 실행 전 실행 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println(handler.toString() + " 가 호출되었습니다. ");
		return true;
	}

	// Controller 메소드 실행 후 실행	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
			System.out.println(handler.toString() + " 가 종료되었습니다. " + modelAndView.getViewName() + " 을 View 로 사용합니다.");
	}
	
}
