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

	@GetMapping("list")
	public String Select(Model model) {
		return "/admin/lend/list";
	}

	@PostMapping("list")
	public String Select(Model model, @DateTimeFormat(pattern = "yyyy-MM-dd") Date visit_date) {

		List<Lend> lends = lendMapper.LendfindAllByVisit_date(visit_date);
		model.addAttribute("lends", lends);
		model.addAttribute("visit_date", visit_date);

		return "/admin/lend/list";
	}

	@PostMapping("rent")
	public String Rent(Model model, String lend_no) {
		int no = Integer.parseInt(lend_no);
		Lend selectedLend = lendMapper.LendfindAllByNo(no);
		List<Device_detail> device_details = lendMapper.Device_detailfindByDevice_code(selectedLend.getDevice_code());
		model.addAttribute("lend_no", lend_no);
		model.addAttribute("device_details", device_details);
		model.addAttribute("selectedLend", selectedLend);
		Timestamp currenttime = new Timestamp(System.currentTimeMillis());
		model.addAttribute("currenttime", currenttime);

		return "/admin/lend/rent";
	}

	@PostMapping("save")
	public String Rent(Model model, String detail_no, String lend_no, @DateTimeFormat(pattern = "yyyy-MM-dd") Date end_date) {

		int lend_No = Integer.parseInt(lend_no);
		Lend selectedLend = lendMapper.LendfindAllByNo(lend_No);
		int detail_No = Integer.parseInt(detail_no);
		selectedLend.setDetail_no(detail_No);
		Timestamp currenttime = new Timestamp(System.currentTimeMillis());
		selectedLend.setStart_date(currenttime);
		selectedLend.setEnd_date(end_date);
		lendMapper.LendUpdate(selectedLend);
		model.addAttribute("visit_date", selectedLend.getVisit_date());
		model.addAttribute("selectedLend", selectedLend);
		return "/admin/lend/save";
	}

}
