package security;

import static org.springframework.security.config.Customizer.withDefaults;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@EnableWebSecurity
@Configuration
public class SecurityConfig {
 	
 	
	@Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
    	
    	 http
    	 .authorizeHttpRequests().and()
         .formLogin()	// form 방식 로그인 사용
        		 .loginPage("/mylogin")	// [A] 커스텀 로그인 페이지 지정
                 .loginProcessingUrl("/login_Progress")	// [B] submit 받을 url    
                 .usernameParameter("userId")	// [C] submit할 아이디
                 .passwordParameter("userPw")	// [D] submit할 비밀번호
                 .defaultSuccessUrl("/", true)
                 .permitAll().and()
         .logout(withDefaults());	// 로그아웃은 기본설정으로 (/logout으로 인증해제)
 
        return http.build();
    }

	
}
