package com.youjin.guestbook.argumentresolver;

import java.util.Iterator;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

public class HandlerMapArgumentResolver implements HandlerMethodArgumentResolver {

	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		// 파라미터의 타입이 HeaderInfo 클래스 타입이면 true 반환
		return parameter.getParameterType() == HeaderInfo.class;
	}

	// supportsParameter() 메소드가 true 를 반환할 때만 호출 
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		
		HeaderInfo headerInfo = new HeaderInfo();
		
		// Header 이름 얻어오기
		Iterator<String> headerNames = webRequest.getHeaderNames();
		while (headerNames.hasNext()) {
			String headerName = headerNames.next();
			String headerValue = webRequest.getHeader(headerName);
			headerInfo.put(headerName, headerValue);
			System.out.println("헤더 정보 : " + headerName + " - " + headerValue);
		}
		
		// 반환되는 HeaderInfo 객체는 Controller 메소드의 인자값으로 전달된다.
		return headerInfo;
	}

}
