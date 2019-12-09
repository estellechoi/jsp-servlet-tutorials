package com.youjin.mvctest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.youjin.mvctest.dto.User;

@Controller
public class UserController {

	@RequestMapping(path = "/userform", method = RequestMethod.GET)
	public String userform() {
		return "userform";
	}
	
	@RequestMapping(path = "/regist", method = RequestMethod.POST)
	public String regist(@ModelAttribute User user) {
		
		// @ModelAttribute User user : request.getParameter("name")의 값을 User 객체의 동명 변수에 넣어준다.
		System.out.println(user);
		
		return "regist";
	}
	
}
