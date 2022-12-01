package com.ceragem.crm.sys.dao;

import java.util.List;

import com.ceragem.crm.common.model.EzMap;
import com.ceragem.crm.sys.mapper.CrmMapper;
import com.ceragem.crm.sys.model.CrmComnCdBaseVo;

@CrmMapper
public interface CrmComnCdBaseDao extends ICrmDao {

	int updateSeq(Object param) throws Exception;

	int deleteChildren(Object param) throws Exception;

	List<CrmComnCdBaseVo> selectCodeCombo(Object param) throws Exception;

	List<EzMap> selectExcelList(Object param) throws Exception;

}
