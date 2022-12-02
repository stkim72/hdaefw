package com.wigo.cmm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.sys.dao.GrpOrgHstDao;
import com.wigo.cmm.sys.dao.ICmmDao;

@Service
public class CrmGrpOrgHstService extends AbstractCmmService {
   @Autowired
   GrpOrgHstDao dao;

   @Override
   public ICmmDao getDao() {
       return dao;
   }
}
