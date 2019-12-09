package com.youjin.daotest.main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.youjin.daotest.config.ApplicationConfig;
import com.youjin.daotest.dao.RoleDao;
import com.youjin.daotest.dto.Role;

public class InsertMain {

	public static void main(String[] args) {

		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		RoleDao roleDao = ac.getBean(RoleDao.class);
		
		Role role = new Role();
		role.setRoleId(4);
		role.setDescription("CTO");
		
		int insertCount = roleDao.insert(role);
		System.out.println(insertCount + " 개의 레코드가 입력되었습니다.");
	}

}
