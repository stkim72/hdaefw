package com.wigo.cmm.sys.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.common.util.Constants;
import com.wigo.cmm.common.util.Utilities;
import com.wigo.cmm.sys.dao.UserWdgtDao;
import com.wigo.cmm.sys.dao.ICmmDao;
import com.wigo.cmm.sys.model.ComnCdBaseVo;

@Service
public class UserWdgtService extends AbstractCmmService {

	@Autowired
	UserWdgtDao dao;

	@Autowired
	AsyncService asyncService;

	@Autowired
	ComnCdService comnCdService;


	private List<String> s180List = null;
	private Map<String, Object> s180Map = null;
//	private String s180Data = null;

	@PostConstruct
	public void initMainData() throws Exception {
//		asyncService.initMainData();
	}

	public void initLastData() throws Exception {
		
		refreshS180();

	}

	@Override
	public ICmmDao getDao() {
		return dao;
	}

	public EzMap getData() throws Exception {
		initLastData();
		return new EzMap();
	}

//	@Scheduled(cron = "0 0 * * * *")
	public EzMap refreshData() throws Exception {
		return getData();
	}

	public void refreshS180() throws Exception {


		EzMap codeSo = new EzMap();
		codeSo.setString("codeCd", Constants._FILE_WHITE_LIST);
		List<ComnCdBaseVo> list = comnCdService.getComboCode(codeSo);
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
