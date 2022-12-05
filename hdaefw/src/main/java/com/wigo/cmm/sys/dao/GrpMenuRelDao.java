package com.wigo.cmm.sys.dao;

import com.wigo.cmm.sys.mapper.CmmMapper;

@CmmMapper
public interface GrpMenuRelDao extends ICmmDao {

	int deleteMenuId(Object param) throws Exception;

	void deleteGrpCd(Object param) throws Exception;

}
