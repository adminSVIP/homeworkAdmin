package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Operator;
import entity.User;

@Repository
public interface UserDao {
	@Select("select * from user")
	public List<User> select();
	
	@Insert("insert into user(email,password,tel,level,amount,status,comments) "
			+ "values(#{email},#{password},#{tel},#{level},"
			+ "#{amount},#{status},#{comments})")
	public int insert(User user);
	
	@Update("update user set email = #{email} , "
			+ "password = #{password},tel=#{tel},amount=#{amount},"
			+ "tel = #{tel}, status = #{status},"
			+ "comments = #{comments} "
			+ " where id = #{id} ")
	public int update(User user);
	
	@Delete("delete user where id = #{id}")
	public int delete(int id);
}
