package service_Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.TypeDao;
import entity.Type;
import service.TypeService;

@Service
public class TypeServiceImpl implements TypeService {

	@Autowired
	TypeDao dao;
	
	public List<Type> select(Integer id) {
		if(id != null) {
			return dao.select(id);
		}
		return dao.selectAll();
	}

	public int insert(Type type) {
		return dao.insert(type);
	}

//	public List<Type> select() {
//		return dao.select();
//	}

}
