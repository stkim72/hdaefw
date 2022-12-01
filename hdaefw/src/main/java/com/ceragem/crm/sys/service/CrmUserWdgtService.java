package com.ceragem.crm.sys.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.ceragem.crm.common.model.EzMap;
import com.ceragem.crm.common.util.Constants;
import com.ceragem.crm.common.util.Utilities;
import com.ceragem.crm.sys.dao.CrmUserWdgtDao;
import com.ceragem.crm.sys.dao.ICrmDao;
import com.ceragem.crm.sys.model.CrmComnCdBaseVo;

@Service
public class CrmUserWdgtService extends AbstractCrmService {

	@Autowired
	CrmUserWdgtDao dao;

	@Autowired
	AsyncService asyncService;

	@Autowired
	CrmComnCdService comnCdService;

	private String lastDate;
	private EzMap lastData;

	private List<String> s180List = null;
	private Map<String, Object> s180Map = null;
//	private String s180Data = null;

	@PostConstruct
	public void initMainData() throws Exception {
		asyncService.initMainData();
	}

	public void initLastData() throws Exception {
		if (Utilities.getDateString().equals(lastDate))
			return;
		EzMap data = new EzMap();
		EzMap custCountInfo = dao.selectCustCountInfo();
		EzMap custCountWeek = dao.selectCustCountWeek();
		EzMap custType = dao.selectCustType();
		List<EzMap> custTypeList = dao.selectCustTypeList();
		List<EzMap> couponList = dao.selectCouponList();
		List<EzMap> memberRegList = dao.selectMembershipRegList();
		List<EzMap> custRegList = dao.selectCustRegList();
		List<EzMap> ordList = dao.selectOrdList();

		data.put("custCountInfo", custCountInfo);
		data.put("custCountWeek", custCountWeek);
		data.put("custType", custType);
		data.put("custTypeList", custTypeList);
		data.put("couponList", couponList);
		data.put("memberRegList", memberRegList);
		data.put("custRegList", custRegList);
		data.put("ordList", ordList);
		lastData = data;
		lastDate = Utilities.getDateString();

		refreshS180();

	}

	@Override
	public ICrmDao getDao() {
		return dao;
	}

	public EzMap getData() throws Exception {
		initLastData();
		return new EzMap(lastData);
	}

	@Scheduled(cron = "0 0 * * * *")
	public EzMap refreshData() throws Exception {
		lastDate = null;
		lastData = null;
		return getData();
	}

	public void refreshS180() throws Exception {

		dao.insertUserCard();

		EzMap codeSo = new EzMap();
		codeSo.setString("codeCd", Constants._FILE_WHITE_LIST);
		List<CrmComnCdBaseVo> list = comnCdService.getComboCode(codeSo);
		s180List = new ArrayList<String>();
		s180Map = new HashMap<String, Object>();
		for (int i = 0; i < list.size(); i++) {
			String codeNm = list.get(i).getComnCdNm().toLowerCase();
			s180List.add(list.get(i).getComnCdNm());
			s180Map.put(codeNm, codeNm);
		}

	}

	public List<String> getS180List() {
		return s180List;
	}

	public Map<String, Object> getS180Map() throws Exception {
//		EzMap codeSo = new EzMap();
//		codeSo.setString("codeCd", Constants._FILE_WHITE_LIST);
//		List<CrmComnCdBaseVo> list = comnCdService.getComboCode(codeSo);
//		Map<String, Object> map = new HashMap<String, Object>();
//		for (int i = 0; i < list.size(); i++) {
//			String codeNm = list.get(i).getComnCdNm().toLowerCase();
//			map.put(codeNm, codeNm);
//		}
//		return map;

		return s180Map;
	}

	public String getS180Json() {
		try {
			return Utilities.getJsonString(s180Map);
		} catch (Exception e) {
			return null;
		}
	}
}
