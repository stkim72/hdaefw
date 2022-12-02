package com.wigo.cmm.sys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.sys.dao.GenGridDao;
import com.wigo.cmm.sys.dao.ICmmDao;

@Service
public class CrmGenGridService extends AbstractCmmService {
	@Autowired
	GenGridDao dao;

	@Override
	public ICmmDao getDao() {
		return dao;
	}
	public List<EzMap > getCodeList(Object param){
		return dao.selectCodeList(param);
	}
}
