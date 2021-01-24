package com.as.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.as.dto.Member;

@Mapper
public interface MemberMapper {

	@Select("SELECT * FROM member WHERE snum=#{snum}")
    Member findMember(String snum);

    @Select("SELECT r.name FROM role AS r JOIN member AS m ON r.id = m.role_id WHERE m.snum=#{snum}")
    List<String> findAuthority(String snum);

    @Insert("INSERT INTO member (snum, password, name, email, first_major_id, signup_date, role_id) VALUES "
    		+ "(#{m.snum}, #{m.password}, #{m.name}, #{m.email}, #{m.first_major_id}, now(), #{m.role_id})")
    void insertMember(@Param("m") Member m);

    @Insert("INSERT INTO role VALUES (#{id}, #{name})")
    void insertAuthority(int id, String name);

    @Select("SELECT * FROM member")
    List<Member> findAllMember();
}
