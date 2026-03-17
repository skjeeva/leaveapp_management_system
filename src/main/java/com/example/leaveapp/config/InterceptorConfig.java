package com.example.leaveapp.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.example.leaveapp.interceptor.RoleInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

    @Autowired
    private RoleInterceptor roleInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        registry.addInterceptor(roleInterceptor).addPathPatterns("/admin/**","/manager/**", "/employee/**")
        .excludePathPatterns("/login","/logout","/leaveapp","/css/**","/js/**","/images/**");
    }
}