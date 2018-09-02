package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginOutController {
	
	@RequestMapping("Logout")
	public String index(HttpServletRequest req) {
		req.getSession().removeAttribute("user");
		return "redirect:/index.jsp";
	}
	@RequestMapping("userlogout")
	public String userLogout(HttpSession session,HttpServletRequest req) {
		session.removeAttribute("user");
		return "redirect:"+req.getHeader("referer");
		
	}
}
