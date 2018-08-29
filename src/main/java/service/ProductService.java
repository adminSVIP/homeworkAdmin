package service;

import java.util.List;

import entity.Product;
import entity.ProductSearchInfo;

public interface ProductService {

	public List select(ProductSearchInfo productSearchInfo );

	public int insert(Product product);

	public int update(Product product);

	public int delete(int id);
}
