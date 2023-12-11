package com.study.springboot.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.PaymentDao;
import com.study.springboot.dao.ShopBoardDao;
import com.study.springboot.dto.PaymentDto;
import com.study.springboot.dto.ShopBoardDto;

@Service
public class ShopService implements IShopService{
    
    @Autowired
    private ShopBoardDao shopBoardDao;
    
    @Autowired
    private PaymentDao paymentDao; // 추가된 부분
    
    @Override
    public void hShopProductInsert(String sTitle, String sContent, String sMoney, String fileName, String filePath, String sCategory){
    	
    	filePath = filePath.substring(filePath.indexOf("/images"));

    	Map<String, String> map = new HashMap<String, String>();
		map.put("item1", sTitle);
		map.put("item2", sContent);
		map.put("item3", fileName);
		map.put("item4", filePath);
		map.put("item5", sCategory);
    	
		shopBoardDao.hShopProductInsert(sTitle, sContent, Integer.parseInt(sMoney), fileName, filePath, sCategory);
    }
    
    @Override
    public String insertPayment(String pName, String pPhone, String pAddress, int sId, int mId, int quantity, int totalPrice, String orderId) {
		
    	int nResult = paymentDao.insertPayment(pName, pPhone, pAddress, sId, mId, quantity, totalPrice, orderId);
    	
    	String json_data;
    	if (nResult == 1) {
    		json_data = "{\"code\":\"success\"}";
		} else if (nResult == 0) {
			json_data = "{\"code\":\"fail\", \"desc\":\"처리중 에러가 발생했습니다.(0)\"}";
		} else {
			json_data = "{\"code\":\"fail\", \"desc\":\"처리중 에러가 발생했습니다.(none)\"}";
		}
    	
    	return json_data;
    }
    
    @Override
    public List<PaymentDto> getMyProducts(int mId){
    	System.out.println("서비스" + mId);
    	
    	List<PaymentDto> dtos = paymentDao.getMyProducts(mId);
    	
    	System.out.println("서비스2");
    	for(PaymentDto dto: dtos) {
    		ShopBoardDto sIdInfo = shopBoardDao.getProductInfo(dto.getsId());
    		
    		System.out.println(dto.getsId());
    		String sTitle = sIdInfo.getsTitle();
			dto.setsTitle(sTitle);

		}
    	
		return dtos;
    }
    
    @Override
	public int deleteShop(int sId) {
		
    	ShopBoardDto dto = shopBoardDao.getProductInfo(sId);
    	String filePath = dto.getsFilepath();
    	filePath = "D:/LEEJISU/Web/06.SpringBoot/TrainingProject/TrainingProject/src/main/resources/static" + filePath;
    	File file = new File(filePath);
    	
    	if (file.exists()) {
    		file.delete();
    	}
    	
    	int nResult = shopBoardDao.deleteShop(sId);
		
		return nResult;
	}
	
	@Override
	public ShopBoardDto shopModify(int sId){
		
//    	ShopBoardDto dto = shopBoardDao.getProductInfo(sId);
//    	String filePath = dto.getsFilepath();
//    	filePath = "D:/LEEJISU/Web/06.SpringBoot/TrainingProject/TrainingProject/src/main/resources/static" + filePath;
//    	File file = new File(filePath);
//    	
//    	if (file.exists()) {
//    		file.delete();
//    	}
    
		
		return shopBoardDao.shopModify(sId);
	}
	
	@Override
	public List<ShopBoardDto> getRandomProducts(int count) {
		
        return shopBoardDao.getRandomProducts(count);
    }
	
	@Override
	public int modifyShopBoard(int sId, String sTitle, String sContent, String fileName, String filePath, String sCategory) {
		
		
		if (filePath != null) {
			ShopBoardDto dto = shopBoardDao.getProductInfo(sId);
	    	
			String oldFilePath = dto.getsFilepath();
			oldFilePath = "/home/ec2-user/apache-tomcat-10.1.16/webapps/TrainingProject/WEB-INF/classes/static" + oldFilePath;
	    	File file = new File(oldFilePath);
	    	
	    	if (file.exists()) {
	    		file.delete();
	    	}
	    	filePath = filePath.substring(filePath.indexOf("/images"));
		}
		
    	int nResult = shopBoardDao.modifyShopBoard(sId, sTitle, sContent, fileName, filePath, sCategory);
    	return nResult;
	}
	
 	@Override
	public List<PaymentDto> getMyShopPage(int mId, int page, int count) {
	    int start = (page - 1) * count;
	    
	    Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("item1", mId);
		map.put("item2", start);
		map.put("item3", count);
	    
	    List<PaymentDto> dtos = paymentDao.getMyShopPage(map);
	    
    	System.out.println("서비스2");
    	for(PaymentDto dto: dtos) {
    		ShopBoardDto sIdInfo = shopBoardDao.getProductInfo(dto.getsId());
    		
    		System.out.println(dto.getsId());
    		String sTitle = sIdInfo.getsTitle();
			dto.setsTitle(sTitle);

		}
	    
		return dtos;
	}
	
	@Override
	public int getTotalCountMyShopPage(int mId) {
	    return paymentDao.getTotalCountMyShopPage(mId);
	}
	
	@Override
 	public List<ShopBoardDto> getAllProductsPage(int page, int count) {
        int start = (page - 1) * count;
        
        Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("item2", start);
		map.put("item3", count);
    
		List<ShopBoardDto> dtos = shopBoardDao.getAllProductsPage(map);
    
		return dtos;
	}

    @Override
    public int getTotalCountAllProductsPage() {
        return shopBoardDao.getTotalCountAllProductsPage();
    }

    @Override
 	public List<ShopBoardDto> getAllProductsSearch(String query, String search_type, int page, int count) {
        int start = (page - 1) * count;
        
        query = '%'+query+'%';
        
		List<ShopBoardDto> dtos = shopBoardDao.getAllProductsSearch(query, search_type, start, count);
    
		return dtos;
	}

    @Override
    public int getTotalCountAllProductsSearch(String query, String search_type) {
    	
    	query = '%'+query+'%';
    	
        return shopBoardDao.getTotalCountAllProductsSearch(query, search_type);
    }

}
