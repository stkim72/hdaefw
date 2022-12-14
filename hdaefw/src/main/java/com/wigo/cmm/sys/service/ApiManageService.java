package com.wigo.cmm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.common.util.Utilities;
import com.wigo.cmm.sys.dao.ApiInfoBaseDao;
import com.wigo.cmm.sys.dao.ICmmDao;
import com.wigo.cmm.sys.model.ApiInfoBaseVo;

@Service
public class ApiManageService extends AbstractCmmService {
	@Autowired
	ApiInfoBaseDao dao;

	@Override
	public ICmmDao getDao() {
		return dao;
	}

	@Override
	public int update(Object param) throws Exception {
		if(param instanceof ApiInfoBaseVo) {
			ApiInfoBaseVo vo = (ApiInfoBaseVo) param;
			String url = vo.getApiUrl();
			if(Utilities.isNotEmpty(url) && !url.startsWith("/"))
				vo.setApiUrl("/"+url);
		}
		return super.update(param);
	}
	@Override
	public int insert(Object param) throws Exception {
		if(param instanceof ApiInfoBaseVo) {
			ApiInfoBaseVo vo = (ApiInfoBaseVo) param;
			String url = vo.getApiUrl();
			if(Utilities.isNotEmpty(url) && !url.startsWith("/"))
				vo.setApiUrl("/"+url);
		}
		return super.insert(param);
	}
}
