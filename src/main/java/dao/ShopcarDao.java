package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.SearchInfo;
import entity.Shopcar;
import entity.ShopcarSearchInfo;

@Repository
public interface ShopcarDao {
	
	@Select("select * from shopcar ${where} ${limit}")
	public List<Shopcar> select(SearchInfo searchInfo);
 
	@Insert("insert into shopcar (user_id,product_id,count) values(#{user_id},#{product_id},#{count})")
	public int insert(Shopcar shopcar);

	@Update("update shopcar set user_id = #{user_id}, product_id = #{product_id}, count = #{count}")
	public int update(Shopcar shopcar);
	
	@Delete("delete from shopcar where id in (${where})")
	public int delete(ShopcarSearchInfo shopcarSearchInfo);
	
	@Select("select p.*,c.user_id,c.id cid from shopcar c join product p on(c.product_id = p.id) where c.user_id = #{id}")
	@Results({ 
		@Result(property="cid", column="c.id")
	})
	public List<HashMap<String, Object>> myShopcar(int id);
	
	
}
