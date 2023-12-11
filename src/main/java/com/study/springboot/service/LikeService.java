package com.study.springboot.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.LikeDao;

@Service
public class LikeService implements ILikeService{
    	
	@Autowired
    private LikeDao likeDao;
	
	@Override
    public String goodBadInsert(String fId, String mId, String goodBad) {
		String json_data = "";
    	Map<String, String> map = new HashMap<String, String>();
		map.put("item1", mId);
		map.put("item2", fId);
		map.put("item3", goodBad);
		
		String nResult = likeDao.checkGoodBad(map);
		System.out.println("nResult:");
		System.out.println(nResult);
		String cancel = "";
		
		if(nResult != null) {
			if (nResult.equals(goodBad)) {
				likeDao.goodBadDeleteDao(map);
				cancel = "selectCancel";
				json_data = "{\"code\":\"success\", \"desc\":\"취소되었습니다.\", \"cancel\":\"" + cancel + "\"}";
			} else if (!nResult.equals(goodBad)) {
				json_data = "{\"code\":\"fail\", \"desc\":\"추천 또는 비추천은 하나만 선택 가능합니다.\"}";
			} else {
				json_data = "{\"code\":\"fail\", \"desc\":\"처리중 에러가 발생했습니다.(null_x)\"}";
			}
		} else if (nResult == null){
			likeDao.goodBadInsertDao(map);
			
			if (goodBad.equals("good")){
				json_data = "{\"code\":\"success\", \"desc\":\"게시물을 추천하셨습니다.\"}";
			} else if(goodBad.equals("bad")) {
				json_data = "{\"code\":\"success\", \"desc\":\"게시물을 비추천하셨습니다.\"}";
			} else {
				json_data = "{\"code\":\"fail\", \"desc\":\"처리중 에러가 발생했습니다.(null)\"}";
			}
		}
		
    	return json_data;
    }
	
}

