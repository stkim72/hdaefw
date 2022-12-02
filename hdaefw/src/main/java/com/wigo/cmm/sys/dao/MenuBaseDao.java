package com.wigo.cmm.sys.dao;

import java.util.List;

import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.sys.mapper.CmmMapper;
import com.wigo.cmm.sys.model.MenuVo;

@CmmMapper
public interface MenuBaseDao extends ICmmDao {

	MenuVo selectMaxInfo(Object so) throws Exception;

	List<MenuVo> selectTreeList(EzMap param) throws Exception;

	int updateSeq(Object param);

	List<MenuVo> selectUserMenuList(Object param) throws Exception;

	int selectChildrenCount(Object param) throws Exception;
	
}
