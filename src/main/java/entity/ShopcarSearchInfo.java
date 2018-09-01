package entity;

public class ShopcarSearchInfo {
	private int max = 6;
	private String where;
	private int pageno = 1;
	private String limit;
	private int searchType;
	private boolean flag = false;
	
	
	public ShopcarSearchInfo() {
		super();
	}

	
	
	public int getSearchType() {
		return searchType;
	}
	public void setSearchType(int searchType) {
		this.searchType = searchType;
	}
	
	public int getPageno() {
		return pageno;
	}
	public void setPageno(int pageno) {
		this.pageno = pageno;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	
	public String getWhere() {
		return where;
	}
	public void setWhere(String where) {
		this.where = where;
	}
	public String getLimit() {
		if(flag)return "";
		if(pageno < 1) pageno = 1;
		limit = " limit " + ((pageno-1) * max) + "," + max;
		return limit;
	}
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
}
