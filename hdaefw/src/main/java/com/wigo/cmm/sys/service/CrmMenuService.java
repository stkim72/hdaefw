package com.wigo.cmm.sys.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.common.model.AbstractTreeVo;
import com.wigo.cmm.common.model.EzAjaxException;
import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.common.model.ITreeVo;
import com.wigo.cmm.common.util.SessionUtil;
import com.wigo.cmm.common.util.Utilities;
import com.wigo.cmm.sys.dao.GrpMenuRelDao;
import com.wigo.cmm.sys.dao.MenuBaseDao;
import com.wigo.cmm.sys.dao.UserWdgtDao;
import com.wigo.cmm.sys.dao.ICmmDao;
import com.wigo.cmm.sys.model.CrmMenuVo;
import com.wigo.cmm.sys.model.CrmUserWdgtVo;

@Service("menuService")
public class CrmMenuService extends AbstractCrmService {
	@Autowired
	MenuBaseDao dao;

	@Autowired
	GrpMenuRelDao grpMenuDao;

	@Autowired
	UserWdgtDao wdgtDao;

	@Override
	public ICmmDao getDao() {
		return dao;
	}

	@Override
	public int delete(Object param) throws Exception {
		int cnt = dao.selectChildrenCount(param);
		if (cnt > 0)
			throw new EzAjaxException("하부메뉴가 존재합니다.");
		grpMenuDao.deleteMenuCd(param);
		wdgtDao.deleteMenuCd(param);
		return super.delete(param);
	}

	public CrmMenuVo getNewMenu(CrmMenuVo param) throws Exception {

		String parentCd = param.getPrntsMenuCd();
		CrmMenuVo parent = null;
		CrmMenuVo maxInfo = null;
		if (Utilities.isNotEmpty(parentCd)) {
			EzMap so = new EzMap();
			so.setString("menuCd", parentCd);
			parent = get(so);
			maxInfo = dao.selectMaxInfo(so);
		} else {
			EzMap so = new EzMap();
			so.setString("menuCd", "0000000000");
			maxInfo = dao.selectMaxInfo(so);
		}
		if (maxInfo == null)
			maxInfo = new CrmMenuVo();
		String menuCd = maxInfo.getMenuCd();
		int seq = maxInfo.getMenuOdrg() + 1;
		if (Utilities.isEmpty(menuCd)) {
			if (parent == null)
				menuCd = "0000000000";
			else
				menuCd = parent.getMenuCd();
		}
		if (parent == null) {
			parent = new CrmMenuVo();

		}
		int parentLevel = parent.getMenuLvlNo();
		int offset = parentLevel * 2;
//		int menuSeq = Utilities.parseInt(menuCd.substring(offset, offset + 2)) + 1;
		menuCd = menuCd.substring(0, offset) + Utilities.padLeft(seq + "", 2, '0') + menuCd.substring(offset + 2);
		CrmMenuVo menu = new CrmMenuVo();
		menu.setMenuCd(menuCd);
		menu.setMenuLvlNo(parentLevel + 1);
		menu.setMenuOdrg(seq);

		if (parentLevel == 0)
			menu.setTopMenuCd(menuCd);
		else {
			menu.setTopMenuCd(parent.getTopMenuCd());
			menu.setPrntsMenuCd(parent.getMenuCd());
		}
		menu.setUseYn("Y");
		return menu;
	}

	/**
	 * 사용자 메뉴 가져오기
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<ITreeVo> getUserMenuTree(Object param) throws Exception {
		EzMap itemMap = new EzMap();
		return getUserMenuTree(param, itemMap);

	}

	public List<ITreeVo> getTreeList(EzMap param) throws Exception {
		param.setInt("recordCountPerPage", 100000);
		return AbstractTreeVo.makeHierarchy(dao.selectTreeList(param));
	}

//	public List<EzMap> getGridTreeList(EzMap param) throws Exception {
//		return  Utilities.convertTreeJson(getList(param),"menuCd","menuNm","uprMenCId");
//	}
//	
	/**
	 * 사용자 메뉴 가져오기
	 * 
	 * @param param
	 * @return
	 */
	public List<ITreeVo> getUserMenuTree(Object param, EzMap itemMap) throws Exception {
		return getUserMenuTree(param, itemMap, false);

	}

	/**
	 * 사용자 메뉴 가져오기
	 * 
	 * @param param
	 * @return
	 */
	public List<ITreeVo> getUserMenuTree(Object param, EzMap menuMap, boolean force) throws Exception {
		EzMap itemMap = menuMap;
		if (itemMap == null)
			itemMap = new EzMap();
		EzMap map = force ? null : SessionUtil.getUserMenuMap();
		List<ITreeVo> tree = force ? null : SessionUtil.getUserMenuList();
		if (tree != null && map != null) {
			itemMap.putAll(map);
			return tree;
		}
		List<ITreeVo> list = Utilities.makeHierarchy(getUserMenuList(param), itemMap);
		List<String> removeList = new ArrayList<String>();
		for (String key : itemMap.keySet()) {
			CrmMenuVo menu = (CrmMenuVo) itemMap.get(key);
			if (!menu.hasLinkedMenu()) {
				removeList.add(menu.getId());
			}
		}
		for (int i = 0; i < removeList.size(); i++) {
			CrmMenuVo menu = (CrmMenuVo) itemMap.remove(removeList.get(i));
			ITreeVo parant = menu.parent();
			if (parant != null)
			{
				List<ITreeVo> chd = parant.getChildren(); 
				for(int j=0;j<chd.size();j++) {
					ITreeVo c = chd.get(j);
					if(c.getId().equals(menu.getId())) {
						chd.remove(j);
						break;
					}
				}
			}
		}
		if (!force) {
			SessionUtil.setUserMenuMap(itemMap);
			SessionUtil.setUserMenuList(list);
		}

		return list;
	}

	public List<CrmMenuVo> getUserMenuList(Object param) throws Exception {
		return dao.selectUserMenuList(param);
	}

	public EzMap saveSeq(CrmMenuVo param) throws Exception {
		return Utilities.getUpdateResult(dao.updateSeq(param));

	}

	public EzMap saveSeq(List<CrmMenuVo> list) throws Exception {
		List<EzMap> result = new ArrayList<EzMap>();
		for (int i = 0; i < list.size(); i++) {
			result.add(saveSeq(list.get(i)));
		}
		return Utilities.getSaveResult(result);
	}

	public Object insertWdgt(CrmUserWdgtVo vo) {
		vo.setUserCd(Utilities.getLoginUserCd());
		wdgtDao.delete(vo);
		EzMap map = SessionUtil.getUserMenuMap();
		CrmMenuVo menu = (CrmMenuVo) map.get(vo.getMenuCd());
		menu.setWdgtYn("Y");
		return Utilities.getUpdateResult(wdgtDao.insert(vo));
	}

	public Object deleteWdgt(CrmUserWdgtVo vo) {
		vo.setUserCd(Utilities.getLoginUserCd());
		EzMap map = SessionUtil.getUserMenuMap();
		CrmMenuVo menu = (CrmMenuVo) map.get(vo.getMenuCd());
		menu.setWdgtYn("N");
		return Utilities.getDeleteResult(wdgtDao.delete(vo));

	}

	public List<CrmUserWdgtVo> getWdgtList(Object param) {
		EzMap map = new EzMap(param);
		map.setString("userCd", Utilities.getLoginUserCd());
		return wdgtDao.selectList(map);
	}
}
