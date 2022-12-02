package com.wigo.cmm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.common.model.AbstractTreeVo;
import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.sys.dao.ICmmDao;
import com.wigo.cmm.sys.dao.OrgBaseDao;

@Service
public class OrgBaseService extends AbstractCmmService {
	@Autowired
	OrgBaseDao dao;

	@Override
	public ICmmDao getDao() {
		return dao;
	}


	

	public Object getTreeList(EzMap param) {
		param.setInt("recordCountPerPage", 100000);
		return AbstractTreeVo.makeHierarchy(dao.selectList(param));
	}

}
