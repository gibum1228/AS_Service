package com.as.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.as.dto.Device;

@Mapper
public interface DeviceMapper {


		// >> 선택한 장비의 정보 가져오기 <<
		@Select("SELECT * FROM device WHERE  code = #{code} ")
		Device findByDevice_Code(String code);

		// >> major_id 로 원하는 학과의 원하는 type 장비 불러오기 <<
		@Select("SELECT * FROM Device" + " WHERE major_id = #{major_id} AND type = #{type}" + " ORDER BY buy_date DESC") // 구입날짜 최신순으로 정렬
		List<Device> findAllByMajorIdAndType(int major_id, int type);


}
