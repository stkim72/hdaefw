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
            <h3 class="mTitle1">스탬프 발행 검색</h3>
        </div>
        
        <!-- sort -->
        <div class="mSort2 type3">
        
         <form role="form" id="frmSearch" name="frmSearch">
            <div class="row">
                <ul>
                	
                	<li class="w25per">
                        <div class="tit">스탬프 마스터코드</div>
                        <div class="txt">
                            <input type="text" class="it w200" title="스탬프 발행명" name="stmpBasCd" id="stmpBasCd"   value="">
                        </div>
                    </li>
                    
                	<li class="w25per">
                        <div class="tit">스탬프 마스터 명</div>
                        <div class="txt">
                            <input type="text" class="it w200" title="스탬프 발행명" name="stmpBasNm" id="stmpBasNm"   value="">
                        </div>
                    </li>
                
                    <li class="w12per">
                        <div class="tit w85">채널</div>
                        <div class="txt">
                            <code:commCode  className="select" id="accumChl" name="accumChl" codeCd="ST040" prefixLabel="전체" prefixValue=""/>
                        </div>
                    </li>
                    <li class="w12per">
                        <div class="tit w85">스탬프유형</div>
                        <div class="txt">
                        	<select name="stmpEventCd" id="stmpEventCd" class='select wAuto'>
                        		<option value="">전체</option>
                        		<option value="0">결제 시 적립</option>
                        		<option value="1">이벤트 시 적립</option>
                        	</select>
                        </div>
                    </li>
                    
                    <li class="w30per">
                        
                        <div class="tit">적립기간</div>
                        <div class="mDate11">
                          <input type="text" class="it w80 data-check" title="기간 시작일"  data-type="dateRangeStart" data-range-end="toPblsStdDay"  data-button="Y"  name="fromPblsStdDay" id="fromPblsStdDay" value="">
                                    
                            <span class="bar">~</span>
				                        
						<input type="text" class="it  w80 data-check" title="기간 마지막일" name="toPblsStdDay" id="toPblsStdDay" data-button="Y"  value="">
                        </div>
                    </li>
                    
                </ul>
            </div>
            <div class="row">
                <ul>
                	<!-- <li class="w25per">
                        <div class="tit">매장 명</div>
                        <div class="txt">
                            <input type="text" class="it w200" title="상품 명" name="storNm" id="storNm"   value="">
                        </div>
                    </li> -->
                    <li class="w25per">
                        <div class="tit">통합고객번호</div>
                        <div class="txt">
                            <input type="text" class="it w200" title="회원코드" name="itgCustNo" id="itgCustNo"   value="">
                        </div>
                    </li>
                    <li class="w20per">
                        <div class="tit">회원명</div>
                        <div class="txt">
                            <input type="text" class="it w200" title="회원명" name="custNm" id="custNm"   value="">
                        </div>
                    </li>
                     
                  	<%-- <li class="w12per">
                        <div class="tit w85">상태</div>
                        <div class="txt">
                            <code:commCode  className="select" id="useYn" name="useYn" codeCd="S010" prefixLabel="전체" prefixValue=""/>
                        </div>
                    </li> --%>
                    <div class=" "> <!-- 버튼 상하 가운데 정렬 : class="posVm" -->
			                <a href="#" class="mBtn1" data-click="search">검색</a>
			            </div>
                </ul>
            </div>
            
            </form>
        </div>
        <!-- //sort -->
        
        <div class="gTitle1">
            <h3 class="mTitle1">스탬프 발행 목록</h3>
            <!-- <div class="gRt">
                <a href="#" class="mBtn1 lWhite" data-click="cpyCoupon">복사</a>
                <a href="#" class="mBtn1 lPrimary" data-click="newCoupon">신규등록</a>
            </div> -->
        </div>
        


		<div id="divGrid" style="height:520px"
		  data-post="Y"
		  data-grid-id="grdList"
		  data-pagenation="Y"
		  data-get-url="<c:url value='/example/getList'/>"
		  data-type="grid"
		  data-block-ui="Y"
		  data-tpl-url="<c:url value='/static/gridTemplate/memship/crmMshipStmpIssue.xml'/>"
		  >
		</div>
        
    </div>
    <!-- //cont -->
	                  



<script>
var _current_code_cd = null;

window.onload = function(){
	dateSetting();
}

function dateSetting(){
	var strStartDay= moment().subtract(1, 'month').format('YYYYMMDD');
    var strEndDay = moment().format("YYYYMMDD");
    
    $("#fromPblsStdDay").val(strStartDay);
    $("#toPblsStdDay").val(strEndDay);
}

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

	/* var url = "<c:url value='${urlPrefix}/add${urlSuffix}'/>?mshipStmpBasNo="+ gridView.getCurrentJson().mshipStmpBasNo ;
	Utilities.openModal(url, "100%", 1800); */
	//location.href = url;

}


/* 그리드 컬럼 더블 클릭 */
function onGridCellDblClick(gridView, rowIndex, columnName, colIndex,
		fieldIndex) {

}

function onGridRowChanged(gridView, oldRow, newRow) {

}

/* 검색조건 검색 */
function search() {
	var valid = validateForm("#frmSearch"); //  class='data-check' 인 경우만 체크
	if(!valid) {
		alert("필수 항목들을 기입해 주세요.");
		return;
	}
	
	$("form#frmSearch").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/searchStmpList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmSearch");
	param.recordCountPerPage = 30;
	grdList.loadUrl(url, param);
}


</script>

