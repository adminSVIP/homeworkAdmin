package entity;

public class SearchInfo {
	private int max = 6;
	private String where;
	private int pageno = 1;
	private String limit;
	private int searchType;
	private boolean flag = false;
	private boolean isSearchOperator = false;
	
	
	public void setSearchOperator(boolean isSearchOperator) {
		this.isSearchOperator = isSearchOperator;
	}
	public SearchInfo() {
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
		switch (searchType) {
		case 1:
			return " where name  like '%"+ where +"%'  and status <> 3";
		case 2:
			return " where nike  like '%"+ where +"%' and status <> 3";
		case 3:
			if(where == null || where.trim().length() == 0) return "";
			return " where status = "+ where ;
		case 4:
			return " where type_id = "+ where;
		default: 
			if(isSearchOperator)return " where status <> 3";
			return "";
		}
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
