package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Operator;
import entity.Orders_status;
import entity.SearchInfo;

@Repository
public interface OrderStatusDao {

	@Select("select * from orders_status ${where}  ${limit}")
	public List<Operator> select(); 
	
	@Insert("insert into orders_status(orders_id,date,dest_status,info,num,amount,comments) "
			+ "values(#{orders_id},#{date},#{dest_status},#{info},"
			+ "#{num},#{amount},#{comments})")
	public int insert(Orders_status orders_status);
	  
	@Update("update orders_status set orders_id = #{orders_id} , "
			+ "date=#{date},dest_status=#{dest_status},"
			+ "info = #{info},num = #{num}, amount = #{amount},"
			+ "comments = #{comments}"  
			+ " where id = #{id} ")
	public int update(Orders_status orders_status);
	 
}
