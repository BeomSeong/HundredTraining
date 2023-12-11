package com.study.springboot.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface LikeDao {
	
	public String checkGoodBad(Map<String, String> map);
	public void goodBadInsertDao(Map<String, String> map);
	public void goodBadDeleteDao(Map<String, String> map);
	public int countGoodDao(@Param("_fId")int fId);
	public int countBadDao(@Param("_fId")int fId);
	
	
	
//    void saveOrUpdateLike(LikeDto like);
//
//    int countLikes(@Param("fId") int fId);
//
//    int countDislikes(@Param("fId") int fId);
}
