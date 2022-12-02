package com.wigo.cmm.sys.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.common.model.EzPaginationInfo;
import com.wigo.cmm.common.util.Utilities;
import com.wigo.cmm.sys.model.CrmComnCdBaseVo;
import com.wigo.cmm.sys.service.CrmComnCdService;

/**
 * 
 * <pre>
 * com.wigo.cmm.common.ExampleController - ExampleController.java
 * </pre>
 *
 * @ClassName : ExampleController
 * @Description : CrmComnCdController 컨트롤러
 * @author : 김성태
 * @date : 2022. 1. 8.
 * @Version : 1.0
 * @Company : Copyright ⓒ wigo.ai. All Right Reserved
 */
//@Slf4j
@Controller
@RequestMapping(value = { "code", "{menuCd}/code" })
public class CrmComnCdBaseController {
	@Autowired
	CrmComnCdService service;


	@GetMapping(value = { "", "index" })
	public String init(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
//		log.debug(bosService.getCustomerList("AM001").toString());
		model.addAllAttributes(param);
		return Utilities.getProperty("tiles.crm.type3") + "sys/codeList";
	}

	@PostMapping(value = { "getList" })
	public @ResponseBody Object getList(@RequestBody EzMap param) throws Exception {
//		EzMap param = new EzMap(rparam);
		EzPaginationInfo page = param.getPaginationInfo();
		List<EzMap> list = service.getList(param);
		page.setTotalRecordCount(service.getListCount(param));
		return Utilities.getGridData(list, page);
	}

	@PostMapping(value = { "getExcelList" })
	public @ResponseBody Object getExcelList(@RequestBody EzMap param) throws Exception {
//		EzMap param = new EzMap(rparam);
		List<EzMap> list = service.getExcelList(param);
		return list;
	}

	@GetMapping(value = { "get" })
	public @ResponseBody Object get(@RequestParam Map<String, Object> rparam) throws Exception {
		EzMap param = new EzMap(rparam);
		return service.get(param);
	}

	@PostMapping(value = { "save" })
	public @ResponseBody Object save(@RequestBody CrmComnCdBaseVo vo) throws Exception {
		return service.save(vo);
	}

	@PostMapping(value = { "saveList" })
	public @ResponseBody Object saveList(@RequestBody List<CrmComnCdBaseVo> list) throws Exception {
		return service.saveList(list);
	}

	@PostMapping(value = { "deleteList" })
	public @ResponseBody Object deleteList(@RequestBody List<CrmComnCdBaseVo> list) throws Exception {
		return service.deleteList(list);
	}

	@PostMapping(value = { "saveSeq" })
	public @ResponseBody Object saveSeq(@RequestBody List<CrmComnCdBaseVo> list) throws Exception {
		return service.updateSeqList(list);
	}

}
