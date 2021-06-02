package com.as.test;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.as.dto.Device;
import com.as.dto.Device_detail;

@Mapper
public interface TestMapper {

	@Insert("INSERT INTO device VALUES "
			+ "(#{d.code}, #{d.name}, #{d.type}, #{d.buy_date}, #{d.major_id})")
	void insertDevice(@Param("d") Device d);

	@Insert("INSERT INTO device_detail (device_code, detail_no) VALUES "
			+ "(#{dt.device_code}, #{dt.detail_no})")
	void insertDeviceDetail(@Param("dt") Device_detail dt);
}
