package com.youjin.daotest.dto;

public class Role {
	private int roleId;
	private String description;
	
	
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	// 객체가 가진 값들을 문자열로 쉽게 확인하는데 사용하는 메소드
	@Override
	public String toString() {
		return "Role [roleId=" + roleId + ", description=" + description + "]";
	}
	
	
	
	
}
