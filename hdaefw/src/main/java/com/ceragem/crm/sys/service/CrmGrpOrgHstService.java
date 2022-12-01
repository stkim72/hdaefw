package com.ceragem.crm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ceragem.crm.sys.dao.CrmGrpOrgHstDao;
import com.ceragem.crm.sys.dao.ICrmDao;

@Service
public class CrmGrpOrgHstService extends AbstractCrmService {
   @Autowired
   CrmGrpOrgHstDao dao;

   @Override
   public ICrmDao getDao() {
       return dao;
   }
}
