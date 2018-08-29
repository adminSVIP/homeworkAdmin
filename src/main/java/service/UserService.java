package service;

import java.util.List;

import entity.User;
import entity.UserSearchInfo;

public interface UserService {

	public List select(UserSearchInfo searchInfo);

	public int insert(User user);

	public int update(User user);

	public int delete(int id);
	
	public List<User> canLogin(User user);
}
