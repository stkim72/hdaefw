package com.wigo.cmm.sys.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.wigo.cmm.common.model.BaseVo;
import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.common.util.Utilities;
import com.wigo.cmm.sys.dao.ICmmDao;
import com.wigo.cmm.sys.model.ICrmFile;

import lombok.extern.slf4j.Slf4j;

/**
 * <pre>
 * com.wigo.cmm.common.service.AbstractCrmService
 * </pre>
 *
 * @ClassName : AbstractCrmService
 * @Description : AbstractCrmService
 * @author : 김성태
 * @date : 2021. 4. 27.
 * @Version : 1.0
 * @Company : Copyright ⓒ wigo.CO.LTD. All Right Reserved
 */
@Slf4j
public abstract class AbstractCrmService {

	@Autowired
	AsyncService asyncService;

	public abstract ICmmDao getDao();

	public <T> List<T> getList(Object param) throws Exception {
		return getDao().selectList(param);
	}

	public <T> T get(Object param) throws Exception {
		return getDao().select(param);
	}

	public int getListCount(Object param) throws Exception {
		return getDao().selectListCount(param);
	}

	public int insert(Object param) throws Exception {
		return getDao().insert(param);
	}

	public int update(Object param) throws Exception {
		return getDao().update(param);
	}

	public int delete(Object param) throws Exception {
		if (param instanceof ICrmFile) {
			try {
				ICrmFile crmFile = (ICrmFile) param;
				String fileCd = crmFile.getFileCd();
				ICrmFile obj = Utilities.isNotEmpty(fileCd) ? crmFile : get(param);
				asyncService.deleteFileCd(obj);
			} catch (Exception ex) {
				log.warn(ex.getMessage());
			}

		}

		return getDao().delete(param);
	};

	public EzMap save(BaseVo vo) throws Exception {
		if ("C".equalsIgnoreCase(vo.getStat()))
			return Utilities.getInsertResult(insert(vo), vo);
		else if ("U".equalsIgnoreCase(vo.getStat()))
			return Utilities.getUpdateResult(update(vo), vo);
		else if ("D".equalsIgnoreCase(vo.getStat()))
			return Utilities.getDeleteResult(delete(vo));
		return Utilities.getUpdateResult(0, vo);
	}

	public EzMap insertList(List<? extends BaseVo> list) throws Exception {
		List<EzMap> result = new ArrayList<EzMap>();
		for (int i = 0; i < list.size(); i++) {
			result.add(Utilities.getInsertResult(insert(list.get(i)), list.get(i)));
		}
		return Utilities.getSaveResult(result);
	}

	public EzMap updateList(List<? extends BaseVo> list) throws Exception {
		List<EzMap> result = new ArrayList<EzMap>();
		for (int i = 0; i < list.size(); i++) {
			result.add(Utilities.getUpdateResult(update(list.get(i)), list.get(i)));
		}
		return Utilities.getSaveResult(result);
	}

	public EzMap deleteList(List<? extends BaseVo> list) throws Exception {
		List<EzMap> result = new ArrayList<EzMap>();
		for (int i = 0; i < list.size(); i++) {
			result.add(Utilities.getDeleteResult(delete(list.get(i))));
		}
		return Utilities.getSaveResult(result);
	}

	public EzMap saveList(List<? extends BaseVo> list) throws Exception {
		List<EzMap> result = new ArrayList<EzMap>();
		for (int i = 0; i < list.size(); i++) {
			result.add(save(list.get(i)));
		}
		return Utilities.getSaveResult(result);
	}

}
