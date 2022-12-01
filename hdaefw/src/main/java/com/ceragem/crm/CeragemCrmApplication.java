package com.ceragem.crm;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 *
 * <pre>
 * com.ceragem.crm - CeragemCrmApplication.java
 * </pre>
 *
 * @ClassName : AiredpenAdminAuthApplication
 * @Description : Spring boot 실행 어플리케이션
 * @author : 김성태
 * @date : 2021. 1. 5.
 * @Version : 1.0
 * @Company : Copyright ⓒ wigo.ai. All Right Reserved
 */
@EnableAsync
@EnableScheduling
@SpringBootApplication
//@Slf4j
public class CeragemCrmApplication {

	public static void main(String[] args) {
		SpringApplication.run(CeragemCrmApplication.class, args);
	}

//	@Bean
//	ServletContextInitializer preCompileJspsAtStartup() {
//		return servletContext -> {
//			getDeepResourcePaths(servletContext, "/WEB-INF/jsp/").forEach(jspPath -> {
//				log.info("Registering JSP: {}", jspPath);
//				ServletRegistration.Dynamic reg = servletContext.addServlet(jspPath, Constants.JSP_SERVLET_CLASS);
//				reg.setInitParameter("jspFile", jspPath);
//				reg.setLoadOnStartup(99);
//				reg.addMapping(jspPath);
//			});
//		};
//	}

//	private static Stream<String> getDeepResourcePaths(ServletContext servletContext, String path) {
//		return (path.endsWith("/"))
//				? servletContext.getResourcePaths(path).stream().flatMap(p -> getDeepResourcePaths(servletContext, p))
//				: Stream.of(path);
//	}

}
