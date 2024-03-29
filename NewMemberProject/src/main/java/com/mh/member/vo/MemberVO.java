package com.mh.member.vo;

import java.util.Date;

public class MemberVO {

	int mno;
	String mname;
	String email;
	String pwd;
	Date cre_date;
	Date mod_date;
	
	// getter/setter 만들고...
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Date getCre_date() {
		return cre_date;
	}
	public void setCre_date(Date cre_date) {
		this.cre_date = cre_date;
	}
	public Date getMod_date() {
		return mod_date;
	}
	public void setMod_date(Date mod_date) {
		this.mod_date = mod_date;
	}
	
	// toString -> 값을 한번에 찍을 때
	@Override
	public String toString() {
		return "MemberVO [mno=" + mno + ", mname=" + mname + ", email=" + email + ", pwd=" + pwd + ", cre_date="
				+ cre_date + ", mod_date=" + mod_date + "]";
	}
	
	// constructor 생성자... (필수는 아님)
	public MemberVO() { }
	public MemberVO(int mno, String mname, String email, String pwd, Date cre_date, Date mod_date) {
		super();
		this.mno = mno;
		this.mname = mname;
		this.email = email;
		this.pwd = pwd;
		this.cre_date = cre_date;
		this.mod_date = mod_date;
	}
	// MemberVO memberVO = new MemberVO();
	// MemberVO memberVO = new MemberVO(1, 'aaa', '1@mini.com', '111', sysdate, sysdate)
	
}
