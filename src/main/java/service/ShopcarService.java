package service;

import java.util.List;

import entity.Operator;
import entity.SearchInfo;
import entity.Shopcar;

public interface ShopcarService {

	public List select(SearchInfo searchInfo);

	public int insert(Shopcar shopcar);

	public int update(Shopcar shopcar);

	public int delete(int id);
	
	
}
