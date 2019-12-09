package com.youjin.daotest.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@ComponentScan(basePackages = {"com.youjin.daotest.dao "}) // Controller, Component, Repository, Service 를 찾아낸다.
@Import({DBConfig.class}) // 설정파일을 여러개로 나눠서 작성할 수 있도록하는 어노테이션
public class ApplicationConfig {

}
