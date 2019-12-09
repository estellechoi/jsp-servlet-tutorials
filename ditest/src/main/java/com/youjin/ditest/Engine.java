package com.youjin.ditest;

import org.springframework.stereotype.Component;

@Component
public class Engine {

	public Engine() {
		System.out.println("엔진 생성자");
	}
	
	public void exec() {
		System.out.println("엔진이 동작합니다.");
	}
}
