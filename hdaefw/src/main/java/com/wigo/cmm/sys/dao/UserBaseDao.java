package com.wigo.cmm.sys.dao;

import java.util.List;

import com.wigo.cmm.sys.mapper.CmmMapper;
import com.wigo.cmm.sys.model.GrpBaseVo;
import com.wigo.cmm.sys.model.LoginUserVo;

@CmmMapper
public interface UserBaseDao extends ICmmDao {

	LoginUserVo selectUser(Object param) throws Exception;

	int updateLoginFail(Object param) throws Exception;

	int updateLogin(Object user) throws Exception;

	int insertLoginHist(Object user) throws Exception;

	int updatePassword(Object param) throws Exception;

	int updateMyInfo(Object param) throws Exception;

	int updateEmp(Object param)throws Exception;

	List<GrpBaseVo> selectUserGroupList(Object param)throws Exception;

}
