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
import com.wigo.cmm.sys.model.UserBaseVo;
import com.wigo.cmm.sys.service.UserService;

/**
 * 
* <pre>
* com.wigo.cmm.common.CrmMenuController
*	- CrmMenuController.java
* </pre>
*
* @ClassName	: CrmMenuController 
* @Description	: CrmMenuController 컨트롤러 
* @author 		: 김성태
* @date 		: 2022. 1. 8.
* @Version 		: 1.0 
* @Company 		: Copyright ⓒ wigo.ai. All Right Reserved
 */

@Controller
@RequestMapping(value = {"user","{menuId}/user"})
public class UserController {
	@Autowired
	UserService userService;

	@GetMapping(value = { "", "index" })
	public String init(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
		model.addAllAttributes(param);
		return Utilities.getProperty("tiles.cmm") + "sys/userList";
	}
	@GetMapping(value = { "userPopup" })
	public String userPopup(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
		model.addAllAttributes(param);
		return Utilities.getProperty("tiles.cmm.blank") + "sys/userPop";
	}
	
	
	@GetMapping(value = { "add" })
	public String add(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
		model.addAllAttributes(param);
		return Utilities.getProperty("tiles.cmm.blank") + "sys/userAdd";
	}
	
	@PostMapping(value = { "reset" })
	public String resetPopup(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
		model.addAllAttributes(param);
		return Utilities.getProperty("tiles.cmm.blank") + "sys/userReset";
	}
	
	@PostMapping(value = { "getList" })
	public @ResponseBody Object getList(@RequestBody EzMap param) throws Exception {
		EzPaginationInfo page = param.getPaginationInfo();
		List<EzMap> list = userService.getList(param);
		page.setTotalRecordCount(userService.getListCount(param));
		return Utilities.getGridData(list,page);
	} 
	@PostMapping(value = { "getUser" })
	public @ResponseBody Object getUser(@RequestBody UserBaseVo param) throws Exception {
		UserBaseVo user = userService.get(param);
		return user;
	} 
	@PostMapping(value = { "addUser" })
	public @ResponseBody Object addUser(@RequestBody UserBaseVo param) throws Exception {
		param.setStat("c");
		return userService.save(param);
	}
	@PostMapping(value = { "editUser" })
	public @ResponseBody Object editUser(@RequestBody UserBaseVo param) throws Exception {
		param.setStat("u");
		return userService.save(param);
	}
	@PostMapping(value = { "removeUserList" })
	public @ResponseBody Object removeUserList(@RequestBody List<UserBaseVo> param) throws Exception {
		return userService.deleteList(param);
	}
	@PostMapping(value = { "removeUser" })
	public @ResponseBody Object removeUser(@RequestBody UserBaseVo param) throws Exception {
		return userService.delete(param);
	}
	@PostMapping(value = { "saveUser" })
	public @ResponseBody Object saveUser(@RequestBody UserBaseVo param) throws Exception {
		return userService.save(param);
	}
	@PostMapping(value = { "save" })
	public @ResponseBody Object save(@RequestBody List<UserBaseVo> param) throws Exception {
		return userService.saveList(param);
	}
	@PostMapping(value = { "resetPassword" })
	public @ResponseBody Object resetPassword(@RequestBody UserBaseVo param) throws Exception {
		return userService.savePassword(param);
	}
	
}
