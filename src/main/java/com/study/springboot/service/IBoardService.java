package com.study.springboot.service;

import java.util.List;

import com.study.springboot.dto.BoardDto;
import com.study.springboot.dto.MemberDto;

import jakarta.servlet.http.HttpServletRequest;

public interface IBoardService {
	public List<BoardDto> getAllPosts();
	public int deletePost(String fId);
	public BoardDto getPost(int fId);
	public int createPost(BoardDto post);
	public List<BoardDto> getBoards(int page, int pageSize);
	public List<BoardDto> searchPosts(String query, String search_type, int page, int count);
	public List<BoardDto> getBestPostsByPage(int page, int count);
	public List<BoardDto> getBestPostsByPageSearch(String query, String search_type, int page, int count);
	public int getTotalCountSearch(String query, String search_type);
	public int getTotalCountBestPosts();
	public int getTotalCountBestPostsSearch(String query, String search_type);
	public List<BoardDto> myChart(int mId);
	public String deleteBoard(String fId);
	public List<BoardDto> getTopRecommendedPosts(int count);
	public void modifyBoard(String fId, String fTitle, String fContent, String fileName, String filePath, HttpServletRequest request);
	public List<BoardDto> getPostsByPage(int page, int count);
	public int getTotalCount();
	public List<BoardDto> getMyBoardPage(int mId, int page, int count);
	public int getTotalCountMyBoardPage(int mId);
	public List<BoardDto> getAllPostsPage(int page, int count);
	public int getTotalCountAllPostsPage();
	public List<BoardDto> getAllPostsSearch(String query, String search_type, int page, int count);
	public int getTotalCountAllPostsSearch(String query, String search_type);
	public int upHit(int fId);
}
