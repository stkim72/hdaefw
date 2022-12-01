package com.ceragem.crm.sys.dao;

import com.ceragem.crm.sys.mapper.CrmMapper;

@CrmMapper
public interface CrmGrpMenuRelDao extends ICrmDao {

	int deleteMenuCd(Object param) throws Exception;

	void deleteGrpCd(Object param) throws Exception;

}
