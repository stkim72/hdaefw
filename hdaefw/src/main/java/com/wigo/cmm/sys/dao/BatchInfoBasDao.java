package com.wigo.cmm.sys.dao;

import com.wigo.cmm.sys.mapper.CmmMapper;

@CmmMapper
public interface BatchInfoBasDao extends ICmmDao {

	int updateHist(Object param) throws Exception;

}
