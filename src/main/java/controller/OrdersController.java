package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Operator;
import entity.Orders;
import entity.OrdersSearchInfo;
import entity.Orders_status;
import service.OrdersService;
import service.OrdersStatusService;
import util.JsonUnit;

@Controller
@RequestMapping("orders")
public class OrdersController {
	@Autowired
	OrdersService  ordersService;
	@Autowired
	OrdersStatusService ordersStatusService;
	
	@RequestMapping("select")
	@ResponseBody
	public Map<String,Object> select(@RequestBody(required=false) OrdersSearchInfo searchInfo,Integer pageno,HttpServletRequest req){
		if(pageno == null) pageno = 1;
		HttpSession session = req.getSession();
		if(searchInfo == null) {
			searchInfo = (OrdersSearchInfo) session.getAttribute("OrdersSearchInfo");
			if(searchInfo == null) searchInfo = new OrdersSearchInfo();
		}
		session.setAttribute("OrdersSearchInfo", searchInfo);
		searchInfo.setFlag(false);
		searchInfo.setPageno(pageno.intValue());
		List list = ordersService.select(searchInfo); 
		searchInfo.setFlag(true);
		int allRows = ordersService.select(searchInfo).size();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("allRows", allRows);
		return map;
	}
	
	
	
	@RequestMapping("insert")
	@ResponseBody
	public String insert(@RequestBody(required=true) Orders orders) {
		
		int rsRow = ordersService.insert(orders);
		return "{\"rs\":\""+ rsRow +"\"}";
	}
	
	@RequestMapping("update")
	@ResponseBody
	public String update(@RequestBody(required=true) Orders orders) {
		int rsRow = ordersService.update(orders);
		return "{\"rs\":\""+ rsRow +"\"}";
	}
	
	@RequestMapping("status")
	@ResponseBody
	public String[] status() {
		return Orders.statuses;
	}

	@RequestMapping("delivery")
	@ResponseBody
	public String delivery(@RequestBody(required=true)  Map<String,Object> map,HttpServletRequest req) {
		Orders orders = JsonUnit.toObject(map.get("data").toString(), Orders.class);
		Orders_status orders_status =  JsonUnit.toObject(map.get("os").toString(), Orders_status.class);
		
		orders_status.setOrders_id(orders.getId());
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		orders_status.setDate(f.format(new Date()));  
		orders_status.setDest_status(orders.getStatus()); 
		ordersStatusService.insert(orders_status); 
		Operator user = (Operator) req.getSession().getAttribute("user");
		if(orders.getStatus()==5)orders_status.setNum(user.getId()); 
		int rsRow = ordersService.update(orders);
		if(rsRow > 0) { 
			return "{\"state\":\"ok\",\"code\":\""+ orders.getStatus() +"\"}";
		}
		return "{\"state\":\"false\"}";
	}
	
	
}


