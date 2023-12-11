package com.study.springboot.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.BoardDto;
import com.study.springboot.dto.ShopBoardDto;


@Mapper
public interface ShopBoardDao {
		
	public ShopBoardDto getProductInfo(int sId);
	public List<ShopBoardDto> getAllProducts();
	public void hShopProductInsert(@Param("_sTitle") String sTitle,
								   @Param("_sContent") String sContent,
							   	   @Param("_sMoney") int sMoney,
							   	   @Param("_fileName") String fileName,
							   	   @Param("_filePath") String filePath,
							   	   @Param("_sCategory") String sCategory);	
	public int deleteShop(@Param("_sId") int sId);
	public List<ShopBoardDto> getRandomProducts(@Param("_count") int count);
	public ShopBoardDto shopModify(@Param("_sId") int sId);
	public int modifyShopBoard(@Param("_sId") int sId,
							   @Param("_sTitle") String sTitle,
							   @Param("_sContent") String sContent,
							   @Param("_fileName") String fileName,
							   @Param("_filePath") String filePath,
							   @Param("_sCategory") String sCategory);
	public List<ShopBoardDto> getAllProductsPage(Map<String, Integer> map);
	public int getTotalCountAllProductsPage();
	public List<ShopBoardDto> getAllProductsSearch(@Param("_query") String query,@Param("_search_type") String search_type,
											   @Param("_start") int start, @Param("_count") int count);
	public int getTotalCountAllProductsSearch(@Param("_query") String query,@Param("_search_type") String search_type);
	
}
