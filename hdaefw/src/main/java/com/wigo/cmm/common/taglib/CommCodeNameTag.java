package com.wigo.cmm.common.taglib;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.common.util.Utilities;
import com.wigo.cmm.sys.service.ComnCdService;

/**
 * 
* <pre>
* com.wigo.cmm.common.taglib
*	- CommCodeNameTag.java
* </pre>
*
* @ClassName	: CommCodeNameTag 
* @Description	: 공통코드명 태그 
* @author 		: 김성태
* @date 		: 2021. 1. 5.
* @Version 		: 1.0 
* @Company 		: Copyright ⓒ wigo.ai. All Right Reserved
 */

public class CommCodeNameTag extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6129581713388769101L;
    private String upCodeCd;
    private String codeCd;
    private String codeType;
    
	ComnCdService codeService = Utilities.getBean(ComnCdService.class);
	
	public String getUpCodeCd() {
		return upCodeCd;
	}
	public void setUpCodeCd(String upCodeCd) {
		this.upCodeCd = upCodeCd;
	}
	public String getCodeCd() {
		return codeCd;
	}
	public void setCodeCd(String codeCd) {
		this.codeCd = codeCd;
	}
	
	@Override
    public int doStartTag() throws JspException {
    	
    	EzMap param = new EzMap();
    	param.put("uprCodeCd", getUpCodeCd());
    	param.put("codeCd",getCodeCd());
    	param.put("codeType",getCodeType());
    	try {
    		String codeNm  = codeService.getComboCodeName(param);
    		if(codeNm!=null)
    			pageContext.getOut().print(codeNm);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return SKIP_BODY;
    }
	/**
	 * @return the codeType
	 */
	public String getCodeType() {
		return codeType;
	}
	/**
	 * @param codeType the codeType to set
	 */
	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}
	
	
}
