package com.study.springboot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.BoardDto;
import com.study.springboot.dto.CommentDto;

public interface CommentDao {
	public List<CommentDto> CommentList(); // 모든 게시물 가져오기
	public List<CommentDto> BoardCommentList(@Param("_fId")int fId); // 특정 게시물 모든 댓글 가져오기
	public int insertComment(@Param("_cContent")String cContent, 
							 @Param("_mId")int mId,
							 @Param("_fId")int fId);
	public int deleteComment(@Param("_cId")int cId, 
							 @Param("_exComment")String exComment);
	public int commentCount(@Param("_fId")int fId);
	public List<CommentDto> myChart(Map<String, Integer> map);
	public List<CommentDto> getMyCommentPage(Map<String, Integer> map);
	public int getTotalCountMyCommentPage(@Param("_mId") int mId);
	public List<CommentDto> getCommentListPage(Map<String, Integer> map);
	public int getTotalCountCommentListPage();
	public List<CommentDto> getCommentListSearch(@Param("_query") String query,@Param("_search_type") String search_type,
											   @Param("_start") int start, @Param("_count") int count);
	public int getTotalCountCommentListSearch(@Param("_query") String query,@Param("_search_type") String search_type);
}
