package com.wigo.cmm.sys.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wigo.cmm.common.util.Utilities;
import com.wigo.cmm.sys.model.UserWdgtVo;
import com.wigo.cmm.sys.service.MenuService;
import com.wigo.cmm.sys.service.NtcartBasService;
import com.wigo.cmm.sys.service.UserWdgtService;

@Controller
@RequestMapping(value = { "" })
public class MainController {
	@Autowired
	MenuService menuService;
	
	@Autowired
	NtcartBasService noticeService;
	
	@Autowired
	UserWdgtService widgetServcie;



	
//	@Autowired
//	EzJwtProvider jwtProvider;
	@GetMapping(value = { "", "index" })
	public String init(HttpServletRequest request, HttpServletResponse response,
			@RequestParam Map<String, Object> param, ModelMap map) throws Exception {
//		return "intro";		
		
		map.addAttribute("wdgtList", menuService.getWdgtList(param));
		return "main";

	}

	@GetMapping(value = { "main" })
	public String main(HttpServletRequest request, HttpServletResponse response,
			@RequestParam Map<String, Object> param, ModelMap map) throws Exception {
//		param.put("userId", SessionUtil.getLoginUserId());
		map.addAttribute("wdgtList", menuService.getWdgtList(param));

		return "main";
	}


	@GetMapping(value = { "widget" })
	public String widget( ModelMap map) throws Exception {
		
		return "cmm/blankBody/main/widget";
	}
	
	
	@PostMapping(value = { "addWdgt" })
	public @ResponseBody Object addWdgt(@RequestBody UserWdgtVo vo) throws Exception {
		return menuService.insertWdgt(vo);
	}

	@PostMapping(value = { "removeWdgt" })
	public @ResponseBody Object removeWdgt(@RequestBody UserWdgtVo vo) throws Exception {
		return menuService.deleteWdgt(vo);
	}

	@RequestMapping(value = { "util/sort" })
	public String sort(HttpServletRequest request, HttpServletResponse response,
			@RequestParam Map<String, Object> param, ModelMap map) throws Exception {
		return Utilities.getProperty("tiles.cmm.blank") + "main/sort";
	}

	@RequestMapping(value = { "util/textDialog" })
	public String textDialog(HttpServletRequest request, HttpServletResponse response,
			@RequestParam Map<String, Object> param, ModelMap map) throws Exception {
		map.addAllAttributes(param);
		return Utilities.getProperty("tiles.cmm.blank") + "main/textDialog";
	}

}
