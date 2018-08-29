package entity;

public class Product {
	public static String[] statuses = {"热卖","促销","打折","售空"};
	private int id;
	private String fullname;
	private int type_id;
	private String activity;
	private String tip;
	private String sale;
	private String info;
	private Double price;
	private Double nowprice;
	private int salecount;
	private int collectcount;
	private int priority;
	private int status;
	private String pics;
	
	
	
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	public String getActivity() {
		return activity;
	}
	public void setActivity(String activity) {
		this.activity = activity;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public String getSale() {
		return sale;
	}
	public void setSale(String sale) {
		this.sale = sale;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		info.replaceAll("\"","\'");
		this.info = info;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getNowprice() {
		return nowprice;
	}
	public void setNowprice(Double nowprice) {
		this.nowprice = nowprice;
	}
	public int getSalecount() {
		return salecount;
	}
	public void setSalecount(int salecount) {
		this.salecount = salecount;
	}
	public int getCollectcount() {
		return collectcount;
	}
	public void setCollectcount(int collectcount) {
		this.collectcount = collectcount;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getPics() {
		return pics;
	}
	public void setPics(String pics) {
		this.pics = pics;
	}
	
	
	
}
