package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.SearchInfo;
import entity.Shopcar;

@Repository
public interface ShopcarDao {
	
	@Select("select * from shopcar ${where} ${limit}")
	public List<Shopcar> select(SearchInfo searchInfo);

	@Insert("insert into shopcar (user_id,product_id,count) values(#{user_id},#{product_id},#{count})")
	public int insert(Shopcar shopcar);

	@Update("update shopcar set user_id = #{user_id}, product_id = #{product_id}, count = #{count}")
	public int update(Shopcar shopcar);
	
	@Delete("delete from shopcar where id = #{id}")
	public int delete(int id);
}
