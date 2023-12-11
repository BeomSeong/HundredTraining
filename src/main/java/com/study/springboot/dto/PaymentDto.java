package com.study.springboot.dto;

import java.sql.Timestamp;
import java.util.Date;

public class PaymentDto {
    private int pId; // 결제 아이디
    private String pName; // 결제자 이름
    private String pPhone; // 결제자 번호
    private String pAddress; // 결제자 주소
	private int sId; // 상품 아이디
    private int mId; // 회원 아이디
    private Timestamp pDate; // 결제 날짜
    private int quantity;
    private int totalPrice;
    private String orderId;
    private String sTitle;
    
    public PaymentDto() {
		
	}
    
    public PaymentDto(int pId, String pName, String pPhone, String pAddress, int sId, int mId, Timestamp pDate, int quantity, int totalPrice, String orderId, String sTitle) {
        this.pId = pId;
        this.pName = pName;
        this.pPhone = pPhone;
        this.pAddress = pAddress;
        this.sId = sId;
        this.mId = mId;
        this.pDate = pDate;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.orderId = orderId;
    }
    
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpPhone() {
		return pPhone;
	}
	public void setpPhone(String pPhone) {
		this.pPhone = pPhone;
	}
	public String getpAddress() {
		return pAddress;
	}
	public void setpAddress(String pAddress) {
		this.pAddress = pAddress;
	}
	public int getsId() {
		return sId;
	}
	public void setsId(int sId) {
        this.sId = sId;
    }
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	public Timestamp getpDate() {
		return pDate;
	}
	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}
	
	public int getquantity() {
		return quantity;
	}

	public void setquantity(int quantity) {
		this.quantity = quantity;
	}

	public int gettotalPrice() {
		return totalPrice;
	}

	public void settotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public String getorderId() {
		return orderId;
	}
	public void setorderId(String orderId) {
		this.orderId = orderId;
	}
	
	public String getsTitle() {
		return sTitle;
	}
	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}

	
	

    
}
