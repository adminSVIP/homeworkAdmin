package service;

import java.util.List;

import entity.Assess;

public interface AssessService {
	
	public List<Assess> select();
	
	public int insert(Assess assess);
	
	public int update(Assess assess);

	public int delete(int id);
}
