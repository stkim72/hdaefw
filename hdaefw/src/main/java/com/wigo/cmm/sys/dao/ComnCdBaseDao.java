package com.wigo.cmm.sys.dao;

import java.util.List;

import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.sys.mapper.CmmMapper;
import com.wigo.cmm.sys.model.ComnCdBaseVo;

@CmmMapper
public interface ComnCdBaseDao extends ICmmDao {

	int updateSeq(Object param) throws Exception;

	int deleteChildren(Object param) throws Exception;

	List<ComnCdBaseVo> selectCodeCombo(Object param) throws Exception;

	List<EzMap> selectExcelList(Object param) throws Exception;

}
