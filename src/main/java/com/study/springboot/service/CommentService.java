package com.study.springboot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.CommentDao;
import com.study.springboot.dao.MemberDao;
import com.study.springboot.dto.BoardDto;
import com.study.springboot.dto.CommentDto;
import com.study.springboot.dto.MemberDto;

@Service
public class CommentService implements ICommentService {
    @Autowired
    private CommentDao CommentDao;
    
    @Autowired
    private MemberDao memberDao;
    
    @Override
    public List<CommentDto> CommentList() {
		return CommentDao.CommentList();
	}
    
    @Override
    public List<CommentDto> BoardCommentList(int fId) {
    	
    	List<CommentDto> dtos = CommentDao.BoardCommentList(fId);
    	
    	for(CommentDto dto: dtos) {
    		String checkDeleted = "삭제된 댓글입니다.";
    		if (checkDeleted.equals(dto.getcContent())) {
    			dto.setmNick("-");
    		}
		}
    	
		return dtos;
	}
    
    @Override
    public String insertComment(String cContent, String mId, String fId) {
    	
    	int nResult = CommentDao.insertComment(cContent, Integer.parseInt(mId), Integer.parseInt(fId));

    	String json_data = "";
    	
    	if (nResult == 1) {
    		json_data = "{\"code\":\"success\", \"desc\":\"댓글이 등록되었습니다.\"}";
		} else if (nResult == 0) {
			json_data = "{\"code\":\"fail\", \"desc\":\"처리중 에러가 발생했습니다.(0)\"}";
		} else {
			json_data = "{\"code\":\"fail\", \"desc\":\"처리중 에러가 발생했습니다.(none)\"}";
		}
    	
    	return json_data;
    }
    
    @Override
    public String deleteComment(String cId) {
    	String exComment = "삭제된 댓글입니다.";
    	int nResult = CommentDao.deleteComment(Integer.parseInt(cId), exComment);

    	String json_data = "";
    	
    	if (nResult == 1) {
    		json_data = "{\"code\":\"success\", \"desc\":\"댓글이 삭제되었습니다.\"}";
		} else if (nResult == 0) {
			json_data = "{\"code\":\"fail\", \"desc\":\"처리중 에러가 발생했습니다.(0)\"}";
		} else {
			json_data = "{\"code\":\"fail\", \"desc\":\"처리중 에러가 발생했습니다.(none)\"}";
		}
    	
    	return json_data;
    }
    
    @Override
    public List<CommentDto> myChart(int mId) { 
    	System.out.println("Service" + mId);
    	
    	Map<String, Integer> map = new HashMap<String, Integer>();
    	map.put("item1", mId);
    	
		return CommentDao.myChart(map);
	}
    
    @Override
    public List<CommentDto> getMyCommentPage(int mId, int page, int count) {
        int start = (page - 1) * count;
        
        Map<String, Integer> map = new HashMap<String, Integer>();
    	map.put("item1", mId);
    	map.put("item2", start);
    	map.put("item3", count);
        
        List<CommentDto> dtos = CommentDao.getMyCommentPage(map);
        
        
		return dtos;
    }
    
    @Override
    public int getTotalCountMyCommentPage(int mId) {
        return CommentDao.getTotalCountMyCommentPage(mId);
    }
    
    @Override
 	public List<CommentDto> getCommentListPage(int page, int count) {
        int start = (page - 1) * count;
        
        Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("item2", start);
		map.put("item3", count);
    
		List<CommentDto> dtos = CommentDao.getCommentListPage(map);
		
//		for(CommentDto dto: dtos) {
//    		
//			MemberDto memDto = memberDao.getMemberInfo(dto.getmId());
//			dto.setmNick(memDto.getmNick());
//		}
		return dtos;
	}

    @Override
    public int getTotalCountCommentListPage() {
        return CommentDao.getTotalCountCommentListPage();
    }

    @Override
 	public List<CommentDto> getCommentListSearch(String query, String search_type, int page, int count) {
        int start = (page - 1) * count;
        
        query = '%'+query+'%';
        
		List<CommentDto> dtos = CommentDao.getCommentListSearch(query, search_type, start, count);
    
		return dtos;
	}

    @Override
    public int getTotalCountCommentListSearch(String query, String search_type) {
    	
    	query = '%'+query+'%';
    	
        return CommentDao.getTotalCountCommentListSearch(query, search_type);
    }
    
    
}
