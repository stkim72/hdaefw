package com.wigo.cmm.sys.service;

import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.ClientAbortException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.sys.dao.ErrHstDao;
import com.wigo.cmm.sys.dao.ICmmDao;
import com.wigo.cmm.sys.model.ErrHstVo;
import com.wigo.cmm.sys.model.MenuBaseVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CrmErrHstService extends AbstractCmmService {
	@Autowired
	ErrHstDao dao;

	@Override
	public ICmmDao getDao() {
		return dao;
	}

	public void addErrorLog(Exception ex, HttpServletRequest request, HttpServletResponse response) {
		try {
			if (ex instanceof ClientAbortException) {
				return;
			}
			ErrHstVo vo = new ErrHstVo();
			MenuBaseVo menu = (MenuBaseVo) request.getAttribute("currentMenu");
			if (menu != null) {
				vo.setMenuId(menu.getMenuId());
			}

//			ex.getMessage();
			String nm = ex.getClass().getSimpleName();
			nm = nm.substring(0, nm.length() - "Exception".length());
			StringWriter sw = new StringWriter();
			ex.printStackTrace(new PrintWriter(sw));
			String errorStr = sw.toString();// .substring(0,500);
			if (nm.length() > 20)
				nm = nm.substring(0, 20);
			vo.setErrCd(nm);
			vo.setErrMsgTxn(errorStr);
			vo.setMenuUrl(request.getRequestURI());
			if ("/actuator/health".equalsIgnoreCase(vo.getMenuUrl()))
				return;
			if ("/error".equalsIgnoreCase(vo.getMenuUrl()))
				return;
			dao.insert(vo);
		} catch (Exception e) {
			log.debug(e.getMessage());
		}
	}
}
