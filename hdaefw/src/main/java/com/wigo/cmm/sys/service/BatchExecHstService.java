package com.wigo.cmm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wigo.cmm.sys.dao.BatchExecHstDao;
import com.wigo.cmm.sys.dao.ICmmDao;

/**
 * 
 * @ClassName    BatchExecHstService
 * @author    김성태
 * @date    2022. 5. 25.
 * @Version    1.0
 * @description    배치실행이력 Service
 * @Company    Copyright ⓒ wigo.ai. All Right Reserved
 */
@Service
public class BatchExecHstService extends AbstractCmmService {
   @Autowired
   BatchExecHstDao dao;

   @Override
   public ICmmDao getDao() {
       return dao;
   }
}
