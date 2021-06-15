package com.as.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}

	// 스프링 시큐리티 설정
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();

		// 각 경로에 따른 권한을 지정
		http.authorizeRequests().
			antMatchers("/login", "/signup", "/", "/user/mail/verifying", "/user/mail/change_email").permitAll() // 누구나
			.antMatchers("/server/**").access("hasRole('ROLE_SERVER')")
			.antMatchers("/superadmin/**").access("hasAnyRole('ROLE_SUPERADMIN', 'ROLE_SERVER')")
			.antMatchers("/admin/**").access("hasAnyRole('ROLE_ADMIN', 'ROLE_SUPERADMIN','ROLE_SERVER')")
			.antMatchers("/professor/**").access("hasRole('ROLE_PROFESSOR')")
			.antMatchers("/employee/**").access("hasRole('ROLE_EMPLOYEE')")
			.antMatchers("/member/**").access("hasRole('ROLE_MEMBER')")
			.antMatchers("/user/**").authenticated();
		// .antMatchers("/**").authenticated(); // 로그인 된 사용자만
		// 접근 권한 제한으로 인해 리소스(css, js, media) 파일이 적용 안 될 수 있음

		// 로그인 페이지 설정
		http.formLogin().loginPage("/login").loginProcessingUrl("/login_processing").failureUrl("/login")
				.defaultSuccessUrl("/index", true).usernameParameter("userId").passwordParameter("password");

		// 로그아웃 설정
		http.logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout_processing")).logoutSuccessUrl("/login")
				.invalidateHttpSession(true); // 로그아웃할 때, 세션에 들어있는 데이터를 전부 삭제
	}

	// 패스워드 인코딩, (+)일반적인 인코딩 형식인 BCryptPasswordEncoder을 반환
	@Bean
	public PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}
}
