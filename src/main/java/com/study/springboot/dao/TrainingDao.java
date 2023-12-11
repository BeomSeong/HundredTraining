package com.study.springboot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.TrainingDto;

import jakarta.servlet.http.HttpServletRequest;

@Mapper
public interface TrainingDao {
	public List<TrainingDto> Chart(Map<String, Integer> map); // 모든 게시물 가져오기
	public int Training(Map<String, Integer> map);
	public List<TrainingDto> selData(@Param("_yearMonth")String yearMonth,@Param("_mId") int mId);
}
