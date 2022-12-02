package com.wigo.cmm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.sys.dao.GrpEmpHstDao;
import com.wigo.cmm.sys.dao.ICmmDao;

@Service
public class CrmGrpEmpHstService extends AbstractCmmService {
   @Autowired
   GrpEmpHstDao dao;

   @Override
   public ICmmDao getDao() {
       return dao;
   }
}
