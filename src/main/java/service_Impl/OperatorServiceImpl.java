package service_Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.OperatorDao;
import entity.Operator;
import entity.SearchInfo;
import service.OperatorService;

@Service
public class OperatorServiceImpl implements OperatorService {

	@Autowired
	OperatorDao operatorDao;
	
	public List<Operator> select(SearchInfo searchInfo) {
		return operatorDao.select(searchInfo);
	}

	public int insert(Operator operator) {
		return operatorDao.insert(operator);
	}

	public int update(Operator operator) {
		return operatorDao.update(operator);
	}

	public int delete(int id) {
		return operatorDao.delete(id);		
	}

	public List<Operator> canLogin(Operator operator) {
		
		return operatorDao.canLogin(operator);
	}

}
