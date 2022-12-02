package com.wigo.cmm.sys.dao;

import java.util.List;

import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.sys.mapper.CmmMapper;
import com.wigo.cmm.sys.model.CrmMenuVo;

@CmmMapper
public interface MenuBaseDao extends ICmmDao {

	CrmMenuVo selectMaxInfo(Object so) throws Exception;

	List<CrmMenuVo> selectTreeList(EzMap param) throws Exception;

	int updateSeq(Object param);

	List<CrmMenuVo> selectUserMenuList(Object param) throws Exception;

	int selectChildrenCount(Object param) throws Exception;
	
}
