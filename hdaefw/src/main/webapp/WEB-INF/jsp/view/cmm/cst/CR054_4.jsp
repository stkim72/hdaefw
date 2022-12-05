<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="title">
	<h1>제품선택</h1>
	<a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
</div>

<div class="cont">
	<div class="gTitle1 line">
		<h3 class="mTitle1">구매제품 조회</h3>
		<div class="gRt">
			
		</div>
	</div>
	<div class="mSort2 mini">
		<form role="form" id="frmSearch">
		<ul>
			<li class="wAuto">
				<div class="tit">제품군</div>
				<div class="txt">
					<code:commCode name="godsClassCd" codeType="godsClassNo" codeCd="M" className="select" multiple="true" selectedValue=""/>
				</div>
			</li>
			<li class="wAuto">
				<div class="tit">제품번호</div>
				<div class="txt">
					<input type="text" class="it" title="매장코드" name="godsNo" placeholder="제품번호">
				</div>
			</li>
			<li class="wAuto">
				<div class="tit">제품명</div>
				<div class="txt">
					<input type="text" class="it" title="매장명" name="godsNm" placeholder="제품명">
				</div>
			</li>
		</ul>
		</form>
		<div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
			<a href="#" class="mBtn1 lGray" data-click="godsListGet">검색</a>
		</div>
	</div>
	<div id="divGodsGrid" style="height:440px" 
		data-post="Y" 
		data-grid-id="grdGodsInfo" 
		data-pagenation="Y" 
		data-get-url="" 
		data-type="grid" 
		data-block-ui="Y"
		data-grid-callback="onGridLoad" 
		data-tpl-url="<c:url value='/static/gridTemplate/cst/cmmCustGrpDealGods.xml'/>">
	</div>
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
			<a href="#" class="mBtn1 lWhite" data-click="godsInfoSelect">제품 선택</a>
		</div>
	</div>
</div>

<script>
	var callFuncNm = '<c:out value="${callFuncNm}"/>';

	$("document").ready(function(){
		
	});

	function grdGodsInfo_load(grid, gridId){
		godsListGet();	
	}
	
	function godsListGet(){
		var url = "<c:url value='${urlPrefix}/custGroup/getDealGodsSearchList${urlSuffix}'/>";
		var param = Utilities.formToMap("frmSearch");

		grdGodsInfo.loadUrl(url,param);
	}

	function grdGodsInfo_dataLoaded(grid,jsonList,data){
		if(jsonList.length > 0){	//검색된 자료가 있다면 제일최상위 로우를 선택한다.
			grdGodsInfo.focusAt(0, 1);
		}
	}

	function godsInfoSelect(){
		var callbackName = "${callback}";
		if(!callbackName) callbackName = "onGodsSelect";

		var selectedData = grdGodsInfo.getCheckedJson();
		if (selectedData.length <= 0) {
			alert("제품을 선택해주세요.");
			return false;
		}
//console.log("==== > "+ JSON.stringify(selectedData.length));return;
		if(selectedData.length > 0){
			var win = Utilities.getOpener();
			try{
				if(win[callbackName])
				win[callbackName](selectedData);
			}catch(e){}
		}
		Utilities.closeModal();
	}
</script>