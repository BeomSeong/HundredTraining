package com.study.springboot.dto;

import java.sql.Timestamp;

public class CommentDto {
	private int cId;
	private String cContent;
	private int mId;
	private String mNick;
	private int fId;
	private Timestamp cDate;
	private int cGroup;
	private int cStep;
	private int cIndent;
	
	public CommentDto() {
		
	}
	
	public CommentDto(int cId, String cContent, int mId, String mNick, int fId, Timestamp cDate, int cGroup, int cStep, int cIndent) {
		super();
		this.cId = cId;
		this.cContent = cContent;
		this.mId = mId;
		this.mNick = mNick;
		this.fId = fId;
		this.cDate = cDate;
		this.cGroup = cGroup;
		this.cStep = cStep;
		this.cIndent = cIndent;
	}
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
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
	public Timestamp getcDate() {
		return cDate;
	}
	public void setcDate(Timestamp cDate) {
		this.cDate = cDate;
	}
	public int getcGroup() {
		return cGroup;
	}
	public void setcGroup(int cGroup) {
		this.cGroup = cGroup;
	}
	public int getcStep() {
		return cStep;
	}
	public void setcStep(int cStep) {
		this.cStep = cStep;
	}
	public int getcIndent() {
		return cIndent;
	}
	public void setcIndent(int cIndent) {
		this.cIndent = cIndent;
	}
	
	
}
