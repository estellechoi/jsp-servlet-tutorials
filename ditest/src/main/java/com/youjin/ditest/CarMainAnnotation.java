package com.youjin.ditest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class CarMainAnnotation {

	public static void main(String[] args) {

		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		
//		Car car = (Car) ac.getBean("car");
		// 클래스 타입으로 빈 호출하기
		Car car = (Car) ac.getBean(Car.class);
		car.run();
	}

}
