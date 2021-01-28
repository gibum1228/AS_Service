package com.as.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.as.dto.Member;
import com.as.mapper.TestMapper;

@Controller
public class FrontController {

	@Autowired TestMapper testMapper;

	@RequestMapping("/")
	public String index(Model model) {
		return "index";
	}

	@RequestMapping("print")
	public String print(Model model, HttpSession session, String snum, String name, String first_major_id, String email) {

		Member user = (Member)session.getAttribute("user");

		model.addAttribute("user",user);


		return "print";
	}

	@RequestMapping("test")
	public String test(Model model, HttpSession session) {

		Member mb = new Member();
		mb.setName("양재용");
		mb.setSnum("201734017");
		mb.setEmail("yjy8501@naver.com");
		mb.setFirst_major_id(1);

		session.setAttribute("user", mb);

		return "test";
	}
}


