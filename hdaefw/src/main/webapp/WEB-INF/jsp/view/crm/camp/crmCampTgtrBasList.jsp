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
            <h3 class="mTitle1">캠페인 고객 조회</h3>
        </div>
        

			<div class="mSort2 type3">
			
 <form role="form" id="frmSearch" name="frmSearch">
 
			<!-- sort -->
				<ul>
			
				
					<li class="w100per">
					
						<div class="tit">캠페인번호</div>
						<div class="txt">
							<input type="text" class="it w485" title="캠페인번호"  id="campBasNo" name="campBasNo"  value="">
						</div>
						
						
						<div class="tit">캠페인명</div>
						<div class="txt">
							<input type="text" class="it w485" title="캠페인명"  id="campBasNm" name="campBasNm"  value="">
						</div>
					</li>
					
					<li class="w100per">
						<div class="tit">고객그룹명</div>
						<div class="txt">
							<input type="text" class="it w485" title="그룹명"  id="custGrpNm" name="custGrpNm"  value="">
						</div>
					</li>
					
					
					<li class="w100per">
					
					<div class="tit">통합고객번호</div>
						<div class="txt">
							<input type="text" class="it w485" title="고객명"  id="itgCustNo" name="itgCustNo"  value="">
						</div>
						
						
						<div class="tit">고객명</div>
						<div class="txt">
							<input type="text" class="it w485" title="고객명"  id="custNm" name="custNm"  value="">
						</div>
					</li>
					
					<li class="w100per">
						<div class="tit">등록일자</div>
						<div class="txt">
							<div class="mDate1">
								<input type="text" class="it date" title="캠페인 시작일"  data-type="dateRangeStart" data-range-end="hstEndYmd"   id="hstStaYmd" name="hstStaYmd" value="">
								<span class="bar">~</span>
								<input type="text" class="it date" title="캠페인 마지막일" data-button="Y"   id="hstEndYmd" name="hstEndYmd"  value="">
							</div>
						</div>
					</li>
					
					
					
				</ul>
				<div class="button">
					<button type="submit" class="mBtn1"  data-click="search">검색</button>
				</div>
				
				
				</form>

		</div>
			
		
	
	
	
			<!-- box -->

				<div class="gTitle1" >
					<h3 class="mTitle1">캠페인 그룹 고객 목록</h3>
					<div class="gRt">
						<!--  <a href="#" class="mBtn1 lWhite" data-click="cpyCamp">복사</a>
               			 <a href="#" class="mBtn1 lPrimary" data-click="newCamp">신규등록</a> -->
               			  <a href="#" class="mBtn1 gray" data-click="getDownloadReason">엑셀다운로드</a>
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
						  data-get-url="<c:url value='/crmCampTgtrBas/getList'/>"
						  data-type="grid" 
						  data-tpl-url="<c:url value='/static/gridTemplate/camp/crmCampTgtrBas.xml'/>"
						  >
					
				
	</div>
</div>





<script>


/* 공통코드 그리드 load */
function grdList_load(gridView, gridId) {
	//search();
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


/* 그리드 셀 더블 클릭 */
function onGridCellDblClick(gridView, itemIndex, column, json, value){

}




function onGridRowChanged(gridView, oldRow, newRow) {

}


function getDownloadReason(){
    Utilities.textDialog("","개인정보 다운로드 사유를 적으세요",false,700,500);
}

function changeText(reason){ 
    if(!reason)
        return;
    var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    param.indiInfoHandlPrsnNo = "${LOGIN_USER.userCd}";
    param.connPrsnIpAddr = "${peerIpAddr}";
    param.dnldTxn = reason;
    param.pfmWorkCd = "003";
    grdList.exportExcel("캠페인고객그룹목록.xlsx",true,url,param)
//  param.recordCountPerPage = 100000;
//     grdList.ex(url, param);
}



/* 검색조건 검색 */
function search() {
	$("form#frmSearch").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmSearch");
	param.recordCountPerPage = 20;
	grdList.loadUrl(url, param);
}



</script>