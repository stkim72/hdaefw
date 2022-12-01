package com.ceragem.crm.sys.dao;

import java.util.List;

import com.ceragem.crm.sys.mapper.CrmMapper;
import com.ceragem.crm.sys.model.CrmGrpBaseVo;
import com.ceragem.crm.sys.model.CrmLoginUserVo;

@CrmMapper
public interface CrmUserBaseDao extends ICrmDao {

	CrmLoginUserVo selectUser(Object param) throws Exception;

	int updateLoginFail(Object param) throws Exception;

	int updateLogin(Object user) throws Exception;

	int insertLoginHist(Object user) throws Exception;

	int updatePassword(Object param) throws Exception;

	int updateMyInfo(Object param) throws Exception;

	int updateEmp(Object param)throws Exception;

	List<CrmGrpBaseVo> selectUserGroupList(Object param)throws Exception;

}
