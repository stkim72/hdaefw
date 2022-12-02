package com.wigo.cmm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.sys.dao.UserLoginHstDao;
import com.wigo.cmm.sys.dao.ICmmDao;

@Service
public class CrmUserLoginHstService extends AbstractCrmService {
	@Autowired
	UserLoginHstDao dao;

	@Override
	public ICmmDao getDao() {
		return dao;
	}
	
	
}
