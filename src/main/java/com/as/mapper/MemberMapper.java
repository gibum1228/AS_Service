package com.as.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.as.dto.Major;
import com.as.dto.Member;

@Mapper
public interface MemberMapper {

	// 학번으로 회원 정보 검색
	@Select("SELECT * FROM member WHERE snum=#{snum}")
    Member findMember(String snum);

	// 학번으로 회원 권한 검색
    @Select("SELECT r.name FROM role AS r JOIN member AS m ON r.id = m.role_id WHERE m.snum=#{snum}")
    List<String> findAuthority(String snum);

    // 전공 번호로 전공명 검색
    @Select("SELECT name FROM major"
    		+ " WHERE id = #{major_id}")
    String findMajorAtId(int major_id);

    // 전공명으로 전공 번호 리턴
    @Select("SELECT id FROM major"
            + " WHERE name REGEXP #{ name }")
    int findMajorAtName(String name);

    // 이메일로 회원 정보 return
    @Select("SELECT * FROM member"
    		+ " WHERE email = #{mail}")
    Member findMemberAtEmail(String mail);

    // 이름으로 회원 정보 검색
    @Select("SELECT * FROM member"
            + " WHERE name = #{name}")
    List<Member> findMemberAtName(String name);

    // 회원 정보 저장
    @Insert("INSERT INTO member (snum, password, name, phone, email, first_major_id, sec_major_id, signup_date) VALUES "
    		+ "(#{m.snum}, #{m.password}, #{m.name}, #{m.phone}, #{m.email}, #{m.first_major_id}, #{m.sec_major_id}, now())")
    void insertMember(@Param("m") Member m);

    // 권한 추가
    @Insert("INSERT INTO role VALUES (#{id}, #{name})")
    void insertAuthority(int id, String name);

    // 모든 회원 정보 검색
    @Select("SELECT * FROM member")
    List<Member> findAllMember();

    // 모든 전공명 찾기
    @Select("SELECT * FROM major")
    List<Major> findAllMajor();

    // 이메일 존재하는지 검색
    @Select("SELECT * FROM member WHERE email=#{email}")
    Member findEmail(String email);

    // 휴대전화 존재하는지 검색
    @Select("SELECT * FROM member WHERE phone=#{phone}")
    Member findPhone(String phone);

    // 학생 계정 인증 여부 변경
    @Update("UPDATE member SET access = 1 WHERE snum = #{ m.snum }")
    void updateAcess(@Param("m") Member m);

    // 학생 이메일 변경
    @Update("UPDATE member SET email = #{ changeEMail } WHERE snum = #{ snum }")
    void updateEMail(String snum, String changeEMail);

    // 학번으로 계정 권한 변경
    @Update("UPDATE member SET role_id = #{ rold_id } WHERE snum = #{ snum }")
    void updateRoleAtSnum(String snum, int rold_id);
}
