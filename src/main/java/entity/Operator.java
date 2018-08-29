package entity;

import util.md5;

public class Operator {
	public static String[] statuses = {"‘⁄÷∞","«ÎºŸ","¿Î÷∞"};
	private int id;
	private String nike;
	private String password;
	private String name;
	private int sex;
	private String tel;
	private int power;
	private int status;
	private String comments;
	private String md5Pass;
	
	
	public String getMd5Pass() {
		return md5.toMd5(password);
	}
	public Operator() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNike() {
		return nike;
	}
	public void setNike(String nike) {
		this.nike = nike;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
}
