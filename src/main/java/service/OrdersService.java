package service;

import java.util.List;

import entity.Orders;
import entity.OrdersSearchInfo;
import entity.SearchInfo;

public interface OrdersService {
	public List select(OrdersSearchInfo searchInfo);

	public int insert(Orders orders);

	public int update(Orders orders);

	public int delete(int id);
	
	
}
