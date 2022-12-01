package com.ceragem.crm.common.util;

/**
 *
 * <pre>
 * com.ceragem.crm.common.util - Constants.java
 * </pre>
 *
 * @ClassName : Constants
 * @Description : 상수 설정
 * @author : 김성태
 * @date : 2021. 1. 5.
 * @Version : 1.0
 * @Company : Copyright ⓒ wigo.ai. All Right Reserved
 */

public class Constants {
	public static final String _LOGIN_SESSION_NAME = "LOGIN_USER";
	public static final String _USER_MENU_LIST_NAME = "USER_MENU_LIST";
	public static final String _USER_MENU_MAP_NAME = "USER_MENU_MAP";
	public static final String _USER_SYSTEM_LIST_NAME = "USER_SYSTEM_LIST";
	public static final String _LOGIN_ID = "userCd";
	public static final String _LOGIN_STATE_KEY = "state";

	public static final int _ERROR_NEED_LOGIN = 462;
	public static final int _ERROR_HAS_NO_RIGHT = 463;
	public static final int _ERROR_BAN_LOGIN = 464;
	public static final int _ERROR_KEY_DUPLICATE = 486;
	public static final int _ERROR_USER = 487;
	public static final int _ERROR_UNKNOWN = 488;

	public static final int _PASSWORD_CHANGE_MONTH = 1;
	public static final String _META_TYPE_CATEGORY = "01000000000000000000";
	public static final String _SEQ_KEY_CD = "seqKeyCd";
	public static final String _SEQ_PK_NAME = "seqPkCol";
	public static final String _SEQ_FORMAT = "seqFormat";

	public static final String _NOTICE_BBS_ID = "NOTICE";

	public final static String _API_CODE_OK = "IAR0200";
	public final static String _API_CODE_NO_DATA = "IAR0400"; /* 조회된 데이터가 없습니다. */
	public final static String _API_DOUBLE_CHIT_NO_DATA = "IAR0500"; /* 조회된 데이터가 없습니다. */
	public final static String _API_CODE_NO_DATA_MSG = "조회된 데이터가 없습니다."; /* 조회된 데이터가 없습니다. */
	public final static String _API_DOUBLE_CHIT_NO_DATA_MSG = "중복된 전표번호 입니다."; /* 조회된 데이터가 없습니다. */

	public final static String _API_COUPN_OVER_DAY_DATA = "IAR0600"; /* 조회된 데이터가 없습니다. */
	public final static String _API_COUPN_OVER_DAY_DATA_MSG = "발행기간이 초과 되었습니다."; /* 조회된 데이터가 없습니다. */

	public final static String _API_COUPN_GRADE_DATA = "IAR0601";
	public final static String _API_COUPN_GRADE_DATA_MSG = "회원등급 불일치 합니다.";

	public final static String _API_COUPN_MAXDAY_DATA = "IAR0602";
	public final static String _API_COUPN_MAXDAY_DATA_MSG = "당일발급 최대치 초과 했습니다.";

	public final static String _API_COUPN_MAXCNT_DATA = "IAR0603";
	public final static String _API_COUPN_MAXCNT_DATA_MSG = "회원당 최대치 초과 했습니다.";

	public final static String _API_COUPN_OVER_ISSUE_DATA = "IAR0604";
	public final static String _API_COUPN_OVER_ISSUE_DATA_MSG = "일최대 발급 매수 초과 했습니다.";

	public final static String _FILE_WHITE_LIST = "S180";

	public final static String SINGLE_VIEW_COOKIE = "SINGLE_VIEW";
	public final static String SINGLE_VIEW = "/crmCustBas";
	public final static String IDENTIFIER = "&isCTC";
}
