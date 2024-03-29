package com.wigo.cmm.sys.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.xml.ws.http.HTTPException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.wigo.cmm.common.model.EzAjaxException;
import com.wigo.cmm.common.model.EzException;
import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.common.util.Utilities;
import com.wigo.cmm.sys.dao.FileBaseDao;
import com.wigo.cmm.sys.dao.ICmmDao;
import com.wigo.cmm.sys.model.FileVo;
import com.wigo.cmm.sys.model.ICmmFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FileService extends AbstractCmmService {
	@Autowired
	FileBaseDao dao;

	@Value("${spring.nas.path}")
	String nasPath;

	@Value("${spring.nas.url}")
	String nasUrl;

	@Autowired
	UserWdgtService mainService;

	@Override
	public ICmmDao getDao() {
		return dao;
	}

	@Override
	public int delete(Object param) throws Exception {
		FileVo fileInfo = get(param);
		if (fileInfo == null)
			return 0;
		String saveFileName = getSaveFileName(fileInfo.getFileSaveNm());
		Utilities.deleteFile(new File(saveFileName));
		int ret = super.delete(param);
		String fileCd = fileInfo.getFileId();
		EzMap so = new EzMap();
		so.setString("fileCd", fileCd);
		int cnt = getListCount(so);
		if (cnt == 0) {
			String dir = Utilities.getFilePath(saveFileName);
			Utilities.deleteDirectory(dir);
		}
		return ret;
	}

	private String getSaveFileName(String saveName) {
		return nasPath + saveName;
	}

	private String getFileUrlName(String fileName) {
		return nasUrl + fileName;
	}

	private void saveUploadFile(MultipartFile uploadfile, String fileName) throws Exception {
		Utilities.createDirectory(Utilities.getFilePath(fileName));
		File dir = new File(Utilities.getFilePath(fileName));
		if (!dir.isDirectory()) {
			throw new EzAjaxException("첨부파일을 저장할 폴더를 생성할 수 없습니다.\n관리자에게 문의하세요");
		}
		uploadfile.transferTo(new File(fileName));
	}

	public FileVo uploadFile(MultipartFile uploadfile, FileVo fileInfo) throws Exception {
		if (uploadfile == null)
			throw new EzException();

//		파일확장자 체크
		Map<String, Object> whiteList = mainService.getS180Map();
		if (Utilities.isNotEmpty(whiteList)) {
			String ext = Utilities.getFileExtension(uploadfile.getOriginalFilename()).toLowerCase();
			if (!whiteList.containsKey(ext)) {
				throw new EzException("[" + uploadfile.getName() + "]업로드가 제한된 파일 형식입니다.");
			}
		}

		if (Utilities.isEmpty(fileInfo.getFileNm())) {
			String rFileName = uploadfile.getOriginalFilename();
			fileInfo.setFileNm(rFileName);
			fileInfo.setFileExtNm(".txt");
			fileInfo.setFileSize(uploadfile.getSize());
			fileInfo.setMimeTypeNm(uploadfile.getContentType());
		}

		String ctgryCd = fileInfo.getFileCtgryCd();
		String subUrl = fileInfo.getFileId() + "/";
		String fileName = fileInfo.getFileNm();

		// 완료후
		fileName = Utilities.getUniqID(20) + "." + Utilities.getFileExtension(fileName);

		if (Utilities.isEmpty(ctgryCd))
			ctgryCd = "attachment";
		if (ctgryCd.startsWith("/"))
			ctgryCd = ctgryCd.substring(1);
		if (ctgryCd.endsWith("/"))
			ctgryCd = ctgryCd.substring(0, ctgryCd.length() - 1);

		Integer fileSeq = fileInfo.getFileOdrg();
		if (fileSeq != null && fileSeq > 0) {
			delete(fileInfo);
		}

		String fileCd = fileInfo.getFileId();

		subUrl = ctgryCd + "/" + fileCd + "/";
		String subFileName = subUrl + fileName;
		fileInfo.setFileUrl(getFileUrlName(subFileName));
		fileInfo.setFileSaveNm(subFileName);
		String saveFileName = getSaveFileName(subFileName);
		saveUploadFile(uploadfile, saveFileName);

		insert(fileInfo);
		return fileInfo;
	}

	public Object downloadFile(FileVo param) throws Exception {
		FileVo fileInfo = get(param);
		if (fileInfo == null)
			throw new HTTPException(404);
		String saveName = getSaveFileName(fileInfo.getFileSaveNm());
		String fileNm = fileInfo.getFileNm();
		Utilities.DownloadFile(saveName, fileNm);
		return true;

	}

	public void deleteFileCd(ICmmFile cmmFile) throws Exception {
		if (cmmFile == null)
			return;
		try {
			if (Utilities.isNotEmpty(cmmFile.getFileCd())) {
				deleteFileCd(cmmFile.getFileCd());
			}
		} catch (Exception ex) {
			log.debug(ex.getMessage());
		}

	}

	public void deleteFileCd(String fileCd) throws Exception {
		if (Utilities.isEmpty(fileCd))
			return;
		EzMap fileSo = new EzMap();
		fileSo.setString("fileCd", fileCd);
		List<FileVo> fileList = dao.selectList(fileSo);
		deleteList(fileList);

	}

	public int getMaxFileSeq(String fileCd) throws Exception {
		EzMap param = new EzMap();
		param.setString("fileCd", fileCd);
		return dao.selectMaxFileSeq(param);
	}

	

}
