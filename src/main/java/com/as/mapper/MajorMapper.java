package com.as.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.as.dto.Major;

@Mapper
public interface MajorMapper {

		// >> id로 major정보 가져오기 <<
		@Select("SELECT * FROM major WHERE id = #{major_id}")
		Major findById(int major_id);

}

