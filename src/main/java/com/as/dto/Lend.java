package com.as.dto;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Lend {
// ===== Data =====
	private int no;
	private String snum;
	private String device_code;
	private int detail_no;
	private int type;
	private Timestamp wait_date;
	private Date visit_date;
	private int state;
	private Date start_date;
	private Date end_date;
	private Date return_date;
	private int extend;
	private int arrears;
	// Device에서 장비명 불러오기
	private String device_name;
	// Member에서 이름 불러오기
	private String snum_name;
	// Major에서 학과이름 불러오기
	private String major_name;

// ===== getter & setter =====
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getSnum() {
		return snum;
	}

	public void setSnum(String snum) {
		this.snum = snum;
	}

	public String getDevice_code() {
		return device_code;
	}

	public void setDevice_code(String device_code) {
		this.device_code = device_code;
	}

	public int getDetail_no() {
		return detail_no;
	}

	public void setDetail_no(int detail_no) {
		this.detail_no = detail_no;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Timestamp getWait_date() {
		return wait_date;
	}

	public void setWait_date(Timestamp wait_date) {
		this.wait_date = wait_date;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date visit_date2) {
		this.start_date = visit_date2;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public Date getReturn_date() {
		return return_date;
	}

	public void setReturn_date(Date return_date) {
		this.return_date = return_date;
	}

	public int getExtend() {
		return extend;
	}

	public void setExtend(int extend) {
		this.extend = extend;
	}

	public int getArrears() {
		return arrears;
	}

	public void setArrears(int arrears) {
		this.arrears = arrears;
	}

	public Date getVisit_date() {
		return visit_date;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public void setVisit_date(Date visit_date) {
		this.visit_date = visit_date;
	}

	// Device에서 장비명 불러오기
	public String getDevice_name() {
		return device_name;
	}

	public void setDevice_name(String device_name) {
		this.device_name = device_name;
	}

	// Member에서 이름 불러오기
	public String getSnum_name() {
		return snum_name;
	}

	public void setSnum_name(String snum_name) {
		this.snum_name = snum_name;
	}


	// Major에서 학과이름 불러오기
	public String getMajor_name() {
		return major_name;
	}

	public void setMajor_name(String major_name) {
		this.major_name = major_name;
	}



}


