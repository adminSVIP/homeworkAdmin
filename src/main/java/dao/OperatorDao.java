package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Operator;
import entity.SearchInfo;

@Repository
public interface OperatorDao {

	@Select("select * from operator ${where}  ${limit}")
	public List<Operator> select(SearchInfo searchInfo);
	
	@Insert("insert into operator(nike,password,name,sex,tel,power,status,comments) "
			+ "values(#{nike},#{md5Pass},#{name},#{sex},"
			+ "#{tel},#{power},#{status},#{comments})")
	public int insert( Operator operator);
	
	@Update("update operator set nike = #{nike} , "
			+ "name=#{name},sex=#{sex},"
			+ "tel = #{tel},power = #{power}, status = #{status},"
			+ "comments = #{comments} ,password = #{md5Pass}"
			+ " where id = #{id} ") 
	public int update(Operator operator);
	
	@Update("update operator set status = 3  where  id = #{id} ")
	public int delete(int id);
	
	@Select("select * from operator where nike = #{nike} and password = #{md5Pass}")
	public List<Operator> canLogin(Operator operator);
}
