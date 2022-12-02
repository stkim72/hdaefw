package com.wigo.cmm.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.common.model.EzPropertyService;
import com.wigo.cmm.common.model.EzPropertyServiceImpl;

/**
 * 
 * <pre>
 * com.wigo.cmm.config - TilesConfig.java
 * </pre>
 *
 * @ClassName : TilesConfig
 * @Description : Tiles 설정
 * @author : 김성태
 * @date : 2021. 1. 5.
 * @Version : 1.0
 * @Company : Copyright ⓒ wigo.ai. All Right Reserved
 */

@Configuration
public class PropertyConfig {
//	@Autowired
//	private Environment environment;


	@Bean(name = "propertiesService")
	EzPropertyService tilesViewResolver() {

		final EzPropertyServiceImpl propertyService = new EzPropertyServiceImpl();
		EzMap map = new EzMap();
		map.setString("storage.root", "c:/nas/files/");
		map.setString("storage.temp", "c:/nas/files/temp/");

		map.setString("currentPageNo", "1");
		map.setString("recordCountPerPage", "30");
		map.setString("pageSize", "10");
		// map.setString("urlSuffix", ".do");
		map.setString("urlSuffix", "");

		map.setString("context.manage", "");

//        map.setString("tiles.manage", "manage/");
//        map.setString("tiles.manage.blank", "manage/blank/");
//        map.setString("tiles.manage.blankBody", "manage/blankBody");
//        
		map.setString("tiles.kland", "kland/");
		map.setString("tiles.kland.blank", "kland/blank/");
		map.setString("tiles.kland.blankBody", "kland/blankBody/");

		map.setString("tiles.manage", "manage/");
		map.setString("tiles.manage.blank", "manage/blank/");
		map.setString("tiles.manage.blankBody", "manage/blankBody/");

		map.setString("tiles.lms", "lms/");
		map.setString("tiles.lms.blank", "lms/blank/");

		
		
		map.setString("tiles.crm", "crm/");
		map.setString("tiles.crm.type1", "crm/type1/");
		map.setString("tiles.crm.type2", "crm/type2/");
		map.setString("tiles.crm.type3", "crm/type3/");
		map.setString("tiles.crm.type4", "crm/type4/");
		map.setString("tiles.crm.type5", "crm/type5/");
		map.setString("tiles.crm.type6", "crm/type6/");
		map.setString("tiles.crm.type7", "crm/type7/");
		map.setString("tiles.crm.type8", "crm/type8/");
		map.setString("tiles.crm.type9", "crm/type9/");
		map.setString("tiles.crm.blank", "crm/blank/");
//		for (PropertySource<?> propertySource : ((ConfigurableEnvironment) environment).getPropertySources()) {
//			if (propertySource instanceof EnumerablePropertySource) {
//				for (String key : ((EnumerablePropertySource<?>) propertySource).getPropertyNames()) {
//					map.put(key, propertySource.getProperty(key).toString());
//				}
//			}
//		}

		propertyService.setProperties(map);

		return propertyService;
	}
}
