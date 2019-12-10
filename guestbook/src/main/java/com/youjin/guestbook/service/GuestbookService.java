package com.youjin.guestbook.service;

import java.util.List;

import com.youjin.guestbook.dto.Guestbook;

// 서비스 메소드 인터페이스
public interface GuestbookService {
	
	// 상수
	public static final Integer LIMIT = 5;
	
	// 메소드
	public List<Guestbook> getGuestbooks(Integer start);
	// 추가, 삭제의 경우 Log 테이블에 데이터 추가/삭제
	public int deleteGuestbook(Long id, String ip);
	public Guestbook addGuestbook(Guestbook guestbook, String ip);
	public int getCount();
}
