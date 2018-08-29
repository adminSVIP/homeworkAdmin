package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Operator;
import service.OperatorService;

@Controller
public class loginController {
	@Autowired
	OperatorService operatorService;
	
	@RequestMapping("loginxx")
	@ResponseBody
	public String index(@RequestBody Operator operator,HttpServletRequest req) {
		List<Operator> list = operatorService.canLogin(operator);
		if(list.size()>0) {
			req.getSession().setAttribute("user", list.get(0));
			return "{\"state\":\"ok\"}";
		}else { 
			return "{\"state\":\"false\"}";
		}
		
		
	}
	
		
		
}
