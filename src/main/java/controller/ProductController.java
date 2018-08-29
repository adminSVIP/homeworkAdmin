package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Product;
import entity.ProductSearchInfo;
import service.ProductService;

@Controller
@RequestMapping("product")
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("select")
	@ResponseBody
	public Map<String,Object> select(@RequestBody(required=false) ProductSearchInfo productSearchInfo,Integer pageno,HttpServletRequest req,HttpServletResponse response){
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Allow-Methods", "POST, GET, PUT, OPTIONS, DELETE");  
		response.setHeader("Access-Control-Allow-Headers", "x-requested-with, Content-Type");  
	    response.setHeader("Access-Control-Allow-Credentials", "true");
		if(pageno == null) pageno = 1;
		HttpSession session = req.getSession();
		if(productSearchInfo == null) {
			productSearchInfo = (ProductSearchInfo) session.getAttribute("productSearchInfo");
			if(productSearchInfo == null) productSearchInfo = new ProductSearchInfo();
		}
		
		session.setAttribute("searchInfo", productSearchInfo);
//		System.out.println(searchInfo+":"+pageno);
		productSearchInfo.setFlag(false);
		productSearchInfo.setPageno(pageno.intValue());
		List list = productService.select(productSearchInfo); 
		productSearchInfo.setFlag(true);
		int allRows = productService.select(productSearchInfo).size();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("allRows", allRows);
		return map;
	}
	
	@RequestMapping("status")
	@ResponseBody
	public String[] status() {
		return Product.statuses;
	}
	
	
	@RequestMapping("insert")
	@ResponseBody
	public String insert(@RequestBody(required=true) Product product) {
		int rsRow = productService.insert(product);
		return "{\"rs\":\""+ rsRow +"\"}";
	}
	
	@RequestMapping("update")
	@ResponseBody
	public String update(@RequestBody(required=true)  Product product) {
		int rsRow = productService.update(product);
		return "{\"rs\":\""+ rsRow +"\"}";
	}
	
	

}
