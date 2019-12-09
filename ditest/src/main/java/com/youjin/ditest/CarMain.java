package com.youjin.ditest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CarMain {

	public static void main(String[] args) {

		// classpath 에 명시된 설정파일을 토대로 공장을 만들어라.
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		System.out.println("초기화 완료");
		
		// 해당 빈에 Engine 빈이 의존 주입되어있다.
		Car car = (Car) ac.getBean(Car.class);
		
		car.run();
	}

}
