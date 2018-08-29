package entity;

public class Orders {
	public static String[] statuses = {"未支付","已支付","已发货","已收货","已退货","已取消"};
	private int id;
	private String date;
	private String code;
	private Double amount;
	private Double nowamount;
	private int address_id;
	private int user_id;
	private int status;
	private String comments;
	private int assessstatus;
	
	
	
	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public Double getNowamount() {
		return nowamount;
	}
	public void setNowamount(Double nowamount) {
		this.nowamount = nowamount;
	}
	public int getAddress_id() {
		return address_id;
	}
	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
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
	public int getAssessstatus() {
		return assessstatus;
	}
	public void setAssessstatus(int assessstatus) {
		this.assessstatus = assessstatus;
	}
	
	
	
}
