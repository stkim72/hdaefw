package com.wigo.cmm.sys.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.common.model.EzPaginationInfo;
import com.wigo.cmm.common.util.Utilities;
import com.wigo.cmm.sys.model.ChngHstVo;
import com.wigo.cmm.sys.service.ChngHstService;

/**
 * 
* <pre>
* com.wigo.cmm.common.CrmChngHstController
*	- CrmChngHstController.java
* </pre>
*
* @ClassName	: CrmChngHstService 
* @Description	: CrmChngHstService 컨트롤러 
* @author 		: 김성태
* @date 		: 2022. 1. 8.
* @Version 		: 1.0 
* @Company 		: Copyright ⓒ wigo.ai. All Right Reserved
 */

@Controller
@RequestMapping(value = {"chngHst"})
public class ChngHstController {
	@Autowired
	ChngHstService service;

	@GetMapping(value = { "", "index" })
	public String init(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
		model.addAllAttributes(param);
		return Utilities.getProperty("tiles.cmm") + "sys/changeHistList";
	}
	
	@GetMapping(value = { "detail/{hstId}" })
	public String detail(ChngHstVo vo,@PathVariable("hstId") String hstId , @RequestParam Map<String, Object> param, ModelMap model) throws Exception {
		vo.setChngHstId(hstId);
		model.addAttribute("hist", service.get(vo));
		model.addAllAttributes(param);
		return Utilities.getProperty("tiles.cmm.blank") + "sys/changeHistDetail";
	}
	
	@PostMapping(value = { "getList" })
	public @ResponseBody Object getList(@RequestBody EzMap param) throws Exception {
		EzPaginationInfo page = param.getPaginationInfo();
		List<EzMap> list = service.getList(param);
		page.setTotalRecordCount(service.getListCount(param));
		return Utilities.getGridData(list,page);
	} 
}
