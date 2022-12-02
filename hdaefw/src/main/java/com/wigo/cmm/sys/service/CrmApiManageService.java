package com.wigo.cmm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.common.util.Utilities;
import com.wigo.cmm.sys.dao.CrmApiInfoBaseDao;
import com.wigo.cmm.sys.dao.ICrmDao;
import com.wigo.cmm.sys.model.CrmApiInfoBaseVo;

@Service
public class CrmApiManageService extends AbstractCrmService {
	@Autowired
	CrmApiInfoBaseDao dao;

	@Override
	public ICrmDao getDao() {
		return dao;
	}

	@Override
	public int update(Object param) throws Exception {
		if(param instanceof CrmApiInfoBaseVo) {
			CrmApiInfoBaseVo vo = (CrmApiInfoBaseVo) param;
			String url = vo.getApiUrl();
			if(Utilities.isNotEmpty(url) && !url.startsWith("/"))
				vo.setApiUrl("/"+url);
		}
		return super.update(param);
	}
	@Override
	public int insert(Object param) throws Exception {
		if(param instanceof CrmApiInfoBaseVo) {
			CrmApiInfoBaseVo vo = (CrmApiInfoBaseVo) param;
			String url = vo.getApiUrl();
			if(Utilities.isNotEmpty(url) && !url.startsWith("/"))
				vo.setApiUrl("/"+url);
		}
		return super.insert(param);
	}
}
