package com.wigo.cmm.sys.dao;

import com.wigo.cmm.sys.mapper.CrmMapper;

@CrmMapper
public interface GrpOrgRelDao extends ICmmDao {

	void deleteGrpCd(Object param) throws Exception;

}
