package com.as.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.as.dto.Lend;

@Mapper
public interface LendMapper {



	// >> lend 정보 + device 장비명 가져오기 <<
	@Select("SELECT l.*, m.name snum_name,  m.phone, m.first_major_id, d.name device_name, j.name major_name  "
			+ "FROM lend l LEFT JOIN member m ON l.snum = m.snum "
			+" JOIN device d ON d.code = l.device_code "
			+" JOIN major j ON d.major_id = j.id "
			+ " WHERE no = #{no}")
	Lend findByNo(int no);


	// >>모든 예약 가져오기
	@Select("SELECT l.*, m.name snum_name, d.name device_name, j.name major_name  "
			+ "FROM lend l LEFT JOIN member m ON l.snum = m.snum "
			+" JOIN device d ON d.code = l.device_code "
			+" JOIN major j ON d.major_id = j.id "
			+ "ORDER BY wait_date DESC    ")//최신 날짜로 정렬
	List<Lend> findAll();


	// >> 해당 학번의 모든 예약 가져오기 <<
	@Select("SELECT l.*, m.name snum_name, d.name device_name, j.name major_name  "
			+ "FROM lend l LEFT JOIN member m ON l.snum = m.snum "
			+" JOIN device d ON d.code = l.device_code "
			+" JOIN major j ON d.major_id = j.id "
			+ " WHERE l.snum LIKE #{snum}"
			+ "ORDER BY wait_date DESC    "
			 )
	List<Lend> findBySnum(String snum);

	// >> 해당 학번의 모든 예약 가져오기 <<
	@Select("SELECT l.*, m.name snum_name, d.name device_name, j.name major_name  "
			+ "FROM lend l LEFT JOIN member m ON l.snum = m.snum "
			+" JOIN device d ON d.code = l.device_code "
			+" JOIN major j ON d.major_id = j.id "
			+ " WHERE d.name LIKE #{device_name}"
			+ "ORDER BY wait_date DESC    "
			 )
	List<Lend> findByDevice_name(String device_name);


	// >>상태가 승인대기(state=0)인 Lend 정보 가져오기<<
	@Select("SELECT l.*, m.name snum_name, d.name device_name, j.name major_name  "
			+ "FROM lend l LEFT JOIN member m ON l.snum = m.snum "
			+" JOIN device d ON d.code = l.device_code "
			+" JOIN major j ON d.major_id = j.id "
			+ " WHERE l.state = 0 "
			+ "ORDER BY wait_date DESC    "

	)
		List<Lend> findAllByStateZero();

	// >>상태가 승인대기(state=0)인 해당 학번의 Lend 정보 가져오기<<
	@Select("SELECT l.*, m.name snum_name, d.name device_name, j.name major_name  "
			+ "FROM lend l LEFT JOIN member m ON l.snum = m.snum "
			+" JOIN device d ON d.code = l.device_code "
			+" JOIN major j ON d.major_id = j.id "
			+ " WHERE l.state = 0 AND l.snum LIKE #{snum}"
			+ "ORDER BY wait_date DESC    "

	)
		List<Lend> findAllByStateZeroSNum(String snum);

	// >>상태가 승인대기(state=0)인 해당 장비명의 Lend 정보 가져오기<<
	@Select("SELECT l.*, m.name snum_name, d.name device_name, j.name major_name  "
			+ "FROM lend l LEFT JOIN member m ON l.snum = m.snum "
			+" JOIN device d ON d.code = l.device_code "
			+" JOIN major j ON d.major_id = j.id "
			+ " WHERE l.state = 0 AND  d.name LIKE #{device_name}"
			+ "ORDER BY wait_date DESC    "

	)
		List<Lend> findAllByStateZeroDevice(String device_name);


	// >>상태가 승인대기(state=2)인 Lend 정보 가져오기<<
		@Select("SELECT l.*, m.name snum_name, d.name device_name, j.name major_name  "
				+ "FROM lend l LEFT JOIN member m ON l.snum = m.snum "
				+" JOIN device d ON d.code = l.device_code "
				+" JOIN major j ON d.major_id = j.id "
				+ " WHERE l.state = 2 "
				+ "ORDER BY wait_date DESC    "

		)
			List<Lend> findAllByStateTwo();

		// >>상태가 승인대기(state=2)인 해당 학번의 Lend 정보 가져오기<<
		@Select("SELECT l.*, m.name snum_name, d.name device_name, j.name major_name  "
				+ "FROM lend l LEFT JOIN member m ON l.snum = m.snum "
				+" JOIN device d ON d.code = l.device_code "
				+" JOIN major j ON d.major_id = j.id "
				+ " WHERE l.state = 2 AND l.snum LIKE #{snum}"
				+ "ORDER BY wait_date DESC    "

		)
			List<Lend> findAllByStateTwoSNum(String snum);

		// >>상태가 승인대기(state=2)인 해당 장비명의 Lend 정보 가져오기<<
		@Select("SELECT l.*, m.name snum_name, d.name device_name, j.name major_name  "
				+ "FROM lend l LEFT JOIN member m ON l.snum = m.snum "
				+" JOIN device d ON d.code = l.device_code "
				+" JOIN major j ON d.major_id = j.id "
				+ " WHERE l.state = 2 AND  d.name LIKE #{device_name}"
				+ "ORDER BY wait_date DESC    "

		)
			List<Lend> findAllByStateTwoDevice(String device_name);


		// >>상태가 대여중(state=3)인 Lend 정보 가져오기<<
		@Select("SELECT l.*, m.name snum_name, d.name device_name, j.name major_name  "
				+ "FROM lend l LEFT JOIN member m ON l.snum = m.snum "
				+" JOIN device d ON d.code = l.device_code "
				+" JOIN major j ON d.major_id = j.id "
				+ " WHERE l.state = 3 "
				+ "ORDER BY wait_date DESC    "

		)
			List<Lend> findAllByStateThree();

		// >>상태가 대여중(state=3)인 해당 학번의 Lend 정보 가져오기<<
		@Select("SELECT l.*, m.name snum_name, d.name device_name, j.name major_name  "
				+ "FROM lend l LEFT JOIN member m ON l.snum = m.snum "
				+" JOIN device d ON d.code = l.device_code "
				+" JOIN major j ON d.major_id = j.id "
				+ " WHERE l.state = 3 AND l.snum LIKE #{snum}"
				+ "ORDER BY wait_date DESC    "

		)
			List<Lend> findAllByStateThreeSNum(String snum);

		// >>상태가 대여중(state=3)인 해당 장비명의 Lend 정보 가져오기<<
		@Select("SELECT l.*, m.name snum_name, d.name device_name, j.name major_name  "
				+ "FROM lend l LEFT JOIN member m ON l.snum = m.snum "
				+" JOIN device d ON d.code = l.device_code "
				+" JOIN major j ON d.major_id = j.id "
				+ " WHERE l.state = 3 AND  d.name LIKE #{device_name}"
				+ "ORDER BY wait_date DESC    "

		)
			List<Lend> findAllByStateThreeDevice(String device_name);





		// >> Lend 데이터 삽입 <<
		@Insert("INSERT Lend (snum,device_code,detail_no,type,wait_date,visit_date,state,start_date,end_date,return_date,extend,arrears)     "
				+ "VALUES (#{snum},#{device_code},#{detail_no},#{type},#{wait_date},#{visit_date},#{state},#{start_date},#{end_date},#{return_date},#{extend},#{arrears})")
		void InsertLend(Lend lend);

		// >> Lend 데이터 업데이트 <<
		@Update("UPDATE Lend SET                  " + "  snum = #{snum},    " + "  device_code = #{device_code},    "
				+ "  detail_no = #{detail_no},   " + "  type = #{type},   " + "  wait_date = #{wait_date},   "
				+ "  visit_date = #{visit_date},   " + "  state = #{state},   " + "  start_date = #{start_date},   "
				+ "  end_date = #{end_date},   " + "  return_date = #{return_date},   " + "  extend = #{extend},   "
				+ "  arrears = #{arrears}   " + " WHERE no = #{no} ")
		void UpdateLend(Lend lend);

}
