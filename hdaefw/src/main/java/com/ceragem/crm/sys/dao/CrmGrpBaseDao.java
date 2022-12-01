package com.ceragem.crm.sys.dao;

import java.util.List;

import com.ceragem.crm.common.model.EzMap;
import com.ceragem.crm.sys.mapper.CrmMapper;
import com.ceragem.crm.sys.model.CrmGrpBaseVo;
import com.ceragem.crm.sys.model.CrmGrpMenuRelVo;
import com.ceragem.crm.sys.model.CrmGrpUserRelVo;

@CrmMapper
public interface CrmGrpBaseDao extends ICrmDao {

	List<CrmGrpUserRelVo> selectGroupUserList(Object param) throws Exception;

	int selectGroupUserListCount(Object param) throws Exception;
	
	List<CrmGrpMenuRelVo> selectGroupMenuList(Object param) throws Exception;

	int selectGroupMenuListCount(Object param) throws Exception;

	List<CrmGrpBaseVo> selectGroupCheckList(EzMap param) throws Exception;

}
