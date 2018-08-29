package service_Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;
import entity.User;
import entity.UserSearchInfo;
import service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userdao;
	
	public List select(UserSearchInfo searchInfo) {
		return userdao.select(searchInfo);
	}

	public int insert(User user) {
		return userdao.insert(user);
	}

	public int update(User user) {
		return userdao.update(user);
	}

	public int delete(int id) {
		return userdao.delete(id);
	}

	public List<User> canLogin(User user) {
		return userdao.getUser(user);
	}

}
