package com.wigo.cmm.sys.dao;

import com.wigo.cmm.sys.mapper.CmmMapper;

@CmmMapper
public interface CommonDao extends ICmmDao {

	String getAutoSeq(Object param);
	
	String endcryptText(String param);

	String decryptText(String param);
}
