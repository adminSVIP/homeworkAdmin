package service;

import java.util.HashMap;
import java.util.List;

import entity.Orders;
import entity.OrdersSearchInfo;

public interface OrdersService {
	public List select(OrdersSearchInfo searchInfo);

	public int insert(Orders orders);

	public int update(Orders orders);

	public int delete(int id);
	
	public List<HashMap<String,Object>> userOrders(int user_id);
}
