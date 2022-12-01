package com.ceragem.crm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ceragem.crm.sys.dao.CrmApiExecHstDao;
import com.ceragem.crm.sys.dao.ICrmDao;

@Service
public class CrmApiHistService extends AbstractCrmService {
	@Autowired
	CrmApiExecHstDao dao;

	@Override
	public ICrmDao getDao() {
		return dao;
	}

	
}
