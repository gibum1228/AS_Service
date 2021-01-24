package com.as.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.as.dto.Member;
import com.as.mapper.MemberMapper;
import com.as.service.MemberService;

@RestController
public class FrontController {

	@Autowired
	MemberService memberService;

	@Autowired
	MemberMapper memberMapper;

	@RequestMapping("/")
	public String index(Model model) {

		return "index";
	}

	@RequestMapping("/createA")
	public Member createA() {

		Member member = new Member();

		member.setSnum("adminTest");
		member.setPassword("1234567890");
		member.setName("관리자");
		member.setEmail("SKHUAS@skhu.ac.kr");
		member.setFirst_major_id(1);
		member.setRole_id(10);

		memberService.save(member);

		return member;
	}

	@RequestMapping("/admin/hello")
	public String hello() {
		return "hello Spring";
	}
}
