package com.youjin.daotest.main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.youjin.daotest.config.ApplicationConfig;
import com.youjin.daotest.dao.RoleDao;
import com.youjin.daotest.dto.Role;

public class DeleteMain {

	public static void main(String[] args) {
		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		RoleDao roleDao = ac.getBean(RoleDao.class);
		
		int deleteCount = roleDao.deleteById(4);
		System.out.println(deleteCount + " 개의 레코드가 삭제되었습니다.");

	}

}
