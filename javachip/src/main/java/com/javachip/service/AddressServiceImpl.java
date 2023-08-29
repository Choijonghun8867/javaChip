package com.javachip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.dao.AddressDAO;
import com.javachip.vo.AddressVO;
import com.javachip.vo.SearchVO;

@Repository
public class AddressServiceImpl implements AddressService{
	@Autowired
	private AddressDAO addressDAO;
	
	@Override
	public List<AddressVO> addressSelect(SearchVO searchVO) {
		
		return addressDAO.addressSelect(searchVO);
	}
	
	@Override
	public int addressSaved(AddressVO vo) {
		
		return addressDAO.addressSaved(vo);
	}

	@Override
	public int updateComment(AddressVO addressVO) {
		// TODO Auto-generated method stub
		return addressDAO.updateComment(addressVO);
	}
}
