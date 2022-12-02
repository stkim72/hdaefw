package com.wigo.cmm.sys.controller;

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
import com.wigo.cmm.common.util.Utilities;
import com.wigo.cmm.sys.service.CrmGenGridService;

@Controller
@RequestMapping(value = { "genGrid","{menuCd}/genGrid" })
public class CrmGenGridController {
	@Autowired
	CrmGenGridService service;
	
	@GetMapping(value = { "" })
	public  Object index(@RequestParam Map<String, Object> param, ModelMap model) throws Exception{
		model.addAllAttributes(param);
		return Utilities.getProperty("tiles.crm") + "sys/genGrid";
	}
	
	@GetMapping(value = { "text" })
	public  Object text(@RequestParam Map<String, Object> param, ModelMap model) throws Exception{
		model.addAllAttributes(param);
		return Utilities.getProperty("tiles.crm.blank") + "sys/genGridPop";
	}
	
	@PostMapping(value = { "selectColInfo" })
	public @ResponseBody Object colInfo(@RequestBody EzMap param) throws Exception {
		return service.getList(param);
	} 
	
	@PostMapping(value = { "getCodeList" })
	public @ResponseBody Object getCodeList(@RequestBody EzMap param) throws Exception {
		return service.getCodeList(param);
	}
	
}
