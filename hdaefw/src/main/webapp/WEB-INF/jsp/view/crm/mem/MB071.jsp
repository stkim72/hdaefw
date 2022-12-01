<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="title">
	<h1>매장선택</h1>
	<a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
</div>

<div class="cont">
	<div class="gTitle1 line">
		<h3 class="mTitle1">매장조회</h3>
		<div class="gRt">
			
		</div>
	</div>
	<div class="mSort2 medium">
		<form role="form" id="frmSearch">
		<ul>
			<li class="wAuto">
				<div class="tit">지역</div>
				<div class="txt">
					<code:commCode name="distrctCd" codeCd="CU100" className="select crucial" multiple="true" selectedValue=""/>
				</div>
			</li>
			<li class="wAuto">
				<div class="tit">매장채널</div>
				<div class="txt">
					<code:commCode name="storChlCd" codeCd="ST040" className="select wAuto" prefixLabel="전체" />
				</div>
			</li>
			<li class="wAuto">
				<div class="tit">매장코드</div>
				<div class="txt">
					<input type="text" class="it" title="매장코드" name="storNo" placeholder="매장코드">
				</div>
			</li>
			<li class="wAuto">
				<div class="tit">매장명</div>
				<div class="txt">
					<input type="text" class="it" title="매장명" name="storNm" placeholder="매장명">
				</div>
			</li>
			<li class="wAuto">
				<div class="tit">매장상태</div>
				<div class="txt">
					<code:commCode name="storStatusCd" codeCd="ST020" className="select" prefixLabel="전체" />
				</div>
			</li>
		</ul>
		</form>
		<div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
			<a href="#" class="mBtn1 lGray" data-click="storeListGet">검색</a>
		</div>
	</div>
	
	<c:choose>
		<c:when test="${multiChk eq 'Y'}">
			<div id="divStoreInfoGrid" style="height:450px" 
				data-post="Y" 
				data-grid-id="grdStoreInfo" 
				data-pagenation="N" 
				data-get-url="" 
				data-type="grid" 
				data-grid-callback="onGridLoad" 
				data-tpl-url="<c:url value='/static/gridTemplate/mem/crmStoreSearchMulti.xml'/>">
			</div>
		</c:when>
		<c:otherwise>
			<div id="divStoreInfoGrid" style="height:450px" 
				data-post="Y" 
				data-grid-id="grdStoreInfo" 
				data-pagenation="Y" 
				data-get-url="" 
				data-type="grid" 
				data-grid-callback="onGridLoad" 
				data-tpl-url="<c:url value='/static/gridTemplate/mem/crmStoreSearch.xml'/>">
			</div>
		</c:otherwise>
	</c:choose>
	
	<p>&nbsp;</p>
	<div class="mSort2 medium"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
		<ul>
			<li class="wAuto ml20">
				<div class="tit"></div>
				<div class="txt">
					
				</div>
			</li>
		</ul>
		<div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
			<a href="#" class="mBtn1 lWhite" data-click="storeInfoSelect">매장 선택</a>
		</div>
	</div>
</div>

<script>
	var callFuncNm = '<c:out value="${callFuncNm}"/>';

	$("document").ready(function(){
		
	});

	function grdStoreInfo_load(grid, gridId){
		storeListGet();
	}
	
	function storeListGet(){
		var url = "";
		<c:choose>
			<c:when test="${multiChk eq 'Y'}">
			url = "<c:url value='${urlPrefix}/storeBas/getStoreBasSearchList${urlSuffix}'/>";
			</c:when>
			<c:otherwise>
			url = "<c:url value='${urlPrefix}/storeBas/getStoreBasList${urlSuffix}'/>";
			</c:otherwise>
		</c:choose>
		var param = Utilities.formToMap("frmSearch");

		grdStoreInfo.loadUrl(url,param);
	}

	function grdStoreInfo_dataLoaded(grid,jsonList,data){
		if(jsonList.length > 0){	//검색된 자료가 있다면 제일최상위 로우를 선택한다.
			grdStoreInfo.focusAt(0, 1);
		}
	}

	function grdStoreInfo_cellClick(gridView, itemIndex, column, index, field){
		//grdStoreInfo.check(itemIndex);	//체크표시가 여러개 된다 - zodiack
	}

	function grdStoreInfo_cellDblClick(gridView,itemIndex, column,json, value){
		<c:choose>
			<c:when test="${multiChk eq 'Y'}">
				return false;
			</c:when>
			<c:otherwise>
				grdStoreInfo.check(itemIndex);
				storeInfoSelect();
			</c:otherwise>
		</c:choose>
	}

	function storeInfoSelect(){
		var callbackName = "${callback}";
		if(!callbackName) callbackName = "onStoreSelect";

		var selectedData = grdStoreInfo.getCheckedJson();
		if (selectedData == null) {
			alert("매장을 선택해주세요.");
			return false;
		}

		if(selectedData != null){
			var win = Utilities.getOpener();
			try{
				if(win[callbackName])
				win[callbackName](selectedData);
			}catch(e){}
		}
		Utilities.closeModal();
	}
</script>