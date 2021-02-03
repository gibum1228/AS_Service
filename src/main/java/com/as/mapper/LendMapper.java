package com.as.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.as.dto.Lend;

@Mapper
public interface LendMapper {

	// >> 날짜별로 lend 데이터 +device 장비명 가져오기 <<
	@Select("SELECT l.*, d.name device_name  " + "FROM lend l LEFT JOIN device d "
			+ " ON l.device_code = d.code " + " WHERE visit_date = #{visit_date}")
	List<Lend> findAllByVisit_date(Date visit_date);

	// >> no로 lend 정보 + device 장비명 가져오기 <<
	@Select("SELECT l.*, d.name device_name  " + "FROM lend l LEFT JOIN device d "
			+ " ON l.device_code = d.code " + " WHERE no = #{no}")
	Lend findByNo(int no);

	// >> Lend 데이터 삽입 <<
	@Insert("INSERT Lend (snum,device_code,detail_no,type,wait_date,visit_date,state,start_date,end_date,return_date,extend,arrears)     "
			+ "VALUES (#{snum},#{device_code},#{detail_no},#{type},#{wait_date},#{visit_date},#{state},#{start_date},#{end_date},#{return_date},#{extend},#{arrears})")
	void InsertLend(Lend lend);

	// >> Lend 데이터 업데이트 <<
	@Update("UPDATE Lend SET                  " + "  device_code = #{device_code},    "
			+ "  detail_no = #{detail_no},   " + "  type = #{type},   " + "  wait_date = #{wait_date},   "
			+ "  visit_date = #{visit_date},   " + "  state = #{state},   " + "  start_date = #{start_date},   "
			+ "  end_date = #{end_date},   " + "  return_date = #{return_date},   " + "  extend = #{extend},   "
			+ "  arrears = #{arrears}   " + " WHERE snum = #{snum}                    ")
	void UpdateLend(Lend lend);



}
