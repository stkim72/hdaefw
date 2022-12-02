package com.wigo.cmm.sys.dao;

import com.wigo.cmm.sys.mapper.CrmMapper;

@CrmMapper
public interface CrmCommonDao extends ICrmDao {

	String getAutoSeq(Object param);
	
	String endcryptText(String param);

	String decryptText(String param);
}
