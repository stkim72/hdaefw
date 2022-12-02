package com.wigo.cmm.sys.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.common.model.BaseVo;
import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.common.util.Utilities;
import com.wigo.cmm.sys.dao.ComnCdBaseDao;
import com.wigo.cmm.sys.dao.ICmmDao;
import com.wigo.cmm.sys.model.ComnCdBaseVo;

@Service
public class ComnCdService extends AbstractCmmService {
	@Autowired
	ComnCdBaseDao dao;

	@Override
	public ICmmDao getDao() {
		return dao;
	}

	@Override
	public int delete(Object param) throws Exception {
		if (param instanceof ComnCdBaseVo) {
			dao.deleteChildren(param);
		}
		return super.delete(param);
	}

	public List<ComnCdBaseVo> getComboCode(Object param) throws Exception {
		return dao.selectCodeCombo(param);
	}

	public String getComboCodeName(EzMap param) throws Exception {
		String codeCd = param.getString("codeCd");
		if (Utilities.isEmpty(codeCd))
			return "";
		param.setString("codeName", "Y");
		List<ComnCdBaseVo> codeList = dao.selectCodeCombo(param);

		for (int i = 0; codeList != null && i < codeList.size(); i++) {
			ComnCdBaseVo vo = codeList.get(i);
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
