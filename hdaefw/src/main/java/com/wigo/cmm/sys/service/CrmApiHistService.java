package com.wigo.cmm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.sys.dao.ApiExecHstDao;
import com.wigo.cmm.sys.dao.ICmmDao;

@Service
public class CrmApiHistService extends AbstractCmmService {
	@Autowired
	ApiExecHstDao dao;

	@Override
	public ICmmDao getDao() {
		return dao;
	}

	
}
