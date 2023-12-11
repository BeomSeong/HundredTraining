package com.study.springboot.dto;

import java.util.Date;

public class MemberDto {
	private int mId;
	private String memId;
	private String mNick;
	private String mPwd;
	private String mEmail;
	private String mPhone;
	private String mAdmin;
	private Date mDate;
	private String mBan;
	
	public MemberDto() {
		
	}
	
	public MemberDto(int mId, String memId, String mNick, String mPwd, String mEmail, String mPhone, String mAdmin,
			Date mDate, String mBan) {
		super();
		this.mId = mId;
		this.memId = memId;
		this.mNick = mNick;
		this.mPwd = mPwd;
		this.mEmail = mEmail;
		this.mPhone = mPhone;
		this.mAdmin = mAdmin;
		this.mDate = mDate;
		this.mBan = mBan;
	}
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getmNick() {
		return mNick;
	}
	public void setmNick(String mNick) {
		this.mNick = mNick;
	}
	public String getmPwd() {
		return mPwd;
	}
	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getmPhone() {
		return mPhone;
	}
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}
	public String getmAdmin() {
		return mAdmin;
	}
	public void setmAdmin(String mAdmin) {
		this.mAdmin = mAdmin;
	}
	public Date getmDate() {
		return mDate;
	}
	public void setmDate(Date mDate) {
		this.mDate = mDate;
	}
	public String getmBan() {
		return mBan;
	}
	public void setmBan(String mBan) {
		this.mBan = mBan;
	}
	
	
}	
