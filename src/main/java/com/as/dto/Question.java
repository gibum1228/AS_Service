package com.as.dto;

public class Question {
// ===== Data =====
	int question_no;
	int student_snum;
	int question_type;
	String question_title;
	String question_body;
	int question_state;

// ===== get & set =====
	public int getQuestion_no() {
		return question_no;
	}
	public void setQuestion_no(int question_no) {
		this.question_no = question_no;
	}
	public int getStudent_snum() {
		return student_snum;
	}
	public void setStudent_snum(int student_snum) {
		this.student_snum = student_snum;
	}
	public int getQuestion_type() {
		return question_type;
	}
	public void setQuestion_type(int question_type) {
		this.question_type = question_type;
	}
	public String getQuestion_title() {
		return question_title;
	}
	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}
	public String getQuestion_body() {
		return question_body;
	}
	public void setQuestion_body(String question_body) {
		this.question_body = question_body;
	}
	public int getQuestion_state() {
		return question_state;
	}
	public void setQuestion_state(int question_state) {
		this.question_state = question_state;
	}
}
