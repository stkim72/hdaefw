package com.wigo.cmm.sys.dao;

import java.util.List;

import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.sys.mapper.CmmMapper;
import com.wigo.cmm.sys.model.CrmGrpBaseVo;
import com.wigo.cmm.sys.model.CrmGrpMenuRelVo;
import com.wigo.cmm.sys.model.CrmGrpUserRelVo;

@CmmMapper
public interface GrpBaseDao extends ICmmDao {

	List<CrmGrpUserRelVo> selectGroupUserList(Object param) throws Exception;

	int selectGroupUserListCount(Object param) throws Exception;
	
	List<CrmGrpMenuRelVo> selectGroupMenuList(Object param) throws Exception;

	int selectGroupMenuListCount(Object param) throws Exception;

	List<CrmGrpBaseVo> selectGroupCheckList(EzMap param) throws Exception;

}
