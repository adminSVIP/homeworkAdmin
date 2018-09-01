package service_Impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.OrderStatusDao;
import dao.OrdersDao;
import dao.OrdersDetailDao;
import dao.ProductDao;
import dao.ShopcarDao;
import entity.Orders;
import entity.Orders_detail;
import entity.Orders_status;
import entity.ShopcarSearchInfo;
import service.MyTranstionService;
import util.JsonUnit;

@Service
public class TransitionServiceImpl implements MyTranstionService {
	public SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	@Autowired
	OrdersDao ordersDao;
	@Autowired
	ProductDao productDao;
	
	@Autowired
	ShopcarDao shopcarDao ;
	
	@Autowired
	OrderStatusDao orderStatusDao;
	@Autowired
	OrdersDetailDao ordersDetailDao;
	
	@Transactional(transactionManager="transactionManager")
	public void orderTranstion(HashMap<String, Object> map) {
		//解析数据
		Orders orders = JsonUnit.toObject(JsonUnit.toString(map.get("order")), Orders.class);
		orders.setUser_id(Integer.valueOf(map.get("user_id").toString()));
		String date = format.format(new Date());
		String code = "order"+System.currentTimeMillis();
		orders.setCode(code);
		orders.setDate(date);
		//插入订单
		ordersDao.insert(orders);
		
		int lastId = ordersDao.lastID();
		//throw new RuntimeException();
		//解析订单中的商品信息
		ObjectMapper mapper = new ObjectMapper();
		List<Orders_status> list = new ArrayList<Orders_status>();
		List<Orders_detail> detailList = new ArrayList<Orders_detail>();
		
		String  payShopcarIds =  "";
		try {
			payShopcarIds = map.get("payShopcarIds").toString();
			list = mapper.readValue(
							JsonUnit.toString(map.get("orders_status")), 
							new TypeReference<List<Orders_status>>(){});
			
			
			detailList = mapper.readValue(
							JsonUnit.toString(map.get("orders_detail")), 
							new TypeReference<List<Orders_detail>>(){});
		} catch (Exception e) {
			throw new RuntimeException();
		}
		
		System.out.println(payShopcarIds);
		ShopcarSearchInfo shopcarSearchInfo = new ShopcarSearchInfo();
		shopcarSearchInfo.setWhere(payShopcarIds);
		shopcarDao.delete(shopcarSearchInfo);
		
		
		for (Orders_detail orders_detail : detailList) {
			orders_detail.setOrders_id(lastId);
			ordersDetailDao.insert(orders_detail);
		}
		for (Orders_status orders_status : list) {
			orders_status.setDate(date);
			orders_status.setOrders_id(lastId);
			orders_status.setInfo(code);
			orderStatusDao.insert(orders_status);
		}
		
			
		
		
		
//		String ids = map.get("productIds").toString();
//		ids = ids.subSequence(1, ids.length()-1).toString();
//		String[] pidstrs =  ids.split(",");	//商品id
//		String pcounts = map.get("productCount").toString();
//		pcounts = pcounts.subSequence(1, pcounts.length()-1).toString();
//		String[] pcountStr = pcounts.split(",");//商品数量
		
		
//		for(int i = 0 ; i < pidstrs.length; i++) {
//			ProductSearchInfo productSearchInfo = new ProductSearchInfo();
//			productSearchInfo.setSearchType(2);
//			productSearchInfo.setWhere(pidstrs[i]);
//			Product products= productDao.select(productSearchInfo).get(0);
//			
//			
//			
//			Orders_status orders_status = new Orders_status();
//			orders_status.setComments(orders.getComments());
//			orders_status.setDest_status(1);
//			orders_status.setOrders_id(lastId);
//			orders_status.setDate(date);
//			Double price =  products.getNowprice();
//			Double amount = price * Integer.valueOf(pcountStr[i]);
//			orders_status.setAmount(amount);
//			
//		}
//		orderStatusDao.insert(orders_status );
		
	}

}



