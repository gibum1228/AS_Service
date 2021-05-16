package com.as.dto;

import java.sql.Date;

public class Notice implements Comparable<Notice> {

	/* data */

	private int no;
	private String snum;
	private String title;
	private String body;
	private int views;
	private Date write_date;


	/* getter -- setter */

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	 @Override
	    public int compareTo(Notice o) {
	        return o.getNo() - getNo();
	    }
}
