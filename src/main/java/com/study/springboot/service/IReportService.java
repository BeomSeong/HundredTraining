package com.study.springboot.service;

import java.util.List;

import com.study.springboot.dto.BoardDto;
import com.study.springboot.dto.ReportDto;

import jakarta.servlet.http.HttpServletRequest;

public interface IReportService {
	public List<ReportDto> Report();
    public String insertReport(String rCategory, String rTitle, String rContent, String mId, String fId);
	public int reportCheck(String rId, HttpServletRequest req);
	public int reportNoCheck(String rId, HttpServletRequest req);
	public List<ReportDto> getReportPage(int page, int count);
	public int getTotalCountReportPage();
	public List<ReportDto> getReportSearch(String query, String search_type, int page, int count);
	public int getTotalCountReportSearch(String query, String search_type);
}