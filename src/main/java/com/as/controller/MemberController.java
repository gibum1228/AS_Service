package com.as.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.as.dto.Member;
import com.as.mapper.MemberMapper;

@Controller
public class MemberController {

	@Autowired
	MemberMapper memberMapper;

	@GetMapping("/signup")
	public String signup(Model model) {

		Member member = new Member();

		model.addAttribute("member", member);
		model.addAttribute("majors", memberMapper.findAllMajor());

		return "front/signup";
	}
	@PostMapping("/signup")
	public String signup(Model model, Member member, String emailAddress) {

		member.setPassword("");

		model.addAttribute("member", member);
		model.addAttribute("majors", memberMapper.findAllMajor());
		model.addAttribute("emailAddress", emailAddress);

		return "front/signup"; // 회원 가입 성공시
	}
}
