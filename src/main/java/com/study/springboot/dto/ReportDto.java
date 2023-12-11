package com.study.springboot.dto;

import java.util.Date;

public class ReportDto {
	private int rId;
	private int mId;
	private String rCategory;
	private String rTitle;
	private String rContent;
	private int fId;
	private Date rDate;
	private String rStatus;
	
	public ReportDto() {
		
	}
	
	public ReportDto(int rId, int mId, String rCategory, String rTitle, String rContent, 
					 int fId, Date rDate, String rStatus) {
		super();
		this.rId = rId;
		this.mId = mId;
		this.rCategory = rCategory;
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.fId = fId;
		this.rDate = rDate;
		this.rStatus = rStatus;
	}
	
	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
	}
	
	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	public String getrCategory() {
		return rCategory;
	}

	public void setrCategory(String rCategory) {
		this.rCategory = rCategory;
	}

	public String getrTitle() {
		return rTitle;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}

	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public int getfId() {
		return fId;
	}
	public void setfId(int fId) {
		this.fId = fId;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	public String getrStatus() {
		return rStatus;
	}
	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}
	
}
