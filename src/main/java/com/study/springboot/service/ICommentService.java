package com.study.springboot.service;

import java.util.List;

import com.study.springboot.dto.CommentDto;

public interface ICommentService {
	public List<CommentDto> CommentList();
	public List<CommentDto> BoardCommentList(int fId); // 특정 게시물의 댓글 가져오기
	public String insertComment(String cContent, String mId, String fId);
	public String deleteComment(String cId);
	public List<CommentDto> myChart(int mId);
	public List<CommentDto> getMyCommentPage(int mId, int page, int count);
	public int getTotalCountMyCommentPage(int mId);
	public List<CommentDto> getCommentListPage(int page, int count);
	public int getTotalCountCommentListPage();
	public List<CommentDto> getCommentListSearch(String query, String search_type, int page, int count);
	public int getTotalCountCommentListSearch(String query, String search_type);
}
