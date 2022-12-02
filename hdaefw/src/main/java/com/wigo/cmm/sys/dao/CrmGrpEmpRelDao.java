package com.wigo.cmm.sys.dao;

import com.wigo.cmm.sys.mapper.CrmMapper;

@CrmMapper
public interface CrmGrpEmpRelDao extends ICrmDao {
	void deleteGrpCd(Object param) throws Exception;
}
