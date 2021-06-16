package com.as.controller;

import java.security.Principal;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.as.dto.Device;
import com.as.dto.Lend;
import com.as.mapper.DeviceMapper;
import com.as.mapper.Device_detailMapper;
import com.as.mapper.Device_logMapper;
import com.as.mapper.LendMapper;
import com.as.mapper.MajorMapper;
import com.as.mapper.MemberMapper;

@Controller
@RequestMapping("/user/lend")
public class LendFrontController {

	@Autowired
	LendMapper lendMapper;
	@Autowired
	DeviceMapper deviceMapper;
	@Autowired
	Device_detailMapper device_detailMapper;
	@Autowired
	MemberMapper memberMapper;
	@Autowired
	MajorMapper majorMapper;
	@Autowired
	Device_logMapper device_logMapper;

	//컴공 노트북 대여
	@RequestMapping("select_com_laptop")
	public String Device(Model model) {

		GregorianCalendar gc = new GregorianCalendar ();

		// 내일 날짜 가져와서 변수에 넣기
		gc.add(Calendar.DATE, 1);

		int year = gc.get(Calendar.YEAR);
		int month = gc.get(Calendar.MONTH) + 1;
		int date = gc.get(Calendar.DATE);
		int dayOfWeek = gc.get(Calendar.DAY_OF_WEEK);
		int max = gc.getActualMaximum(Calendar.DAY_OF_MONTH);

		Integer years[] = new Integer[5];
		Integer months[] = new Integer[5];
		Integer dates[] = new Integer[5];
		Integer dayOfWeeks[] = new Integer[5];
		String korDayOfWeeks[] = new String[5];

		for (int i = 0; i < 5; i++) {

			years[i] = year;
			months[i] = month;
			if (months[i] <= 12) {// 12월달이 넘어갈때
				dates[i] = date + i;
				if (dates[i] <= max) {// 달의 마지막날을 넘어갈때

					dayOfWeeks[i] = dayOfWeek + i;

					korDayOfWeeks[i] = "";
					switch (dayOfWeeks[i] % 7) {
					case 1:
						date = date + 1;
						dayOfWeek = dayOfWeek + 1;// 주말일경우에는 안나오게
						i--;
						break;
					case 2:
						korDayOfWeeks[i] = "월";
						break;
					case 3:
						korDayOfWeeks[i] = "화";
						break;
					case 4:
						korDayOfWeeks[i] = "수";
						break;
					case 5:
						korDayOfWeeks[i] = "목";
						break;
					case 6:
						korDayOfWeeks[i] = "금";
						break;
					case 0:
						date = date + 1;
						dayOfWeek = dayOfWeek + 1;// 주말일경우에는 안나오게
						i--;
						break;

					}

				} else {
					date = date - max;// 1일부터 다시 시작
					month++;// 다음달
					i--;
				}
			} else {
				year++;// 다음년도
				month = 1;// 1월부터 다시시작
				i--;
			}
		}

		// Date객체로 변환하기 위한 String 객체 배열
		String calendar[] = new String[5];
		for (int i = 0; i < 5; i++) {
			calendar[i] = years[i].toString() + "-" + months[i].toString() + "-" + dates[i].toString();
		}

		// Select에 보여주기 위한 String 객체 배열
		String selectDate[] = new String[5];
		for (int i = 0; i < 5; i++) {
			selectDate[i] = years[i] + "년" + months[i] + "월" + dates[i] + "일" + korDayOfWeeks[i] + "요일";
		}

		model.addAttribute("korDayOfWeeks", korDayOfWeeks);
		model.addAttribute("calendar", calendar);
		model.addAttribute("selectDate", selectDate);



		return "/user/lend/select_com_laptop";
	}


	//사용자별 예약리스트 보기
	@RequestMapping("userlist")
	public String Userlist(Model model, String device_code, String visit_date,String lend_type, Principal principal)
			throws ParseException {

		// lend 객체 생성
		Lend device_lend = new Lend();
		device_lend.setSnum(principal.getName());//로그인 아이디(학번) 저장

		//예약 날짜 visit_Date 삽입
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date Visit_Date = transFormat.parse(visit_date);
		device_lend.setVisit_date(Visit_Date);

		// 선택된 장비 device_code 삽입
		device_lend.setDevice_code(device_code);
		// 현재시각 삽입
		Timestamp currenttime = new Timestamp(System.currentTimeMillis());
		device_lend.setWait_date(currenttime);
		//상태: 승인대기중
		device_lend.setState(0);

		// 선택된 장비의 타입 삽입
		int lendtype=Integer.parseInt(lend_type);
		device_lend.setType(lendtype);

		//Lend 객체 삽입
		lendMapper.InsertLend(device_lend);

		// device_code로 장비명 불러오기
		Device selecteddevice = deviceMapper.findByDevice_Code(device_code);
		model.addAttribute("selecteddevice", selecteddevice);

		//로그인 아이디에 해당하는 예약리스트 가져오기
		List<Lend> lends = lendMapper.findBySnum(principal.getName());

		model.addAttribute("lends", lends);


		return "/user/lend/userlist";
	}

	@RequestMapping("userpage")
	public String Userlist(Model model, Principal principal)
			throws ParseException {


		//로그인 아이디에 해당하는 예약리스트 가져오기
		List<Lend> lends = lendMapper.findBySnum(principal.getName());

		model.addAttribute("lends", lends);


		return "/user/lend/userpage";
	}

}
