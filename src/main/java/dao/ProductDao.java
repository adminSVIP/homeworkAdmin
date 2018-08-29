package dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Product;
import entity.ProductSearchInfo;

@Repository
public interface ProductDao {

	@Select("select * from product ${where}  ${limit}")
	public List<Product> select(ProductSearchInfo productSearchInfo);
	
	@Insert("insert into product(fullname,type_id,activity,tip,sale,info,price,nowprice,priority,status,pics) "
			+ "values(#{fullname},#{type_id},#{activity},#{tip},"
			+ "#{sale},#{info},#{price},#{nowprice},#{priority},#{status},#{pics})")
	public int insert(Product product);
	
	@Update("update product set fullname = #{fullname} , "
			+ "type_id=#{type_id},activity=#{activity},"
			+ "tip = #{tip},sale = #{sale}, info = #{info},"
			+ "price = #{price} ,nowprice = #{nowprice},"
			+ "priority = #{priority} ,status = #{status},pics = #{pics}"
			+ " where id = #{id} ")
	public int update(Product product);
	
	@Update("update operator set status = 3  where  id = #{id}")
	public int delete(int id);
}
