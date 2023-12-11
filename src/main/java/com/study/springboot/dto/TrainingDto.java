package com.study.springboot.dto;

import java.sql.Timestamp;

public class TrainingDto {
	private int tId;
	private int mId;
	private int tPushNum;
	private int tSitupNum;
	private int tPullupNum;
	private int tRunDist;
	private String tDate;
	private int year;
	private int month;	
	
	public TrainingDto() {
		
	}
	
	public TrainingDto(int tId, int mId, int tPushNum, int tSitupNum, int tPullupNum, int tRunDist, String tDate, int year, int month) {
		super();
		this.tId = tId;
		this.mId = mId;
		this.tPushNum = tPushNum;
		this.tSitupNum = tSitupNum;
		this.tPullupNum = tPullupNum;
		this.tRunDist = tRunDist;
		this.tDate = tDate;
		this.year = year;
		this.month = month;
	}
	public int gettId() {
		return tId;
	}
	public void settId(int tId) {
		this.tId = tId;
	}
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	public int gettPushNum() {
		return tPushNum;
	}
	public void settPushNum(int tPushNum) {
		this.tPushNum = tPushNum;
	}
	public int gettSitupNum() {
		return tSitupNum;
	}
	public void settSitupNum(int tSitupNum) {
		this.tSitupNum = tSitupNum;
	}
	public int gettPullupNum() {
		return tPullupNum;
	}
	public void settPullupNum(int tPullupNum) {
		this.tPullupNum = tPullupNum;
	}
	public int gettRunDist() {
		return tRunDist;
	}
	public void settRunDist(int tRunDist) {
		this.tRunDist = tRunDist;
	}
	public String gettDate() {
		return tDate;
	}
	public void settDate(String tDate) {
		this.tDate = tDate;
	}
	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}
}
