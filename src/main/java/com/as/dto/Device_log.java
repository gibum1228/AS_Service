package com.as.dto;

import java.sql.Timestamp;

public class Device_log {
	// ===== Data =====
		private int log_no;
		private String code;
		private int detail_no;
		private String snum;
		private int state;
		private Timestamp date;
		// Device에서 장비명 불러오기
		private String device_name;


	// ===== getter & setter =====
		public int getLog_no() {
			return log_no;
		}
		public void setLog_no(int log_no) {
			this.log_no = log_no;
		}
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
		public String getSnum() {
			return snum;
		}
		public void setSnum(String snum) {
			this.snum = snum;
		}
		public int getState() {
			return state;
		}
		public void setState(int state) {
			this.state = state;
		}
		public Timestamp getDate() {
			return date;
		}
		public void setDate(Timestamp date) {
			this.date = date;
		}
		public String getDevice_name() {
			return device_name;
		}
		public void setDevice_name(String device_name) {
			this.device_name = device_name;
		}



}
