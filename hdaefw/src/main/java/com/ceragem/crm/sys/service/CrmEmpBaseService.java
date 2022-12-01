package com.ceragem.crm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ceragem.crm.common.util.Utilities;
import com.ceragem.crm.sys.dao.CrmEmpBaseDao;
import com.ceragem.crm.sys.dao.CrmUserBaseDao;
import com.ceragem.crm.sys.dao.ICrmDao;
import com.ceragem.crm.sys.model.CrmJadeHrVo;
import com.ceragem.crm.sys.model.CrmLoginUserVo;
import com.ceragem.crm.sys.model.CrmUserBaseVo;

@Service
public class CrmEmpBaseService extends AbstractCrmService {
	@Autowired
	CrmEmpBaseDao dao;
	@Autowired
	CrmUserBaseDao userDao;

	
	@Override
	public ICrmDao getDao() {
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
