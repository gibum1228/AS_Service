package com.as.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.as.dto.Device_log;

@Mapper
public interface Device_logMapper {




	@Select("SELECT l.*, d.name device_name  " + "FROM Device_log l LEFT JOIN device d "
			+ " ON l.code = d.code "+ " WHERE l.detail_no = #{detail_no} AND l.code=#{device_code} ")
	List<Device_log> findbyDetail_no(int detail_no, String device_code);

	// >> Device_log 데이터 삽입 <<
		@Insert("INSERT Device_log (code, detail_no, snum, state, date)     "
				+ "VALUES (#{code},#{detail_no},#{snum},#{state},now())")
		void InsertDevice_log(Device_log device_log);

		// >> Device_log 데이터 업데이트 <<
		@Update("UPDATE Device_log SET                  " + "  code = #{code},    "
				+ "  detail_no = #{detail_no},   " + "  snum = #{snum},   "
				+ "  state = #{state}   " + "  date = #{date}   "+ " WHERE log_no = #{log_no} ")
		void UpdateDevice_log(Device_log device_log);
}
