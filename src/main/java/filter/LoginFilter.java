package filter;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFilter implements Filter {
	private Set<String> prefixIignores = new HashSet<String>();

	private boolean canIgnore(HttpServletRequest request) {
		String url = request.getRequestURI();
		for (String ignore : prefixIignores) {
			if(url.matches("[a-zA-Z/]*product/select*"))return true;
			if(url.matches("[a-zA-Z/]*product/assessOfProduct*"))return true;
			if(url.matches("[a-zA-Z/]*user/select*"))return true;
			if(url.matches("[a-zA-Z/]*user/login"))return true;
			if(url.matches("[a-zA-Z/]*user/regist"))return true;
			if(url.matches("[a-zA-Z/]*user/currUser"))return true;
			if(url.matches("[a-zA-Z/]*shopcar/myShopcars"))return true;
			if(url.matches("[a-zA-Z/]*shopcar/insert"))return true;
			if(url.matches("[a-zA-Z/]*shopcar/remove"))return true;
			if(url.matches("[a-zA-Z/]*address/index"))return true;
			if(url.matches("[a-zA-Z/]*address/add"))return true;
			if(url.matches("[a-zA-Z/]*address/del"))return true;
			if(url.matches("[a-zA-Z/]*address/setUse"))return true;
			if(url.matches("[a-zA-Z/]*orders/userOrders"))return true;
			if(url.matches("[a-zA-Z/]*orders/recivePackage"))return true;
			if(url.matches("[a-zA-Z/]*image"))return true;
			if (url.endsWith(ignore)) return true;
		}
		return false;
	}

	public void destroy() {
		
	}

	public void init(FilterConfig config) throws ServletException {
		String ignoresParam = config.getInitParameter("ex");
		String[] ignoreArray = ignoresParam.split(",");
		for (String s : ignoreArray) {
			prefixIignores.add(s);
		}
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) arg0;
		HttpServletResponse rsq = (HttpServletResponse) arg1;
		
		if (canIgnore(req)) {
			chain.doFilter(req, rsq);
			return;
		}
		if (req.getSession().getAttribute("user") == null) {
			String requestType = req.getHeader("X-Requested-With");
			if("XMLHttpRequest".equals(requestType)){
			    System.out.println("AJAX����..");
			    rsq.getWriter().write("{\"state\":\"false\"}");
			    return;
			}else{
			    rsq.sendRedirect(req.getContextPath()+"/login.html");
			}
		
			return;
		}
		chain.doFilter(req, rsq); 
	}

}
