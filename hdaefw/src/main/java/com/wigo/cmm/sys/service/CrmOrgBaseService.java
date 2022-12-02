package com.wigo.cmm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.common.model.AbstractTreeVo;
import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.sys.dao.OrgBaseDao;
import com.wigo.cmm.sys.dao.ICmmDao;
import com.wigo.cmm.sys.model.CrmJadeOrgVo;

@Service
public class CrmOrgBaseService extends AbstractCrmService {
	@Autowired
	OrgBaseDao dao;

	@Override
	public ICmmDao getDao() {
		return dao;
	}


	@Override
	public int insert(Object param) throws Exception {
		CrmJadeOrgVo vo = get(param);
		if (vo == null)
			return super.insert(param);
		else
			return super.update(param);
	}

	public Object getTreeList(EzMap param) {
		param.setInt("recordCountPerPage", 100000);
		return AbstractTreeVo.makeHierarchy(dao.selectList(param));
	}

}
