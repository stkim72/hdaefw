package com.wigo.cmm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.sys.dao.GrpEmpHstDao;
import com.wigo.cmm.sys.dao.GrpEmpRelDao;
import com.wigo.cmm.sys.dao.ICmmDao;

@Service
public class GrpEmpRelService extends AbstractCmmService {
	@Autowired
	GrpEmpRelDao dao;
	@Autowired
	GrpEmpHstDao hstDao;

	@Override
	public ICmmDao getDao() {
		return dao;
	}

	@Override
	public int delete(Object param) throws Exception {
		hstDao.insertDelete(param);
		return super.delete(param);
	}

	@Override
	public int insert(Object param) throws Exception {
		if (get(param) == null) {
			hstDao.insert(param);
			return super.insert(param);
		}
		return 0;
	}
}
