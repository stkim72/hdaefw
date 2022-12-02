package com.wigo.cmm.common.taglib;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import com.wigo.cmm.common.model.EzMap;
import com.wigo.cmm.common.util.Utilities;
import com.wigo.cmm.sys.model.FileBaseVo;
import com.wigo.cmm.sys.service.FileService;

/**
 * 
 * <pre>
 * com.wigo.cmm.common.taglib - FileInfoTag.java
 * </pre>
 *
 * @ClassName : FileInfoTag
 * @Description : file Tag
 * @author : MKH
 * @date : 2021. 1. 18.
 * @Version : 1.0
 * @Company : Copyright ⓒ wigo.ai. All Right Reserved
 */

public class FileInfoTag extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5810949506019349503L;

	private String name;
	private String fileCd;
	private int fileSeq = 0;
	private String acceptFileTypes = "";
	private String acceptExts = "";
	private boolean viewMode = false;
	private String fileCategory = "attachment";
	FileService service = Utilities.getBean(FileService.class);

	@Override
	public int doStartTag() throws JspException {
		StringBuffer html = new StringBuffer();
		StringBuffer idNm = new StringBuffer();
		if(Utilities.isNotEmpty(id))
		{
			idNm.append( " id='");
			idNm.append(id);
			idNm.append("'");
		}
		if(Utilities.isNotEmpty(name))
		{
			idNm.append(" name='");
			idNm.append(name);
			idNm.append("'");
		}
		StringBuffer  dataInfo = new StringBuffer();
		dataInfo.append("data-file-cd='");
		dataInfo.append(fileCd);
		dataInfo.append("' data-file-seq='");
		dataInfo.append(fileSeq);
		dataInfo.append("' data-file-category='");
		dataInfo.append(fileCategory);
		dataInfo.append("' data-accept-ext='");
		dataInfo.append(acceptExts);
		dataInfo.append("' data-accept-types='");
		dataInfo.append(acceptFileTypes);
		dataInfo.append("' ");
		dataInfo.append(idNm);
		
		StringBuffer info = new StringBuffer();
		info.append("<span ");
		info.append(dataInfo);
		info.append(" data-file-info='info' >");
		
		
		StringBuffer button = new StringBuffer();
		button.append("&nbsp;<button ");
		button.append(dataInfo);
		button.append(" class=\"btnInner gray btnSubmit\" type=\"button\" data-click=\"onFileInfo\" data-file-info='button'>첨부</button>");
		
		StringBuffer cancel = new StringBuffer();
		cancel.append("&nbsp;<button ");
		cancel.append(dataInfo);
		cancel.append(" class=\"btnInner gray btnSubmit\" style='display:none'  type=\"button\" data-click=\"onCancelFileInfo\"  data-file-info='cancel'>취소</button>");
		
		StringBuffer remove = new StringBuffer();
		
		StringBuffer download = new StringBuffer();
		
		EzMap param = new EzMap();
		param.setString("fileCd", fileCd);
		if (fileSeq > 0) {
			param.setInt("fileSeq", fileSeq);
		}
		List<FileBaseVo> fileList = null;
		try {
			fileList = service.getList(param);
			if (Utilities.isEmpty(fileList))
			{
				info.append("첨부없음");
				
				remove.append("&nbsp;<button ");
				remove.append(dataInfo);
				remove.append(" class=\"btnInner gray btnSubmit\" style='display:none'  type=\"button\" data-click=\"onRemoveFileInfo\"  data-file-info='remove'>삭제</button>");
				
				download.append("&nbsp;<button ");
				download.append(dataInfo);
				download.append(" style='display:none' class=\"btnInner gray btnSubmit\" data-file-url='' type=\"button\" data-click=\"onDownloadFileInfo\"  data-file-info='download'>받기</button>");
			}
			else {
				remove.append( "&nbsp;<button ");
				remove.append(dataInfo);
				remove.append(" class=\"btnInner gray btnSubmit\" type=\"button\" data-click=\"onRemoveFileInfo\"  data-file-info='remove'>삭제</button>");
				download.append("&nbsp;<button ");
				download.append(dataInfo);
				download.append(" class=\"btnInner gray btnSubmit\" data-file-url='");
				download.append(fileList.get(0).getFileUrl());
				download.append("' data-file-nm='");
				download.append(fileList.get(0).getFileNm());
				download.append("' type=\"button\" data-click=\"onDownloadFileInfo\"  data-file-info='download'>받기</button>");
				info .append( fileList.get(0).getFileNm());
				
				if (fileList.size() > 1)
				{
					info .append("(총 " );
					info .append( fileList.size());
					info .append( " 파일)");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			return SKIP_BODY;
		}
		info.append("</span>");
		html.append(info);
		if (!viewMode)
		{
			html.append(button);
			html.append(cancel);
			html.append(download);
			html.append(remove);
			
			
		}
		else {
			if (Utilities.isNotEmpty(fileList))
				html.append(download);
		}
		
		try {
			pageContext.getOut().print(html.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}

		return SKIP_BODY;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFileCd() {
		return fileCd;
	}

	public void setFileCd(String fileCd) {
		this.fileCd = fileCd;
	}

	public int getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(int fileSeq) {
		this.fileSeq = fileSeq;
	}

	public String getAcceptFileTypes() {
		return acceptFileTypes;
	}

	public void setAcceptFileTypes(String acceptFileTypes) {
		this.acceptFileTypes = acceptFileTypes;
	}

	public String getAcceptExts() {
		return acceptExts;
	}

	public void setAcceptExts(String acceptExts) {
		this.acceptExts = acceptExts;
	}

	public boolean isViewMode() {
		return viewMode;
	}

	public void setViewMode(boolean viewMode) {
		this.viewMode = viewMode;
	}

	public String getFileCategory() {
		return fileCategory;
	}

	public void setFileCategory(String fileCategory) {
		this.fileCategory = fileCategory;
	}

}
