package com.study.springboot.service;

import java.util.List;
import java.util.Map;

import com.study.springboot.dto.BoardDto;
import com.study.springboot.dto.MemberDto;

import jakarta.servlet.http.HttpServletRequest;

public interface IMemberService {
	public int joinConfirm(String memId, String mNick, String mPwd, String mPwdChk, String mEmail, String mPhone);
	public int loginConfirm(String memId, String mPwd, HttpServletRequest request);
	public int snsLoginConfirm(String mPwd, String mEmail, HttpServletRequest request);
	public Map<String, String> findId(String mPhone);
	public int pwModify(String mId, String mPwd);
	public int pwModifyLogin(String memId, String mPwd);
	public int deleteDao(String mId);
	public int updateMem(String mId, String memId, String mNick, String mEmail, HttpServletRequest request);
	public String pwCheck(String memId, String mPwd);
	public int hostLoginConfirm(String memId, String mPwd, String mAdmin, HttpServletRequest request);
	public List<MemberDto> memberList();
	public int memberBanInsert(String mId, HttpServletRequest req);
	public int memberBanDelete(String mId, HttpServletRequest req);
	public int memberAdminInsert(String mId, HttpServletRequest req);
	public int memberAdminDelete(String mId, HttpServletRequest req);
	public List<MemberDto> getMemberListPage(int page, int count);
	public int getTotalCountMemberListPage();
	public List<MemberDto> getMemberListSearch(String query, String search_type, int page, int count);
	public int getTotalCountMemberListSearch(String query, String search_type);
	
}
