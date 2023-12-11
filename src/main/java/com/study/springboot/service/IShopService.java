package com.study.springboot.service;

import java.util.List;

import com.study.springboot.dto.PaymentDto;
import com.study.springboot.dto.ShopBoardDto;

public interface IShopService {

	public void hShopProductInsert(String sTitle, String sContent, String sMoney, String fileName, String filePath, String sCategory);
	public String insertPayment(String pName, String pPhone, String pAddress, int sId, int mId, int quantity, int totalPrice, String orderId);
	public List<PaymentDto> getMyProducts(int mId);
	public int deleteShop(int sId);
	public List<ShopBoardDto> getRandomProducts(int count);
	public ShopBoardDto shopModify(int sId);
	public int modifyShopBoard(int sId, String sTitle, String sContent, String fileName, String filePath, String sCategory);
	public List<PaymentDto> getMyShopPage(int mId, int page, int count);
	public int getTotalCountMyShopPage(int mId);
	public List<ShopBoardDto> getAllProductsPage(int page, int count);
	public int getTotalCountAllProductsPage();
	public List<ShopBoardDto> getAllProductsSearch(String query, String search_type, int page, int count);
	public int getTotalCountAllProductsSearch(String query, String search_type);
}