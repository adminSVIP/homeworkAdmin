package service;

import java.util.List;

import entity.Operator;
import entity.Orders_status;

public interface OrdersStatusService {
	public List<Operator> select();
	
	public int insert(Orders_status orders_status);
	
	public int update(Orders_status orders_status);
}
