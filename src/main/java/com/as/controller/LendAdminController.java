package com.as.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.as.dto.Lend;
import com.as.mapper.LendMapper;

@Controller
@RequestMapping("/admin/lend")
public class LendAdminController {

	@Autowired
	LendMapper lendMapper;

	@RequestMapping("list")
	public String Select(Model model,  @DateTimeFormat(pattern = "yyyy-MM-dd") Date visit_date) {

		List<Lend> lends = lendMapper.LendfindAllByVisit_date(visit_date);
		model.addAttribute("lends", lends);
		model.addAttribute("visit_date", visit_date);
		return "/admin/lend/list";
	}

}
