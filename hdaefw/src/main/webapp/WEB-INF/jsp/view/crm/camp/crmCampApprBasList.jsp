<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 






<div id="wrapIframe" class="closed"> <!-- 고객정보 닫힘 -->
		
    <!-- cont -->
    <div class="cont">
        
        <div class="gTitle1 line">
            <h3 class="mTitle1">캠페인 검색</h3>
        </div>

			
 
 
			<!-- sort -->
			<div class="mSort2">
			
			
 <form role="form" id="frmSearch" name="frmSearch">
 
 
				<ul>
				
					<li class="w32per">
						<div class="tit">캠페인유형</div>
						<div class="txt">
							<div class="mFlex2">
								<code:commCode  className="select w160" id="campTypeCd" name="campTypeCd" codeCd="CM010" prefixLabel="캠페인유형" prefixValue=""/>
							</div>
						</div>
					</li>
					<li class="w16per">
						<div class="tit">캠페인형태</div>
						<div class="txt">
							
							<code:commCode  className="select w160" id="campShapCd" name="campShapCd" codeCd="CM020" prefixLabel="캠페인형태" prefixValue=""/>
						</div>
					</li>
					<%-- <li class="w16per">
						<div class="tit">차수</div>
						<div class="txt">
							<code:commCode  className="select w160" id="campExecCnt" name="campExecCnt" codeCd="CM030" prefixLabel="차수" prefixValue=""/>
						</div>
					</li> --%>
					<%-- <li class="w16per">
						<div class="tit">캠페인상태</div>
						<div class="txt">
							
							<code:commCode  className="select w160" id="campStatusCd" name="campStatusCd" codeCd="CM040" prefixLabel="캠페인상태" prefixValue=""/>
						</div>
					</li> --%>
					<li class="w100per">
						<div class="tit">캠페인명</div>
						<div class="txt">
							<input type="text" class="it w485" title="캠페인명"  id="campBasNm" name="campBasNm"  value="">
						</div>
					</li>
					<li class="w100per">
						<div class="tit">캠페인 시작일</div>
						<div class="txt">
						
							<div class="mDate1">
								<input type="text" class="it date" title="캠페인 시작일"  data-type="dateRangeStart" data-range-end="campEndYmd"   id="campStaYmd" name="campStaYmd" value="">
								<span class="bar">~</span>
								<input type="text" class="it date" title="캠페인 마지막일" data-button="Y"   id="campEndYmd" name="campEndYmd"  value="">
							</div>
						</div>
					</li>
				</ul>
				<div class="button">
					<a href="#" class="mBtn1"  data-click="search">검색</a>
				</div>
				
				</form>
			</div>
			<!-- //sort -->


			<!-- box -->
				
				<div class="gTitle1">
					<h3 class="mTitle1">캠페인 승인대상 목록</h3>
					<div class="gRt">
						<a href="#" class="mBtn1 lWhite"  onclick="authCampainY()">승인</a>
						<a href="#" class="mBtn1 primary" onclick="authCampainN()">반려</a>
					</div>
				</div>
				
				
						<div id="divGrid" style="height:520px"
						  data-post="Y"
						  data-grid-id="grdList"
						  data-pagenation="Y"
                    	data-block-ui="Y"
						  data-get-url="<c:url value='/crmCampBas/getApprList'/>"
						  data-type="grid" 
						  data-tpl-url="<c:url value='/static/gridTemplate/camp/crmCampApprBas.xml'/>"
						  >
						</div>
						
			
</div>




<script>


/* 공통코드 그리드 load */
function grdList_load(gridView, gridId) {
	search();
}

/* 하부코드 그리드 load */
function grdDetail_load(gridView, gridId) {
}

/* 공통코드 Row클릭 시 */
function grdList_rowChanged(grdList, oldRow, newRow, rowData) {
	
}


function onGridLoad(gridView, gridId) {
}



/* 그리드 컬럼 클릭 */
function onGridCellClick(gridView, rowIndex, columnName, colIndex, fieldIndex) {

}

function grdList_cellClick(gridView, itemIndex, column, index, field){


}


/* 그리드 컬럼 더블 클릭 */
function onGridCellDblClick(gridView, itemIndex, column, json, value){
	// 상위 캠페인이 있다면 
	if( gridView.getCurrentJson().prntsCampBasNo != null ){		
		var url = "<c:url value='${urlPrefix}/add2th${urlSuffix}'/>?campBasNo="+ json.prntsCampBasNo +"&lowRspnCampNo="+ json.campBasNo +"&lowRspnDnaCampNo="+ json.campBasNo +"&prntsCampBasNo="+ json.prntsCampBasNo +"&rspnApplyYn="+ json.rspnApplyYn;		
		
	}else{
		var url = "<c:url value='${urlPrefix}/add${urlSuffix}'/>?campBasNo="+ json.campBasNo ;
	}
	
	Utilities.openModal(url, 1200, 600);	
}


function onGridRowChanged(gridView, oldRow, newRow) {

}

/* 검색조건 검색 */
function search() {
	$("form#frmSearch").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getApprList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmSearch");
	param.recordCountPerPage = 20;
	grdList.loadUrl(url, param);
}

//  캠페인 중지
function authCampainY(statusCd){
	
	var saveJson = grdList.getCheckedJson();
	
	if( saveJson.length == 0){
		alert("승인할 캠페인을 선택해 주세요.");
		return false;
	}

	var statChk = "";
	for(var i=0 ; i < saveJson.length ; i++ ){
		
		
		if( saveJson[i].campStatusCd != "001" ){
			statChk += "'"+ saveJson[i].campBasNm +"'\n";
			saveJson.splice(i, 1); 
			i--; 
			
		}else{
			
			saveJson[i].stat="U";
			saveJson[i].campStatusCd="002";	
			
		} 	 	
		
	}
	
	if(statChk != ""){
		alert( "아래 승인 요청이 아닌 캠페인은 제외됩니다. \n\n"+ statChk );
		
	}
	
	var url = "<c:url value='${urlPrefix}/saveList${urlSuffix}'/>";
	Utilities.getAjax(url, saveJson, true, function(data, jqXHR) {
		if (Utilities.processResult(data, jqXHR, "캠페인 승인에 실패했습니다.")) {
			alert("캠페인 승인을 완료하였습니다.");
				search();
		}
	});
	
}

// 캠페인 반려
function authCampainN(){
	
	var saveJson = grdList.getCheckedJson();
	
	if( saveJson.length == 0){
		alert("반려할 캠페인을 선택해 주세요.");
		return false;
	}

	var statChk = "";
	for(var i=0 ; i < saveJson.length ; i++ ){

		
		if( saveJson[i].campStatusCd != "001" ){
			statChk += "'"+ saveJson[i].campBasNm +"'\n";

			saveJson.splice(i, 1); 
			i--; 
			
		}else{
			saveJson[i].stat="U";
			saveJson[i].campStatusCd="005";	
		} 	
		
	}
	
	
	if(statChk != ""){
		alert( "아래 캠페인은 제외됩니다. \n\n"+ statChk );
		
	}
	
	var url = "<c:url value='${urlPrefix}/saveList${urlSuffix}'/>";
	Utilities.getAjax(url, saveJson, true, function(data, jqXHR) {
		if (Utilities.processResult(data, jqXHR, "캠페인 반려처리를 실패했습니다.")) {
			alert("캠페인 반려처리를 완료하였습니다.");
				search();
		}
	});
}

</script>