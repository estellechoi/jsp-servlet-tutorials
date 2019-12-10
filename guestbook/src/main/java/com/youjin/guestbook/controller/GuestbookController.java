package com.youjin.guestbook.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
			ModelMap model) {
		// @RequestParam 값이 없으면, 기본값은 0 으로 설정
		
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
