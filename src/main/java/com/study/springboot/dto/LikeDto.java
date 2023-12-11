package com.study.springboot.dto;

import java.util.Date;

public class LikeDto {
	private int gId;
	private String mNick;
	private int fId;
	private int gLike;
	
	public LikeDto() {
		
	}
	
	public LikeDto(int gId, String mNick, int fId, int gLike, Date gDate) {
		super();
		this.gId = gId;
		this.mNick = mNick;
		this.fId = fId;
		this.gLike = gLike;
		this.gDate = gDate;
	}

	public int getgId() {
		return gId;
	}
	public void setgId(int gId) {
		this.gId = gId;
	}
	public String getmNick() {
		return mNick;
	}
	public void setmNick(String mNick) {
		this.mNick = mNick;
	}
	public int getfId() {
		return fId;
	}
	public void setfId(int fId) {
		this.fId = fId;
	}
	public int getgLike() {
		return gLike;
	}
	public void setgLike(int gLike) {
		this.gLike = gLike;
	}
	public Date getgDate() {
		return gDate;
	}
	public void setgDate(Date gDate) {
		this.gDate = gDate;
	}
	private Date gDate;
}
