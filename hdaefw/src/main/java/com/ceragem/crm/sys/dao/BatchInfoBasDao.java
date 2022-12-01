package com.ceragem.crm.sys.dao;

import com.ceragem.crm.sys.mapper.CrmMapper;

@CrmMapper
public interface BatchInfoBasDao extends ICrmDao {

	int updateHist(Object param) throws Exception;

}
