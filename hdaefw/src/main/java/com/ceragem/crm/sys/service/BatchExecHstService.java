package com.ceragem.crm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ceragem.crm.sys.dao.BatchExecHstDao;
import com.ceragem.crm.sys.dao.ICrmDao;

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
public class BatchExecHstService extends AbstractCrmService {
   @Autowired
   BatchExecHstDao dao;

   @Override
   public ICrmDao getDao() {
       return dao;
   }
}
