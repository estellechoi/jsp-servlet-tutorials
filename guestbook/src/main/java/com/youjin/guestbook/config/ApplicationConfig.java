package com.youjin.guestbook.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@ComponentScan(basePackages = {"com.youjin.guestbook.dao", "com.youjin.guestbook.service"})
@Import({DBConfig.class})
public class ApplicationConfig {

}
