package com.as.dto;

public class Student {
// ===== Data =====
	int student_snum;
	String student_password;
	String student_name;
	String student_email;
	int student_access;
	int student_position;
	int first_major_id;
	int second_major_id;

// ===== get & set =====
	public int getStudent_snum() {
		return student_snum;
	}
	public void setStudent_snum(int student_snum) {
		this.student_snum = student_snum;
	}
	public String getStudent_password() {
		return student_password;
	}
	public void setStudent_password(String student_password) {
		this.student_password = student_password;
	}
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public String getStudent_email() {
		return student_email;
	}
	public void setStudent_email(String student_email) {
		this.student_email = student_email;
	}
	public int getStudent_access() {
		return student_access;
	}
	public void setStudent_access(int student_access) {
		this.student_access = student_access;
	}
	public int getStudent_position() {
		return student_position;
	}
	public void setStudent_position(int student_position) {
		this.student_position = student_position;
	}
	public int getFirst_major_id() {
		return first_major_id;
	}
	public void setFirst_major_id(int first_major_id) {
		this.first_major_id = first_major_id;
	}
	public int getSecond_major_id() {
		return second_major_id;
	}
	public void setSecond_major_id(int second_major_id) {
		this.second_major_id = second_major_id;
	}
}
