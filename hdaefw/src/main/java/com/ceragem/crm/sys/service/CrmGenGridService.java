package com.ceragem.crm.sys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ceragem.crm.common.model.EzMap;
import com.ceragem.crm.sys.dao.CrmGenGridDao;
import com.ceragem.crm.sys.dao.ICrmDao;

@Service
public class CrmGenGridService extends AbstractCrmService {
	@Autowired
	CrmGenGridDao dao;

	@Override
	public ICrmDao getDao() {
		return dao;
	}
	public List<EzMap > getCodeList(Object param){
		return dao.selectCodeList(param);
	}
}
