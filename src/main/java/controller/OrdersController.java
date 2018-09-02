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

import entity.Assess;
import entity.Operator;
import entity.Orders;
import entity.OrdersSearchInfo;
import entity.Orders_status;
import entity.User;
import service.AssessService;
import service.MyTranstionService;
import service.OrdersService;
import service.OrdersStatusService;
import util.JsonUnit;

@Controller
@RequestMapping("orders")
public class OrdersController {
	@Autowired
	OrdersService  ordersService;
	@Autowired
	AssessService assessService;
	
	@Autowired
	OrdersStatusService ordersStatusService;
	@Autowired
	MyTranstionService myTranstionService;
	
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
	
	
	@RequestMapping("order")
	@ResponseBody
	public String order(@RequestBody HashMap<String, Object> map,HttpSession session) {
		User user = (User) session.getAttribute("user");
		map.put("user_id",user.getId());
		
		return myTranstionService.orderTranstion(map);
		
	}
	@RequestMapping("userOrders")
	@ResponseBody
	public List<HashMap<String,Object>> userOrders(HttpSession session){
		User user = (User) session.getAttribute("user");
		if(user==null)return null;
		return ordersService.userOrders(user.getId());
		
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
	
	@RequestMapping("recivePackage")
	@ResponseBody
	public String recivePackage(@RequestBody(required=true)  Map<String,Object> map,HttpServletRequest req) {
		System.out.println(map.get("data").toString());
		String id = map.get("data").toString();
		int status = Integer.valueOf(map.get("status").toString());
		OrdersSearchInfo searchInfo = new OrdersSearchInfo();
		searchInfo.setSearchType(1);
		searchInfo.setWhere(id);
		Orders orders = (Orders) ordersService.select(searchInfo).get(0);
		orders.setStatus(status);
		String comments = map.get("comments").toString();
		int rsRow = ordersService.update(orders);
		Orders_status orders_status = new Orders_status();
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		orders_status.setDate(f.format(new Date()));
		orders_status.setOrders_id(orders.getId());
		orders_status.setComments(comments);
		orders_status.setDest_status(orders.getStatus());
		ordersStatusService.insert(orders_status); 
		if(rsRow > 0) { 
			return "{\"state\":\"ok\",\"code\":\""+ orders.getStatus() +"\"}";
		}
		return "{\"state\":\"false\"}";
	}
	
	@RequestMapping("assess")
	@ResponseBody
	public String assessOrders(@RequestBody(required=true) Assess assess,HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user==null)return "{\"state\":\"false\"}";
		System.out.println(assess.getInfo());
		assess.setUser_id(user.getId());
		int orderid = assess.getOrders_id();
		assessService.insert(assess);
		OrdersSearchInfo searchInfo = new OrdersSearchInfo();
		searchInfo.setSearchType(1);
		searchInfo.setWhere(orderid+"");
		Orders orders = (Orders) ordersService.select(searchInfo).get(0);
		orders.setAssessstatus(1);
		int rsRow = ordersService.update(orders);
		if(rsRow > 0) { 
			return "{\"state\":\"ok\"}";
		}
		return "{\"state\":\"false\"}";
	}
	
}


