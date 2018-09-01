package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Address;
import entity.User;
import service.AddressService;

@Controller
@RequestMapping("address")
public class AddressController {

	@Autowired
	AddressService addressService;
	
	@RequestMapping("index")
	@ResponseBody
	public List<Address> index(HttpSession session){
		User  user = (User) session.getAttribute("user");
		if(user == null) return null;
		return addressService.getUserAddress(user.getId());
	}
	
	@RequestMapping("add")
	@ResponseBody
	public String add(@RequestBody Address address,HttpSession session) {
		User  user = (User) session.getAttribute("user");
		address.setUser_id(user.getId());
		int rsRow = addressService.insert(address);
		return "{\"rs\":\""+ rsRow +"\"}";
	}
	
}
