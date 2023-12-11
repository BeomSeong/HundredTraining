package com.study.springboot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.CommentDao;
import com.study.springboot.dao.ReportDao;
import com.study.springboot.dto.BoardDto;
import com.study.springboot.dto.ReportDto;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class ReportService implements IReportService{
	
	@Autowired
	private ReportDao reportDao;
	
	public List<ReportDto> Report() {
		return reportDao.Report();
	}
	
    @Override
    public String insertReport(String rCategory, String rTitle, String rContent, String mId, String fId) {
    	
    	int nResult = reportDao.insertReport(rCategory, rTitle, rContent, Integer.parseInt(mId), Integer.parseInt(fId));

    	String json_data = "";
    	
    	if (nResult == 1) {
    		json_data = "{\"code\":\"success\", \"desc\":\"신고가 접수되었습니다.\"}";
		} else if (nResult == 0) {
			json_data = "{\"code\":\"fail\", \"desc\":\"처리중 에러가 발생했습니다.(0)\"}";
		} else {
			json_data = "{\"code\":\"fail\", \"desc\":\"처리중 에러가 발생했습니다.(none)\"}";
		}
    	
    	return json_data;
    }
	
	@Override
	public int reportCheck(String rId, HttpServletRequest req) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("item1", rId);
		System.out.println("AdminServiceIn : " + rId);
		int ri = reportDao.reportCheck(map);
		
		return ri;
	}
	
	@Override
	public int reportNoCheck(String rId, HttpServletRequest req) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("item1", rId);
		System.out.println("AdminServiceDel : " + rId);
		
		int ri = reportDao.reportNoCheck(map);
		
		return ri;
	}
	
	@Override
 	public List<ReportDto> getReportPage(int page, int count) {
        int start = (page - 1) * count;
        
        Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("item2", start);
		map.put("item3", count);
    
		List<ReportDto> dtos = reportDao.getReportPage(map);
    
		return dtos;
	}

    @Override
    public int getTotalCountReportPage() {
        return reportDao.getTotalCountReportPage();
    }

    @Override
 	public List<ReportDto> getReportSearch(String query, String search_type, int page, int count) {
        int start = (page - 1) * count;
        
        query = '%'+query+'%';
        
		List<ReportDto> dtos = reportDao.getReportSearch(query, search_type, start, count);
    
		return dtos;
	}

    @Override
    public int getTotalCountReportSearch(String query, String search_type) {
    	
        query = '%'+query+'%';
    	
        return reportDao.getTotalCountReportSearch(query, search_type);
    }
}
