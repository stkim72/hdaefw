package com.ceragem.crm.sys.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ceragem.crm.common.model.EzMap;
import com.ceragem.crm.common.util.Utilities;
import com.ceragem.crm.sys.model.CrmNtcartBasVo;
import com.ceragem.crm.sys.model.CrmUserWdgtVo;
import com.ceragem.crm.sys.service.CrmMenuService;
import com.ceragem.crm.sys.service.CrmNtcartBasService;
import com.ceragem.crm.sys.service.CrmUserWdgtService;

@Controller
@RequestMapping(value = { "" })
public class CrmMainController {
	@Autowired
	CrmMenuService menuService;
	
	@Autowired
	CrmNtcartBasService noticeService;
	
	@Autowired
	CrmUserWdgtService widgetServcie;

	@Value("${spring.bi.url}")
	String biUrl;
	
	@Value("${spring.bi.server}")
	String biServer;
	
	@Value("${spring.eon.send.url}")
	String eonUrl;
	
	@Value("${spring.eon.send.user}")
	String eonUser;

	
//	@Autowired
//	EzJwtProvider jwtProvider;
	@GetMapping(value = { "", "index" })
	public String init(HttpServletRequest request, HttpServletResponse response,
			@RequestParam Map<String, Object> param, ModelMap map) throws Exception {
//		return "intro";		
		map.addAttribute("biUrl",biUrl);
		map.addAttribute("biServer",biServer);
		map.addAttribute("eonUrl",eonUrl);
		map.addAttribute("eonUser",eonUser);
		map.addAttribute("wdgtList", menuService.getWdgtList(param));
		return "main";

	}

	@GetMapping(value = { "main" })
	public String main(HttpServletRequest request, HttpServletResponse response,
			@RequestParam Map<String, Object> param, ModelMap map) throws Exception {
//		param.put("userCd", SessionUtil.getLoginUserCd());
		map.addAttribute("biUrl",biUrl);
		map.addAttribute("biServer",biServer);
		map.addAttribute("eonUrl",eonUrl);
		map.addAttribute("eonUser",eonUser);
		map.addAttribute("wdgtList", menuService.getWdgtList(param));

		return "main";
	}

	@GetMapping(value = { "singleView" })
	public String singleView(HttpServletRequest request, HttpServletResponse response,
			@RequestParam Map<String, Object> param, ModelMap map) throws Exception {

		return Utilities.getProperty("tiles.crm") + "main/index";
	}

	@GetMapping(value = { "widget" })
	public String widget( ModelMap map) throws Exception {
		EzMap so = new EzMap();
		so.setString("dashboard", "Y");
		so.setInt("recordCountPerPage", "7");
		List<CrmNtcartBasVo> noticeList = noticeService.getList(so);
		map.addAttribute("noticeList",noticeList);
		map.addAttribute("widgetData",widgetServcie.getData());
		return "crm/blankBody/main/widget";
	}
	
	@GetMapping(value = { "widget/data" })
	public @ResponseBody Object  widgetData() throws Exception {

		return widgetServcie.getData();
	}
	@GetMapping(value = { "widget/refresh" })
	public @ResponseBody Object  refreshData() throws Exception {

		return widgetServcie.refreshData();
	}
	@PostMapping(value = { "addWdgt" })
	public @ResponseBody Object addWdgt(@RequestBody CrmUserWdgtVo vo) throws Exception {
		return menuService.insertWdgt(vo);
	}

	@PostMapping(value = { "removeWdgt" })
	public @ResponseBody Object removeWdgt(@RequestBody CrmUserWdgtVo vo) throws Exception {
		return menuService.deleteWdgt(vo);
	}

	@RequestMapping(value = { "util/sort" })
	public String sort(HttpServletRequest request, HttpServletResponse response,
			@RequestParam Map<String, Object> param, ModelMap map) throws Exception {
		return Utilities.getProperty("tiles.crm.blank") + "main/sort";
	}

	@RequestMapping(value = { "util/textDialog" })
	public String textDialog(HttpServletRequest request, HttpServletResponse response,
			@RequestParam Map<String, Object> param, ModelMap map) throws Exception {
		map.addAllAttributes(param);
		return Utilities.getProperty("tiles.crm.blank") + "main/textDialog";
	}

}
