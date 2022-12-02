package com.wigo.cmm.sys.dao;

import java.util.List;

import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.sys.mapper.CmmMapper;
import com.wigo.cmm.sys.model.GrpBaseVo;
import com.wigo.cmm.sys.model.GrpMenuRelVo;
import com.wigo.cmm.sys.model.GrpUserRelVo;

@CmmMapper
public interface GrpBaseDao extends ICmmDao {

	List<GrpUserRelVo> selectGroupUserList(Object param) throws Exception;

	int selectGroupUserListCount(Object param) throws Exception;
	
	List<GrpMenuRelVo> selectGroupMenuList(Object param) throws Exception;

	int selectGroupMenuListCount(Object param) throws Exception;

	List<GrpBaseVo> selectGroupCheckList(EzMap param) throws Exception;

}
