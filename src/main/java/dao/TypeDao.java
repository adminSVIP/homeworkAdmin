package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Operator;
import entity.Type;
import entity.User;

@Repository
public interface TypeDao {
	@Select("select * from type where parentid = #{id}")
	public List<Type> select(Integer id);
	
	@Select("select * from type ")
	public List<Type> selectAll();
	
	@Insert("insert into type(name,parentid) "
			+ "values(#{name},#{parentid})")
	public int insert(Type type);
	
}
	
	
