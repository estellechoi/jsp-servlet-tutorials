package com.youjin.ditest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component // 빈의 이름은 클래스명을 소문자로 바꾼 이름으로 자동 등록된다. (여기에서 빈의 이름은 car 가 된다.)
public class Car {
	
	@Autowired // 타입이 같은 빈을 찾아서 자동 주입.
	private Engine v8;
	
	public Car() {
		System.out.println("Car 생성자");
	}
	
	public void setEngine(Engine e) {
		this.v8 = e;
	}
	
	public void run() {
			System.out.println("자동차가 달립니다.");
			v8.exec();
	}
	
//	public static void main(String[] args) {
//		Engine e = new Engine();
//		Car c = new Car();
//		c.setEngine(e);
//		c.run();
//	}
}
