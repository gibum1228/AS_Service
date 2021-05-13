package com.as.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.as.dto.Notice;



@Mapper
public interface NoticeMapper {


    // 회원 정보 저장
    @Insert("INSERT INTO notice (snum, title, body, write_date) VALUES "
    		+ "(#{n.snum}, #{n.title}, #{n.body}, now()) ")
    void insertNotice(@Param("n")Notice n);


}
