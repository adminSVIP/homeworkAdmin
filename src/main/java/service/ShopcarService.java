package service;

import java.util.HashMap;
import java.util.List;

import entity.Operator;
import entity.SearchInfo;
import entity.Shopcar;
import entity.ShopcarSearchInfo;

public interface ShopcarService {

	public List select(SearchInfo searchInfo);

	public int insert(Shopcar shopcar);

	public int update(Shopcar shopcar);

	public int delete(ShopcarSearchInfo shopcarSearchInfo);
	
	public List<HashMap<String, Object>> myShopcar(int id);
	
}
