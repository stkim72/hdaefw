package com.wigo.cmm.sys.model;

import com.wigo.cmm.common.util.Utilities;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FileVo extends FileBaseVo {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String fileCtgryCd;

	public String getFileSizeText() {
		return Utilities.getSizeString(getFileSize()) + "B";
	};
}
