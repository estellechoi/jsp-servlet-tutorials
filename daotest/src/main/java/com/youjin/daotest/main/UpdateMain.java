package com.youjin.daotest.main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.youjin.daotest.config.ApplicationConfig;
import com.youjin.daotest.dao.RoleDao;
import com.youjin.daotest.dto.Role;

public class UpdateMain {

	public static void main(String[] args) {
		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		RoleDao roleDao = ac.getBean(RoleDao.class);
		
		Role role = new Role();
		role.setRoleId(4);
		role.setDescription("design intern");
		
		int updateCount = roleDao.update(role);
		System.out.println(updateCount + " 개의 레코드가 수정되었습니다.");

	}

}
