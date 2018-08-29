package service;

import java.util.List;

import entity.Type;

public interface TypeService {
	public List<Type> select(Integer id);
//	public List<Type> select ();
	public int insert(Type type);
}
