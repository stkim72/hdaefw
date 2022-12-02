package com.wigo.cmm.sys.dao;

import java.util.List;

import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.sys.mapper.CrmMapper;
import com.wigo.cmm.sys.model.CrmComnCdBaseVo;

@CrmMapper
public interface CrmComnCdBaseDao extends ICrmDao {

	int updateSeq(Object param) throws Exception;

	int deleteChildren(Object param) throws Exception;

	List<CrmComnCdBaseVo> selectCodeCombo(Object param) throws Exception;

	List<EzMap> selectExcelList(Object param) throws Exception;

}