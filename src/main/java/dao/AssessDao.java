package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Address;
import entity.Assess;

@Repository
public interface AssessDao {
	@Select("select * from assess")
	public List<Assess> select();
	
	@Insert("insert into assess(orders_id,product_id,user_id,info,pics,result,status) "
			+ "values(#{orders_id},#{product_id},#{user_id},#{info},"
			+ "'',#{result},#{status})")
	public int insert(Assess assess);
	
	@Update("update assess set orders_id = #{orders_id} , "
			+ "product_id = #{product_id},user_id=#{user_id},info=#{info},"
			+ "pics = #{pics}, result = #{result}, status = #{status}"
			+ " where id = #{id} ")
	public int update(Assess assess);
	
	@Delete("delete assess where id = #{id}")
	public int delete(int id);
}
