package service;

import java.util.List;

import entity.Address;

public interface AddressService {
	public List<Address> select();
	
	public List<Address> getUserAddress(int id);
	
	public int insert(Address address);
	
	public int update(Address address);

	public int delete(int id);
}
