package service_Impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ShopcarDao;
import entity.SearchInfo;
import entity.Shopcar;
import entity.ShopcarSearchInfo;
import service.ShopcarService;

@Service
public class ShopcarServiceImpl implements ShopcarService {

	@Autowired
	ShopcarDao shopcarDao;

	public List select(SearchInfo searchInfo) {
		return shopcarDao.select(searchInfo);
	}

	public int insert(Shopcar shopcar) {
		return shopcarDao.insert(shopcar);
	}

	public int update(Shopcar shopcar) {
		return shopcarDao.update(shopcar);
	}

	public int delete(ShopcarSearchInfo shopcarSearchInfo) {
		return shopcarDao.delete(shopcarSearchInfo);
	}

	public List<HashMap<String, Object>> myShopcar(int id) {
		return shopcarDao.myShopcar(id);
	}
	
	

}
