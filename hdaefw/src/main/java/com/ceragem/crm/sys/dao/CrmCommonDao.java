package com.ceragem.crm.sys.dao;

import com.ceragem.crm.sys.mapper.CrmMapper;

@CrmMapper
public interface CrmCommonDao extends ICrmDao {

	String getAutoSeq(Object param);
	
	String endcryptText(String param);

	String decryptText(String param);
}
