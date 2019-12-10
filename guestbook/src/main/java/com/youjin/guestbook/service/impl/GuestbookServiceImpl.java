package com.youjin.guestbook.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.youjin.guestbook.dao.GuestbookDao;
import com.youjin.guestbook.dao.LogDao;
import com.youjin.guestbook.dto.Guestbook;
import com.youjin.guestbook.dto.Log;
import com.youjin.guestbook.service.GuestbookService;
@Service
public class GuestbookServiceImpl implements GuestbookService {
	
	// 필요한 객체들을 자동 주입한다.
	@Autowired
	GuestbookDao guestbookDao;
	@Autowired
	LogDao logDao;

	// GuestbookService 의 메소드를 오버라이드한다.
	@Override
	@Transactional // Read 기능만 수행하는 메소드에 붙여주면, ReadOnly 커넥션 해준다. ?
	public List<Guestbook> getGuestbooks(Integer start) {
		List<Guestbook> list = guestbookDao.selectAll(start, GuestbookService.LIMIT);
		return list;
	}

	@Override
	@Transactional(readOnly = false) // 이 설정이 있어야 트랜젝션으로 간주되어 DB 입력/삭제가 된다.
	public int deleteGuestbook(Long id, String ip) {
		int deleteCount = guestbookDao.deleteById(id);
		
		// 데이터 추가/삭제의 경우에는 로그 데이터를 log 테이블에 추가하여 남긴다.
		Log log = new Log();
		log.setIp(ip);
		log.setMethod("delete");
		log.setRegdate(new Date());
		logDao.insert(log);
		
		return deleteCount;
	}

	@Override
	@Transactional(readOnly = false)
	public Guestbook addGuestbook(Guestbook guestbook, String ip) {

		// * 트랜젝션
		// 작업이 진행하다가 중간에 예외가 발생하면, 이전에 완료한 작업이 모두 취소되고 처음으로 돌아온다. (rollback)
		// 예외가 발생하지 않으면 모든 작업이 완료되고 DB 쿼리문이 정상적으로 실행되어 데이터가 추가된다. (commit)
		
		// guestbook 테이블에 데이터 추가한다.
		guestbook.setRegdate(new Date());
		Long id = guestbookDao.insert(guestbook);
		guestbook.setId(id);
		
		// 데이터 추가/삭제의 경우에는 로그 데이터를 log 테이블에 추가하여 남긴다.
		Log log = new Log();
		log.setIp(ip);
		log.setMethod("insert");
		log.setRegdate(new Date());
		logDao.insert(log);
		
		return guestbook;
	}

	@Override
	public int getCount() {
		
		return guestbookDao.selectCount();
	}
	
	
	
	
	
}
