package com.as.dto;

import java.sql.Date;

public class Device {
// ===== Data =====
	int device_no;
	String device_name;
	int device_type;
	Date device_buy_date;
	int major_id;

// ===== get & set =====
	public int getDevice_no() {
		return device_no;
	}

	public void setDevice_no(int device_no) {
		this.device_no = device_no;
	}

	public String getDevice_name() {
		return device_name;
	}

	public void setDevice_name(String device_name) {
		this.device_name = device_name;
	}

	public int getDevice_type() {
		return device_type;
	}

	public void setDevice_type(int device_type) {
		this.device_type = device_type;
	}

	public Date getDevice_buy_date() {
		return device_buy_date;
	}

	public void setDevice_buy_date(Date device_buy_date) {
		this.device_buy_date = device_buy_date;
	}

	public int getMajor_id() {
		return major_id;
	}

	public void setMajor_id(int major_id) {
		this.major_id = major_id;
	}
}
