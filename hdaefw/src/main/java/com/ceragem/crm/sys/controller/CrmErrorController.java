package com.ceragem.crm.sys.controller;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ceragem.crm.common.model.EzAjaxException;
import com.ceragem.crm.common.model.EzException;
import com.ceragem.crm.common.model.EzLoginAjaxException;
import com.ceragem.crm.common.model.EzLoginException;
import com.ceragem.crm.common.util.Constants;
import com.ceragem.crm.common.util.SessionUtil;
import com.ceragem.crm.sys.service.CrmErrHstService;
import com.ceragem.crm.sys.service.CrmLoginService;

/**
 * <pre>
 * com.ceragem.crm.common.controller - ErrorController.java
 * </pre>
 *
 * @ClassName : ErrorController
 * @Description : 에러
 * @author : MKH
 * @date : 2021. 1. 21.
 * @Version : 1.0
 * @Company : Copyright ⓒ wigo.ai. All Right Reserved
 */

@Controller
@ControllerAdvice
@RequestMapping(value = { "/error" })
public class CrmErrorController implements ErrorController {
//	private Logger logger = LoggerFactory.getLogger(EzErrorController.class);
	private static final String ERROR_PATH = "/error";
	@Autowired
	CrmLoginService loginService;

	@Autowired
	CrmErrHstService hstService;

//	@Override
	public String getErrorPath() {
		return ERROR_PATH;
	}

	@RequestMapping(value = { "", "index" })
	public String init(HttpServletRequest request, @RequestParam Map<String, Object> param, ModelMap model) {
		return "error";
	}

	@RequestMapping(value = { "", "index" }, headers = { SessionUtil.HEADER_X_REQ_WITH })
	public @ResponseBody Object ajaxError(HttpServletRequest request, @RequestParam Map<String, Object> param,
			ModelMap model) throws Exception {
		Exception ex = (Exception) request.getAttribute("javax.servlet.error.exception");

		EzException e = new EzException(Constants._ERROR_UNKNOWN, "", ex);
		return e.toMap();

	}

	@RequestMapping(value = { "noUser" })
	public String noUser(HttpServletRequest request, @RequestParam Map<String, Object> param, ModelMap model)
			throws Exception {
		model.addAttribute("title", "권한없음");
		model.addAttribute("txt", "해당 사이트의 사용권한이 없습니다.");
		return "error";

	}

	@GetMapping(value = { "render" })
	public String render(HttpServletRequest request, @RequestParam Map<String, Object> param, ModelMap model)
			throws Exception {
		return "error";
	}

	@ExceptionHandler(DuplicateKeyException.class)
	public @ResponseBody void duplicateKeyException(DuplicateKeyException ex, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.sendError(486, "중복된 값이 존재합니다.");

	}

	@ExceptionHandler(SQLIntegrityConstraintViolationException.class)
	public @ResponseBody void keyError(SQLIntegrityConstraintViolationException ex, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (ex.getErrorCode() == 1)
			response.sendError(486, "중복된 값이 존재합니다.");
		else
			response.sendError(404);

	}

	@ExceptionHandler(EzLoginException.class)
	public String ezLoginError(EzLoginException ex, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return "checkSso";
//		loginService.goSso(response);
	}

	@ExceptionHandler(EzLoginAjaxException.class)
	public @ResponseBody Object ezAjaxError(EzLoginAjaxException ex, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setStatus(Constants._ERROR_NEED_LOGIN);
		if (request.getHeader(SessionUtil.HEADER_X_REQ_WITH) != null)
			return ex.toMap();
		else {
			request.getRequestDispatcher(getErrorPath()).forward(request, response);
			return null;
		}
	}

	@ExceptionHandler(EzAjaxException.class)
	public @ResponseBody Object ezAjaxError(EzAjaxException ex, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setStatus(487);
		hstService.addErrorLog(ex, request, response);
		if (request.getHeader(SessionUtil.HEADER_X_REQ_WITH) != null)
			return ex.toMap();
		else {
			request.getRequestDispatcher(getErrorPath()).forward(request, response);
			return null;
		}
	}

	@ExceptionHandler(EzException.class)
	public @ResponseBody Object ezError(EzException ex, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setStatus(487);
		hstService.addErrorLog(ex, request, response);
		if (request.getHeader(SessionUtil.HEADER_X_REQ_WITH) != null)
			return ex.toMap();
		else {
			request.getRequestDispatcher(getErrorPath()).forward(request, response);
			return null;
		}
	}

	@ExceptionHandler(Exception.class)
	public @ResponseBody Object error(Exception ex, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		hstService.addErrorLog(ex, request, response);
		response.setStatus(488);
		EzException e = new EzException(Constants._ERROR_UNKNOWN, "", ex);
		if (request.getHeader(SessionUtil.HEADER_X_REQ_WITH) != null)
			return e.toMap();
		else {
			request.getRequestDispatcher(getErrorPath()).forward(request, response);
			return null;
		}
	}

}
