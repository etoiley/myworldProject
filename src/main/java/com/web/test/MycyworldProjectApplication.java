package com.web.test;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@MapperScan(basePackageClasses = MycyworldProjectApplication.class)
@SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
public class MycyworldProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(MycyworldProjectApplication.class, args);
	}

}
