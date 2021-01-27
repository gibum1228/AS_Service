package com.as.dto;

import java.sql.Date;
import java.sql.Timestamp;

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
	private int arrear;

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
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
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
	public int getArrear() {
		return arrear;
	}
	public void setArrear(int arrear) {
		this.arrear = arrear;
	}
	public Date getVisit_date() {
		return visit_date;
	}
	public void setVisit_date(Date visit_date) {
		this.visit_date = visit_date;
	}

}
