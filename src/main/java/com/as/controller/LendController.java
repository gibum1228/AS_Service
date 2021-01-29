package com.as.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.as.dto.Device;
import com.as.dto.Lend;
import com.as.dto.Major;
import com.as.dto.Member;
import com.as.mapper.LendMapper;

@Controller
@RequestMapping("/front/lend")
public class LendController {

	@Autowired
	LendMapper lendMapper;

	//장비대여하기 페이지
	@GetMapping("select")
	public String Select(Model model) {
		return "/front/lend/select";
	}

	//팝업창 닫고 난 후 select 페이지
	@PostMapping("select")
	public String Select(Model model, String  device_code) {

		//device_code로 장비명 불러오기
		Device selecteddevice = lendMapper.DevicefindByDevice_Code(device_code);
		String device_name =selecteddevice.getName();
		model.addAttribute("device_name", device_name);

		model.addAttribute("device_code", device_code);

		return "/front/lend/select";
	}

	//팝업창으로 원하는 학과 선택 페이지
	@PostMapping("deviceselect")
	public String SelectDevice(Model model) {
		Member member = lendMapper.MemberfindBySnum("adminTest"); //임의로 지정
		Major firstmajor = lendMapper.MajorfindById(member.getFirst_major_id());
		Major secondmajor = lendMapper.MajorfindById(member.getSec_major_id());
		model.addAttribute("firstmajor", firstmajor);
		model.addAttribute("secondmajor", secondmajor);
		model.addAttribute("member", member);

		return "/front/lend/deviceselect";
	}

	//선택된 학과 장비 선택 페이지
	@GetMapping("major")
	public String Major(Model model, String majorid) {
		int id = Integer.parseInt(majorid);
		List<Device> devices = lendMapper.DevicefindByMajorId(id);
		model.addAttribute("devices", devices);

		return "/front/lend/major";
	}

	@PostMapping("save")
	public String SelectDate(Model model, String device_code, @DateTimeFormat(pattern = "yyyy-MM-dd") Date visit_date) {

		// lend 객체 생성
		Lend device_lend = new Lend();
		// 방문 날짜 visit_date 삽입
		device_lend.setSnum("adminTest");// 임의로 지정
		device_lend.setVisit_date(visit_date);
		// 선택된 장비 device_code 삽입
		device_lend.setDevice_code(device_code);
		// 현재시각 삽입
		Timestamp currenttime = new Timestamp(System.currentTimeMillis());
		device_lend.setWait_date(currenttime);

		model.addAttribute("device_lend", device_lend);
		lendMapper.LendInsert(device_lend);

		//device_code로 장비명 불러오기
		Device selecteddevice = lendMapper.DevicefindByDevice_Code(device_code);
		model.addAttribute("selecteddevice", selecteddevice);

		return "/front/lend/save";
	}

}
