package com.wigo.cmm.sys.dao;

import java.util.List;

import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.sys.mapper.CrmMapper;

@CrmMapper
public interface CrmGenGridDao extends ICrmDao {
	List<EzMap> selectCodeList(Object param);
}
