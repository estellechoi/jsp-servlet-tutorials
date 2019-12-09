package com.youjin.daotest.main;

import java.sql.Connection;

import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.youjin.daotest.config.ApplicationConfig;

public class MainClass {

	public static void main(String[] args) {

		// 컨테이너 생성
		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		
		// DataSource 빈 호출
		DataSource dataSource = ac.getBean(DataSource.class);
		
		// 연결 테스트
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			if (conn != null) {
				System.out.println("접속 성공 !");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

}
