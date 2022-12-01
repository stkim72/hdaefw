package com.ceragem.crm.sys.dao;

import java.util.List;

import com.ceragem.crm.common.model.EzMap;
import com.ceragem.crm.sys.mapper.CrmMapper;

@CrmMapper
public interface CrmGenGridDao extends ICrmDao {
	List<EzMap> selectCodeList(Object param);
}
