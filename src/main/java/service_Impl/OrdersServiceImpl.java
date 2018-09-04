package service_Impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.OrdersDao;
import entity.Orders;
import entity.OrdersSearchInfo;
import service.OrdersService;

@Service
public class OrdersServiceImpl implements OrdersService {
		
	@Autowired
	OrdersDao ordersDao;
	
	public List select(OrdersSearchInfo searchInfo) {
		return ordersDao.select(searchInfo );
	}

	public int insert(Orders orders) {
		return ordersDao.insert(orders);
	}

	public int update(Orders orders) {
		return ordersDao.update(orders);
	}

	public int delete(int id) {
		return ordersDao.delete(id);
	}

	public List<HashMap<String, Object>> userOrders(int user_id) {
		return ordersDao.userOrders(user_id);
	}

	public List<HashMap<String, Object>> userOrdersDetails(int id) {
		return ordersDao.userOrdersDetails(id);
	}

}
