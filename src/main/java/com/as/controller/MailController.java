package com.as.controller;

import java.security.Principal;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.as.dto.Member;
import com.as.mapper.MemberMapper;
import com.as.service.MailSendService;

@RestController
public class MailController {
	@Autowired
	private MailSendService mss;
	@Autowired
	private MemberMapper memberMapper;

	@RequestMapping("/front/mail/verify")
	public String verify(Principal p, HttpSession session) {
		Member m = memberMapper.findMember(p.getName());

		String authKey = mss.sendAuthMail(m);
		session.setAttribute("authKey", authKey);

		return session.getAttribute("authKey").toString();
	}

	@RequestMapping("/front/mail/show_Session")
	public String showSession(HttpSession session, @RequestParam Map<String, String> map) {
//		System.out.println(session.getAttribute("authKey"));

//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("/index");
//
//		return mv;
		return session.getAttribute("authKey").toString();
	}
}
