package com.wigo.cmm.sys.model;

import com.wigo.cmm.common.model.BaseVo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ErrHstVo extends BaseVo {
    /**
    *
    */
private static final long serialVersionUID = 1L;
    /**
    * <p>오류이력코드</p> 
    */
    private String errHstId;
    /**
    * <p>메뉴코드</p> 
    */
    private String menuId;
    /**
    * <p>메뉴URL</p> 
    */
    private String menuUrl;
    /**
    * <p>오류코드</p> 
    */
    private String errCd;
    /**
    * <p>오류메시지내역</p> 
    */
    private String errMsgTxn;
    
    private String menuNm;
    
    private String menuPath;
}
