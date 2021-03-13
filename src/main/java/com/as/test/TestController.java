package com.as.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.as.dto.Member;
import com.as.mapper.MemberMapper;
import com.as.service.MemberService;

@Controller
public class TestController {
	@Autowired
	MemberService memberService;
	@Autowired
	MemberMapper memberMapper;

// 테스트 계정 만들기
	@RequestMapping("/testCreate")
	public String testAccount(Model model) {
		Member testMember = new Member();
		String testID = "member01";

		if(memberMapper.findMember(testID) == null) {

			testMember.setSnum(testID);
			testMember.setPassword("1111");
			testMember.setAccess(1);
			testMember.setEmail("member01@as.com");
			testMember.setFirst_major_id(0);
			testMember.setSec_major_id(0);
			testMember.setName("학생01");
			testMember.setPhone("01011112222");
			testMember.setRole_id(1);

			memberService.save(testMember);
			System.out.print("학생 생성 완료");
		}

		return "testCreate";
	}
}