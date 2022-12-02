package com.wigo.cmm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.sys.dao.CrmGrpEmpHstDao;
import com.wigo.cmm.sys.dao.ICrmDao;

@Service
public class CrmGrpEmpHstService extends AbstractCrmService {
   @Autowired
   CrmGrpEmpHstDao dao;

   @Override
   public ICrmDao getDao() {
       return dao;
   }
}
