package com.wigo.cmm.sys.dao;

import java.util.List;

import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.sys.mapper.CrmMapper;

@CrmMapper
public interface UserWdgtDao extends ICmmDao {

	int deleteMenuCd(Object param) throws Exception;

	EzMap selectCustType() throws Exception;

	EzMap selectCustCountInfo() throws Exception;

	List<EzMap> selectCustTypeList() throws Exception;

	List<EzMap> selectCouponList() throws Exception;

	List<EzMap> selectMembershipRegList() throws Exception;

	List<EzMap> selectCustRegList() throws Exception;

	List<EzMap> selectOrdList() throws Exception;

	EzMap selectCustCountWeek() throws Exception;

	int insertUserCard() throws Exception;
}
