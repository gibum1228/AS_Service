package com.as.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.as.mapper.MemberMapper;
import com.as.service.MemberService;

@Controller
public class FrontController {

	@Autowired
	MemberService memberService;

	@Autowired
	MemberMapper memberMapper;

	@RequestMapping("/index")
	public String idex(Model model) {

		return "front/index";
	}

	@RequestMapping({"/", "/login"})
	public String login(Model model) {

		return "front/login";
	}

	@RequestMapping("/signup")
	public String signup(Model model) {

		return "front/signup";
	}

	// 어드민 페이지 기본 테스트
	@RequestMapping("/admin/hello")
	public String hello(Model model) {

		return "admin/hello";
	}
}
