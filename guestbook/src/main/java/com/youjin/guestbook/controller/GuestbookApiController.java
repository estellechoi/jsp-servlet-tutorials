package com.youjin.guestbook.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.youjin.guestbook.dto.Guestbook;
import com.youjin.guestbook.service.GuestbookService;

@RestController
@RequestMapping(path="/guestbooks")
public class GuestbookApiController {
	@Autowired
	GuestbookService guestbookService;
	
	// contentType = application/json + "GET" 요청이 들어오면 실행되는 메소드
	@GetMapping
	public Map<String, Object> list(@RequestParam(name="start", required =false, defaultValue = "0") int start) {
		
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
		
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("pageStartList", pageStartList);
		
		return map;
		// application/json 요청이므로
		// DispatcherServlet 은 JSONMessageConvertor 를 사용해서 Map 객체를 json 으로 변환하여 응답한다.
	}
	
	@PostMapping
	public Guestbook write(@RequestBody Guestbook guestbook, HttpServletRequest request) {
		String clientIp = request.getRemoteAddr();
		
		Guestbook resultGuestbook = guestbookService.addGuestbook(guestbook, clientIp);
		return resultGuestbook;
		// DispatcherServlet 은 JSONMessageConvertor 를 사용해서 Guestbook 객체를 json 으로 변환하여 응답한다.
	}
	
	@DeleteMapping("/{id}")
	public Map<String, String> delete(@PathVariable(name="id") Long id, HttpServletRequest request) {
		String clientIp = request.getRemoteAddr();
		int deleteCount = guestbookService.deleteGuestbook(id, clientIp);
		
		// 값이 1개인 Map 객체를 생성하여 리턴한다. (key, value)
		return Collections.singletonMap("success", deleteCount > 0 ? "true" : "false");
	}
	
}
