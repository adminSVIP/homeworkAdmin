package service_Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.OrderStatusDao;
import dao.OrdersDao;
import entity.Operator;
import entity.Orders;
import entity.OrdersSearchInfo;
import entity.Orders_status;
import service.OrdersService;
import service.OrdersStatusService;

@Service
public class OrdersStatusServiceImp implements OrdersStatusService {

	@Autowired
	OrderStatusDao orderStatusDao;

	public List<Operator> select() {
		return orderStatusDao.select();
	}

	public int insert(Orders_status orders_status) {
		return orderStatusDao.insert(orders_status);
	}

	public int update(Orders_status orders_status) {
		return orderStatusDao.update(orders_status);
	}
	

}
