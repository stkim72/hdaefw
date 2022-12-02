package com.wigo.cmm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.sys.dao.CrmGrpMenuHstDao;
import com.wigo.cmm.sys.dao.ICrmDao;

@Service
public class CrmGrpMenuHstService extends AbstractCrmService {
   @Autowired
   CrmGrpMenuHstDao dao;

   @Override
   public ICrmDao getDao() {
       return dao;
   }
}
