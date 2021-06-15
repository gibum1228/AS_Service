package com.as.controller;

import java.security.Principal;
import java.util.Collection;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.as.dto.Member;
import com.as.mapper.MemberMapper;
import com.as.service.MailSendService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/user/mail")
public class MailController {
	@Autowired
	private MailSendService mss;
	@Autowired
	private MemberMapper memberMapper;

	@RequestMapping("/send")
	public ModelAndView verify(Principal p, HttpSession session) {
		Member m = memberMapper.findMember(p.getName());

		String authKey = mss.sendAuthMail(m);
		session.setAttribute("authKey", authKey);
		session.setMaxInactiveInterval(60 * 10); // 세션 유효 기간 600초 -> 10분

		ModelAndView mv = new ModelAndView(); // View 리턴
		mv.setViewName("/user/mail/sendMail");

		return mv;
	}

	@RequestMapping("/verifying")
	public ModelAndView verify(HttpSession session, @RequestParam Map<String, String> map) {
		ModelAndView mv = new ModelAndView();

		if (session.getAttribute("authKey") == null) { // 세션이 없으면 키 정보가 없어서 null
			mv.setViewName("user/mail/verify_fail");
		} else {
			mv.setViewName("user/mail/verify_success"); // 세션 안에 있는 인증키 인증 성공
			Member m = memberMapper.findMemberAtEmail(map.get("email"));
			memberMapper.updateAcess(m);
			session.invalidate(); // 세션 초기화
		}

		return mv;
	}

	@RequestMapping("/send_change_email")
	public ModelAndView send_change_email(Principal p, @RequestParam String changeEMail){
		Member m = memberMapper.findMember(p.getName());

		mss.sendChangeEMail(m, changeEMail);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/user/logout");

		return mv;
	}


	@RequestMapping("/change_email")
	public ModelAndView change_email(HttpSession session, @RequestParam Map<String, String> map){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/user/logout");

		String email = map.get("email");
		String changeDomain = map.get("changeEMail").split("@")[1];

		if(email == null || changeDomain == null){
			mv.setViewName("user/mail/verify_fail");
			return mv;
		}

		if(changeDomain.compareTo("gmail.com") == 0 || changeDomain.compareTo("daum.net") == 0 || changeDomain.compareTo("naver.com") == 0){
			Member m = memberMapper.findMemberAtEmail(map.get("email"));
			memberMapper.updateEMail(m.getSnum(), map.get("changeEMail"));
		}
		
		return mv;
	}
}
