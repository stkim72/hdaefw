package com.wigo.cmm.sys.model;

import java.util.List;
import java.util.Map;

import com.wigo.cmm.common.model.ITreeVo;
import com.wigo.cmm.common.util.Utilities;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MenuVo extends MenuBaseVo {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String menuRegAuthYn;
	private String menuReadAuthYn;
	private String menuAmdAuthYn;
	private String menuDelAuthYn;
	private String menuPath;
	private String wdgtYn;
	
	public MenuVo() {

	}

	public MenuVo(Map<String, Object> param) {
		super(param);
	}

	@Override
	public String getIcon() {
		if (!Utilities.isEmpty(getMenuIconCd()))
			return getMenuIconCd();
		if (getLevel() < 3 || getChildrenCount() > 0)
			return "far fa-folder";
		else
			return "far fa-circle";
//		switch (getLevel()) {
//		case 1:
//		case 2:
//		case 3:
//			return "far fa-folder";
//		case 4:
//			return "far fa-circle";
//		case 5:
//			return "far fa-dot-circle";
//		default:
//			return "fas fa-book";
//		}
	}

	public boolean hasLinkedMenu() {
		if (Utilities.isNotEmpty(getMenuUrl()))
			return true;
		List<ITreeVo> list = getChildren();
		for (int i = 0; list != null && i < list.size(); i++) {
			MenuVo ch = (MenuVo) list.get(i);
			if (ch.hasLinkedMenu())
				return true;
		}
		return false;
	}

}
