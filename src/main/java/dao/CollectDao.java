package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Collect;
import entity.Operator;

@Repository
public interface CollectDao {

	@Select("select * from collect")
	public List<Collect> select();
	
	@Insert("insert into collect(user_id,product_id,date) "
			+ "values(#{user_id},#{product_id},#{date})")
	public int insert(Collect collect);
	
	@Update("update collect set user_id = #{user_id} , "
			+ "product_id = #{product_id},date=#{date} "
			+ " where id = #{id} ")
	public int update(Collect collect);
	
	@Delete("delete collect where id = #{id}")
	public int delete(int id);
}
