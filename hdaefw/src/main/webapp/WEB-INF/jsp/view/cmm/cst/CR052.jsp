<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="title">
	<h1>고객그룹</h1>
	<a href="#" data-btn-type="closeModal"  class="close">팝업 닫기</a>
</div>

<div class="cont">
    <div class="gTitle1 line">
        <h3 class="mTitle1">고객그룹 목록</h3>
        <div class="gRt">
        </div>
    </div>
    <!-- board -->
    <div class="mBoard2">
    	<form role="form" id="frmSearch">
		<div class="mSort2 mini">
			<ul>
				<li class="wAuto">
					<div class="tit">일자구분</div>
					<div class="txt">
						<code:commCode name="searchUseDateType" codeCd="S090" className="select w100" prefixLabel="전체" />
                        <input class="it w65" type="text" data-type="dateRangeStart" data-range-end="searchUseEndDay" id="searchUseStaDay" name="searchUseStaDay" data-button="Y" value="" />
                        <span class="bar">~</span>
						<input class="it w65" type="text" id="searchUseEndDay" name="searchUseEndDay" data-button="Y" value=""/>
					</div>
				</li>
				<li class="wAuto">
					<div class="tit">공개여부</div>
					<div class="txt">
						<code:commCode name="ottpYn" codeCd="S050" prefixLabel="전체" />
					</div>
				</li>
				<li class="wAuto">
					<div class="tit">사용여부</div>
					<div class="txt">
						<code:commCode name="useYn" codeCd="S050" prefixLabel="전체" className="select w100" />
					</div>
				</li>
				<li class="wAuto">
					<div class="tit">그룹명</div>
					<div class="txt">
						<input type="text" class="it" title="그룹명" name="custGrpNm">
					</div>
				</li>
			</ul>
			<div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
				<a href="#" class="mBtn1" data-click="groupBasListGet">검색</a>
			</div>
		</div>
        </form>
        <!-- //고객그룹 그리드영역 -->
		<div id="divGroupInfoGrid" style="height:500px" 
			data-post="Y" 
			data-grid-id="grdGroupInfo" 
			data-pagenation="Y" 
			data-get-url="" 
			data-load-focus="Y"
			data-type="grid" 
			data-grid-callback="onGridLoad" 
			data-tpl-url="<c:url value='/static/gridTemplate/cst/cmmCustGrpSearch.xml'/>">
		</div>
		<!-- //고객그룹 그리드영역 -->
		
		<div class="mSort2 medium"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
			<ul>
				<li class="wAuto ml20">
					<div class="tit"></div>
					<div class="txt">
						
					</div>
				</li>
			</ul>
			<div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
				<a href="#" class="mBtn1 lWhite" id="btnGroupInfoSelect">그룹 선택</a>
			</div>
		</div>
    </div>
</div>

<script>
	var callFuncNm = '<c:out value="${callFuncNm}"/>';

	$("document").ready(function(){
		$("#btnGroupInfoSelect").on("click", function(){
			groupInfoSelect();
		});
	});

	function grdGroupInfo_load(grid, gridId){
		groupBasListGet();
	}

	function groupBasListGet(){
		var url = "<c:url value='${urlPrefix}/custGroup/getGroupBasList${urlSuffix}'/>";
		var param = Utilities.formToMap("frmSearch");
		grdGroupInfo.loadUrl(url,param);
	}

	function grdGroupInfo_cellDblClick(gridView,itemIndex, column,json, value){
		grdGroupInfo.check(itemIndex);
		groupInfoSelect(json.custGrpNo, json.custCnt);
	}

	function groupInfoSelect(custGrpNo, custCnt){
		if(custGrpNo != null && custCnt != null){
			groupBasInfoLoad(custGrpNo, custCnt)
		}else{
			var selectedData = grdGroupInfo.getCheckedJson();
			if (selectedData == null) {
				alert("고객그룹을 선택해주세요.");
				return false;
			}
			groupBasInfoLoad(selectedData.custGrpNo, selectedData.custCnt);
		}
	}

	function groupBasInfoLoad(custGrpNo, custCnt){
		var callbackName = "${callback}";
		if(!callbackName) callbackName = "onGropuSelect";
		
		var param = {
			custGrpNo : custGrpNo
		};
		var url = "<c:url value='${urlPrefix}/custGroup/getGroupBasInfo'/>${urlSuffix}";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "고객그룹정보 읽기에 실패했습니다.")) {
				data.custCnt = custCnt;
//console.log("고객그룹정보\n"+ JSON.stringify(data));
				var win = Utilities.getOpener();
				try{
					if(win[callbackName])
					win[callbackName](data);
				}catch(e){}
				
				Utilities.closeModal();
			}
		});
	}
</script>