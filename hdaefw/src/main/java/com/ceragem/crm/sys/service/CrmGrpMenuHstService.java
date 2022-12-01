package com.ceragem.crm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ceragem.crm.sys.dao.CrmGrpMenuHstDao;
import com.ceragem.crm.sys.dao.ICrmDao;

@Service
public class CrmGrpMenuHstService extends AbstractCrmService {
   @Autowired
   CrmGrpMenuHstDao dao;

   @Override
   public ICrmDao getDao() {
       return dao;
   }
}
