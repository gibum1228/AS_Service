package com.as.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Device_detail {
// ===== Data =====
	private String code;
	private int detail_no;
	private int state;

// ===== getter & setter =====

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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

