package com.ceragem.crm.sys.service;

import org.springframework.stereotype.Service;

import com.ceragem.crm.common.model.address.EzAddressSo;
import com.ceragem.crm.common.model.address.EzAdressResultVo;
import com.ceragem.crm.common.util.AddressUtil;

@Service
public class CrmAddressService {

	public EzAdressResultVo getList(EzAddressSo so) throws Exception {
		return AddressUtil.searchAddr(so.getKeyword(), so.getCurrentPage(), so.getCountPerPage(), so.getLanguage());
	}

}
