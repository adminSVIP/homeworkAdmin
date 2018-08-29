package util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class md5 {
	
	public static void main(String[] args) {
		System.out.println(toMd5("123"));
	}
	public static String toMd5(String text) {
		 byte[] secretBytes = null;
	        try {
	            secretBytes = MessageDigest.getInstance("md5").digest(
	            		text.getBytes());
	        } catch (NoSuchAlgorithmException e) {
	            throw new RuntimeException("没有这个md5算法！");
	        }
	        String md5code = new BigInteger(1, secretBytes).toString(16);
	        for (int i = 0; i < 32 - md5code.length(); i++) {
	            md5code = "0" + md5code;
	        }
	     return md5code;
	}
}
