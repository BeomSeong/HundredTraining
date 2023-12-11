package com.study.springboot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.TrainingDao;
import com.study.springboot.dto.TrainingDto;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class TrainingService implements ITrainingService{
    @Autowired
    private TrainingDao trainingDao;
    
    @Override
    public List<TrainingDto> Chart(int mId) { 
    	System.out.println("Service" + mId);
    	
    	Map<String, Integer> map = new HashMap<String, Integer>();
    	map.put("item1", mId);
    	
		return trainingDao.Chart(map);
	}
    
	@Override
	public int Training(int mId, int tPushNum, int tSitupNum, int tPullupNum, int tRunDist, int tDate) {
		 
		int nResult = 0;
		System.out.println("111");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("item1", mId);
		map.put("item2", tPushNum);
		map.put("item3", tSitupNum);
		map.put("item4", tPullupNum);
		map.put("item5", tRunDist);
		map.put("item6", tDate);
		
		nResult = trainingDao.Training(map);	
		System.out.println(nResult);
		return nResult;
	}
	
	@Override
	public List<TrainingDto> selData(int mId, int year, int month) {
		
		String yearMonth = "";
		
		if(month !=10 && month !=11 && month != 12) {
			yearMonth = '%' + "" + year + "" + '0' + "" + month + "" + '%';
		} else {
			yearMonth = '%' + "" + year + "" + month + "" + '%';
		}
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("item1", year);
		map.put("item2", month);
		map.put("item3", mId);
		System.out.println("Service :" + mId);
		System.out.println();
		System.out.println(map);
		return trainingDao.selData(yearMonth, mId);
	}
	
}
