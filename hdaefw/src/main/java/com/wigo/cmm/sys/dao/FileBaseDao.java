package com.wigo.cmm.sys.dao;

import com.wigo.cmm.sys.mapper.CmmMapper;

@CmmMapper
public interface FileBaseDao extends ICmmDao {

	int selectMaxFileSeq(Object param) throws Exception;

}
