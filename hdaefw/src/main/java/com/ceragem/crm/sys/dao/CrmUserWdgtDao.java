package com.ceragem.crm.sys.dao;

import java.util.List;

import com.ceragem.crm.common.model.EzMap;
import com.ceragem.crm.sys.mapper.CrmMapper;

@CrmMapper
public interface CrmUserWdgtDao extends ICrmDao {

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
