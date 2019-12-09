package com.youjin.daotest.main;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.youjin.daotest.config.ApplicationConfig;
import com.youjin.daotest.dao.RoleDao;
import com.youjin.daotest.dto.Role;

public class SelectAllMain {

	public static void main(String[] args) {
		
		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		
		RoleDao roleDao = ac.getBean(RoleDao.class);
		
		List<Role> list = roleDao.selectAll();
		
		for (Role role : list) {
			System.out.println(role);
		}
		
	}

}
