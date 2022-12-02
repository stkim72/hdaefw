package com.wigo.cmm.sys.dao;

import com.wigo.cmm.sys.mapper.CrmMapper;

@CrmMapper
public interface CrmFileBaseDao extends ICrmDao {

	int selectMaxFileSeq(Object param) throws Exception;

}
