package com.ceragem.crm.sys.dao;

import com.ceragem.crm.sys.mapper.CrmMapper;

@CrmMapper
public interface CrmFileBaseDao extends ICrmDao {

	int selectMaxFileSeq(Object param) throws Exception;

}
