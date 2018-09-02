package service_Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AddressDao;
import entity.Address;
import service.AddressService;

@Service
public class AddressServiceImpl implements AddressService {
	
	@Autowired
	AddressDao addressDao;
	
	public List<Address> select() {
		return addressDao.select();
	}

	public List<Address> getUserAddress(int id) {
		return addressDao.getUserAddress(id);
	}

	public int insert(Address address) {
		return addressDao.insert(address);
	}

	public int update(Address address) {
		return addressDao.update(address);
	}

	public int delete(int id) {
		
		return addressDao.delete(id);
	}

}
