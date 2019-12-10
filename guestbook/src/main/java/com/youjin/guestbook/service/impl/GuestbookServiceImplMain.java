package com.youjin.guestbook.service.impl;

import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.youjin.guestbook.config.ApplicationConfig;
import com.youjin.guestbook.dto.Guestbook;
import com.youjin.guestbook.service.GuestbookService;

public class GuestbookServiceImplMain {

	public static void main(String[] args) {

		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		
		GuestbookService guestbookService = ac.getBean(GuestbookService.class);
		
		Guestbook guestbook = new Guestbook();
		guestbook.setName("홍용기");
		guestbook.setContent("방명록 테스트입니다.");
		guestbook.setRegdate(new Date());
		
		Guestbook result = guestbookService.addGuestbook(guestbook, "127.0.0.1");
		System.out.println(result);
	}

}
