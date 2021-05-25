package com.as.controller;

import java.security.Principal;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.as.dto.Member;
import com.as.mapper.MemberMapper;
import com.as.service.MailSendService;

@RestController
public class MailController {
	@Autowired
	private MailSendService mss;
	@Autowired
	private MemberMapper memberMapper;

	@RequestMapping("/front/mail/send")
	public ModelAndView verify(Principal p, HttpSession session) {
		Member m = memberMapper.findMember(p.getName());

		String authKey = mss.sendAuthMail(m);
		session.setAttribute("authKey", authKey);
		session.setMaxInactiveInterval(60*10); // 세션 유효 기간 600초 -> 10분

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/front/mail/sendMail");

		return mv;
	}

	@RequestMapping("/front/mail/verify")
	public ModelAndView verify(HttpSession session, @RequestParam Map<String, String> map) {
		ModelAndView mv = new ModelAndView();

		if(session.getAttribute("authKey") == null) { // 세션이 없으면 키 정보가 없어서 null
			mv.setViewName("front/mail/verify_fail");
		}else{
			mv.setViewName("front/mail/verify_success");
			Member m = memberMapper.findMemberAtEmail(map.get("email"));
			memberMapper.updateAcess(m);
			session.invalidate(); // 세션 초기화
		}

		return mv;
	}
}
