package com.wigo.cmm.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.wigo.cmm.sys.model.ICmmFile;

/**
 * 
 * @ClassName CrmAsyncService
 * @author 김성태
 * @date 2022. 9. 15.
 * @Version 1.0
 * @description
 * @Company Copyright ⓒ wigo.ai. All Right Reserved
 */
@Service
public class AsyncService {

	@Lazy
	@Autowired
	BatchInfoBasService batchService;

	@Lazy
	@Autowired
	UserWdgtService wdgtService;

	@Lazy
	@Autowired
	FileService fileService;

	@Async
	public void executeBatch(String jobName) throws Exception {
		batchService.executeBatch(jobName);
	}

	@Async
	public void initMainData() throws Exception {
		wdgtService.initLastData();
	}

	@Async
	public void deleteFileCd(ICmmFile cmmFile) throws Exception {
		fileService.deleteFileCd(cmmFile);
	}
}
