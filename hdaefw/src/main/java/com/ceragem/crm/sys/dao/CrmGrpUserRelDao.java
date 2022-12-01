package com.ceragem.crm.sys.dao;

import com.ceragem.crm.sys.mapper.CrmMapper;

@CrmMapper
public interface CrmGrpUserRelDao extends ICrmDao {

	void deleteUserCd(Object param) throws Exception;

	void deleteGrpCd(Object param) throws Exception;

}
