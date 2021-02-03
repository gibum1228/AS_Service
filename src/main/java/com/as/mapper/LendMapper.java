package com.as.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.as.dto.Device;
import com.as.dto.Device_detail;
import com.as.dto.Lend;
import com.as.dto.Major;
import com.as.dto.Member;

@Mapper
public interface LendMapper {

	//////////// ====Device 데이터베이스====////////////
	// >> 선택한 장비의 정보 가져오기 <<
	@Select("SELECT * FROM device " + " WHERE  code = #{code} ")
	Device DevicefindByDevice_Code(String code);

	// >> major_id 로 원하는 학과의 원하는 type 장비 불러오기 <<
	@Select("SELECT * FROM Device" + " WHERE major_id = #{major_id} AND type = #{type}" + " ORDER BY buy_date DESC") // 구입날짜 최신순으로 정렬
	List<Device> DevicefindByMajorIdAndType(int major_id, int type);

	// >> major_id 로 원하는 학과의 type 정보 불러오기 <<
		@Select("SELECT type FROM Device" + " WHERE major_id = #{major_id}" + " ORDER BY buy_date DESC") // 구입날짜 최신순으로 정렬
		List<Integer> DevicefindByMajorId(int major_id);

	////////////====Major 데이터베이스====////////////
	// >> id로 major정보 가져오기 <<
	@Select("SELECT * FROM major" + " WHERE id = #{major_id}")
	Major MajorfindById(int major_id);




	////////////====Device_detail 데이터베이스====////////////
	// >> device_code에 해당되고 State=1인 device_detail 정보 리스트 가져오기 <<
	@Select("SELECT * FROM Device_detail" + " WHERE device_code = #{device_code} AND state = 1 ")
	List<Device_detail> Device_detailfindByDevice_codeAndStateOne(String device_code);

	// >> device_code에 해당되는 device_detail 정보 리스트 가져오기 <<
	@Select("SELECT * FROM Device_detail" + " WHERE device_code = #{device_code} AND detail_no = #{detail_no}")
	Device_detail Device_detailfindByDevice_code(String device_code, int detail_no);

	// >> Device_detail 데이터 업데이트 <<
	@Update("UPDATE Device_detail SET                  " + "  device_code = #{device_code},    "
			+ "  detail_no = #{detail_no},   " + "  state = #{state}   "  + " WHERE device_code = #{device_code} AND detail_no = #{detail_no}")
	void Device_detailUpdate(Device_detail device_detail );




	////////////====Lend 데이터베이스====////////////
	// >> 날짜별로 lend 데이터 +device 장비명 가져오기 <<
	@Select("SELECT l.*, d.name device_name         " + "FROM lend l LEFT JOIN device d "
			+ " ON l.device_code = d.code " + " WHERE visit_date = #{visit_date}")
	List<Lend> LendfindAllByVisit_date(Date visit_date);

	// >> no로 lend 정보 + device 장비명 가져오기 <<
	@Select("SELECT l.*, d.name device_name         " + "FROM lend l LEFT JOIN device d "
			+ " ON l.device_code = d.code " + " WHERE no = #{no}")
	Lend LendfindAllByNo(int no);

	// >> Lend 데이터 삽입 <<
	@Insert("INSERT Lend (snum,device_code,detail_no,type,wait_date,visit_date,state,start_date,end_date,return_date,extend,arrears)     "
			+ "VALUES (#{snum},#{device_code},#{detail_no},#{type},#{wait_date},#{visit_date},#{state},#{start_date},#{end_date},#{return_date},#{extend},#{arrears})")
	void LendInsert(Lend lend);

	// >> Lend 데이터 업데이트 <<
	@Update("UPDATE Lend SET                  " + "  device_code = #{device_code},    "
			+ "  detail_no = #{detail_no},   " + "  type = #{type},   " + "  wait_date = #{wait_date},   "
			+ "  visit_date = #{visit_date},   " + "  state = #{state},   " + "  start_date = #{start_date},   "
			+ "  end_date = #{end_date},   " + "  return_date = #{return_date},   " + "  extend = #{extend},   "
			+ "  arrears = #{arrears}   " + " WHERE snum = #{snum}                    ")
	void LendUpdate(Lend lend);



	////////////====Member 데이터베이스====////////////
	// >> 학번으로 멤버 정보 가져오기 <<
	@Select("SELECT * FROM member" + " WHERE snum LIKE #{num}")
	Member MemberfindBySnum(String num);

}
