package com.ceragem.crm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ceragem.crm.sys.dao.CrmUserLoginHstDao;
import com.ceragem.crm.sys.dao.ICrmDao;

@Service
public class CrmUserLoginHstService extends AbstractCrmService {
	@Autowired
	CrmUserLoginHstDao dao;

	@Override
	public ICrmDao getDao() {
		return dao;
	}
	
	
}
