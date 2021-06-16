package com.as.controller;

import com.as.dto.Member;
import com.as.mapper.MemberMapper;
import com.as.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
		String error = "";

		// '-' 제거하고 휴대전화 번호 저장
		// phone = phone.split("-")[0] + phone.split("-")[1] + phone.split("-")[2];

		// 회원 정보가 유니크하지 않은지 판단
		if(memberMapper.findMember(snum) != null){
			error = "이미 등록된 아이디(학번)입니다.";
		}else if(memberMapper.findEmail(email) != null){
			error = "이미 등록된 이메일입니다.";
		}else if(memberMapper.findPhone(phone) != null){
			if(phone.length() == 11){
				error = "이미 등록된 전화번호입니다.";
			}else{
				error = "전화번호 형식에 맞지 않습니다.";
			}
		}else{
			memberService.save(m);

			return "user/login";
		}

		error += "<br> A/S실: 02-2610-4201";
		model.addAttribute("error", error);

		return "user/signup";
	}
}
