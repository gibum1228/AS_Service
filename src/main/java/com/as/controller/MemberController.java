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
		Member member = new Member();

		// 전공 목록 받기
		List<Major> majors = memberMapper.findAllMajor();
		selectMajors(majors);

		model.addAttribute("member", member);
		model.addAttribute("majors", majors);

		return "user/signup";
	}

	@PostMapping("/signup")
	public String signup(Model model, Member member) {
		boolean isEmpty = false;

		if (member.getName().compareTo("") == 0 || member.getPhone().compareTo("") == 0
				|| member.getFirst_major_id() == 0) {
			isEmpty = false;
		} else if (memberMapper.findEmail(member.getEmail()) != null) {
			isEmpty = false;
		} else if (memberMapper.findPhone(member.getPhone()) != null) {
			isEmpty = false;
		} else if (memberMapper.findMember(member.getSnum()) != null) {
			isEmpty = false;
		} else {
			isEmpty = true;
		}

		if (isEmpty) {
			memberService.save(member);

			return "/login"; // 회원 가입 성공시
		} else {
			member.setSnum("");
			member.setPassword("");
			member.setName("");
			member.setEmail("");
			member.setPhone("");

			// 전공 목록 받기
			List<Major> majors = memberMapper.findAllMajor();
			selectMajors(majors);

			model.addAttribute("member", member);
			model.addAttribute("majors", majors);

			return "user/signup";
		}
	}

// Methods
	void selectMajors(List<Major> m) {
		int[] majorDelList = { 0, 97, 98, 99 };

		// 전공 목록 반환
		for (int i = 0; i < m.size(); i++) {
			for (int j : majorDelList) {
				if (m.get(i).getId() == j) {
					m.remove(i);
				}
			}
		}
	}
}
