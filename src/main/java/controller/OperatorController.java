package controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import entity.Operator;
import entity.SearchInfo;
import service.OperatorService;

@Controller
@RequestMapping("operator")
public class OperatorController {
	
	@Autowired
	OperatorService operatorService;
	
	@RequestMapping("select")
	@ResponseBody
	public Map<String,Object> select(@RequestBody(required=false) SearchInfo searchInfo,Integer pageno,HttpServletRequest req){
		if(pageno == null) pageno = 1;
		HttpSession session = req.getSession();
		if(searchInfo == null) {
			searchInfo = (SearchInfo) session.getAttribute("searchInfo");
			if(searchInfo == null) searchInfo = new SearchInfo();
		}
		searchInfo.setSearchOperator(true);
		session.setAttribute("searchInfo", searchInfo);
//		System.out.println(searchInfo+":"+pageno);
		searchInfo.setFlag(false);
		searchInfo.setPageno(pageno.intValue());
		List list = operatorService.select(searchInfo); 
		searchInfo.setFlag(true);
		int allRows = operatorService.select(searchInfo).size();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("allRows", allRows);
		return map;
	}
	
	@RequestMapping("status")
	@ResponseBody
	public String[] status(){
		return Operator.statuses;
	}
	
	
	@RequestMapping("insert")
	@ResponseBody
	public String insert(@RequestBody(required=true) Operator operator) {
		
		int rsRow = operatorService.insert(operator);
		return "{\"rs\":\""+ rsRow +"\"}";
	}
	
	@RequestMapping("update")
	@ResponseBody
	public String update(@RequestBody(required=true) Operator operator) {
		int rsRow = operatorService.update(operator);
		return "{\"rs\":\""+ rsRow +"\"}";
	}
	
}
