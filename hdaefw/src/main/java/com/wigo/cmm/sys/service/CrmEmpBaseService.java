package com.wigo.cmm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.sys.dao.EmpBaseDao;
import com.wigo.cmm.sys.dao.ICmmDao;
import com.wigo.cmm.sys.dao.UserBaseDao;

@Service
public class CrmEmpBaseService extends AbstractCmmService {
	@Autowired
	EmpBaseDao dao;
	@Autowired
	UserBaseDao userDao;

	
	@Override
	public ICmmDao getDao() {
		return dao;
	}

	
}
