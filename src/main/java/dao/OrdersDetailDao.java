package dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import entity.Orders_detail;

@Repository
public interface OrdersDetailDao {

	@Select("select * from oredrs_details")
	public List<Orders_detail> select();
	
	@Insert("insert into oredrs_details"
			+ "(orders_id,product_id,count,price,nowprice,comments) values"
			+ "(#{orders_id},#{product_id},#{count},#{price},#{nowprice},#{comments})")
	public int insert(Orders_detail orders_detail);
}
