package com.wigo.cmm.sys.dao;

import com.wigo.cmm.sys.mapper.CrmMapper;

@CrmMapper
public interface CrmGrpUserRelDao extends ICrmDao {

	void deleteUserCd(Object param) throws Exception;

	void deleteGrpCd(Object param) throws Exception;

}
