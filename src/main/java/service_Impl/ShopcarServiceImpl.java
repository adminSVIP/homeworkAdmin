package service_Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.OperatorDao;
import dao.ShopcarDao;
import entity.Operator;
import entity.SearchInfo;
import entity.Shopcar;
import service.OperatorService;
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

	public int delete(int id) {
		return shopcarDao.delete(id);
	}
	
	

}
