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

import entity.User;
import entity.UserSearchInfo;
import service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("select")
	@ResponseBody
	public Map<String,Object> select(@RequestBody(required=false) UserSearchInfo searchInfo,Integer pageno,HttpServletRequest req){
		if(pageno == null) pageno = 1;
		HttpSession session = req.getSession();
		if(searchInfo == null) {
			searchInfo = (UserSearchInfo) session.getAttribute("searchInfo");
			if(searchInfo == null) searchInfo = new UserSearchInfo();
		}
		session.setAttribute("searchInfo", searchInfo);
		searchInfo.setFlag(false);
		searchInfo.setPageno(pageno.intValue());
		List list = userService.select(searchInfo); 
		searchInfo.setFlag(true);
		int allRows = userService.select(searchInfo).size();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("allRows", allRows);
		return map;
	}
	
//	@RequestMapping("status")
//	@ResponseBody
//	public String[] status(){
//		return Operator.statuses;
//	}
	
	@RequestMapping("currUser")
	@ResponseBody
	public User currentUser(HttpServletRequest req,HttpServletResponse response) {
		User user = (User) req.getSession().getAttribute("user");
		return user;
	}
	
	@RequestMapping("regist")
	@ResponseBody
	public String insert(@RequestBody(required=true) User user,HttpServletRequest req,HttpServletResponse response) {
		
		int rsRow = userService.insert(user);
		if(rsRow>0) {
			req.getSession().setAttribute("user", user);
			return "{\"state\":\"ok\"}";
		}else {
			return "{\"state\":\"false\"}";
		}
	}
	
	@RequestMapping("update")
	@ResponseBody
	public String update(@RequestBody(required=true) User user) {
		int rsRow = userService.update(user);
		return "{\"rs\":\""+ rsRow +"\"}";
	}
	
	@RequestMapping("login")
	@ResponseBody
	public String canLogin(@RequestBody(required=true)User user,HttpServletRequest req,HttpServletResponse response) {
		 
		List list = userService.canLogin(user);
		if(list.size()>0) {
			req.getSession().setAttribute("user", list.get(0));
			return "{\"state\":\"ok\"}";
		}else {
			return "{\"state\":\"false\"}";
		}
	}
	
}
