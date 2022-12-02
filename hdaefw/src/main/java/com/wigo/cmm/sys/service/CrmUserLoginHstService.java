package com.wigo.cmm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.sys.dao.CrmUserLoginHstDao;
import com.wigo.cmm.sys.dao.ICrmDao;

@Service
public class CrmUserLoginHstService extends AbstractCrmService {
	@Autowired
	CrmUserLoginHstDao dao;

	@Override
	public ICrmDao getDao() {
		return dao;
	}
	
	
}
