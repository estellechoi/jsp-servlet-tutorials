package com.youjin.guestbook.dao;

import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.youjin.guestbook.config.ApplicationConfig;
import com.youjin.guestbook.dto.Log;

public class GuestbookDaoMain {

	public static void main(String[] args) {

		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		
//		GuestbookDao guestbookDao = ac.getBean(GuestbookDao.class);
//		
//		Guestbook guestbook = new Guestbook();
//		guestbook.setName("최유진");
//		guestbook.setContent("안녕하세요.");
//		guestbook.setRegdate(new Date());
//		
//		Long id = guestbookDao.insert(guestbook); // 생성된 id 값 리턴
//		System.out.println(id + " 번 레코드가 추가되었습니다.");
		
		LogDao logDao = ac.getBean(LogDao.class);
		
		Log log = new Log();
		log.setIp("127.0.0.1");
		log.setMethod("insert");
		log.setRegdate(new Date());
		
		Long id = logDao.insert(log);
		System.out.println(id + " 번 레코드가 추가되었습니다.");
	}

}
