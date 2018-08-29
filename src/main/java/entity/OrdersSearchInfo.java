package entity;

public class OrdersSearchInfo {
	private int max = 6;
	private String where;
	private int pageno = 1;
	private String limit;
	private int searchType;
	private boolean flag = false;
	
	
	
	public OrdersSearchInfo() {
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
//			if(where == null || where.trim().length() == 0) return "";
//			return " where name  like '%"+ where +"%'  and status <> 3";
		case 2:
//			if(where == null || where.trim().length() == 0) return "";
//			return " where nike  like '%"+ where +"%' and status <> 3";
		case 3:
			if(where == null || where.trim().length() == 0) return "";
			int c = Integer.parseInt(where);
			switch (c) {
			case 1:
				return " where DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= date(date) " ;				
			case 2:
				return " WHERE DATE_FORMAT( date, '%Y%m' ) = DATE_FORMAT( CURDATE( ) , '%Y%m' )";
			case 3:
				return " where DATE_SUB(CURDATE(), INTERVAL 30 DAY) <= date(date) " ;
			case 4:
				return " where YEAR(date)=YEAR(NOW())";
			case 5:
				return " where year(date)=year(date_sub(now(),interval 1 year))";
				
			}
			
		default: 
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
