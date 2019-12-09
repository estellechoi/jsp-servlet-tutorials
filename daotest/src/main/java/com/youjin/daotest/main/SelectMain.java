package com.youjin.daotest.main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.youjin.daotest.config.ApplicationConfig;
import com.youjin.daotest.dao.RoleDao;
import com.youjin.daotest.dto.Role;

public class SelectMain {

	public static void main(String[] args) {
		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		RoleDao roleDao = ac.getBean(RoleDao.class);
		
		Role role = roleDao.selectById(3);
		
		if (role !=null) {
			System.out.println(role);			
		}
		else {
			System.out.println("일치하는 레코드가 없습니다.");
		}

	}

}
