package com.wigo.cmm.sys.dao;

import com.wigo.cmm.sys.mapper.CmmMapper;

@CmmMapper
public interface GrpOrgRelDao extends ICmmDao {

	void deleteGrpId(Object param) throws Exception;

}
