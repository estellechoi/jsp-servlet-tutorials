package com.youjin.guestbook.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class GuessController {
	
	@GetMapping(path = "/guess")
	public String guess(@RequestParam(name = "number", required = false) Integer number,
						HttpSession session, ModelMap model) {
						// 스프링에서는 Request 객체의 getSession 메소드로 세션을 가져오지 않아도 된다.
		String msg = null;
		// 사용자 입력값이 없을 때
		if (number == null) {
			msg = "행운의 숫자를 맞춰 보세요.";
			// 행운의 숫자 생성
			session.setAttribute("count", 0);
			session.setAttribute("randomNumber", (int)(Math.random() * 100) + 1);
		} else {
			int count = (Integer) session.getAttribute("count");
			int randomNumber = (Integer) session.getAttribute("randomNumber");
			
			if (number < randomNumber) {
				msg = "행운의 숫자는 당신의 생각보다 큽니다.";
				session.setAttribute("count", ++count);
			} else if (number > randomNumber) {
				msg = "행운의 숫자는 당신의 생각보다 작습니다.";
				session.setAttribute("count", ++count);				
			} else {
				msg = "행운의 숫자를 " + ++count + " 번 째에 맞추었습니다!";
				session.removeAttribute("count");
				session.removeAttribute("randomNumber");
			}
		}
		
		model.addAttribute("msg", msg);
		
		return "guess";
	}
}
