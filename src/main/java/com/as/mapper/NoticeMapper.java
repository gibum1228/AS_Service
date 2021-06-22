package com.as.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.as.dto.Notice;
import com.as.dto.Sequence;



@Mapper
public interface NoticeMapper {

	// 공지사항 no로 찾기
	@Select("SELECT * from notice WHERE notice.no = #{no}")
	Notice findByNo(int no);

	// 공지사항 제목으로 찾기
	@Select
	("SELECT * from notice WHERE notice.title LIKE #{title}")
	List<Notice> findByTitle(String title);

	// 공지사항 리스트 불러오기
	@Select
	("select * from notice;")
	List<Notice> findAll();

	// 공지사항 리스트 no 최대값
	@Select
	("SELECT MAX(no) FROM notice;")
	int findLX();

	// 공지사항 리스트 no 최솟값
	@Select
	("SELECT MIN(no) FROM notice;")
	int findFX();

	// 공지사항 리스트 이전 이후값
		@Select
		("SELECT no, preNo, nextNo"
				+ " FROM"
				+ "	(SELECT 	 /*+ USE_IDX */ no"
				+ "			, LAG(no, 1) over (ORDER BY no) preNo"
				+ "			, LEAD(no, 1) over (ORDER BY no) nextNo"
				+ "	FROM notice) a"
				+ " WHERE no = #{no};")
	Sequence find_ud_notice(int no);


	// 공지사항 정보 수정
	@Update
    ("UPDATE notice SET title = #{n.title}, body = #{n.body} WHERE no = #{n.no};")
    void updateNotice(@Param("n")Notice n);

	// 공지사항 정보 삭제
	@Delete
	("DELETE from notice where no = #{n.no};")
	void deleteNotice(@Param("n")Notice n);


	// 공지사항 조회수 높이기
	@Update
	("UPDATE notice SET views = #{n.views} WHERE no = #{n.no};")
    void updateNotice_views(@Param("n")Notice n);

    // 공지사항 정보 저장
    @Insert
    ("INSERT INTO notice (snum, title, body, write_date) VALUES "
    		+ "(#{n.snum}, #{n.title}, #{n.body}, now()) ")
    void insertNotice(@Param("n")Notice n);


}
