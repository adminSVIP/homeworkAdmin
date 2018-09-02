package service_Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AssessDao;
import entity.Assess;
import service.AssessService;

@Service
public class AssessServiceImpl implements AssessService {

	@Autowired
	AssessDao assessDao;

	public List<Assess> select() {
		return assessDao.select();
	}

	public int insert(Assess assess) {
		return assessDao.insert(assess);
	}

	public int update(Assess assess) {
		return assessDao.update(assess);
	}

	public int delete(int id) {
		return assessDao.delete(id);
	}
	
	
	
}
