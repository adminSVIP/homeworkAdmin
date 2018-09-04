package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Orders;
import entity.OrdersSearchInfo;

@Repository
public interface OrdersDao {
	@Select("select * from orders ${where} ${limit}")
	public List<Orders> select(OrdersSearchInfo infor);
	
	@Insert("insert into orders(date,code,amount,nowamount,address_id,user_id,status,comments,assessstatus) "
			+ "values(#{date},#{code},#{amount},#{nowamount},"
			+ "#{address_id},#{user_id},#{status},#{comments},#{assessstatus})")
	public int insert(Orders orders);
	
	@Update("update orders set date = #{date} , "
			+ "code = #{code},amount=#{amount},nowamount=#{nowamount},"
			+ "address_id = #{address_id}, user_id = #{user_id},status = #{status},"
			+ "comments = #{comments} ,assessstatus= #{assessstatus}"
			+ " where id = #{id} ")
	public int update(Orders orders);
	
	@Delete("delete orders where id = #{id}")
	public int delete(int id);
	
	@Select("SELECT LAST_INSERT_ID()")
	public int lastID ();
	
	@Select("select o.id,o.amount,o.nowamount,address_id,user_id,o.assessstatus," + 
			"				o.status,count,product_id," + 
			"				p.nowprice,p.fullname,p.activity,p.tip,p.sale,p.info" + 
			"				from orders o " + 
			"join oredrs_details od on(od.orders_id = o.id) " + 
			"join product p on(p.id=od.product_id)" + 
			"WHERE user_id = #{user_id}")
	public List<HashMap<String,Object>> userOrders(int user_id);
	
	
	
	
	
	
	@Select("select o.id ,o.date,o.code,o.amount,o.`status`,p.fullname,p.price,od.count,os.comments,os.info"
			+ " ,a.addr,a.zone"
			+ " from "
			+ " orders o join oredrs_details od on(o.id=od.orders_id)"
			+ " join product p on(p.id=od.product_id)"
			+ " join orders_status os on(o.id = os.orders_id)"
			+ " join address a on(a.id=o.address_id)"
			+ " where os.dest_status=2 and o.id = #{id}")
	public List<HashMap<String,Object>> userOrdersDetails(int id);
	
	
}
