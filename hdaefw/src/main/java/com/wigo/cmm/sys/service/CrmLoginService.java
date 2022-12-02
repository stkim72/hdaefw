package com.wigo.cmm.sys.service;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.common.util.Constants;
import com.wigo.cmm.common.util.SessionUtil;
import com.wigo.cmm.common.util.Utilities;
import com.wigo.cmm.sys.dao.UserBaseDao;
import com.wigo.cmm.sys.dao.ICmmDao;
import com.wigo.cmm.sys.model.CrmGrpBaseVo;
import com.wigo.cmm.sys.model.CrmLoginUserVo;

@Service("loginService")
public class CrmLoginService extends AbstractCrmService {
	@Autowired
	UserBaseDao dao;
	@Autowired
	CrmLoginService service;
	@Value("${spring.sso.auth-url}")
	String authUrl;

	@Value("${spring.sso.logout-url}")
	String logoutUrl = "/";

	@Value("${spring.sso.profile-url}")
	String profileUrl;

	@Value("${spring.sso.token-url}")
	String accessTokenUrl;

	@Value("${spring.sso.callback-url}")
	String callbackUrl;

	@Value("${spring.sso.client-id}")
	String clientId;

	@Value("${spring.sso.client-secret}")
	String clientSecret;

	@Value("${spring.sso.mode}")
	boolean ssoMode = false;

	@Value("${spring.profiles.active}")
	String activeProfile;

	@Override
	public ICmmDao getDao() {
		return dao;
	}

	public EzMap updatelogin(CrmLoginUserVo param) throws Exception {
//		boolean isDevMode = !"prod".equalsIgnoreCase(activeProfile);
		EzMap result = new EzMap();
		CrmLoginUserVo user = dao.selectUser(param);
//		isDevMode =false;

		if (user != null && Utilities.isEmpty(user.getGrpCds())) {
			result.put("errorMsg", "사용권한이 없는 사용자 입니다");
			result.put("errorCode", "FAILED LOGIN");
			return result;
		}
		if (Utilities.isNotEmpty(param.getLoginPwd())) {
			if (user == null) {
				result.put("errorMsg", "사용자 아이디 또는 암호를 확인해 주세요");
				result.put("errorCode", "FAILED LOGIN");
				return result;
			}
			if (Utilities.isEmpty(user.getLoginPwd())) {
				result.put("errorMsg", "SSO로그인만 가능한 사용자입니다.");
				result.put("errorCode", "FAILED LOGIN");
				return result;
			}
			if (!Utilities.passwordMatch(param.getLoginPwd(), user.getLoginPwd())) {
				result.put("errorMsg", "사용자 아이디 또는 암호를 확인해 주세요");
				result.put("errorCode", "FAILED LOGIN");
				return result;
			}
		}
		if (user == null) {

			result.put("errorMsg", "사용자 아이디 또는 암호를 확인해 주세요");
			result.put("errorCode", "FAILED LOGIN");
			return result;

		}

		if (Utilities.isEmpty(user.getMobileNo())) {
			String ph = user.getMphonNoEncVal();
			if (Utilities.isNotEmpty(ph)) {
				String phone = Utilities.decrypt(ph);
				user.setMobileNo(phone);
			}
		}

		result.put("success", true);
		processLogin(user);
		return result;
	}

	public Object updatelogout() throws Exception {
		EzMap result = new EzMap();
		result.put("success", true);
		if (ssoMode)
			result.put("url", logoutUrl);
		else
			result.put("url", "/");
		processLogout();
		return result;
	}

	/**
	 * 사용자의 Login 이력을 갱신하고, Session 에 사용자 정보를 저장한다.
	 *
	 * @param user
	 * @throws Exception
	 */
	private void processLogin(CrmLoginUserVo user) throws Exception {
		List<CrmGrpBaseVo> list = dao.selectUserGroupList(user);
		user.setGroupList(list);
		SessionUtil.setLoginUser(user);
		setLoginHist(user);
	}

	public void setLoginHist(CrmLoginUserVo user) throws Exception {
		dao.updateLogin(user);
		dao.insertLoginHist(user);
	};

	private void processLogout() throws Exception {
		SessionUtil.logOut();
//		response.sendRedirect(logoutUrl);

	}

	private String getCallbackUrl() {
//		HttpServletRequest req = Utilities.getRequest();
//		String url = req.getRequestURL().toString();
//		int idx = url.indexOf("://") + 3;
//
//		String protocol = url.substring(0, idx);
//		StringBuffer bf = new StringBuffer();
//		bf.append(protocol);
//		bf.append(req.getServerName());
//
//		if (req.getServerPort() != 80) {
//			bf.append(":");
//			bf.append(req.getServerPort());
//		}
//		bf.append(callbackUrl);
//		return bf.toString();
		return callbackUrl;

	}

	public String goSso(HttpServletResponse res) throws IOException {
		if (ssoMode) {
			String ch = "CRM";
			if (Utilities.isNotEmpty(Utilities.getRequest())) {
				ch = Utilities.getRequest().getParameter("channel");
				if (Utilities.isEmpty(ch))
					ch = "CRM";
				ch = ch.toUpperCase();
			}

			String state = ch + "_" + Utilities.getUniqNumberID(50 - ch.length() - 1);
			HttpSession session = Utilities.getSession();
			session.setAttribute(Constants._LOGIN_STATE_KEY, state);
			String url = authUrl + "?response_type=code&client_id=" + clientId + "&redirect_uri="
					+ URLEncoder.encode(getCallbackUrl(), "UTF-8") + "&state=" + state;
			res.sendRedirect(url);
			return null;
		}

		return "login";
	}

	public void processSso(Map<String, Object> param, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		boolean isDevMode = "local".equalsIgnoreCase(activeProfile);
		String returl = isDevMode ? "/login/loginForm" : "/error/noUser";
//
		String code = (String) param.get("code");
		if (Utilities.isEmpty(code)) {
//			request.getRequestDispatcher(returl).forward(request, response);
			response.sendRedirect(returl);
			return;
		}

		String state = (String) param.get("state");
		String aUrl = accessTokenUrl;
		String aParam = "grant_type=authorization_code&client_id=" + clientId + "&client_secret=" + clientSecret
				+ "&code=" + code + "&state=" + state;
		String json = Utilities.wget(aUrl, aParam, null);
		if (Utilities.isEmpty(json)) {
//			request.getRequestDispatcher(returl).forward(request, response);
			response.sendRedirect(returl);
			return;
		}
		Map<String, Object> map = Utilities.getJson(json);
		if (map == null) {
//			request.getRequestDispatcher(returl).forward(request, response);
			response.sendRedirect(returl);
			return;
		}
		String token = (String) map.get("access_token");
		if (Utilities.isEmpty(token)) {
//			request.getRequestDispatcher(returl).forward(request, response);
			response.sendRedirect(returl);
			return;
		}
//		token = URLDecoder.decode(token, "UTF-8");
		String pm = "client_id=" + clientId + "&client_secret=" + clientSecret + "&access_token="
				+ URLEncoder.encode(token, "UTF-8");
		String profile = Utilities.wget(profileUrl, pm);
		if (Utilities.isEmpty(profile)) {
//			request.getRequestDispatcher(returl).forward(request, response);
			response.sendRedirect(returl);
			return;
		}
		Map<String, Object> pf = Utilities.getJson(profile);
		if (pf == null) {
//			request.getRequestDispatcher(returl).forward(request, response);
			response.sendRedirect(returl);
			return;
		}

		String loginId = (String) pf.get("login_id");
		if (Utilities.isEmpty(loginId)) {
//			request.getRequestDispatcher(returl).forward(request, response);
			response.sendRedirect(returl);
			return;
		}

		CrmLoginUserVo usr = new CrmLoginUserVo();
		usr.setLoginId(loginId);
		EzMap res = updatelogin(usr);

		// SSO 후 상담의 single view인 경우 interceptor에서 처리한 cookie 값을 참조하여 url을 처리한다.
		if (res.getBoolean("success")) {
			returl = "/";
			final Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals(Constants.SINGLE_VIEW_COOKIE)
							&& StringUtils.isNotBlank(cookie.getValue())) {
						returl = cookie.getValue();
					}
				}
			}
			response.sendRedirect(returl);
		} else {
//			usr.setUserNm(loginId);
//			usr.setUserCd(loginId);
//			usr.setUserNm(loginId);
//			SessionUtil.setLoginUser(usr);
//			request.getRequestDispatcher("/").forward(request, response);
//			request.getRequestDispatcher(returl).forward(request, response);
			if (isDevMode)
				returl = "/login/loginForm";
			response.sendRedirect(returl);
		}
	}

}
