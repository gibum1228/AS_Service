package com.as.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.as.dto.Member;
import com.as.mapper.MemberMapper;

@Repository
public class MemberRepository {

	@Autowired
	MemberMapper memberMapper;

	// 회원 정보 저장
	public Member save(Member member) {

		memberMapper.insertMember(member);

		return member;
	}

	// 아이디로 회원 찾기
	public Member findById(String snum) {

		return memberMapper.findMember(snum);
	}

	// 회원 권한 찾기
	public List<String> findAuthorityById(String snum){

		return memberMapper.findAuthority(snum);
	}
}
