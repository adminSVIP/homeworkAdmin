package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Address;
import entity.Operator;
import entity.User;

@Repository
public interface AddressDao {
	@Select("select * from address")
	public List<Address> select();
	
	@Select("select * from address where user_id = #{id}")
	public List<Address> getUserAddress(int id);
	
	@Insert("insert into address(user_id,zone,addr,name,tel,status) "
			+ "values(#{user_id},#{zone},#{addr},#{name},"
			+ "#{tel},#{status})")
	public int insert(Address address);
	
	@Update("update address set user_id = #{user_id} , "
			+ "zone = #{zone},addr=#{addr},name=#{name},"
			+ "tel = #{tel}, status = #{status},"
			+ " where id = #{id} ")
	public int update(Address address);
	
	@Delete("delete user where id = #{id}")
	public int delete(int id);
}
