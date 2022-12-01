package com.ceragem.crm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ceragem.crm.sys.dao.CrmGrpEmpHstDao;
import com.ceragem.crm.sys.dao.ICrmDao;

@Service
public class CrmGrpEmpHstService extends AbstractCrmService {
   @Autowired
   CrmGrpEmpHstDao dao;

   @Override
   public ICrmDao getDao() {
       return dao;
   }
}
