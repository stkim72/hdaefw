package com.ceragem.crm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ceragem.crm.sys.dao.CrmChngHstDao;
import com.ceragem.crm.sys.dao.ICrmDao;

@Service
public class CrmChngHstService extends AbstractCrmService {
	@Autowired
	CrmChngHstDao dao;

	@Override
	public ICrmDao getDao() {
		return dao;
	}
}
