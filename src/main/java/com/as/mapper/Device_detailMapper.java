package com.as.mapper;

import java.util.List;

import com.as.dto.Device_detail;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface Device_detailMapper {

	// 모든 정보 가져오기
	@Select("SELECT * FROM device_detail")
	List<Device_detail> findAllDevice_detail();

	// >> device_code에 해당되고 State=1인 device_detail 정보 리스트 가져오기 <<
	@Select("SELECT * FROM Device_detail WHERE code = #{device_code} AND state = 1 ")
	List<Device_detail> findAllByDevice_codeAndStateOne(String device_code);

	// >> device_code에 해당되는 device_detail 정보 리스트 가져오기 <<
	@Select("SELECT * FROM Device_detail WHERE code = #{device_code} AND detail_no = #{detail_no}")
	Device_detail findByDevice_code(String device_code, int detail_no);

	// >> Device_detail 데이터 업데이트 <<
	@Update("UPDATE Device_detail SET  " + "  code = #{code},    " + "  detail_no = #{detail_no},   "
			+ "  state = #{state}   " + " WHERE code = #{code} AND detail_no = #{detail_no}")
	void UpdateDevice_detail(Device_detail device_detail);

	// 장비 디테일 번호 추가
	@Insert("INSERT INTO device_detail VALUES (#{dd.code}, #{dd.detail_no}, #{dd.state})")
	void insertDeviceDetail(@Param("dd") Device_detail dd);
}
