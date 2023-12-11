package com.study.springboot.dto;

import java.util.Date;

public class ShopBoardDto {
	private int sId;
	private String sTitle;
	private String sContent;
	private int sMoney;
	private int sOrderNum;
	private String sFilename;
	private String sFilepath;
	private String sCategory;
	private Date sDate;
	
	public ShopBoardDto() {
		
	}
	
	public ShopBoardDto(int sId, String sTitle, String sContent, int sMoney, int sOrderNum, String sFilename,
			String sFilepath, String sCategory, Date sDate) {
		super();
		this.sId = sId;
		this.sTitle = sTitle;
		this.sContent = sContent;
		this.sMoney = sMoney;
		this.sOrderNum = sOrderNum;
		this.sFilename = sFilename;
		this.sFilepath = sFilepath;
		this.sCategory = sCategory;
		this.sDate = sDate;
	}
	public int getsId() {
		return sId;
	}
	public void setsId(int sId) {
		this.sId = sId;
	}
	public String getsTitle() {
		return sTitle;
	}
	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}
	public String getsContent() {
		return sContent;
	}
	public void setsContent(String sContent) {
		this.sContent = sContent;
	}
	public int getsMoney() {
		return sMoney;
	}
	public void setsMoney(int sMoney) {
		this.sMoney = sMoney;
	}
	public int getsOrderNum() {
		return sOrderNum;
	}
	public void setsOrderNum(int sOrderNum) {
		this.sOrderNum = sOrderNum;
	}
	public String getsFilename() {
		return sFilename;
	}
	public void setsFilename(String sFilename) {
		this.sFilename = sFilename;
	}
	public String getsFilepath() {
		return sFilepath;
	}
	public void setsFilepath(String sFilepath) {
		this.sFilepath = sFilepath;
	}
	public String getsCategory() {
		return sCategory;
	}
	public void setsCategory(String sCategory) {
		this.sCategory = sCategory;
	}
	public Date getsDate() {
		return sDate;
	}
	public void setsDate(Date sDate) {
		this.sDate = sDate;
	}
	
}
