package com.wigo.cmm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.common.util.Utilities;
import com.wigo.cmm.sys.dao.EmpBaseDao;
import com.wigo.cmm.sys.dao.UserBaseDao;
import com.wigo.cmm.sys.dao.ICmmDao;
import com.wigo.cmm.sys.model.CrmJadeHrVo;
import com.wigo.cmm.sys.model.CrmLoginUserVo;
import com.wigo.cmm.sys.model.CrmUserBaseVo;

@Service
public class CrmEmpBaseService extends AbstractCrmService {
	@Autowired
	EmpBaseDao dao;
	@Autowired
	UserBaseDao userDao;

	
	@Override
	public ICmmDao getDao() {
		return dao;
	}

	

	@Override
	public int insert(Object param) throws Exception {
		if (param instanceof CrmLoginUserVo) {

			CrmLoginUserVo v = (CrmLoginUserVo) param;
			if (Utilities.isEmpty(v.getOrgId()))
				return 0;
			if (Utilities.isEmpty(v.getEmailAddr()))
				v.setLoginId(v.getEmpId());
			else
				v.setLoginId(v.getEmailAddr());
			String phone = v.getMobileNo();
			v.setMphonNoEncVal(Utilities.encrypt(phone));
			v.setMobileNo("");
			v.setDelYn("30".equals(v.getStatusCd()) ? "Y" : "N");
		}

		CrmUserBaseVo usr = userDao.select(param);

		if (usr == null) {

			userDao.insert(param);
		} else {
			userDao.updateEmp(param);
		}
		CrmJadeHrVo vo = get(param);
		if (vo == null)
			return super.insert(param);
		else
			return super.update(param);
	}
}
