package com.wigo.cmm.sys.dao;

import com.wigo.cmm.sys.mapper.CrmMapper;

@CrmMapper
public interface CrmGrpMenuRelDao extends ICrmDao {

	int deleteMenuCd(Object param) throws Exception;

	void deleteGrpCd(Object param) throws Exception;

}