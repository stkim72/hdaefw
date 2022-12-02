package com.wigo.cmm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.sys.dao.ChngHstDao;
import com.wigo.cmm.sys.dao.ICmmDao;

@Service
public class CrmChngHstService extends AbstractCmmService {
	@Autowired
	ChngHstDao dao;

	@Override
	public ICmmDao getDao() {
		return dao;
	}
}
