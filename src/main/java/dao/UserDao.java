package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Operator;
import entity.User;
import entity.UserSearchInfo;

@Repository
public interface UserDao {
	@Select("select * from user")
	public List<User> select(UserSearchInfo searchInfo);
	
	@Insert("insert into user(nike,email,password,tel,level,amount,status,comments) "
			+ "values(#{nike},#{email},#{md5Pass},'',1,"
			+ "0,1,'')")
	public int insert(User user);
	
	@Update("update user set nike=#{nike},email = #{email} , "
			+ "password = #{password},tel=#{tel},amount=#{amount},"
			+ "tel = #{tel}, status = #{status},"
			+ "comments = #{comments} "
			+ " where id = #{id} ")
	public int update(User user);
	
	@Delete("delete user where id = #{id}")
	public int delete(int id);
	
	@Select("select * from user where email=#{email} and password = #{md5Pass}")
	public List<User> getUser(User user) ;
		
}
