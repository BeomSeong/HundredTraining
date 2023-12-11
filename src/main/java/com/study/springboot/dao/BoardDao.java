package com.study.springboot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.BoardDto;
import com.study.springboot.dto.CommentDto;
import com.study.springboot.dto.MemberDto;

@Mapper
public interface BoardDao {
	public List<BoardDto> getAllPosts(); // 모든 게시물 가져오기
	public BoardDto getPost(int fId); // 특정 게시물 가져오기
	public int createPost(BoardDto post); // 게시물 생성
	public int updatePost(BoardDto post); // 게시물 수정
	public int deletePost(@Param("_fId") int fId); // 게시물 삭제
	
	public List<BoardDto> getBoards(@Param("start") int start, @Param("pageSize") int pageSize);
	public int upHit(@Param("_fId") int fId);
	public List<BoardDto> myChart(Map<String, Integer> map);
	public int updateMem(Map<String, String> map);
	
	public List<BoardDto> getPostsByPage(@Param("start") int start, @Param("count") int count);
	public List<BoardDto> searchPosts(@Param("_query") String query, @Param("_select") String search_type,
									  @Param("start") int start, @Param("count") int count);
	public List<BoardDto> getBestPostsByPage(@Param("start") int start, @Param("count") int count);
	public List<BoardDto> getBestPostsByPageSearch(@Param("_query") String query, @Param("_select") String search_type,
			  									   @Param("start") int start, @Param("count") int count);
	public int getTotalCount();
	public int getTotalCountSearch(@Param("_query") String query, @Param("_select") String search_type);
    public int getTotalCountBestPosts();
    public int getTotalCountBestPostsSearch(@Param("_query") String query, @Param("_select") String search_type);
    public int deleteBoard(@Param("_fId") int fId);
    public List<BoardDto> getTopRecommendedPosts(@Param("count") int count);
    public void modifyBoard(@Param("_fId") int fId, @Param("_fTitle") String fTitle,
			   @Param("_fContent") String fContent, @Param("_fFileName") String fileName, @Param("_fFilePath") String filePath);
    public List<BoardDto> getMyBoardPage(Map<String, Integer> map);
	public int getTotalCountMyBoardPage(@Param("_mId") int mId);
	public List<BoardDto> getAllPostsPage(Map<String, Integer> map);
	public int getTotalCountAllPostsPage();
	public List<BoardDto> getAllPostsSearch(@Param("_query") String query,@Param("_search_type") String search_type,
											   @Param("_start") int start, @Param("_count") int count);
	public int getTotalCountAllPostsSearch(@Param("_query") String query,@Param("_search_type") String search_type);
}    