package util;

import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonUnit {
	public static String toString(Object o) {//对象转换为json字符�?
		ObjectMapper mapper=new ObjectMapper();
		try {
			return mapper.writeValueAsString(o);
		} catch (Exception e) {
			return "";
		}
	}
	public static <T> T toObject(String str,Class<T> cla) {//字符串转换为对象
		ObjectMapper mapper =new ObjectMapper();
		try {
			return mapper.readValue(str,cla);
		}catch (Exception e) {
			return null;
		}
	}
	public static String returnvalues(int status,String text) {
		return toString(new jsonInfo(status,text));
	}
	
	
	
	
 	public  static class jsonInfo{
		int status;
		String text;
		public jsonInfo(int status, String text) {
			super();
			this.status = status;
			this.text = text;
		}
		
		public int getStatus() {
			return status;
		}

		public void setStatus(int status) {
			this.status = status;
		}

		public String getText() {
			return text;
		}
		public void setText(String text) {
			this.text = text;
		}
		
		
	}
}
