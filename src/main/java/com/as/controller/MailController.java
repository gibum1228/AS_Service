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

	@RequestMapping("/front/mail/sendMail")
	public ModelAndView verify(Principal p, HttpSession session) {
		Member m = memberMapper.findMember(p.getName());

		String authKey = mss.sendAuthMail(m);
		session.setAttribute("authKey", authKey);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/front/index");

		return mv;
	}

	@RequestMapping("/front/mail/verify")
	public ModelAndView verify(Principal p, HttpSession session, @RequestParam Map<String, String> map) {
		Member m = memberMapper.findMember(p.getName());

		if(m.getAccess() == 0) { // 인증 되지 않은 계정이고
			if(m.getEmail().compareTo(map.get("email")) == 0) { // 현재 동일한 계정이며
				if(session.getAttribute("authKey").toString().compareTo(map.get("authKey")) == 0) { // 인증키가 같을 경우
					memberMapper.updateAcess(m); // 인증 계정으로 변경
				}else {
					// 에러메세지 => 인증키 유효 기간 지남
				}
			}else {
				// 에러메세지 => 동일한 계정(이메일) 아님
			}
		}else {
			// 이미 인증 되었습니다.
		}

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/front/index");

		return mv;
	}
}
