package com.as.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.as.dto.Device_detail;

@Mapper
public interface Device_detailMapper {

	// >> device_code에 해당되고 State=1인 device_detail 정보 리스트 가져오기 <<
		@Select("SELECT * FROM Device_detail WHERE code = #{device_code} AND state = 1 ")
		List<Device_detail> findAllByDevice_codeAndStateOne(String device_code);

		// >> device_code에 해당되는 device_detail 정보 리스트 가져오기 <<
		@Select("SELECT * FROM Device_detail WHERE code = #{device_code} AND detail_no = #{detail_no}")
		Device_detail findByDevice_code(String device_code, int detail_no);

		// >> Device_detail 데이터 업데이트 <<
		@Update("UPDATE Device_detail SET  " + "  code = #{code},    "+ "  detail_no = #{detail_no},   "
		+ "  state = #{state}   "  + " WHERE code = #{code} AND detail_no = #{detail_no}")
		void UpdateDevice_detail(Device_detail device_detail );

}
