package com.study.springboot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.BoardDao;
import com.study.springboot.dao.MemberDao;
import com.study.springboot.dto.BoardDto;
import com.study.springboot.dto.MemberDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class MemberService implements IMemberService{
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public int joinConfirm(String memId, String mNick, String mPwd, String mPwdChk, String mEmail, String mPhone) {
		
		int ri = confirmId(memId);
		int nResult = 0;
		
		if (ri == 1) {
			System.out.println("join fail_id exist");   // 아이디가 존재함
			nResult = -1;
			
		} else {										// 동일 아이디가 존재하지 않음 -> 회원가입가능
			Map<String, String> map = new HashMap<String, String>();
			map.put("item1", memId);
			map.put("item2", mNick);
			map.put("item3", mPwd);
			map.put("item4", mEmail);
			map.put("item5", mPhone);
			
			nResult = memberDao.joinDao(map);					// db 저장 성공시 1이 리턴된다
		}
		return nResult;
	}
	
	
	
	@Override
	public int loginConfirm(String memId, String mPwd, HttpServletRequest request) {
		int ri = confirmId(memId);
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("item1", memId);
		
		
		String dbPw;
		int nResult = 0;
		
		if(ri == 1) {
			dbPw = memberDao.loginDao(map);
			if (dbPw.equals(mPwd)) {
				System.out.println("login ok");
				nResult = 1;  // 로그인 성공
				
				memberDao.memInfo(map);
				MemberDto dto = memberDao.memInfo(map);
				
				request.getSession().invalidate();
				HttpSession session = request.getSession(true);
				session.setAttribute("mId", dto.getmId());
				session.setAttribute("memId", dto.getMemId());
				session.setAttribute("mNick", dto.getmNick());
				session.setAttribute("mEmail", dto.getmEmail());
				session.setAttribute("mAdmin", dto.getmAdmin());
				session.setAttribute("mBan", dto.getmBan());
				session.setMaxInactiveInterval(1800);

			} else {
				System.out.println("login fail_pwd");
				nResult = 0;  // 비밀번호가 맞지 않는다.
			}
		} else {
			System.out.println("login fail_no exist id");
			nResult = -1;
		}
		

		return nResult;
	}
	
	@Override
	public int snsLoginConfirm(String mPwd, String mEmail, HttpServletRequest request) {
		int nResult = 0;
		int snsUserCheck = confirmSnsUser(mPwd);
		Map<String, String> map = new HashMap<String, String>();
		
		if(snsUserCheck == 1) {				// sns 정보 토큰존재 -> 로그인 가능
			nResult = -1;
			
			MemberDto dto = memberDao.memSnsInfo(mPwd);
			
			request.getSession().invalidate();
			HttpSession session = request.getSession(true);
			session.setAttribute("mId", dto.getmId());
			session.setAttribute("memId", dto.getMemId());
			session.setAttribute("mNick", dto.getmNick());
			session.setAttribute("mEmail", dto.getmEmail());
			session.setAttribute("mAdmin", dto.getmAdmin());
			session.setAttribute("mBan", dto.getmBan());
			session.setMaxInactiveInterval(1800);
			
		} else if(snsUserCheck == 0) {		// sns 정보 없음 회원가입시킴
			map.put("item1", mPwd);
			map.put("item2", mEmail);
			
			nResult = memberDao.joinSnsUser(map);
		}
		
		return nResult;
	}
	
	@Override
	public Map<String, String> findId(String mPhone) {
		Map<String, String> map = new HashMap<String, String>();
		Map<String, String> mapReturn = new HashMap<String, String>();
		map.put("item1", mPhone);
		String memId = memberDao.findIdDao(map);
		String result;
		
		int ri = checkPhoneExist(mPhone);
		if(ri == 1) {
			result = "success";
		} else {
			result = "fail";
		}
		
		mapReturn.put("memId", memId);
		mapReturn.put("result", result);
		
		return mapReturn;
	}
	
	@Override
	public int pwModify(String mId, String mPwd) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("item1", mId);
		map.put("item2", mPwd);
		System.out.println(mId);
		int nResult = 0;
		
		if(mId != null) {
			memberDao.pwModify(map);
			nResult = 1;
			System.out.println("pw Update success");
		} else {
			System.out.println("pw Update Fail");
			nResult = -1;
		}
		return nResult;
	}
	
	@Override
	public int pwModifyLogin(String memId, String mPwd) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("item1", memId);
		map.put("item2", mPwd);
		
		int nResult = memberDao.pwModifyLogin(map);
		
		return nResult;
	}
	
	@Override
	public int deleteDao(String mId) {
    	System.out.println("Service" + mId);
        int nResult = memberDao.deleteDao(Integer.parseInt(mId));
        
        return nResult;
	}
	
	@Override
	public int updateMem(String mId, String memId, String mNick, String mEmail, HttpServletRequest request) {
		
		int ri = confirmId(memId);
		int nResult = 0;
		
		if (ri == 1) {
			System.out.println("join fail_id exist");   // 아이디가 존재함
			nResult = -1;
		} else { 
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("item1", mId);
		map.put("item2", memId);
		map.put("item3", mNick);
		map.put("item4", mEmail);
		System.out.println(mId);
		nResult = memberDao.updateMem(map);
		
		if (nResult == 1) {
			boardDao.updateMem(map);
			
			map.put("item1", memId);
			
			MemberDto dto = memberDao.memInfo(map);
			
			request.getSession().invalidate();
			HttpSession session = request.getSession(true);
			session.setAttribute("mId", dto.getmId());
			session.setAttribute("memId", dto.getMemId());
			session.setAttribute("mNick", dto.getmNick());
			session.setAttribute("mEmail", dto.getmEmail());
			session.setAttribute("mAdmin", dto.getmAdmin());
			session.setAttribute("mBan", dto.getmBan());
			session.setMaxInactiveInterval(1800);
				
			System.out.println("Update success");
			}
		}
		return nResult;
	}
	
	@Override
	public String pwCheck(String memId, String mPwd) {

		int ri = confirmId(memId);
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("item1", memId);
		map.put("item2", mPwd);
		
		String dbPw;
		
		String json_data = "";
		if(ri == 1) {
			dbPw = memberDao.loginDao(map);
			if (dbPw.equals(mPwd)) {
				System.out.println("modify login ok");
				json_data = "{\"code\":\"success\", \"desc\":\"인증되었습니다.\"}";
				memberDao.memInfo(map);

			} else {
				System.out.println("login fail_pwd");
				json_data = "{\"code\":\"fail\", \"desc\":\"비밀번호가 맞지 않습니다.\"}";
			}
		} else {
			System.out.println("login fail_no exist id");
			json_data = "{\"code\":\"fail\", \"desc\":\"에러가 발생하였습니다.\"}";
		}
		return json_data;
	}
	
	public int confirmId(String memId) {	// 아이디 중복확인, 아이디 존재확인
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("item1", memId);
		
		int ri = memberDao.confirmId(map);
		
		return ri;
	}
	
	public int confirmSnsUser(String mPwd) {	// sns 유저의 정보가 있는지 확인
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("item1", mPwd);
		
		int ri = memberDao.confirmSnsUser(map);
		
		return ri;
	}
	
	public int checkPhoneExist(String mPhone) {	// 전화번호가 존재하는지 확인
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("item1", mPhone);
		
		int ri = memberDao.checkPhoneExist(map);
		
		return ri;
	}
	
	@Override
    public List<MemberDto> memberList() {
	  return memberDao.memberList();
	}
    
	public int confirmAdmin(String memId, String mAdmin) {	// 존재 확인

		Map<String, String> map = new HashMap<String, String>();
		System.out.println(memId);
		System.out.println(mAdmin);
		map.put("item1", memId);
		map.put("item2", mAdmin);
		
		int ri = memberDao.confirmAdmin(map);
		
		return ri;
	}
	
	@Override
	public int hostLoginConfirm(String memId, String mPwd, String mAdmin, HttpServletRequest request) {
		int ri = confirmAdmin(memId, mAdmin);
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("item1", memId);
		map.put("item2", mAdmin);
		
		String dbPw;
		int nResult = 0;
		
		if(ri == 1) {
			dbPw = memberDao.hostLoginDao(map);
			if (dbPw.equals(mPwd)) {
				System.out.println("login ok");
				nResult = 1;  // 로그인 성공
				
				memberDao.memInfo(map);
				MemberDto dto = memberDao.memInfo(map);
				
				request.getSession().invalidate();
				HttpSession session = request.getSession(true);
				session.setAttribute("mId", dto.getmId());
				session.setAttribute("memId", dto.getMemId());
				session.setAttribute("mNick", dto.getmNick());
				session.setAttribute("mEmail", dto.getmEmail());
				session.setAttribute("mAdmin", dto.getmAdmin());
				session.setAttribute("mBan", dto.getmBan());
				session.setMaxInactiveInterval(1800);

			} else {
				System.out.println("login fail_pwd");
				nResult = 0;  // 비밀번호가 맞지 않는다.
			}
		} else {
			System.out.println("login fail_no exist id");
			nResult = -1;
		}
		return nResult;
	}
	
	@Override
	public int memberBanInsert(String mId, HttpServletRequest req) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("item1", mId);
		System.out.println("ServiceIn : " + mId);
		int ri = memberDao.memberBanInsert(map);
		
		return ri;
	}
	
	@Override
	public int memberBanDelete(String mId, HttpServletRequest req) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("item1", mId);
		System.out.println("ServiceDel : " + mId);
		
		int ri = memberDao.memberBanDelete(map);
		
		return ri;
	}
	
	@Override
	public int memberAdminInsert(String mId, HttpServletRequest req) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("item1", mId);
		System.out.println("AdminServiceIn : " + mId);
		int ri = memberDao.memberAdminInsert(map);
		
		return ri;
	}
	
	@Override
	public int memberAdminDelete(String mId, HttpServletRequest req) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("item1", mId);
		System.out.println("AdminServiceDel : " + mId);
		
		int ri = memberDao.memberAdminDelete(map);
		
		return ri;
	}
	
	@Override
 	public List<MemberDto> getMemberListPage(int page, int count) {
        int start = (page - 1) * count;
        
        Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("item2", start);
		map.put("item3", count);
    
		List<MemberDto> dtos = memberDao.getMemberListPage(map);
    
		return dtos;
	}

    @Override
    public int getTotalCountMemberListPage() {
        return memberDao.getTotalCountMemberListPage();
    }

    @Override
 	public List<MemberDto> getMemberListSearch(String query, String search_type, int page, int count) {
        int start = (page - 1) * count;
        
        if(search_type.equals("mBan")) {
        	query = "Ban";
        } else if(search_type.equals("mAdmin")){
        	query = "admin";
        }
        
        query = '%'+query+'%';
        
		List<MemberDto> dtos = memberDao.getMemberListSearch(query, search_type, start, count);
    
		return dtos;
	}

    @Override
    public int getTotalCountMemberListSearch(String query, String search_type) {
    	if(search_type.equals("mBan")) {
        	query = "Ban";
        } else if(search_type.equals("mAdmin")){
        	query = "admin";
        }
    	query = '%'+query+'%';
        return memberDao.getTotalCountMemberListSearch(query, search_type);
    }
}
