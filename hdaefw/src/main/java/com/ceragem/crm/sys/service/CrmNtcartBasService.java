package com.ceragem.crm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ceragem.crm.sys.dao.CrmNtcartBasDao;
import com.ceragem.crm.sys.dao.ICrmDao;

@Service
public class CrmNtcartBasService extends AbstractCrmService {
   @Autowired
   CrmNtcartBasDao dao;

   @Override
   public ICrmDao getDao() {
       return dao;
   }
}
