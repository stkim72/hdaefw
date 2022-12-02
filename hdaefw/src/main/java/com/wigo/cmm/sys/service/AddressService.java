package com.wigo.cmm.sys.service;

import org.springframework.stereotype.Service;

import com.wigo.cmm.common.model.address.EzAddressSo;
import com.wigo.cmm.common.model.address.EzAdressResultVo;
import com.wigo.cmm.common.util.AddressUtil;

@Service
public class AddressService {

	public EzAdressResultVo getList(EzAddressSo so) throws Exception {
		return AddressUtil.searchAddr(so.getKeyword(), so.getCurrentPage(), so.getCountPerPage(), so.getLanguage());
	}

}
