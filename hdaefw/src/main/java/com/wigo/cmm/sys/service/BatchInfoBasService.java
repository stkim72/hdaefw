package com.wigo.cmm.sys.service;

import java.io.InputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;
import com.wigo.cmm.common.model.EzAjaxException;
import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.sys.dao.BatchInfoBasDao;
import com.wigo.cmm.sys.dao.ICmmDao;
import com.wigo.cmm.sys.model.BatchInfoBasVo;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @ClassName BatchInfoBasService
 * @author 김성태
 * @date 2022. 5. 25.
 * @Version 1.0
 * @description 배치정보기본 Service
 * @Company Copyright ⓒ wigo.ai. All Right Reserved
 */
@Slf4j
@Service
public class BatchInfoBasService extends AbstractCrmService {

	@Value("${spring.batch.host}")
	String host;

	@Value("${spring.batch.port}")
	int port;

	@Value("${spring.batch.user}")
	String user;

	@Value("${spring.batch.password}")
	String password;

	@Value("${spring.batch.path}")
	String path;

	@Autowired
	BatchInfoBasDao dao;

	@Autowired
	AsyncService asyncService;

	@Override
	public ICmmDao getDao() {
		return dao;
	}

	@Override
	public int insert(Object param) throws Exception {
		int ret = super.insert(param);
//		dao.updateHist(param);
		return ret;
	}

	@Override
	public int update(Object param) throws Exception {
		int ret = super.update(param);
//		dao.updateHist(param);
		return ret;
	}

	public void execute(String batchCd) throws Exception {
		EzMap so = new EzMap();
		so.setString("batchCd", batchCd);
		BatchInfoBasVo batch = get(so);
		if (batch == null) {
			throw new EzAjaxException("배치가 존재하지 않습니다.");
		}
		asyncService.executeBatch(batch.getWrkId());
	}

	public void executeBatch(String jobName) throws Exception {
		StringBuffer bf = new StringBuffer();
		bf.append(path);
		bf.append(jobName);
		bf.append(".sh");

		java.util.Properties config = new java.util.Properties();
		config.put("StrictHostKeyChecking", "no");
		JSch jsch = new JSch();
		Session session = jsch.getSession(user, host, 22);
		session.setPassword(password);
		session.setConfig(config);
		session.connect();

		Channel channel = session.openChannel("exec");
		((ChannelExec) channel).setCommand(bf.toString());
		channel.setInputStream(null);
		((ChannelExec) channel).setErrStream(System.err);

		InputStream in = channel.getInputStream();
		StringBuffer result = new StringBuffer();
		try {
			channel.connect();
			byte[] tmp = new byte[1024];

			while (true) {
				while (in.available() > 0) {
					int i = in.read(tmp, 0, 1024);
					if (i < 0)
						break;
					result.append(new String(tmp, 0, i));
				}
				if (channel.isClosed()) {
					break;
				}
				try {
					Thread.sleep(1000);
				} catch (Exception ee) {
					log.debug(ee.getMessage());
				}
			}
		} finally {
			try {
				if (in != null)
					in.close();
				channel.disconnect();
				session.disconnect();
			} catch (Exception ee) {
				log.debug(ee.getMessage());
			}

			log.debug(result.toString());
		}

	}

}
