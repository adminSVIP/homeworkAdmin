package dao;

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
}
