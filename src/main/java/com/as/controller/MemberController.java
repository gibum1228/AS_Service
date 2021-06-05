package com.as.controller;

import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.as.dto.Major;
import com.as.dto.Member;
import com.as.mapper.MemberMapper;
import com.as.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberMapper memberMapper;
	@Autowired
	MemberService memberService;

// 회원 가입 페이지
	@GetMapping("/signup")
	public String signup(Model model) {

		return "user/signup";
	}

	@PostMapping("/signup")
	public String signup(Model model, String snum, String name, String pwd, String email, String phone, int first_major, int sec_major) {
		if(sec_major == 0) sec_major = first_major;
		Member m = new Member(snum, name, pwd, email, phone, first_major, sec_major); // 멤버 객체 생성
		
		if(memberMapper.findMember(snum) == null && memberMapper.findEmail(email) == null && memberMapper.findPhone(phone) == null){
			memberService.save(m);

			return "user/login";
		}else{
			model.addAttribute("error", true);

			return "user/signup";
		}
	}
}
