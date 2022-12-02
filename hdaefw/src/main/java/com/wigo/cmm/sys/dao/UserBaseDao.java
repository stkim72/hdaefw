package com.wigo.cmm.sys.dao;

import java.util.List;

import com.wigo.cmm.sys.mapper.CrmMapper;
import com.wigo.cmm.sys.model.CrmGrpBaseVo;
import com.wigo.cmm.sys.model.CrmLoginUserVo;

@CrmMapper
public interface UserBaseDao extends ICmmDao {

	CrmLoginUserVo selectUser(Object param) throws Exception;

	int updateLoginFail(Object param) throws Exception;

	int updateLogin(Object user) throws Exception;

	int insertLoginHist(Object user) throws Exception;

	int updatePassword(Object param) throws Exception;

	int updateMyInfo(Object param) throws Exception;

	int updateEmp(Object param)throws Exception;

	List<CrmGrpBaseVo> selectUserGroupList(Object param)throws Exception;

}
