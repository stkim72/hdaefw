package com.wigo.cmm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.sys.dao.CrmApiExecHstDao;
import com.wigo.cmm.sys.dao.ICrmDao;

@Service
public class CrmApiHistService extends AbstractCrmService {
	@Autowired
	CrmApiExecHstDao dao;

	@Override
	public ICrmDao getDao() {
		return dao;
	}

	
}
