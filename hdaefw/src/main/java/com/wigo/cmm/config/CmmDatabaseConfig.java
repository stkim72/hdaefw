package com.wigo.cmm.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import com.wigo.cmm.common.log.LogDaoAspect;
import com.wigo.cmm.sys.mapper.CmmMapper;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

/**
 *
 * <pre>
 * com.wigo.cmm.config - DatabaseConfig.java
 * </pre>
 *
 * @ClassName : DatabaseConfig
 * @Description : DB 설정
 * @author : 김성태
 * @date : 2021. 1. 5.
 * @Version : 1.0
 * @Company : Copyright ⓒ wigo.ai. All Right Reserved
 */
@Primary
@Configuration("cmmDatabaseConfig")
@MapperScan(basePackages = {
		"com.wigo.cmm" }, value = "최상위 패키지 경로", annotationClass = CmmMapper.class, sqlSessionFactoryRef = "cmmSqlSessionFactory")
public class CmmDatabaseConfig {
	@Autowired
	ApplicationContext applicationContext;

	@Value("${spring.datasource.driver-class-name}")
	String dbDriverClassName;

	@Value("${spring.datasource.url}")
	String dbURL;

	@Value("${spring.datasource.username}")
	String userName;

	@Value("${spring.datasource.password}")
	String password;

	@Value("${spring.datasource.hikari.connection-timeout}")
	int timeout;

	@Value("${spring.datasource.hikari.maximum-pool-size}")
	int poolSize;

	@Primary
	@Bean(name = "cmmDataSource")
	DataSource dataSource() {
		if (poolSize <= 0)
			poolSize = 100;
		if (timeout <= 0)
			timeout = 120000;
		HikariConfig hikariConfig = new HikariConfig();
		hikariConfig.setDriverClassName(dbDriverClassName);
		hikariConfig.setUsername(userName);
		hikariConfig.setPassword(password);
		hikariConfig.setJdbcUrl(dbURL);
		hikariConfig.setMaximumPoolSize(poolSize);
		hikariConfig.setConnectionTimeout(timeout);
		hikariConfig.setLeakDetectionThreshold(300000);
		hikariConfig.setIdleTimeout(120000);
		hikariConfig.setMaxLifetime(600000);
		hikariConfig.setValidationTimeout(120000);
		hikariConfig.setPoolName("cmm-pool");
		
		return new HikariDataSource(hikariConfig);
	}

	@Primary
	@Bean(name = "cmmSqlSessionFactory")
	SqlSessionFactory sqlSessionFactory(@Qualifier("cmmDataSource") DataSource dataSource,
			@Qualifier("logDaoAspect") LogDaoAspect interceptor) throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSource);
		sqlSessionFactoryBean
				.setConfigLocation(applicationContext.getResource("classpath:/config/mybatis/mybatis-config-base.xml"));
		sqlSessionFactoryBean
				.setMapperLocations(applicationContext.getResources("classpath:/mapper/**/*_SqlMapper.xml"));
		sqlSessionFactoryBean.setTypeAliasesPackage("com.wigo.**.model,com.wigo.**.entity");
		sqlSessionFactoryBean.setPlugins(interceptor);
		return sqlSessionFactoryBean.getObject();
	}

	@Primary
	@Bean(name = "cmmSqlSessionFactory")
	SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory);
	}

}
