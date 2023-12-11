package com.study.springboot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.BoardDto;
import com.study.springboot.dto.MemberDto;

@Mapper
public interface MemberDao {
	public int joinDao(Map<String, String> map);
	public String loginDao(Map<String, String> map);
	public int confirmId(Map<String, String> map);
	public int confirmSnsUser(Map<String, String> map);
	public int joinSnsUser(Map<String, String> map);
	public String findIdDao(Map<String, String> map);
	public int checkPhoneExist(Map<String, String> map);
	public MemberDto memInfo(Map<String, String> map);
//	public MemberDto getMemberInfo(@Param("_mId") int mId);
	public MemberDto memSnsInfo(@Param("_pw")String mPwd);
	public int pwModify(Map<String, String> map);
	public int pwModifyLogin(Map<String, String> map);
	public int deleteDao(@Param("_mId") int mId);
	public int updateMem(Map<String, String> map);
	public int pwCheck(Map<String, String> map);
	public String hostLoginDao(Map<String, String> map);
	public int confirmAdmin(Map<String, String> map);
	public List<MemberDto> memberList();
	public int memberBanInsert(Map<String, String> map);
	public int memberBanDelete(Map<String, String> map);
	public int memberAdminInsert(Map<String, String> map);
	public int memberAdminDelete(Map<String, String> map);
	public List<MemberDto> getMemberListPage(Map<String, Integer> map);
	public int getTotalCountMemberListPage();
	public List<MemberDto> getMemberListSearch(@Param("_query") String query,@Param("_search_type") String search_type,
											   @Param("_start") int start, @Param("_count") int count);
	public int getTotalCountMemberListSearch(@Param("_query") String query,@Param("_search_type") String search_type);

}
