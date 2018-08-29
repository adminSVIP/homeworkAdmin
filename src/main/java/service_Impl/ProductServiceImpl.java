package service_Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ProductDao;
import entity.Product;
import entity.ProductSearchInfo;
import service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao productDao;
	
	public List<Product> select(ProductSearchInfo productSearchInfo) {
		return productDao.select(productSearchInfo);
	}

	public int insert(Product product) {
		return productDao.insert(product);
	}

	public int update(Product product) {
		return productDao.update(product);
	}

	public int delete(int id) {
		return productDao.delete(id);		
	}

}
