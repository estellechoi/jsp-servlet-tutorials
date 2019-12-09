package com.youjin.ditest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainClass {

	public static void main(String[] args) {

		// classpath 에 명시된 설정파일을 토대로 공장을 만들어라.
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		System.out.println("초기화 완료");
		
		// id 가 testBean 인 빈을 호출.
		// 리턴타입이 Object 이므로 형변환 필요 .
		TestBean testBean = (TestBean) applicationContext.getBean("testBean");
		testBean.setName("youjin");
		System.out.println("name : " + testBean.getName());
		
		// 또 호출
		TestBean testBean2 = (TestBean) applicationContext.getBean("testBean");
		
		// 여러번 객체를 생성해도, 같은 빈을 사용하는 것을 알 수 있다.
		if (testBean == testBean2) System.out.println("같은 인스턴스 입니다.");
		
	}

}
