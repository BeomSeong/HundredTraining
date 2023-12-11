package com.study.springboot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.BoardDto;
import com.study.springboot.dto.PaymentDto;

@Mapper
public interface PaymentDao {
	public List<PaymentDto> getMyProducts(@Param("mId") int mId);
	
	public int insertPayment(@Param("_pName")String pName, 
							 @Param("_pPhone")String pPhone, 
							 @Param("_pAddress")String pAddress, 
							 @Param("_sId")int sId, 
							 @Param("_mId")int mId, 
							 @Param("_quantity")int quantity,
							 @Param("_totalPrice")int totalPrice,
							 @Param("_orderId")String orderId
			);
	public List<PaymentDto> getMyShopPage(Map<String, Integer> map);
	public int getTotalCountMyShopPage(@Param("_mId") int mId);
	
	
	
}
