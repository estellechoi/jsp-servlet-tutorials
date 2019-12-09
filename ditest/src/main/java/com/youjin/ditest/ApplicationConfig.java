package com.youjin.ditest;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ApplicationConfig {
	
	@Bean
	public Car car(Engine e) {
		Car car = new Car();
		car.setEngine(e);
		return car;
	}
	
	@Bean
	public Engine engine() {
		return new Engine();
	}
	
	
}
