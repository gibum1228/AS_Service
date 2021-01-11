package com.as.dto;

public class Notice {
// ===== Data =====
	int notice_no;
	int student_snum;
	String notice_title;
	String notice_body;

// ===== get & set =====
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public int getStudent_snum() {
		return student_snum;
	}
	public void setStudent_snum(int student_snum) {
		this.student_snum = student_snum;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_body() {
		return notice_body;
	}
	public void setNotice_body(String notice_body) {
		this.notice_body = notice_body;
	}
}
