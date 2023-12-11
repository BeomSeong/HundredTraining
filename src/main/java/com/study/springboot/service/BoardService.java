package com.study.springboot.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.study.springboot.dao.BoardDao;
import com.study.springboot.dao.CommentDao;
import com.study.springboot.dao.LikeDao;
import com.study.springboot.dao.ReportDao;
import com.study.springboot.dto.BoardDto;
import com.study.springboot.dto.CommentDto;
import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.ShopBoardDto;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class BoardService implements IBoardService{
    @Autowired
    private BoardDao boardDao;
    
    @Autowired
    private LikeDao likeDao;
    
    @Autowired
    private CommentDao commentDao;
    
    @Autowired
    private ReportDao reportDao;
    
    @Override
    public int createPost(BoardDto post) {
        return boardDao.createPost(post);
    }

    @Override
    public int deletePost(String fId) {
    	
    	System.out.println("에프아이디");
    	System.out.println(fId);
        int nResult = boardDao.deletePost(Integer.parseInt(fId));
        
        return nResult;
    }

    @Override
    public List<BoardDto> getBoards(int page, int pageSize) {
        int start = (page - 1) * pageSize;
        return boardDao.getBoards(start, pageSize);
    }
    
    @Override
    public List<BoardDto> getAllPosts() {
    	
    	List<BoardDto> dtos = boardDao.getAllPosts();
    	
    	for(BoardDto dto: dtos) {
    		
			int likeGood = likeDao.countGoodDao(dto.getfId());
			int likeBad = likeDao.countBadDao(dto.getfId());
			int commentCount = commentDao.commentCount(dto.getfId());
			dto.setgoodCount(likeGood);
			dto.setbadCount(likeBad);
			dto.settotalLikeCount(likeGood - likeBad);
			dto.setcommentCount(commentCount);
		}
    	
		return dtos;
	}
    
    @Override
    public List<BoardDto> myChart(int mId) { 
    	System.out.println("Service" + mId);
    	
    	Map<String, Integer> map = new HashMap<String, Integer>();
    	map.put("item1", mId);
    	
		return boardDao.myChart(map);
	}
    
    @Override
    public BoardDto getPost(int fId) {
    	
    	
    	BoardDto dto = boardDao.getPost(fId);
    	
    	int likeGood = likeDao.countGoodDao(dto.getfId());
		int likeBad = likeDao.countBadDao(dto.getfId());
		int commentCount = commentDao.commentCount(dto.getfId());
		int reportCount = reportDao.reportCount(dto.getfId());
    	
    	dto.setgoodCount(likeGood);
		dto.setbadCount(likeBad);
		dto.settotalLikeCount(likeGood - likeBad);
		dto.setcommentCount(commentCount);
		dto.setreportCount(reportCount);
    	
    	return dto;
    }
    
    public int upHit(int fId) {
    	return boardDao.upHit(fId);
    }
    
    

    @Override
    public List<BoardDto> getPostsByPage(int page, int count) {
        int start = (page - 1) * count;
        List<BoardDto> dtos = boardDao.getPostsByPage(start, count);
        
        for(BoardDto dto: dtos) {
			int likeGood = likeDao.countGoodDao(dto.getfId());
			int likeBad = likeDao.countBadDao(dto.getfId());
			int commentCount = commentDao.commentCount(dto.getfId());
			dto.setgoodCount(likeGood);
			dto.setbadCount(likeBad);
			dto.settotalLikeCount(likeGood - likeBad);
			dto.setcommentCount(commentCount);
			
		}
		return dtos;
    }
    
    @Override
    public List<BoardDto> searchPosts(String query, String search_type, int page, int count) {

    	query = '%'+query+'%';
    	
    	int start = (page - 1) * count;
        List<BoardDto> dtos = boardDao.searchPosts(query, search_type, start, count);
        
        for(BoardDto dto: dtos) {
			int likeGood = likeDao.countGoodDao(dto.getfId());
			int likeBad = likeDao.countBadDao(dto.getfId());
			int commentCount = commentDao.commentCount(dto.getfId());
			dto.setgoodCount(likeGood);
			dto.setbadCount(likeBad);
			dto.settotalLikeCount(likeGood - likeBad);
			dto.setcommentCount(commentCount);
			
		}
		return dtos;
    }
    
    @Override
    public List<BoardDto> getBestPostsByPage(int page, int count) {
        int start = (page - 1) * count;
        List<BoardDto> dtos = boardDao.getBestPostsByPage(start, count);
        
        for(BoardDto dto: dtos) {
            int likeGood = likeDao.countGoodDao(dto.getfId());
            int likeBad = likeDao.countBadDao(dto.getfId());
            int commentCount = commentDao.commentCount(dto.getfId());
            dto.setgoodCount(likeGood);
            dto.setbadCount(likeBad);
            dto.settotalLikeCount(likeGood - likeBad);
            dto.setcommentCount(commentCount);
        }
        return dtos;
    }
    
    @Override
    public List<BoardDto> getBestPostsByPageSearch(String query, String search_type, int page, int count) {

    	query = '%'+query+'%';
    	
    	int start = (page - 1) * count;
        List<BoardDto> dtos = boardDao.getBestPostsByPageSearch(query, search_type, start, count);
        
        for(BoardDto dto: dtos) {
			int likeGood = likeDao.countGoodDao(dto.getfId());
			int likeBad = likeDao.countBadDao(dto.getfId());
			int commentCount = commentDao.commentCount(dto.getfId());
			dto.setgoodCount(likeGood);
			dto.setbadCount(likeBad);
			dto.settotalLikeCount(likeGood - likeBad);
			dto.setcommentCount(commentCount);
			
		}
		return dtos;
    }

    @Override
    public int getTotalCount() {
        return boardDao.getTotalCount();
    }
    
    @Override
    public int getTotalCountSearch(String query, String search_type) {
    	query = '%'+query+'%';
        return boardDao.getTotalCountSearch(query, search_type);
    }
    
    @Override
    public int getTotalCountBestPosts() {
        return boardDao.getTotalCountBestPosts();
    }
    
    @Override
    public int getTotalCountBestPostsSearch(String query, String search_type) {
    	query = '%'+query+'%';
        return boardDao.getTotalCountBestPostsSearch(query, search_type);
    }
    
    @Override
    public String deleteBoard(String fId) {
    	int nResult = boardDao.deleteBoard(Integer.parseInt(fId));

    	String json_data = "";
    	
    	if (nResult == 1) {
    		json_data = "{\"code\":\"success\", \"desc\":\"게시글이 삭제되었습니다.\"}";
		} else if (nResult == 0) {
			json_data = "{\"code\":\"fail\", \"desc\":\"처리중 에러가 발생했습니다.(0)\"}";
		} else {
			json_data = "{\"code\":\"fail\", \"desc\":\"처리중 에러가 발생했습니다.(none)\"}";
		}
    	
    	return json_data;
    }
    
    public List<BoardDto> getTopRecommendedPosts(int count) {
        return boardDao.getTopRecommendedPosts(count);
    }
    
    @Override
	public void modifyBoard(String fId, String fTitle, String fContent, String fileName, String filePath, HttpServletRequest request) {
		
    	if (filePath != null) {
    		
			BoardDto dto = boardDao.getPost(Integer.parseInt(fId));
	    	
			String oldFilePath = dto.getfFilepath();
			oldFilePath = "/home/ec2-user/apache-tomcat-10.1.16/webapps/TrainingProject/WEB-INF/classes/static" + oldFilePath;
	    	File file = new File(oldFilePath);
	    	
	    	if (file.exists()) {
	    		file.delete();
	    	}
	    	filePath = filePath.substring(filePath.indexOf("/images"));
		}
		
		boardDao.modifyBoard(Integer.parseInt(fId), fTitle, fContent, fileName, filePath);


	}
    
    @Override
    public List<BoardDto> getMyBoardPage(int mId, int page, int count) {
        int start = (page - 1) * count;
        
        Map<String, Integer> map = new HashMap<String, Integer>();
    	map.put("item1", mId);
    	map.put("item2", start);
    	map.put("item3", count);
        
        List<BoardDto> dtos = boardDao.getMyBoardPage(map);
        
        
		return dtos;
    }
    
    @Override
    public int getTotalCountMyBoardPage(int mId) {
        return boardDao.getTotalCountMyBoardPage(mId);
    }
    
    
    @Override
 	public List<BoardDto> getAllPostsPage(int page, int count) {
        int start = (page - 1) * count;
        
        Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("item2", start);
		map.put("item3", count);
    
		List<BoardDto> dtos = boardDao.getAllPostsPage(map);
		for(BoardDto dto: dtos) {
			int likeGood = likeDao.countGoodDao(dto.getfId());
			int likeBad = likeDao.countBadDao(dto.getfId());
			int commentCount = commentDao.commentCount(dto.getfId());
			dto.setgoodCount(likeGood);
			dto.setbadCount(likeBad);
			dto.settotalLikeCount(likeGood - likeBad);
			dto.setcommentCount(commentCount);
			
		}
    
		return dtos;
	}

    @Override
    public int getTotalCountAllPostsPage() {
        return boardDao.getTotalCountAllPostsPage();
    }

    @Override
 	public List<BoardDto> getAllPostsSearch(String query, String search_type, int page, int count) {
        int start = (page - 1) * count;
        
        query = '%'+query+'%';
        
		List<BoardDto> dtos = boardDao.getAllPostsSearch(query, search_type, start, count);
		for(BoardDto dto: dtos) {
			int likeGood = likeDao.countGoodDao(dto.getfId());
			int likeBad = likeDao.countBadDao(dto.getfId());
			int commentCount = commentDao.commentCount(dto.getfId());
			dto.setgoodCount(likeGood);
			dto.setbadCount(likeBad);
			dto.settotalLikeCount(likeGood - likeBad);
			dto.setcommentCount(commentCount);
			
		}
    
		return dtos;
	}

    @Override
    public int getTotalCountAllPostsSearch(String query, String search_type) {
    	
    	query = '%'+query+'%';
    	
        return boardDao.getTotalCountAllPostsSearch(query, search_type);
    }
    
   
    
}
