package com.as.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.as.dto.Major;
import com.as.dto.Member;
import com.as.mapper.MemberMapper;

@Controller
public class MemberController {

	@Autowired
	MemberMapper memberMapper;

// 회원 가입 페이지
	@GetMapping("/signup")
	public String signup(Model model) {

		Member member = new Member();
		// 전공 목록 받기
		List<Major> majors = memberMapper.findAllMajor();
		majors.remove(0); // 0:관리자 삭제

		model.addAttribute("member", member);
		model.addAttribute("majors", majors);

		return "front/signup";
	}

	@PostMapping("/signup")
	public String signup(Model model, Member member, String emailAddress) {

		member.setPassword("");
		// 전공 목록 받기
		List<Major> majors = memberMapper.findAllMajor();
		majors.remove(0); // 0:관리자 삭제

		model.addAttribute("member", member);
		model.addAttribute("majors", majors);
		model.addAttribute("emailAddress", emailAddress);

		return "front/signup"; // 회원 가입 성공시
	}
}
