package com.wigo.cmm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.sys.dao.CrmNtcartBasDao;
import com.wigo.cmm.sys.dao.ICrmDao;

@Service
public class CrmNtcartBasService extends AbstractCrmService {
   @Autowired
   CrmNtcartBasDao dao;

   @Override
   public ICrmDao getDao() {
       return dao;
   }
}
