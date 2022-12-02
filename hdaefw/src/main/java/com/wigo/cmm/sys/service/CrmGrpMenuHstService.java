package com.wigo.cmm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.sys.dao.GrpMenuHstDao;
import com.wigo.cmm.sys.dao.ICmmDao;

@Service
public class CrmGrpMenuHstService extends AbstractCmmService {
   @Autowired
   GrpMenuHstDao dao;

   @Override
   public ICmmDao getDao() {
       return dao;
   }
}
