package com.wigo.cmm.sys.service;

import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.ClientAbortException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.sys.dao.CrmErrHstDao;
import com.wigo.cmm.sys.dao.ICrmDao;
import com.wigo.cmm.sys.model.CrmErrHstVo;
import com.wigo.cmm.sys.model.CrmMenuBaseVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CrmErrHstService extends AbstractCrmService {
	@Autowired
	CrmErrHstDao dao;

	@Override
	public ICrmDao getDao() {
		return dao;
	}

	public void addErrorLog(Exception ex, HttpServletRequest request, HttpServletResponse response) {
		try {
			if (ex instanceof ClientAbortException) {
				return;
			}
			CrmErrHstVo vo = new CrmErrHstVo();
			CrmMenuBaseVo menu = (CrmMenuBaseVo) request.getAttribute("currentMenu");
			if (menu != null) {
				vo.setMenuCd(menu.getMenuCd());
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
