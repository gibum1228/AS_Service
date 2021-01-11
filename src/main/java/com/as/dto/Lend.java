package com.as.dto;

import java.sql.Date;

public class Lend {
// ===== Data =====
	int lend_no;
	int student_snum;
	int device_no;
	int device_detail_no;
	int lend_type;
	Date lend_start;
	Date lend_end;
	Date lend_return;
	int lend_extend_state;
	int lend_state;
	int arrear;

// ===== get & set =====
	public int getLend_no() {
		return lend_no;
	}
	public void setLend_no(int lend_no) {
		this.lend_no = lend_no;
	}
	public int getStudent_snum() {
		return student_snum;
	}
	public void setStudent_snum(int student_snum) {
		this.student_snum = student_snum;
	}
	public int getDevice_no() {
		return device_no;
	}
	public void setDevice_no(int device_no) {
		this.device_no = device_no;
	}
	public int getDevice_detail_no() {
		return device_detail_no;
	}
	public void setDevice_detail_no(int device_detail_no) {
		this.device_detail_no = device_detail_no;
	}
	public int getLend_type() {
		return lend_type;
	}
	public void setLend_type(int lend_type) {
		this.lend_type = lend_type;
	}
	public Date getLend_start() {
		return lend_start;
	}
	public void setLend_start(Date lend_start) {
		this.lend_start = lend_start;
	}
	public Date getLend_end() {
		return lend_end;
	}
	public void setLend_end(Date lend_end) {
		this.lend_end = lend_end;
	}
	public Date getLend_return() {
		return lend_return;
	}
	public void setLend_return(Date lend_return) {
		this.lend_return = lend_return;
	}
	public int getLend_extend_state() {
		return lend_extend_state;
	}
	public void setLend_extend_state(int lend_extend_state) {
		this.lend_extend_state = lend_extend_state;
	}
	public int getLend_state() {
		return lend_state;
	}
	public void setLend_state(int lend_state) {
		this.lend_state = lend_state;
	}
	public int getArrear() {
		return arrear;
	}
	public void setArrear(int arrear) {
		this.arrear = arrear;
	}
}
