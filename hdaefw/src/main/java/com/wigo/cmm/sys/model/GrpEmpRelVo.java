package com.wigo.cmm.sys.model;

import com.wigo.cmm.common.model.BaseVo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GrpEmpRelVo extends BaseVo  {
    /**
    *
    */
private static final long serialVersionUID = 1L;
    /**
    * <p>그룹코드</p> 
    */
    private String grpId;
    private String grpNm;
}
