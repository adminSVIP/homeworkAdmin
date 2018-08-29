package service;

import java.util.List;

import entity.Operator;
import entity.SearchInfo;

public interface OperatorService {

	public List select(SearchInfo searchInfo);

	public int insert(Operator operator);

	public int update(Operator operator);

	public int delete(int id);
	
	public List<Operator> canLogin(Operator operator);
}
