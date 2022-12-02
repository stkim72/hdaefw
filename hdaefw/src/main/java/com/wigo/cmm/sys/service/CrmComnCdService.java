package com.wigo.cmm.sys.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.common.model.BaseVo;
import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.common.util.Utilities;
import com.wigo.cmm.sys.dao.CrmComnCdBaseDao;
import com.wigo.cmm.sys.dao.ICrmDao;
import com.wigo.cmm.sys.model.CrmComnCdBaseVo;

@Service
public class CrmComnCdService extends AbstractCrmService {
	@Autowired
	CrmComnCdBaseDao dao;

	@Override
	public ICrmDao getDao() {
		return dao;
	}

	@Override
	public int delete(Object param) throws Exception {
		if (param instanceof CrmComnCdBaseVo) {
			dao.deleteChildren(param);
		}
		return super.delete(param);
	}

	public List<CrmComnCdBaseVo> getComboCode(Object param) throws Exception {
		return dao.selectCodeCombo(param);
	}

	public String getComboCodeName(EzMap param) throws Exception {
		String codeCd = param.getString("codeCd");
		if (Utilities.isEmpty(codeCd))
			return "";
		param.setString("codeName", "Y");
		List<CrmComnCdBaseVo> codeList = dao.selectCodeCombo(param);

		for (int i = 0; codeList != null && i < codeList.size(); i++) {
			CrmComnCdBaseVo vo = codeList.get(i);
			if (codeCd.equals(vo.getComnCd()))
				return vo.getComnCdNm();
		}
		return "";
	}

	public int updateSeq(Object param) throws Exception {
		return dao.updateSeq(param);
	}

	public EzMap updateSeqList(List<? extends BaseVo> list) throws Exception {
		List<EzMap> result = new ArrayList<EzMap>();
		for (int i = 0; i < list.size(); i++) {
			result.add(Utilities.getUpdateResult(updateSeq(list.get(i)), list.get(i)));
		}
		return Utilities.getSaveResult(result);
	}

	public List<EzMap> getExcelList(EzMap param) throws Exception {
		return dao.selectExcelList(param);
	}
}
