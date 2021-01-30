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

import com.as.dto.Device_detail;
import com.as.dto.Lend;
import com.as.mapper.LendMapper;

@Controller
@RequestMapping("/admin/lend")
public class LendAdminController {

	@Autowired
	LendMapper lendMapper;

	//장비대여예약목록 볼 날짜선택하기
	@GetMapping("list")
	public String List(Model model) {
		return "/admin/lend/list";
	}

	//날짜별로 장비대여예약목록보여주기
	@PostMapping("list")
	public String List(Model model, @DateTimeFormat(pattern = "yyyy-MM-dd") Date visit_date) {

		List<Lend> lends = lendMapper.LendfindAllByVisit_date(visit_date);
		model.addAttribute("lends", lends);
		model.addAttribute("visit_date", visit_date);
		return "/admin/lend/list";
	}

	//팝업창으로 예약장비디테일넘버,대여일,반납예정일 선택하기
	@PostMapping("rent")
	public String Rent(Model model, String lend_no) {
		//선택한 lend 정보 가져오기
		int no = Integer.parseInt(lend_no);
		Lend selectedLend = lendMapper.LendfindAllByNo(no);

		//선택한 lend.device_code에 맞는 detail_no 리스트 가져오기
		List<Device_detail> device_details = lendMapper.Device_detailfindByDevice_code(selectedLend.getDevice_code());
		model.addAttribute("lend_no", lend_no);
		model.addAttribute("device_details", device_details);
		model.addAttribute("selectedLend", selectedLend);
		//대여일에 오늘 날짜 출력하기
		Timestamp currenttime = new Timestamp(System.currentTimeMillis());
		model.addAttribute("currenttime", currenttime);

		return "/admin/lend/rent";
	}

	//대여한 정보 저장완료 메세지 보여주기
	@PostMapping("rentsave")
	public String RentSave(Model model, String detail_no, String lend_no, @DateTimeFormat(pattern = "yyyy-MM-dd") Date end_date) {

		//lend에서 no로 정보가져오기
		int lend_No = Integer.parseInt(lend_no);
		Lend selectedLend = lendMapper.LendfindAllByNo(lend_No);
		//선택된 detail_no를 lend에서 no로 정보를 가져와서 detail_no(예약장비디테일넘버) 삽입
		int detail_No = Integer.parseInt(detail_no);
		selectedLend.setDetail_no(detail_No);

		//오늘 날짜를 start_date(대여일)에 삽입
		Timestamp currenttime = new Timestamp(System.currentTimeMillis());
		selectedLend.setStart_date(currenttime);
		//선택된 end_date를 end_date(반납예정일)에 삽입
		selectedLend.setEnd_date(end_date);

		//선택된 lend 업데이트하기!
		lendMapper.LendUpdate(selectedLend);

		model.addAttribute("visit_date", selectedLend.getVisit_date());//팝업창 닫은 후에 list에 visit_date 넘겨주기
		model.addAttribute("selectedLend", selectedLend);
		return "/admin/lend/rentsave";
	}


	//팝업창으로 반납일 선택하기
	@PostMapping("return")
	public String Return(Model model, String lend_no) {

		model.addAttribute("lend_no", lend_no);

		return "/admin/lend/return";
	}

	//반납한 정보 저장완료 메세지 보여주기
	@PostMapping("returnsave")
	public String ReturnSave(Model model, String lend_no, @DateTimeFormat(pattern = "yyyy-MM-dd") Date return_date) {

		//lend에서 no로 정보가져오기
		int lend_No = Integer.parseInt(lend_no);
		Lend selectedLend = lendMapper.LendfindAllByNo(lend_No);
;
		//선택된 return_date를 return_date(반납일)에 삽입
		selectedLend.setReturn_date(return_date);

		//선택된 lend 업데이트하기!
		lendMapper.LendUpdate(selectedLend);

		model.addAttribute("visit_date", selectedLend.getVisit_date());//팝업창 닫은 후에 list에 visit_date 넘겨주기
		model.addAttribute("selectedLend", selectedLend);
		return "/admin/lend/returnsave";
	}


}
