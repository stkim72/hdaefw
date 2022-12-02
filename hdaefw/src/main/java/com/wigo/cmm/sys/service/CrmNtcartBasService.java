package com.wigo.cmm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.sys.dao.NtcartBasDao;
import com.wigo.cmm.sys.dao.ICmmDao;

@Service
public class CrmNtcartBasService extends AbstractCmmService {
   @Autowired
   NtcartBasDao dao;

   @Override
   public ICmmDao getDao() {
       return dao;
   }
}
