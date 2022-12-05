<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="mGrid1">
	<div class="gTitle1">
			<h3 class="mTitle1">성별분포</h3>
			<div class="gRt">
				<a href="#" class="mBtn1 lWhite" data-click="grdGndrExcelDownload">엑셀</a>
			</div>
	</div>
	<div id="divGrid"  style="height:156px"
		data-grid-id="grdGndr" 
		data-pagenation="N" 
		data-get-url=""
		data-block-ui="Y" 
		data-type="grid" 
		data-grid-callback="onGridLoad" 
		data-tpl-url="<c:url value='/static/gridTemplate/cst/CR217_2.xml'/>">
	</div>
</div>

<div class="mGrid1">
	<div class="gTitle1">
			<h3 class="mTitle1">성별 모드 사용현황 횟수 <span id="deviceLabel"></span></h3>
			<div class="gRt">
				<a href="#" class="mBtn1 lWhite" data-click="grdGndrModeExcelDownload">엑셀</a>
			</div>
	</div>
	<div id="divGrid" style="height:460px"
		data-grid-id="grdGndrMode" 
		data-pagenation="N" 
		data-get-url="" 
		data-block-ui="Y"
		data-type="grid" 
		data-grid-callback="onGridLoad" 
		data-tpl-url="<c:url value='/static/gridTemplate/cst/CR217_2.xml'/>">
	</div>
</div>

<script>
	$("document").ready(function(){
		
	});
	
	function searchStats(param){
		if(param.deviceCd == "VM34"){
			$("#deviceLabel").text("(V4)");
		}else{
			$("#deviceLabel").text("(V6)");
		}
		grdGndr.clear();
		var url = "<c:url value='${urlPrefix}/cusStat/getIotUseGndrStats'/>${urlSuffix}";
		grdGndr.loadUrl(url, param);

		grdGndrMode.clear();
		var url = "<c:url value='${urlPrefix}/cusStat/getIotUseGndrModeStats'/>${urlSuffix}";
		grdGndrMode.loadUrl(url, param);
	}

	function grdGndrExcelDownload(){
		var saveJson = grdGndr.getData();
		if (saveJson.length == 0) {
			alert("저장할 데이터가 존재하지 않습니다.");
			return;
		}
		
		if (!confirm("성별분포 엑셀파일을 다운로드 하시겠습니까?")) return;
		grdGndr.exportExcel("성별분포 엑셀파일.xlsx", true);
	}

	function grdGndrModeExcelDownload(){
		var saveJson = grdGndrMode.getData();
		if (saveJson.length == 0) {
			alert("저장할 데이터가 존재하지 않습니다.");
			return;
		}
		
		if (!confirm("성별 모드 사용현황 엑셀파일을 다운로드 하시겠습니까?")) return;
		grdGndrMode.exportExcel("성별 모드 사용현황 엑셀파일.xlsx", true);
	}
</script>