package com.as.dto;

public class Device_detail {
// ===== Data =====
	private String device_code;
	private int detail_no;
	private int state;

// ===== getter & setter =====
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

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}


}
