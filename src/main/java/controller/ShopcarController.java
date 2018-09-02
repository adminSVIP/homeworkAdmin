package controller;

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

import entity.SearchInfo;
import entity.Shopcar;
import entity.ShopcarSearchInfo;
import entity.User;
import service.ShopcarService;

@Controller
@RequestMapping("shopcar")
public class ShopcarController {
	
	@Autowired
	ShopcarService shopcarService;
	
	@RequestMapping("index")
	@ResponseBody
	public Map<String,Object> select(@RequestBody(required=false) SearchInfo searchInfo,Integer pageno,HttpServletRequest req){
		if(pageno == null) pageno = 1;
		HttpSession session = req.getSession();
		if(searchInfo == null) {
			searchInfo = (SearchInfo) session.getAttribute("shopcarsearchInfo");
			if(searchInfo == null) searchInfo = new SearchInfo();
		}
		searchInfo.setSearchOperator(false);
		session.setAttribute("shopcarsearchInfo", searchInfo);
//		System.out.println(searchInfo+":"+pageno);
		searchInfo.setFlag(false);
		searchInfo.setPageno(pageno.intValue());
		List list = shopcarService.select(searchInfo); 
		searchInfo.setFlag(true);
		int allRows = shopcarService.select(searchInfo).size();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("allRows", allRows);
		return map;
	}
	
	
	
	
	@RequestMapping("insert")
	@ResponseBody
	public String insert(@RequestBody(required=true) Shopcar shopcar,HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user==null)return "{\"rs\":\"0\"}";
		shopcar.setUser_id(user.getId());
		int rsRow = shopcarService.insert(shopcar);
		return "{\"rs\":\""+ rsRow +"\"}";
	}
	
	@RequestMapping("update")
	@ResponseBody
	public String update(@RequestBody(required=true) Shopcar shopcar) {
		int rsRow = shopcarService.update(shopcar);
		return "{\"rs\":\""+ rsRow +"\"}";
	}
	
	
	@RequestMapping("remove")
	@ResponseBody
	public String removeShopcar(String ids,HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user==null)return"";
		ShopcarSearchInfo shopcarSearchInfo = new ShopcarSearchInfo();
		shopcarSearchInfo.setWhere(ids); 
		int rsRow = shopcarService.delete(shopcarSearchInfo);
		return "{\"rs\":\""+ rsRow +"\"}";
	}
	
	@RequestMapping("myShopcars")
	@ResponseBody
	public List<HashMap<String, Object>> myShopcars(HttpServletRequest req) {
		User user = (User) req.getSession().getAttribute("user");
		if(user==null)return null;
		return shopcarService.myShopcar(user.getId());
	}
}
