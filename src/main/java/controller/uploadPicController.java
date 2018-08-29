package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
public class uploadPicController {
	
	@RequestMapping("uploadPic")
	@ResponseBody
	public String index(@RequestParam CommonsMultipartFile noteImg,HttpServletRequest req) {
		String timeName = System.currentTimeMillis() +"";
		String picName = noteImg.getOriginalFilename();
		String suffix = getSuffix(picName);
		String path = req.getServletContext().getRealPath("/userUploadPics/");
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		picName =timeName + suffix;
		File pic = new File(path +"/"+picName);
		try {
			noteImg.transferTo(pic);
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		String json = "{\"src\":\""+req.getContextPath() +"/userUploadPics/"+picName+"\",\"state\":\"tru\"}";
		
		System.out.println(json); 
		return json;
	}
	
	private static String getSuffix(String picName) {
		String[] splits = picName.split("\\.");
		if(splits.length >= 2) {
			return "."+splits[splits.length-1];
		}
		return "";
	}
}
