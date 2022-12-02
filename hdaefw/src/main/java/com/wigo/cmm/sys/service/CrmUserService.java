package com.wigo.cmm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.common.util.Utilities;
import com.wigo.cmm.sys.dao.GrpUserRelDao;
import com.wigo.cmm.sys.dao.UserBaseDao;
import com.wigo.cmm.sys.dao.ICmmDao;
import com.wigo.cmm.sys.model.UserBaseVo;

@Service
public class CrmUserService extends AbstractCmmService {
	@Autowired
	UserBaseDao dao;

	@Autowired
	GrpUserRelDao grpUserDao;

	@Override
	public ICmmDao getDao() {
		return dao;
	}

	@Override
	public int insert(Object param) throws Exception {
		UserBaseVo user = (UserBaseVo) param;
		if (Utilities.isEmpty(user.getUserId())) {
			String userCd = Utilities.getAutoSeq("USR");
			user.setUserId(userCd);
		}
		if (Utilities.isEmpty(user.getLoginPwd())) {
			String pwd = user.getLoginId() + "123!@";
			user.setLoginPwd(pwd);
		} else {
			String pwd = user.getLoginPwd();
			user.setLoginPwd(pwd);
		}
		String pwd = Utilities.passwordEncode(user.getLoginPwd());
		user.setLoginPwd(pwd);
		return super.insert(param);
	}

	public Object savePassword(UserBaseVo param) throws Exception {
		param.setLoginPwd(Utilities.passwordEncode(param.getLoginPwd()));
		return Utilities.getUpdateResult(dao.updatePassword(param));
	}

	public EzMap updateMyInfo(EzMap param) throws Exception {
		return Utilities.getUpdateResult(dao.updateMyInfo(param));
	}

	public Object updatePwd(EzMap param) throws Exception {
		/* user 비밀번호 조회 */
		UserBaseVo user = dao.select(param);
		EzMap result = new EzMap();
		String checkPwd = user.getLoginPwd();
		String password = param.getString("password"); // 현재비밀번호
		String pwd = param.getString("pwd"); // 변경될 비밀번호

		/* 현재 비밀번호와 조회해온 비밀번호 비교 */
		if (!Utilities.passwordMatch(password, checkPwd)) {
			result.put("errorMsg", "현재비밀번호를 확인해주세요.");
			result.put("errorCode", "FAILED");
			return result;
		}

		/* 비밀번호 암호화 */
		user.setLoginPwd(Utilities.passwordEncode(pwd));
		return Utilities.getUpdateResult(dao.updatePassword(user));
	}

	@Override
	public int delete(Object param) throws Exception {
		grpUserDao.deleteUserCd(param);
		return super.delete(param);
	}
}
