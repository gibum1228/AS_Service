package com.as.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.as.dto.Major;
import com.as.dto.Member;
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

	@RequestMapping("/front/mypages")
	public String mypages(Model model, Principal principal) {
		List<Major> majorList = memberMapper.findAllMajor();
		Member student = memberMapper.findMember(principal.getName());

		model.addAttribute("student", student);
		model.addAttribute("first_major", memberMapper.findMajorName(student.getFirst_major_id()));
		model.addAttribute("sec_major", memberMapper.findMajorName(student.getSec_major_id()));

		return "front/mypages";
	}
}
