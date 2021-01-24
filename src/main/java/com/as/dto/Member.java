package com.as.dto;

import java.sql.Date;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class Member implements UserDetails {
	/*
	 * ver 1.0.0
	*/
	private static final long serialVersionUID = 1L;

	// ===== Data =====
	private String snum;
	private String password;
	private String name;
	private String email;
	private int first_major_id;
	private int sec_major_id;
	private Date signup_date;
	private int role_id;
	private int access;

	private boolean isAccountNonExpired;
	private boolean isAccountNonLocked;
	private boolean isCredentialsNonExpired;
	private boolean isEnabled;
	private Collection<? extends GrantedAuthority> authorities;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return this.authorities;
	}
	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return this.password;
	}
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.snum;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return this.isAccountNonExpired;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return this.isAccountNonLocked;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return this.isCredentialsNonExpired;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return this.isEnabled;
	}

// ===== getter & setter =====
	public String getSnum() {
		return snum;
	}
	public void setSnum(String snum) {
		this.snum = snum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getFirst_major_id() {
		return first_major_id;
	}
	public void setFirst_major_id(int first_major_id) {
		this.first_major_id = first_major_id;
	}
	public int getSec_major_id() {
		return sec_major_id;
	}
	public void setSec_major_id(int sec_major_id) {
		this.sec_major_id = sec_major_id;
	}
	public Date getSignup_date() {
		return signup_date;
	}
	public void setSignup_date(Date signup_date) {
		this.signup_date = signup_date;
	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public int getAccess() {
		return access;
	}
	public void setAccess(int access) {
		this.access = access;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setAccountNonExpired(boolean isAccountNonExpired) {
		this.isAccountNonExpired = isAccountNonExpired;
	}
	public void setAccountNonLocked(boolean isAccountNonLocked) {
		this.isAccountNonLocked = isAccountNonLocked;
	}
	public void setCredentialsNonExpired(boolean isCredentialsNonExpired) {
		this.isCredentialsNonExpired = isCredentialsNonExpired;
	}
	public void setEnabled(boolean isEnabled) {
		this.isEnabled = isEnabled;
	}
	public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
		this.authorities = authorities;
	}
}
