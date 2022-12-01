package com.ceragem.crm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ceragem.crm.common.model.AbstractTreeVo;
import com.ceragem.crm.common.model.EzMap;
import com.ceragem.crm.sys.dao.CrmOrgBaseDao;
import com.ceragem.crm.sys.dao.ICrmDao;
import com.ceragem.crm.sys.model.CrmJadeOrgVo;

@Service
public class CrmOrgBaseService extends AbstractCrmService {
	@Autowired
	CrmOrgBaseDao dao;

	@Override
	public ICrmDao getDao() {
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
