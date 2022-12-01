package com.ceragem.crm.sys.dao;

import java.util.List;

import com.ceragem.crm.common.model.EzMap;
import com.ceragem.crm.sys.mapper.CrmMapper;
import com.ceragem.crm.sys.model.CrmMenuVo;

@CrmMapper
public interface CrmMenuBaseDao extends ICrmDao {

	CrmMenuVo selectMaxInfo(Object so) throws Exception;

	List<CrmMenuVo> selectTreeList(EzMap param) throws Exception;

	int updateSeq(Object param);

	List<CrmMenuVo> selectUserMenuList(Object param) throws Exception;

	int selectChildrenCount(Object param) throws Exception;
	
}
