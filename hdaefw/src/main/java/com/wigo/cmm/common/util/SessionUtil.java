package com.wigo.cmm.common.util;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.common.model.ITreeVo;
import com.wigo.cmm.sys.model.LoginUserVo;

/**
 * 
* <pre>
* com.wigo.cmm.common.util
*	- SessionUtil.java
* </pre>
*
* @ClassName	: SessionUtil 
* @Description	: 세션유틸리티
* @author 		: 김성태
* @date 		: 2021. 1. 5.
* @Version 		: 1.0 
* @Company 		: Copyright ⓒ wigo.ai. All Right Reserved
 */

public class SessionUtil {
	public static final String		HEADER_X_REQ_WITH		= "x-requested-with";

	public static void logOut() {
		HttpSession session = Utilities.getSession();
		if(session == null)
			return;
		session.removeAttribute(Constants._USER_MENU_LIST_NAME);
		session.removeAttribute(Constants._USER_MENU_MAP_NAME);
		session.removeAttribute(Constants._LOGIN_SESSION_NAME);
		session.removeAttribute("userId");
	}
	public static void setLoginUser(LoginUserVo user) {
		HttpSession session = Utilities.getSession();
		if(session == null)
			return ;
		session.removeAttribute(Constants._USER_MENU_LIST_NAME);
		session.removeAttribute(Constants._USER_MENU_MAP_NAME);
		session.setAttribute(Constants._LOGIN_SESSION_NAME,user);
	}
	public static LoginUserVo getLoginUser() {
		HttpSession session = Utilities.getSession();
		if(session == null)
			return null;
		return (LoginUserVo)session.getAttribute(Constants._LOGIN_SESSION_NAME);
	}
	public static String getLoginUserId() {
		HttpSession session = Utilities.getSession();
		if(session == null)
			return null;
		LoginUserVo user =  (LoginUserVo)session.getAttribute(Constants._LOGIN_SESSION_NAME);
		if(user == null)
			return null;
		return (String)user.getUserId();
	}
	public static  boolean isAjaxRequest() {
		return isAjaxRequest(Utilities.getRequest());
	}
	public static  boolean isAjaxRequest(HttpServletRequest request) {
		if(request == null)
			return false;
		return "XMLHttpRequest".equals(request.getHeader(HEADER_X_REQ_WITH));
	}
	/** 
	* @Title		: getUserMenu 
	* @Description	: 세션에서  사용자 메뉴를 가져옵니다.
	* @param @return
	* @return List<ITreeVo>
	*/
	
	@SuppressWarnings("unchecked")
	public static List<ITreeVo> getUserMenuList() {
		HttpSession session = Utilities.getSession();
		if(session == null)
			return null;
		List<ITreeVo> tree =  (List<ITreeVo>)session.getAttribute(Constants._USER_MENU_LIST_NAME);
		return tree;
	}
	
	public static void setUserMenuList(List<ITreeVo> tree) {
		HttpSession session = Utilities.getSession();
		if(session == null)
			return ;
		if(tree == null)
			session.removeAttribute(Constants._USER_MENU_LIST_NAME);
		else
			session.setAttribute(Constants._USER_MENU_LIST_NAME, tree);
	}
	
	public static EzMap getUserMenuMap() {
		HttpSession session = Utilities.getSession();
		if(session == null)
			return null;
		EzMap map =  (EzMap)session.getAttribute(Constants._USER_MENU_MAP_NAME);
		return map;
	}
	
	public static void setUserMenuMap(EzMap map) {
		HttpSession session = Utilities.getSession();
		if(session == null)
			return ;
		if(map == null)
			session.removeAttribute(Constants._USER_MENU_MAP_NAME);
		else
			session.setAttribute(Constants._USER_MENU_MAP_NAME, map);
	}
	public static boolean isLogin() {
		return Utilities.isNotEmpty(getLoginUserId());
	}
	
	
}
