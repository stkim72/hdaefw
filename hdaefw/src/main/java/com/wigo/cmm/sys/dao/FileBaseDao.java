package com.wigo.cmm.sys.dao;

import com.wigo.cmm.sys.mapper.CrmMapper;

@CrmMapper
public interface FileBaseDao extends ICmmDao {

	int selectMaxFileSeq(Object param) throws Exception;

}
