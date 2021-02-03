package com.as.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
public class LendFrontController {

	@Autowired
	LendMapper lendMapper;

	// 장비대여하기 페이지
	@GetMapping("select")
	public String Select(Model model) {

		/////// 날짜 선택 하기///////
		// >>>오늘 날짜로 부터 주말빼고 5일<<<

		/*
		 * Calendar cal = Calendar.getInstance(); Date d = new
		 * Date(cal.getTimeInMillis()); cal.setTime(d);
		 */

		String CurrentTime = "20220331";
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, Integer.parseInt(CurrentTime.substring(0, 4)));
		cal.set(Calendar.MONTH, Integer.parseInt(CurrentTime.substring(4, 6)) - 1);
		cal.set(Calendar.DATE, Integer.parseInt(CurrentTime.substring(6, 8)));

		// 오늘 날짜 가져와서 변수에 넣기
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int date = cal.get(Calendar.DATE);
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		int max = cal.getActualMaximum(Calendar.DATE);

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

		return "/front/lend/select";
	}

	// 팝업창 닫고 난 후 select 페이지
	@PostMapping("select")
	public String Select(Model model, String device_code, String visit_date) {


			/////// 날짜 선택 하기///////
			// >>>오늘 날짜로 부터 주말빼고 5일<<<

			/*
			 * Calendar cal = Calendar.getInstance(); Date d = new
			 * Date(cal.getTimeInMillis()); cal.setTime(d);
			 */

			String CurrentTime = "20220331";
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.YEAR, Integer.parseInt(CurrentTime.substring(0, 4)));
			cal.set(Calendar.MONTH, Integer.parseInt(CurrentTime.substring(4, 6)) - 1);
			cal.set(Calendar.DATE, Integer.parseInt(CurrentTime.substring(6, 8)));

			// 오늘 날짜 가져와서 변수에 넣기
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH) + 1;
			int date = cal.get(Calendar.DATE);
			int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
			int max = cal.getActualMaximum(Calendar.DATE);

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


		// device_code로 장비명 불러오기
		Device selecteddevice = lendMapper.DevicefindByDevice_Code(device_code);
		String device_name = selecteddevice.getName();
		model.addAttribute("device_name", device_name);

		model.addAttribute("device_code", device_code);
		model.addAttribute("visit_date", visit_date);

		return "/front/lend/select";
	}

	// 팝업창으로 원하는 학과 선택 페이지
	@PostMapping("majorselect")
	public String MajorSelect(Model model, String visit_date) {
		Member member = lendMapper.MemberfindBySnum("201635006"); // 임의로 지정
		Major firstmajor = lendMapper.MajorfindById(member.getFirst_major_id());
		Major secondmajor = lendMapper.MajorfindById(member.getSec_major_id());
		model.addAttribute("firstmajor", firstmajor);
		model.addAttribute("secondmajor", secondmajor);
		model.addAttribute("member", member);
		model.addAttribute("visit_date", visit_date);


		return "/front/lend/majorselect";
	}

	// 장비 type 선택하기
	  @GetMapping("deviceselect")
	  public String DeviceTypeSelect(Model model) {

	  return "/front/lend/deviceselect";
	  }

	// 장비 type 선택하기
	@PostMapping("deviceselect")
	public String DeviceSelect(Model model, String major_id, String device_type, String visit_date) {
		int id = Integer.parseInt(major_id);
		int type = Integer.parseInt(device_type);
		List<Device> devices = lendMapper.DevicefindByMajorIdAndType(id, type);
		model.addAttribute("device_type", device_type);
		model.addAttribute("devices", devices);
		model.addAttribute("devices_size", devices.size());// devices 몇개인지
		model.addAttribute("visit_date", visit_date);

		return "/front/lend/deviceselect";
	}

	@PostMapping("save")
	public String SelectDate(Model model, String device_code, String visit_date, String korDayOfWeek)
			throws ParseException {

		// lend 객체 생성
		Lend device_lend = new Lend();
		// 방문 날짜 visit_date 삽입
		device_lend.setSnum("201635006");// 임의로 지정
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date Visit_Date = transFormat.parse(visit_date);
		device_lend.setVisit_date(Visit_Date);
		// 선택된 장비 device_code 삽입
		device_lend.setDevice_code(device_code);
		// 현재시각 삽입
		Timestamp currenttime = new Timestamp(System.currentTimeMillis());
		device_lend.setWait_date(currenttime);

		model.addAttribute("device_lend", device_lend);
		lendMapper.LendInsert(device_lend);

		// device_code로 장비명 불러오기
		Device selecteddevice = lendMapper.DevicefindByDevice_Code(device_code);
		model.addAttribute("selecteddevice", selecteddevice);
		model.addAttribute("korDayOfWeek", korDayOfWeek);

		return "/front/lend/save";
	}

}