package com.as.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.as.dto.Member;
import com.as.repository.MemberRepository;

@Service
public class MemberService implements UserDetailsService {

	@Autowired
	MemberRepository memberRepository;

	@Autowired
	PasswordEncoder passwordEncoder;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		Member member = memberRepository.findById(username);

		member.setAuthorities(getAuthority(username));

		return member;
	}

	public Member save(Member member) {

		member.setPassword(passwordEncoder.encode(member.getPassword()));

		return memberRepository.save(member);
	}

	public Collection<GrantedAuthority> getAuthority(String username){

		List<String> string_authorities = memberRepository.findAuthorityById(username);
		List<GrantedAuthority> authorities = new ArrayList<>();

		for (String authority : string_authorities) {
			authorities.add(new SimpleGrantedAuthority(authority));
		}

		return authorities;
	}
}
