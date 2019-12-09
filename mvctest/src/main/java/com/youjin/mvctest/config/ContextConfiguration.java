package com.youjin.mvctest.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

// DispatcherServlet 이 실행될 때 읽어들일 설정파일
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"com.youjin.mvctest.controller"})
public class ContextConfiguration extends WebMvcConfigurerAdapter {

	// 모든 요청 수용시(/), 각종 리소스 요청들에 대해 탐색할 곳을 설정 
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/assets/**").addResourceLocations("classpath:/META-INF/resources/webjars/").setCachePeriod(31556926);
		registry.addResourceHandler("/css/**").addResourceLocations("/css/").setCachePeriod(31556926);
        registry.addResourceHandler("/img/**").addResourceLocations("/img/").setCachePeriod(31556926);
        registry.addResourceHandler("/js/**").addResourceLocations("/js/").setCachePeriod(31556926);
	}

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
		// default servlet handler를 사용하게 합니다.
		// 매핑정보가 없는 서블릿 -> WAS 의 default servlet 이 static 한 자원을 읽어서 보여주게 한다.
	}

	// 특정 url 에 대한 요청을 controller 를 거치지 않고 별도로 매핑하게 함.
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		System.out.println("addViewControllers가 호출됩니다. ");
		// "/" 요청에 대해 "main" 페이지를 응답한다.
        registry.addViewController("/").setViewName("main");
	}
	
	@Bean
    public InternalResourceViewResolver getInternalResourceViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        return resolver;
    }
	
	
	
	

}
