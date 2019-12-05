package com.youjin.jdbcTest;

import java.util.ArrayList;
import java.util.List;

import com.youjin.jdbcTest.dao.RoleDao;
import com.youjin.jdbcTest.dto.Role;

public class MainClass {

	public static void main(String[] args) {

		RoleDao dao = new RoleDao();
		
//		Role role = dao.getRole(1);	
//		System.out.println(role);

//		int roleId = 4;
//		String description = "design intern";		
//		Role role = new Role(roleId, description);
//		int insertCount = dao.addRole(role);
//		System.out.println(insertCount + " 개의 레코드가 추가되었습니다.");
		
//		int roleId = 2;
//		String description = "sales";
//		Role role = new Role(roleId, description);
//		int updateCount = dao.updateRole(role);
//		System.out.println(updateCount + " 개의 레코드가 수정되었습니다.");

//		int roleId = 4;
//		int deleteCount = dao.deleteRole(roleId);
//		System.out.println(deleteCount + " 개의 레코드가 삭제되었습니다.");

		List<Role> list = dao.getRoles();
		
		for (Role role : list) {
			System.out.println(role);
		}
		
		
		
	}

}
