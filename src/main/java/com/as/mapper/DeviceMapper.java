package com.as.mapper;

import java.util.List;

import com.as.dto.Device;
import com.as.dto.Device_Join_Detail;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface DeviceMapper {

	// >> 선택한 장비의 정보 가져오기 <<
	@Select("SELECT * FROM device WHERE  code = #{code} ")
	Device findByDevice_Code(String code);

	// >> major_id 로 원하는 학과의 원하는 type 장비 불러오기 <<
	@Select("SELECT * FROM Device" + " WHERE major_id = #{major_id} AND type = #{type}" + " ORDER BY buy_date DESC") // 구입날짜, 최신순으로 정렬
	List<Device> findAllByMajorIdAndType(int major_id, int type);

	// 모든 장비 정보 가져오기
	@Select("SELECT * FROM device")
	List<Device> findAllDevice();

	// 세밀한 모든 장비 정보 가져오기
	@Select("SELECT * FROM device NATURAL JOIN device_detail")
	List<Device_Join_Detail> findAllDeviceJoinDetail();

	// 장비명으로 세밀한 모든 장비 정보 가져오기
	@Select("SELECT * FROM device NATURAL JOIN device_detail " +
			"WHERE name REGEXP #{name}")
	List<Device_Join_Detail> findDeviceJoinDetailAtName(String name);

	// 전공 번호로 세밀한 모든 장비 정보 가져오기
	@Select("SELECT * FROM device NATURAL JOIN device_detail " +
			"WHERE major_id REGEXP #{id}")
	List<Device_Join_Detail> findDeviceJoinDetailAtMajor(int id);

	// 장비 모델 추가
	@Insert("INSERT INTO device VALUES (#{d.code}, #{d.name}, #{d.type}, #{d.buy_date}, #{d.major_id})")
	void insertDevice(@Param("d") Device d);
}
