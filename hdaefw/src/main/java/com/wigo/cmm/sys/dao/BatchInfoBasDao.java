package com.wigo.cmm.sys.dao;

import com.wigo.cmm.sys.mapper.CrmMapper;

@CrmMapper
public interface BatchInfoBasDao extends ICmmDao {

	int updateHist(Object param) throws Exception;

}
