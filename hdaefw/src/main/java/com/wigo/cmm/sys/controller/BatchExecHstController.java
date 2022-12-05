package com.wigo.cmm.sys.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.common.model.EzPaginationInfo;
import com.wigo.cmm.common.util.Utilities;
import com.wigo.cmm.sys.model.BatchExecHstVo;
import com.wigo.cmm.sys.service.BatchExecHstService;

/**
 * 
 * @ClassName    BatchExecHstController
 * @author    김성태
 * @date    2022. 5. 25.
 * @Version    1.0
 * @description    배치실행이력 Controller
 * @Company    Copyright ⓒ wigo.ai. All Right Reserved
 */

@Controller
@RequestMapping(value = { "batchHist", "{menuId}/batchHist" })
public class BatchExecHstController{

@Autowired
BatchExecHstService service;

/**
 * 
 * @author 김성태
 * @date 2022. 5. 25. * @param param
 * @param model
 * @return
 * @throws Exception
 * @description 배치실행이력 목록페이지
 *
 */
@GetMapping(value = { "", "index" })
public String init(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
    model.addAllAttributes(param);
    return Utilities.getProperty("tiles.cmm") + "sys/batchHistList";
}

/**
 * 
 * @author 김성태
 * @date 2022. 5. 25. * @param param
 * @return
 * @throws Exception
 * @description 배치실행이력 목록검색
 *
 */
@PostMapping(value = { "getList" })
public @ResponseBody Object getList(@RequestBody EzMap param) throws Exception {
    EzPaginationInfo page = param.getPaginationInfo();
    List<BatchExecHstVo> list = service.getList(param);
    page.setTotalRecordCount(service.getListCount(param));
    return Utilities.getGridData(list,page);
}
@GetMapping(value = { "detail/{batchHstCd}" })
public String detail(BatchExecHstVo vo,@PathVariable("batchHstCd") String batchHstId , @RequestParam Map<String, Object> param, ModelMap model) throws Exception {
	vo.setBatchHstId(batchHstId);
	model.addAttribute("hist", service.get(vo));
	model.addAllAttributes(param);
	return Utilities.getProperty("tiles.cmm.blank") + "sys/batchHistDetail";
}
/**
 * 
 * @author 김성태
 * @date 2022. 5. 25. * @param rparam
 * @return
 * @throws Exception
 * @description 배치실행이력 1건검색
 *
 */
@GetMapping(value = { "get" })
public @ResponseBody Object get(@RequestParam Map<String, Object> rparam) throws Exception {
    EzMap param = new EzMap(rparam);
    return service.get(param);
}
/**
 * 
 * @author 김성태
 * @date 2022. 5. 25. * @param vo
 * @return
 * @throws Exception
 * @description 배치실행이력 저장
 * */@PostMapping(value = {"save" })
public @ResponseBody Object save(@RequestBody BatchExecHstVo vo) throws Exception {
    return service.save(vo);
}

/**
 * 
 * @author 김성태
 * @date 2022. 5. 25. * @param list
 * @return
 * @throws Exception
 * @description 배치실행이력 리스트 저장
 *
 */
@PostMapping(value = { "saveList" })
public @ResponseBody Object saveList(@RequestBody List<BatchExecHstVo> list) throws Exception {
    return service.saveList(list);
}
/**
 * 
 * @author 김성태
 * @date 2022. 5. 25.
 * @param list
 * @return
 * @throws Exception
 * @description 배치실행이력 리스트 삭제
 *
 */
@PostMapping(value = { "deleteList" })
public @ResponseBody Object deleteList(@RequestBody List<BatchExecHstVo> list) throws Exception {
    return service.deleteList(list);
}
}
