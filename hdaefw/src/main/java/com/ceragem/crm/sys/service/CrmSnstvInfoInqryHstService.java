package com.ceragem.crm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ceragem.crm.sys.dao.CrmSnstvInfoInqryHstDao;
import com.ceragem.crm.sys.dao.ICrmDao;

/**
 * 
 * @ClassName    CrmSnstvInfoInqryHstService
 * @author    김성태
 * @date    2022. 4. 19.
 * @Version    1.0
 * @description    CRM민감정보조회이력 Service
 * @Company    Copyright ⓒ wigo.ai. All Right Reserved
 */
@Service
public class CrmSnstvInfoInqryHstService extends AbstractCrmService {
   @Autowired
   CrmSnstvInfoInqryHstDao dao;

   @Override
   public ICrmDao getDao() {
       return dao;
   }
}
