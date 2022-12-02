package com.wigo.cmm.sys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.sys.dao.GrpMenuHstDao;
import com.wigo.cmm.sys.dao.GrpMenuRelDao;
import com.wigo.cmm.sys.dao.ICmmDao;
import com.wigo.cmm.sys.model.GrpMenuRelVo;

@Service
public class CrmGrpMenuRelService extends AbstractCmmService {
	@Autowired
	GrpMenuRelDao dao;
	
	@Autowired
	GrpMenuHstDao hstDao;
	@Override
	public ICmmDao getDao() {
		return dao;
	}
	@Override
	public int insert(Object param) throws Exception {
		hstDao.insert(param);
		return super.insert(param);
	}
	@Override
	public int delete(Object param) throws Exception {
		hstDao.insertDelete(param);
		return super.delete(param);
	}
	public Object saveMenuGroup(String menuCd, List<GrpMenuRelVo> list) throws Exception {
		EzMap param = new EzMap();
		param.setString("menuCd", menuCd);
		dao.deleteMenuCd(param);
		return insertList(list);
	}
	public Object saveGroupMenu(String grpCd, List<GrpMenuRelVo> list) throws Exception {
		EzMap param = new EzMap();
		param.setString("grpCd", grpCd);
		dao.deleteGrpCd(param);
		return insertList(list);
	}
	
}
