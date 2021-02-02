package com.as.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.as.mapper.MemberMapper;
import com.as.mapper.TestMapper;
import com.as.service.MemberService;


@Controller
@RequestMapping("admin")

public class PrintController {

	@Autowired
	TestMapper testMapper;
	@Autowired
	MemberMapper memberMapper;
	@Autowired
	MemberService memberService;


	@RequestMapping("print")
	public String print(Model model, String snum) {

		model.addAttribute("member",testMapper.findByPrint(snum));


		return "admin/print";
	}

	@RequestMapping("test")
	public String test(Model model) {



		return "admin/test";
	}
}
