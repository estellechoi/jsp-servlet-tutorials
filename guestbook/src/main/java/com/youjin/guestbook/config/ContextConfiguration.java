package com.youjin.guestbook.config;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.youjin.guestbook.argumentresolver.HandlerMapArgumentResolver;
import com.youjin.guestbook.interceptor.LogInterceptor;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages= {"com.youjin.guestbook.controller"})
public class ContextConfiguration extends WebMvcConfigurerAdapter {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("/css/").setCachePeriod(31556926);
		registry.addResourceHandler("/img/**").addResourceLocations("/img/").setCachePeriod(31556926);
		registry.addResourceHandler("/js/**").addResourceLocations("/js/").setCachePeriod(31556926);		
	}

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
		// default servlet handler를 사용하게 합니다.
		// 매핑 정보가 없는 url 요청을 처리한다.
	}

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
   		System.out.println("addViewControllers가 호출됩니다. ");
        registry.addViewController("/").setViewName("index");
        // 특정 url 매핑을 여기에서 별도로 한다.
	}
	
    @Bean
    public InternalResourceViewResolver getInternalResourceViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

    // 인터셉터 등록 : addInterceptors() 메소드 오버라이드
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// 인터셉터 객체를 생성하여 인자로 넣어준다 
		registry.addInterceptor(new LogInterceptor());
	}

	// 아규먼트 리졸버 등록
	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
		System.out.println("아규먼트 리졸버 등록");
		argumentResolvers.add(new HandlerMapArgumentResolver());
	}
	
	// MultipartResolver 등록 (DispathcerServlet 에 Multipart 요청이 오면 처리)
	@Bean
	public MultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(1024 * 1024 * 10);
		return multipartResolver;
	}
	
	
    

	
}
