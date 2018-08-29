package controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Type;
import service.TypeService;

@Controller
@RequestMapping("type")
public class TypeController {
	@Autowired
	TypeService typeService;
	
	@RequestMapping("select")
	@ResponseBody
	public List<Type> select(Integer id,HttpServletResponse response) {
		response.setHeader("Access-Control-Allow-Origin", "*");
		return typeService.select(id);
	}
	
	@RequestMapping("insert")
	@ResponseBody
	public String insert(@RequestBody Type type) {
		int rsRow = typeService.insert(type);
		return "{\"rs\":\""+ rsRow +"\"}";
	}
	
	
}
