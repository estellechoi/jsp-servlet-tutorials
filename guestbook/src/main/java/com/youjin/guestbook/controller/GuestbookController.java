package com.youjin.guestbook.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.youjin.guestbook.dto.Guestbook;
import com.youjin.guestbook.service.GuestbookService;

@Controller
public class GuestbookController {

	@Autowired
	GuestbookService guestbookService;
	
	@GetMapping(path="/list")
	public String list(@RequestParam(name = "start", required = false, defaultValue ="0") int start,
			ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		// @RequestParam 값이 없으면, 기본값은 0 으로 설정
		
		// * 쿠키로 방문횟수 구현하기
		String cookieCount = null;
		boolean find = false;
		
		// 클라이언트 요청에서 쿠키 배열 얻기
		// 쿠키가 없으면 null 반환 (첫방문)
		Cookie[] cookies = request.getCookies();
		
		// 쿠키 있을 때
		if (cookies != null) {
			for(Cookie cookie: cookies) {
				// "count" 쿠키가 있을 때
				if ("count".equals(cookie.getName())) {
					find = true;
					cookieCount = cookie.getValue();
					break;
				}
			}
		}
		
		// find = false 일 때 (첫방문)
		if (!find) {
			cookieCount = "1";
		}
		// true 일 때
		else {
			try {
				int i = Integer.parseInt(cookieCount);
				cookieCount = Integer.toString(++i);				
			} catch (Exception e) {
				cookieCount = "1";
			}
		}
		
		// 쿠키 생성	 
		Cookie cookie = new Cookie("count", cookieCount);
		cookie.setMaxAge(60 * 60 * 24 * 365);
		// 지정한 경로 이하에 모두 쿠키 적용
		cookie.setPath("/"); 
		// 쿠키 응답
		// 동일한 이름의 쿠키를 생성하여 전송하면, 기존의 쿠키와 교체한다.
		response.addCookie(cookie);
		
		
		// 방명록 목록 구하기 (start 부터 limit 개의 레코드 조회)
		List<Guestbook> list = guestbookService.getGuestbooks(start);
		
		// 전체 페이지수 구하기 
		int count = guestbookService.getCount();
		int pageCount = count/guestbookService.LIMIT;
		if (count % guestbookService.LIMIT > 0) {
			pageCount++; // 나누어 떨어지지 않고 남는 레코드가 있으면 페이지 1 개 더 필요
		}
		
		// 페이지 수만큼 start의 값을 리스트로 저장 
		// 왜 ArrayList<>() 쓸까 ?
		List<Integer> pageStartList = new ArrayList<>();
		for (int i = 0; i < pageCount; i++) {
			pageStartList.add(i * guestbookService.LIMIT);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pageStartList", pageStartList);
		model.addAttribute("cookieCount", cookieCount);
		
		return "list";
	}
	
	@PostMapping(path = "/write")
	public String write(@ModelAttribute Guestbook guestbook,
			HttpServletRequest request) {
		
		String clientIp = request.getRemoteAddr();
		System.out.println("client ip : " + clientIp);
		
		guestbookService.addGuestbook(guestbook, clientIp);
		
		// 작업 종료 후 list.jsp 로 리다이렉트
		return "redirect:list";
	}
}
