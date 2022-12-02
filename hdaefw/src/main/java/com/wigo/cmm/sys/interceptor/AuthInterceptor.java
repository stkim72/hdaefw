package com.wigo.cmm.sys.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import com.wigo.cmm.common.model.EzLoginAjaxException;
import com.wigo.cmm.common.model.EzLoginException;
import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.common.util.Constants;
import com.wigo.cmm.common.util.HandlerUtils;
import com.wigo.cmm.common.util.SessionUtil;
import com.wigo.cmm.common.util.Utilities;
import com.wigo.cmm.sys.controller.MainController;
import com.wigo.cmm.sys.model.CrmLoginUserVo;
import com.wigo.cmm.sys.service.CrmLoginService;

import lombok.extern.slf4j.Slf4j;

/**
 *
 * <pre>
 * com.wigo.cmm.interceptor - AuthInterceptor.java
 * </pre>
 *
 * @ClassName : AuthInterceptor
 * @Description : 권한 인터셉터
 * @author : 김성태
 * @date : 2021. 1. 5.
 * @Version : 1.0
 * @Company : Copyright ⓒ wigo.ai. All Right Reserved
 */

// public class AuthCheckInterceptor extends HandlerInterceptorAdapter {
@Slf4j
@Component("authInterceptor")
public class AuthInterceptor implements HandlerInterceptor {

	@Autowired
	CrmLoginService loginService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (!(handler instanceof HandlerMethod))
			return true;
		if (HandlerUtils.isInstance(handler, ErrorController.class))
			return true;

		String targetURI = request.getServletPath();

		if (log.isDebugEnabled()) {
			StringBuilder sb = new StringBuilder();

			// request 정보
			sb.append("\n[preHandle] <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
			sb.append("\n#remoteIp   : ").append(request.getRemoteAddr());
			sb.append("\n#targetURI  : ").append(targetURI);
			sb.append("\n#reqUrl     : ").append(request.getRequestURL().toString());
			sb.append("\n#userAgent  : ").append(request.getHeader("User-Agent"));
			sb.append("\n<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
			log.debug(sb.toString());
		}

		// if ( HandlerUtils.isInstance( handler, ErrorController.class ) ) return true;
		// if ( HandlerUtils.isInstance( handler, LoginController.class ) ) return true;
		CrmLoginUserVo user = Utilities.getLoginUser();
		boolean isLogin = user != null && SessionUtil.isLogin();

		// SSO(naver) 후 상담시스템에서 호출하는 single view 처리(main으로 redirect 되는 것 방지)를 위한 쿠키
		String queryString = request.getQueryString();
		if (queryString != null && Constants.SINGLE_VIEW.equals(request.getRequestURI())
				&& queryString.contains(Constants.IDENTIFIER)) {
			Cookie cookie = new Cookie(Constants.SINGLE_VIEW_COOKIE, request.getRequestURI() + "?" + queryString);
			cookie.setMaxAge(60 * 60 * 9);
			cookie.setPath("/");
			response.addCookie(cookie);
		}

		if (!isLogin) {
			if (SessionUtil.isAjaxRequest()) {
				throw new EzLoginAjaxException("need login");
//				response.sendError(Constants._ERROR_NEED_LOGIN, "need login");
			} else {
//				String url = "/login/"; // + Utilities.nullCheck(request.getAttribute("urlSuffix")) ;
//				request.getRequestDispatcher(url).forward(request, response);
				throw new EzLoginException();
			}
		} else {
			if (Utilities.isEmpty(user.getGrpCds())) {
				response.sendError(Constants._ERROR_HAS_NO_RIGHT, "권한이 없습니다.");
			}
			if (HandlerUtils.isInstance(handler, MainController.class))
				return true;

			String menuCd = (String) request.getAttribute("currentMenuCd");
			EzMap menuMap = (EzMap) request.getAttribute("menuMap");
			if (menuMap.containsKey(menuCd)) {
				return true;
			} else {
				response.sendError(Constants._ERROR_HAS_NO_RIGHT, "권한이 없습니다.");
			}
		}

		return true;
	}
}
