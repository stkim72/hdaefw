package com.wigo.cmm.sys.interceptor;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.StandardMultipartHttpServletRequest;
import org.springframework.web.servlet.HandlerInterceptor;

import com.wigo.cmm.common.model.EzException;
import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.common.model.EzPropertyServiceImpl;
import com.wigo.cmm.common.model.ITreeVo;
import com.wigo.cmm.common.util.HandlerUtils;
import com.wigo.cmm.common.util.NasUtil;
import com.wigo.cmm.common.util.SessionUtil;
import com.wigo.cmm.common.util.Utilities;
import com.wigo.cmm.sys.controller.MainController;
import com.wigo.cmm.sys.model.MenuBaseVo;
import com.wigo.cmm.sys.model.MenuVo;
import com.wigo.cmm.sys.service.MenuService;
import com.wigo.cmm.sys.service.UserWdgtService;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * <pre>
 * com.wigo.cmm.interceptor - MenuInterceptor.java
 * </pre>
 *
 * @ClassName : MenuInterceptor
 * @Description : 메뉴 인터셉터
 * @author : 김성태
 * @date : 2021. 1. 5.
 * @Version : 1.0
 * @Company : Copyright ⓒ wigo.ai. All Right Reserved
 */
@Slf4j
@Component("menuInterceptor")
public class MenuInterceptor implements HandlerInterceptor {

//	private Logger logger = LoggerFactory.getLogger(MenuInterceptor.class);

	@Autowired
	MenuService menuService;

	@Resource(name = "propertiesService")
	EzPropertyServiceImpl propertiesService;
	@Autowired
	NasUtil s3Util;

	@Autowired
	UserWdgtService mainService;

	private String setMenuCd(HttpServletRequest request) throws Exception {

		if (request == null)
			return null;

		String urlSuffix = propertiesService.getString("urlSuffix", "");
		String cPath = request.getContextPath();

		if ("/".equals(cPath))
			cPath = "";

		String menuUrl = null;
		String errorUrl = (String) request.getAttribute("javax.servlet.error.request_uri");
		String rurl = Utilities.isEmpty(errorUrl) ? request.getRequestURI() : errorUrl;
		String sPath = Utilities.isEmpty(errorUrl) ? request.getServletPath() : errorUrl.substring(cPath.length());

		if (Utilities.isNotEmpty(urlSuffix)) {
			if (sPath.indexOf(urlSuffix) > 0)
				sPath = sPath.substring(0, sPath.length() - urlSuffix.length());
			if (rurl.indexOf(urlSuffix) > 0)
				rurl = rurl.substring(0, rurl.length() - urlSuffix.length());
		}

		if ("/".equals(sPath))
			sPath = "";

		if (sPath.startsWith("/"))
			sPath = sPath.substring(1);
		int idx = sPath.indexOf("/");
		if (idx > -1) {
			menuUrl = sPath.substring(0, idx);
		} else
			menuUrl = sPath;

		EzMap so = new EzMap();
		String topMenuCd = "0100000000";
		so.put("topMenuCd", topMenuCd);
		so.put("userCd", SessionUtil.getLoginUserCd());

		EzMap menuMap = new EzMap();
		List<ITreeVo> menuTree = menuService.getUserMenuTree(so, menuMap);

		EzMap urlMap = new EzMap();
		for (String key : menuMap.keySet()) {
			MenuVo menu = (MenuVo) menuMap.get(key);
			String url = menu.getMenuUrl();
			if (Utilities.isNotEmpty(url))
				urlMap.put(url, menu);
		}

		MenuBaseVo currentMenu = (MenuBaseVo) urlMap.get(menuUrl);
		String menuCd = currentMenu == null ? menuUrl : currentMenu.getMenuUrl();
		request.setAttribute("currentMenuCd", menuUrl);
		request.setAttribute("menuMap", urlMap);

		if (menuTree != null && menuTree.size() > 0) {
			request.setAttribute("menuTree", menuTree.get(0));
			MenuVo menu = (MenuVo) urlMap.get(menuCd);

			request.setAttribute("currentMenu", currentMenu);

			ITreeVo topMenu = menu;
			while (topMenu != null) {
				request.setAttribute("level" + topMenu.getLevel() + "Menu", topMenu);
				if (topMenu.getLevel() == 2) {
					request.setAttribute("level" + topMenu.parent().getLevel() + "Menu", topMenu.parent());
					break;
				}
				topMenu = topMenu.parent();
			}
			// topMenu = (ITreeVo) menuMap.get("0102000000");
			request.setAttribute("topMenu", topMenu);

		}
		String urlPrefix = "";// root.getString("menuUrl");
//		if(!urlPrefix.startsWith("/") && urlPrefix.length()>0)
//			urlPrefix = "/" + urlPrefix;
		if (Utilities.isNotEmpty(menuUrl))
			urlPrefix += "/" + menuUrl;
		else
			urlPrefix = "";
		request.setAttribute("currentSystemId", topMenuCd);
//		request.setAttribute("currentRootUrl",root.getString("menuUrl"));

		request.setAttribute("currentMenu", currentMenu);
		request.setAttribute("loginUserCd", SessionUtil.getLoginUserCd());
		request.setAttribute("urlSuffix", urlSuffix);
		request.setAttribute("urlPrefix", urlPrefix);
		request.setAttribute("systemId", topMenuCd);
		request.setAttribute("contextPath", cPath);
		request.setAttribute("peerIpAddr", Utilities.getPeerIp());
		String uniqId = Utilities.getUniqID(20);

		request.setAttribute("requestTicket", uniqId);
		return menuCd;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		try {
			if (request instanceof StandardMultipartHttpServletRequest) {
				Map<String, Object> whiteList = mainService.getS180Map();
				StandardMultipartHttpServletRequest mreq = (StandardMultipartHttpServletRequest) request;
				Map<String, MultipartFile> files = mreq.getFileMap();
				for (Map.Entry<String, MultipartFile> elem : files.entrySet()) {
					MultipartFile file = elem.getValue();
					String fileName = file.getOriginalFilename();
					String ext = Utilities.getFileExtension(fileName).toLowerCase();
					if (!whiteList.containsKey(ext)) {
						throw new EzException("[" + fileName + "]업로드가 제한된 파일 형식입니다.");
					}
				}

			}
			request.setAttribute("s180", mainService.getS180Json());
			String urlSuffix = propertiesService.getString("urlSuffix", "");
			request.setAttribute("urlSuffix", urlSuffix);
			if (!(handler instanceof HandlerMethod))
				return true;
			if (HandlerUtils.isInstance(handler, ErrorController.class))
				return true;
			request.setAttribute("httpServletResponse", response);

			if (HandlerUtils.isInstance(handler, MainController.class) && (!SessionUtil.isAjaxRequest()
					&& (request.getRequestURI().equals("/") || request.getRequestURI().equals("")))) {
				SessionUtil.setUserMenuMap(null);
				SessionUtil.setUserMenuList(null);

			}

			setMenuCd(request);
			if (SessionUtil.isAjaxRequest())
				return true;
			return true;
		} finally {
			log.debug("MenuInterceptor preHandle");
		}
	}

}
