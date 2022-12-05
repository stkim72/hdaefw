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
        

			<div class="mSort2 type3">
			
 <form role="form" id="frmSearch" name="frmSearch" autocomplete="off">
 
			<!-- sort -->
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
					<li class="w16per">
						<div class="tit">차수</div>
						<div class="txt">
							<code:commCode  className="select w160" id="campExecCnt" name="campExecCnt" codeCd="CM030" prefixLabel="차수" prefixValue=""/>
						</div>
					</li>
					<li class="w16per">
						<div class="tit">캠페인상태</div>
						<div class="txt">
							
							<code:commCode  className="select w160" id="campStatusCd" name="campStatusCd" codeCd="CM040" prefixLabel="캠페인상태" prefixValue=""/>
						</div>
					</li>
					
					<li class="w50per">
						<div class="tit">캠페인번호</div>
						<div class="txt">
							<input type="text" class="it w200" title="캠페인명"  id="campBasNo" name="campBasNo"  value="">
						</div>
						
						<div class="tit">캠페인명</div>
						<div class="txt">
							<input type="text" class="it w200" title="캠페인명"  id="campBasNm" name="campBasNm"  value="">
						</div>
					</li>
					
				
					<li class="w100per">
						<div class="tit">캠페인 시작일</div>
						<div class="txt">
						
							<div class="mDate1">
								<input type="text" class="it date" title="캠페인 시작일"  data-type="dateRangeStart" data-range-end="campEndYmd"   id="campStaYmd" name="campStaYmd" value="" autocomplete="off">
								<span class="bar">~</span>
								<input type="text" class="it date" title="캠페인 마지막일" data-button="Y"   id="campEndYmd" name="campEndYmd"  value="" autocomplete="off">
							</div>
						</div>
					</li>
				</ul>
				<div class="button">
					<a href="#" class="mBtn1"  data-click="search">검색</a>
				</div>
				
				
				</form>

		</div>
			
		
	
	
	
			<!-- box -->

				<div class="gTitle1" >
					<h3 class="mTitle1">캠페인 목록</h3>
					<div class="gRt">
						 <a href="#" class="mBtn1 lWhite" data-auth-type="c" style="display:none"  data-click="cpyCamp">복사</a>
               			 <a href="#" class="mBtn1 lPrimary" data-auth-type="c" style="display:none"  data-click="newCamp">신규등록</a>
					</div>
				</div>
				<!-- board -->
			
                    <!--
                        class="hSortRow3"   => 상단 검색이 3줄 일 경우
                        class="pType1"      => td height="30px"
                    -->
						<div id="divGrid" style="height:520px"
						  data-post="Y"
						  data-grid-id="grdList"
						  data-pagenation="Y"
                    	data-block-ui="Y"
						  data-get-url="<c:url value='/cmmCampBas/getList'/>"
						  data-type="grid" 
						  data-tpl-url="<c:url value='/static/gridTemplate/camp/cmmCampBas.xml'/>"
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


function cpyCamp(){
	
	var saveJson = grdList.getCheckedJson();
	
	
	if( saveJson[0].campStatusCd != "001" &&  saveJson[0].campStatusCd != "004" ){
		alert("캠페인 상태가 '중지' 또는 '승인요청' 인 캠페인만 복사할 수 있습니다. 캠페인을 복사하려면 상태를 변경하세요.");
		return;
	}
	
	
	if (saveJson.length == 0) {
		alert("복사할 캠페인을 선택해주세요.");
		return;
	}
	
	if( saveJson.length > 1){
		alert("복사할 캠페인 한개만 선택해 주세요.");
		return;
	}
	
	
	if( typeof(saveJson[0].prntsCampBasNo) != 'object' ){
		alert("2차 캠페인은 복사가 불가능 합니다.");
		return;
	}
	


	saveJson[0].stat = "C";
	saveJson[0].campBasNo = null;
	saveJson[0].lowRspnCampNo = null;
	saveJson[0].lowRspnCampNo = null;
	saveJson[0].lowRspnDnaCampNo = null;
	
	if (saveJson.length) {
		
		if (!confirm("캠페인 기본 코드는 자동으로 생성됩니다. \n\n선택된 캠페인을 복사하시겠습니까?"))
			return;
		
		var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
		Utilities.getAjax(url, saveJson[0], true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "캠페인 복사가 실패했습니다.")) {
				alert("캠페인 복사가 완료되었습니다.");
					search();
			}
		});
	} else {
		alert("선택된 데이터가 없습니다.");
	}
	
}

/* 그리드 셀 더블 클릭 */
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
 	var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmSearch");
	param.recordCountPerPage = 20;
	grdList.loadUrl(url, param);
}

/* 캠페인상세 */
function newCamp(){
 	var url = "<c:url value='${urlPrefix}/add${urlSuffix}'/>?campBasNo=";
 	// openModal :function(url,width,height,callFunc,callbackFunc,callbackWin)
 	Utilities.openModal(url, 1200, 600);
 	//Utilities.windowOpen(url,  900, 730);
}

/* 대분류 저장 */
function saveCode(){
	saveCodeList(grdList);
}



</script>