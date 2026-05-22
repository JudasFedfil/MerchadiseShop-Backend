package com.example.merchshop.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class CorsConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        // Cho phép tất cả các đường dẫn API (/**)
        registry.addMapping("/**")
                // Cho phép các port của Frontend gọi vào (5173 là Vite, 8080/8081/8082 là Vue CLI)
                .allowedOrigins(
                        "http://localhost:5173",
                        "http://localhost:8080",
                        "http://localhost:8081",
                        "http://localhost:8082"
                )
                // Cho phép các phương thức HTTP
                .allowedMethods("GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS")
                // Cho phép tất cả các header
                .allowedHeaders("*")
                // Cho phép gửi cookie/token xác thực
                .allowCredentials(true);
    }
}