package com.wigo.cmm.common.log;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Signature;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wigo.cmm.common.util.SessionUtil;
import com.wigo.cmm.common.util.Utilities;
import com.wigo.cmm.sys.model.LoginUserVo;
import com.wigo.cmm.sys.model.MenuBaseVo;
import com.wigo.cmm.sys.service.ChngHstService;

/**
 * <pre>
 * com.wigo.cmm.common.log - LogDaoAspect.java
 * </pre>
 *
 * @ClassName : LogDaoAspect
 * @Description : TODO
 * @author : 김성태
 * @date : 2021. 4. 23.
 * @Version : 1.0
 * @Company : Copyright ⓒ wigo.ai. All Right Reserved
 */
@Intercepts({ @Signature(type = Executor.class, method = "update", args = { MappedStatement.class, Object.class })
//, @Signature(type = Executor.class, method = "query", args = { MappedStatement.class, Object.class,  RowBounds.class, ResultHandler.class})
//, @Signature(type = Executor.class, method = "query", args = { MappedStatement.class, Object.class,  RowBounds.class, ResultHandler.class, CacheKey.class, BoundSql.class })
})
@Aspect
@Component("logDaoAspect")
public class LogDaoAspect implements Interceptor {

	@Autowired
	ChngHstService service;
	static boolean logMode = true;
	static boolean sqlMode = false;

	@Before(value = "execution(* *..*Controller.*(..))")
	public void sqlBeforeController(JoinPoint jp) {
		if (!logMode)
			return;
		ChangeLogVo hist = LogDaoLocal.get();
		if (hist.isInLogMode()) {
			addStack(jp.getStaticPart().toLongString(), jp.getArgs());
			return;
		}

		HttpServletRequest request = Utilities.getRequest();
		if (request == null)
			return;

		MenuBaseVo menu = (MenuBaseVo) request.getAttribute("currentMenu");
		if (menu == null)
			return;

		if (!"Y".equals(menu.getChngLogYn()))
			return;

		LoginUserVo user = SessionUtil.getLoginUser();
		String userId = user == null ? null : user.getLoginId();
		if (Utilities.isEmpty(userId))
			userId = "SYSTEM";
		String reqUrl = Utilities.getRequest() == null ? null : Utilities.getRequest().getRequestURI();
		hist.setInLogMode(true);
		hist.setUserId(userId);
		hist.setMenuId(menu.getMenuId());
		hist.setChngCallUrl(reqUrl);
		hist.addStack(jp.getStaticPart().toLongString(), jp.getArgs());
	}

	@AfterReturning(value = "execution(* *..*Controller.*(..))", returning = "result")
	public void sqlAfterController(JoinPoint jp, Object result) {
		ChangeLogVo hist = LogDaoLocal.get();
		if (!logMode)
			return;
		if (!hist.isInLogMode()) {
			LogDaoLocal.clear();
			return;
		}
		if (!hist.isHasChange()) {
			LogDaoLocal.clear();
			return;
		}
		hist.setResult(result);
		if (hist.getElement() != null) {
			setResult(result);
			return;
		}
		hist.makeParam();
		if (hist.isHasChange())
			addLog(hist);
		LogDaoLocal.clear();
	}

	@Before(value = "execution(* *..*Service.*(..))")
	public void sqlBeforeService(JoinPoint jp) {
		addStack(jp.getStaticPart().toLongString(), jp.getArgs());
	}

	@AfterReturning(value = "execution(* *..*Service.*(..))", returning = "result")
	public void sqlAfterService(JoinPoint jp, Object result) {
		setResult(result);
	}

	@Before(value = "execution(* *..*Dao.*(..))")
	public void sqlBeforeDao(JoinPoint jp) {
		addStack(jp.getStaticPart().toLongString(), jp.getArgs());
	}

	@AfterReturning(value = "execution(* *..*Dao.*(..))", returning = "result")
	public void sqlAfterDao(JoinPoint jp, Object result) {
		setResult(result);
	}

	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		ChangeLogVo hist = LogDaoLocal.get();
		if (!logMode)
			return invocation.proceed();
		if (!hist.isInLogMode())
			return invocation.proceed();
		try {
			Object[] args = invocation.getArgs();
			MappedStatement ms = (MappedStatement) args[0];
			String mapId = ms.getId();
			if (mapId.endsWith("HstDao.insert"))
				return invocation.proceed();
			Object parameterObject = (Object) args[1];

			BoundSql boundSql = ms.getBoundSql(parameterObject);
			String sql = Utilities.getSql(boundSql, parameterObject);
			if (Utilities.isNotEmpty(sql))
				sql = sql.replace("\\n", "\n");
//			Object[] arg = { sql };
			String id = ms.getId();
			int idx = id.lastIndexOf(".");
			String clz = id.substring(0, idx);
			String method = id.substring(idx + 1);
			hist.getElement().setParameters(sql);
			hist.getElement().setClassName(clz);
			hist.getElement().setMethodName(method);
			hist.setHasChange(true);
			if (!sqlMode) {
				hist.getElement().setParameters(null);
				return invocation.proceed();
			}
			return invocation.proceed();
		} catch (Exception e) {
			return invocation.proceed();
		}

		
	}

	private void addStack(String execution, Object[] param) {
		if (!logMode)
			return;
		ChangeLogVo hist = LogDaoLocal.get();
		if (!hist.isInLogMode())
			return;
		hist.addStack(execution, param);
	}

	private void setResult(Object result) {
		if (!logMode)
			return;
		ChangeLogVo hist = LogDaoLocal.get();
		if (!hist.isInLogMode())
			return;
		hist.setResult(result);
	}

	private void addLog(ChangeLogVo logVo) {
		try {
			service.insert(logVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
