package com.wigo.cmm.sys.dao;

import com.wigo.cmm.sys.mapper.CmmMapper;

@CmmMapper
public interface GrpUserRelDao extends ICmmDao {

	void deleteUserCd(Object param) throws Exception;

	void deleteGrpCd(Object param) throws Exception;

}
