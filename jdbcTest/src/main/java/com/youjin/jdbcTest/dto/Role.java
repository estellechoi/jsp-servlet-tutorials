package com.youjin.jdbcTest.dto;

public class Role {

	// Java 에서는 변수명을 작성할 때 카멜 표기법을 사용한다.
	// * 카멜 표기법 : 두번째 단어부터 첫글자만 대문자로 작성하여 단어 의미를 구분할 수 있게 하는 표기법
	private Integer roleId;
	private String description;

	// 기본 생성자
	public Role() {
		
	}
	
	// 인자를 가진 생성자 
	public Role(Integer roleId, String description) {
		super();
		this.roleId = roleId;
		this.description = description;
	}
	
	
	// Role 클래스 객체에 값을 넣고 빼기 위한 getters and setters..
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	// Role 객체가 가진 값들을 쉽게 출력해보기 위한 메소드	
	@Override
	public String toString() {
		return "Role [roleId=" + roleId + ", description=" + description + "]";
	}
		
}
