package com.study.springboot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.ReportDto;
import com.study.springboot.dto.ShopBoardDto;

@Mapper
public interface ReportDao {
	public List<ReportDto> Report();
	public int insertReport(@Param("_rCategory")String rCategory, 
							@Param("_rTitle")String rTitle,
							@Param("_rContent")String rContent,
							@Param("_mId")int mId,
							@Param("_fId")int fId);
	public int reportCount(@Param("_fId")int fId);
	public int reportCheck(Map<String, String> map);
	public int reportNoCheck(Map<String, String> map);
	public List<ReportDto> getReportPage(Map<String, Integer> map);
	public int getTotalCountReportPage();
	public List<ReportDto> getReportSearch(@Param("_query") String query,@Param("_search_type") String search_type,
											   @Param("_start") int start, @Param("_count") int count);
	public int getTotalCountReportSearch(@Param("_query") String query,@Param("_search_type") String search_type);
}
