package com.wigo.cmm.sys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.sys.dao.GrpUserRelDao;
import com.wigo.cmm.sys.dao.ICmmDao;
import com.wigo.cmm.sys.model.GrpUserRelVo;

@Service
public class CrmGrpUserRelService extends AbstractCmmService {
	@Autowired
	GrpUserRelDao dao;

	@Override
	public ICmmDao getDao() {
		return dao;
	}

	public Object saveUserGroup(String userCd, List<GrpUserRelVo> list) throws Exception {
		EzMap param = new EzMap();
		param.setString("userCd", userCd);
		dao.deleteUserCd(param);
		return insertList(list);
	}
	public Object saveGroupUser(String grpCd, List<GrpUserRelVo> list) throws Exception{
		EzMap param = new EzMap();
		param.setString("grpCd", grpCd);
		dao.deleteGrpCd(param);
		return insertList(list);
	}
	
}
