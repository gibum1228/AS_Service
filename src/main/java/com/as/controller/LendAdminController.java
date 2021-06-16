package com.as.controller;

import java.security.Principal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.as.dto.Device_detail;
import com.as.dto.Device_log;
import com.as.dto.Lend;
import com.as.mapper.Device_detailMapper;
import com.as.mapper.Device_logMapper;
import com.as.mapper.LendMapper;
import com.as.mapper.MemberMapper;

@Controller
@RequestMapping("/admin/lend")
public class LendAdminController {

	@Autowired
	MemberMapper memberMapper;
	@Autowired
	LendMapper lendMapper;
	@Autowired
	Device_detailMapper device_detailMapper;
	@Autowired
	Device_logMapper device_logMapper;


	@RequestMapping("main")
	public String Main(Model model) {

		return "/admin/lend/main";
	}

	@RequestMapping("booklist")
	public String Book(Model model, String srchText, String order) {

		if(srchText == null && order==null) {
			model.addAttribute("lends", lendMapper.findAllByStateZero());//상태(승인대기)인 예약들만 불러오기
			order = "학번";
		}
		else if (srchText == null )
		{	srchText = "";
		}
		else if(order.equals("학번")) {
			model.addAttribute("lends", lendMapper.findAllByStateZeroSNum("%" + srchText + "%"));//상태(승인대기)에서 해당하는 학번의 예약들에서 불러오기
		}
		else if(order.equals("장비명")) {
			model.addAttribute("lends", lendMapper.findAllByStateZeroDevice("%" + srchText + "%"));//상태(승인대기)에서 해당하는 장비들의 예약들에서 불러오기
		}

		model.addAttribute("srchText", srchText);
		model.addAttribute("order", order);

		return "/admin/lend/booklist";
	}

	@RequestMapping("approve")
	public String Approve(Model model, String lend_no, Principal principal) {

		Integer lend_No = Integer.parseInt(lend_no);
		Lend selectedLend = lendMapper.findByNo(lend_No);//lend 넘버에 해당하는 예약 불러오기
		// 상태:예약승인(state=2)으로 업데이트
		selectedLend.setState(2);

		lendMapper.UpdateLend(selectedLend);

		return "redirect:booklist";
	}

	@RequestMapping("refuse")
	public String Refuse(Model model, String lend_no, Principal principal) {

		Integer lend_No = Integer.parseInt(lend_no);
		Lend selectedLend = lendMapper.findByNo(lend_No);//lend 넘버에 해당하는 예약 불러오기
		// 상태:승인거절(state=1)으로 업데이트
		selectedLend.setState(1);
		lendMapper.UpdateLend(selectedLend);

		return "redirect:booklist";
	}

	@RequestMapping("rentlist")
	public String Rentlist(Model model, String srchText, String order) {

		if(srchText == null && order==null) {
			model.addAttribute("lends", lendMapper.findAllByStateTwo());//상태(예약승인)인 예약들만 불러오기
			order = "학번";
		}
		else if (srchText == null )
		{	srchText = "";
		}
		else if(order.equals("학번")) {
			model.addAttribute("lends", lendMapper.findAllByStateTwoSNum("%" + srchText + "%"));//상태(예약승인)에서 해당하는 학번의 예약들에서 불러오기
		}
		else if(order.equals("장비명")) {
			model.addAttribute("lends", lendMapper.findAllByStateTwoDevice("%" + srchText + "%"));//상태(예약승인)에서 해당하는 장비명의 예약들에서 불러오기
		}
		Timestamp currenttime = new Timestamp(System.currentTimeMillis());
		model.addAttribute("currenttime", currenttime);

		model.addAttribute("srchText", srchText);
		model.addAttribute("order", order);


		return "/admin/lend/rentlist";
	}

	@PostMapping("rentsave")
	public String RentSave(Model model, String detail_no, String lend_no,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date end_date, Principal principal) {


		int lend_No = Integer.parseInt(lend_no);
		Lend selectedLend = lendMapper.findByNo(lend_No);

		int detail_No = Integer.parseInt(detail_no);
		selectedLend.setDetail_no(detail_No);//장비 디테일넘버 삽입

		//장비코드명의 디테일 넘버에 해당하는 장비 불러오기
		Device_detail device_detail = device_detailMapper.findByDevice_code(selectedLend.getDevice_code(), detail_No);
		device_detail.setState(0);//장비코드명의 디테일 넘버에 해당하는 장비 상태(대여중)으로 변경
		device_detailMapper.UpdateDevice_detail(device_detail);

		// 오늘 날짜를 start_date(대여일)에 삽입
		Timestamp currenttime = new Timestamp(System.currentTimeMillis());
		selectedLend.setStart_date(currenttime);
		// 선택된 end_date를 end_date(반납예정일)에 삽입
		selectedLend.setEnd_date(end_date);
		selectedLend.setState(3);//lend 상태(대여중)으로 변경

		//해당 장비 log(대여중) 생성
		Device_log device_log = new Device_log();
		device_log.setCode(selectedLend.getDevice_code());
		device_log.setSnum(principal.getName());//대여해준 관리자 아이디 삽입
		device_log.setState(3);
		device_log.setDetail_no(selectedLend.getDetail_no());

		device_logMapper.InsertDevice_log(device_log);

		// 선택된 lend 업데이트하기!
		lendMapper.UpdateLend(selectedLend);

		model.addAttribute("selectedLend", selectedLend);

		return "redirect:rentlist";
	}

	@RequestMapping("returnlist")
	public String Returnlist(Model model, String srchText, String order, Principal principal) {


		if(srchText == null && order==null) {
			model.addAttribute("lends", lendMapper.findAllByStateThree());//상태(대여중)인 예약들만 불러오기
			order = "학번";
		}
		else if (srchText == null )
		{	srchText = "";
		}
		else if(order.equals("학번")) {
			model.addAttribute("lends", lendMapper.findAllByStateThreeSNum("%" + srchText + "%"));//상태(대여중)에서 해당하는 학번의 예약들에서 불러오기
		}
		else if(order.equals("장비명")) {
			model.addAttribute("lends", lendMapper.findAllByStateThreeDevice("%" + srchText + "%"));//상태(대여중)에서 해당하는 장비명의 예약들에서 불러오기
		}

		model.addAttribute("srchText", srchText);
		model.addAttribute("order", order);

		return "/admin/lend/returnlist";
	}

	// 팝업창으로 반납일 선택하기
	@PostMapping("return")
	public String Return(Model model, String lend_no, Principal principal) {

		int lend_No = Integer.parseInt(lend_no);
		Lend selectedLend = lendMapper.findByNo(lend_No);

		 Date returnday= new Date(System.currentTimeMillis());//반납일에 오늘 날짜 삽입
		 Date endday=selectedLend.getEnd_date();//반납예정일 삽입


		long calDateDays = (endday.getTime() - returnday.getTime())/(24*60*60*1000);//반납예정일에서 반납일(오늘) 빼기

		calDateDays = Math.abs(calDateDays);

		long arrears =0;


		if(returnday.compareTo(endday) >0) { //반납예정일보다 반납일(오늘)이 더 크면
			calDateDays = calDateDays+1;
			if(memberMapper.findMember(principal.getName()).getFirst_major_id() == 9 || //디지털컨텐츠 학과 생이면
					memberMapper.findMember(principal.getName()).getSec_major_id() == 9)
			{
				arrears=calDateDays*500; // 연체료 하루에 500원
			}
			else {
				arrears=calDateDays*1000;// 연체료 하루에 1000원
			}

		}

		Date today = new Date(System.currentTimeMillis());

		model.addAttribute("today", today);
		model.addAttribute("arrears", arrears);
		model.addAttribute("calDateDays", calDateDays);
		model.addAttribute("returnday", returnday);
		model.addAttribute("endday", endday);
		model.addAttribute("lend_no", lend_no);
		model.addAttribute("selectedLend", selectedLend);

		return "/admin/lend/return";
	}

	// 반납한 정보 저장완료 메세지 보여주기
	@PostMapping("returnsave")
	public String ReturnSave(Model model, String lend_no, String arrears, Principal principal) {


		int lend_No = Integer.parseInt(lend_no);
		Lend selectedLend = lendMapper.findByNo(lend_No);

		//해당 장비 log(반납완료) 생성
		Device_log device_log = new Device_log();
		device_log.setCode(selectedLend.getDevice_code());
		device_log.setSnum(principal.getName());//반납해준 관리자 로그인 정보 삽입
		device_log.setState(4);
		device_log.setDetail_no(selectedLend.getDetail_no());

		device_logMapper.InsertDevice_log(device_log);


		Device_detail device_detail = device_detailMapper.findByDevice_code(selectedLend.getDevice_code(),
				selectedLend.getDetail_no());
		device_detail.setState(2);//장비 상태(대기)로 바꾸기
		device_detailMapper.UpdateDevice_detail(device_detail);

		Timestamp currenttime = new Timestamp(System.currentTimeMillis());
		selectedLend.setReturn_date(currenttime);//반납일(오늘) 삽입
		selectedLend.setState(4);//lend 상태(반납완료) 변경
		int a = Integer.parseInt(arrears);//연체료 삽입
		selectedLend.setArrears(a);

		// 선택된 lend 업데이트하기!
		lendMapper.UpdateLend(selectedLend);

		model.addAttribute("selectedLend", selectedLend);

		return "redirect:returnlist";
	}

	@PostMapping("extendsave")
	public String ExtendSave(Model model, String lend_no, @DateTimeFormat(pattern = "yyyy-MM-dd") Date end_date,
			String arrears) {


		int lend_No = Integer.parseInt(lend_no);
		Lend selectedLend = lendMapper.findByNo(lend_No);

		// 선택된 return_date를 return_date(반납일)에 삽입
		if(end_date!=null) {
		selectedLend.setEnd_date(end_date);
		}
		selectedLend.setExtend(1);//연장 상태(불가능)로 변경
		int a = Integer.parseInt(arrears);//연체료 삽입
		selectedLend.setArrears(a);

		// 선택된 lend 업데이트하기
		lendMapper.UpdateLend(selectedLend);

		model.addAttribute("selectedLend", selectedLend);
		return "redirect:returnlist";
	}

	@RequestMapping("list")
	public String List(Model model, String srchText, String order) {


		if(srchText == null && order==null) {
			model.addAttribute("lends", lendMapper.findAll());//모든 예약 불러오기
			order = "학번";
		}
		else if (srchText == null )
		{	srchText = "";
		}
		else if(order.equals("학번")) {
			model.addAttribute("lends", lendMapper.findBySnum("%" + srchText + "%")); //해당 학번의 모든 예약 불러오기
		}
		else if(order.equals("장비명")) {
			model.addAttribute("lends", lendMapper.findByDevice_name("%" + srchText + "%")); //해당 장비명의 모든 예약 불러오기
		}

		model.addAttribute("srchText", srchText);
		model.addAttribute("order", order);
		return "/admin/lend/list";
	}

	@RequestMapping("devicelog")
	public String Devicelog(Model model, int detail_no, String device_code) {
		List<Device_log> device_logs = device_logMapper.findbyDetail_no(detail_no, device_code);//장비코드명의 디테일 넘버에 해당하는 장비의 log 불러오기

		model.addAttribute("device_logs", device_logs);

		return "/admin/lend/devicelog";
	}

	@RequestMapping("print")
	public String print(Model model, String lend_no) {

		int lend_No = Integer.parseInt(lend_no);
		Lend selectedLend = lendMapper.findByNo(lend_No);

		model.addAttribute("member", selectedLend);


		return "admin/lend/print";
	}

	@RequestMapping("print_button")
	public String print_button(Model model, String lend_no) {

		int lend_No = Integer.parseInt(lend_no);
		Lend selectedLend = lendMapper.findByNo(lend_No);

		model.addAttribute("member", selectedLend);
		model.addAttribute("lend_no", lend_no);


		return "admin/lend/print_button";
	}
}
