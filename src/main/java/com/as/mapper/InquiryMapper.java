package com.as.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.as.dto.Inquiry;
import com.as.dto.Sequence;




@Mapper
public interface InquiryMapper {

	// 문의사항 리스트 불러오기
	@Select
	("select * from inquiry;")
	List<Inquiry> findAll();

	// 문의사항 리스트 no 최대값
	@Select
	("SELECT MAX(no) FROM inquiry;")
	int findLX();

	// 문의사항 no로 찾기
	@Select("SELECT * from inquiry WHERE inquiry.no = #{no}")
	Inquiry findByNo(int no);

	// 문의사항 리스트 이전 이후값
	@Select
	("SELECT no, preNo, nextNo"
				+ " FROM"
				+ "	(SELECT 	 /*+ USE_IDX */ no"
				+ "			, LAG(no, 1) over (ORDER BY no) preNo"
				+ "			, LEAD(no, 1) over (ORDER BY no) nextNo"
				+ "	FROM inquiry) a"
				+ " WHERE no = #{no};")
	Sequence find_ud_inquiry(int no);

	// 문의사항 정보 수정
	@Update
	("UPDATE inquiry SET answer = #{i.answer}, state= #{i.state} WHERE no = #{i.no};")
	void updateInquiry(@Param("i")Inquiry i);

	// 문의사항 조회수 높이기
	@Update
	("UPDATE inquiry SET views = #{i.views} WHERE no = #{i.no};")
	void updateInquiry_views(@Param("i")Inquiry i);


	// 문의사항 처리상태로 정렬
	@Select
	("SELECT * from inquiry WHERE inquiry.state = #{state};")
	List<Inquiry> findByState(int state);


    // 공지사항 정보 저장
    @Insert
    ("INSERT INTO inquiry(snum, title, body, views, write_date, type, state, answer)"
    		+ " VALUES(#{i.snum}, #{i.title}, #{i.body}, #{i.views}, now(), #{i.type}, #{i.state}, #{i.answer});")
    void insertInquiry(@Param("i")Inquiry i);


}
