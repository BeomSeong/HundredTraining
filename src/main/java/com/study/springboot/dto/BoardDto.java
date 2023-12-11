package com.study.springboot.dto;

import java.sql.Timestamp;
import java.util.Date;

public class BoardDto {
	private int fId;
	private String fTitle;
	private String fContent;
	private int mId;
	private String mNick;
	private Timestamp fDate;
	private int fHit;
	private String fFilename;
	private String fFilepath;
	private int goodCount;
	private int badCount;
	private int totalLikeCount;
	private int commentCount;
	private int reportCount;
	
	public BoardDto() {
		
	}
	
	public BoardDto(int fId, String fTitle, String fContent, int mId, String mNick, Timestamp fDate, int fHit,
					String fFilename, String fFilepath, int goodCount, int badCount, int totalLikeCount, int commentCount, int reportCount) {
		this.fId = fId;
		this.fTitle = fTitle;
		this.fContent = fContent;
		this.mId = mId;
		this.mNick = mNick;
		this.fDate = fDate;
		this.fHit = fHit;
		this.fFilename = fFilename;
		this.fFilepath = fFilepath;
		this.goodCount = goodCount;
		this.badCount = badCount;
		this.totalLikeCount = totalLikeCount;
		this.commentCount = commentCount;
		this.reportCount = reportCount;
	}
	
	public int getfId() {
		return fId;
	}
	public void setfId(int fId) {
		this.fId = fId;
	}
	public String getfTitle() {
		return fTitle;
	}
	public void setfTitle(String fTitle) {
		this.fTitle = fTitle;
	}
	public String getfContent() {
		return fContent;
	}
	public void setfContent(String fContent) {
		this.fContent = fContent;
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
	public Date getfDate() {
		return fDate;
	}
	public void setfDate(Timestamp fDate) {
		this.fDate = fDate;
	}
	public int getfHit() {
		return fHit;
	}
	public void setfHit(int fHit) {
		this.fHit = fHit;
	}
	public String getfFilename() {
		return fFilename;
	}
	public void setfFilename(String fFilename) {
		this.fFilename = fFilename;
	}
	public String getfFilepath() {
		return fFilepath;
	}
	public void setfFilepath(String fFilepath) {
		this.fFilepath = fFilepath;
	}
	public int getgoodCount() {
		return goodCount;
	}
	public void setgoodCount(int goodCount) {
		this.goodCount = goodCount;
	}
	public int getbadCount() {
		return badCount;
	}
	public void setbadCount(int badCount) {
		this.badCount = badCount;
	}
	public int gettotalLikeCount() {
		return totalLikeCount;
	}
	public void settotalLikeCount(int totalLikeCount) {
		this.totalLikeCount = totalLikeCount;
	}
	public int getcommentCount() {
		return commentCount;
	}
	public void setcommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public int getreportCount() {
		return reportCount;
	}

	public void setreportCount(int reportCount) {
		this.reportCount = reportCount;
	}
	
	
}


