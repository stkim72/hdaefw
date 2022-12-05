<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%>

<form role="form" id="frmSearch">
<!-- 	<div class="mSort2 medium"> -->
<!-- 		<ul> -->
<!-- 			<li class="wAuto"> -->
<!-- 				<div class="tit">HC이력</div> -->
<!-- 				<div class="txt"> -->
<!-- 					<div class="mDate1"> -->
<!-- 						<input type="text" class="it date" title="계약 시작일" data-type="dateRangeStart" data-range-end="endDt" id="strtDt" name="strtDt" data-enter="search" data-button="Y" value=""> -->
<!-- 						<span class="bar">~</span> -->
<!-- 						<input type="text" class="it date" title="계약 종료일" id="endDt" name="endDt" data-enter="search" data-button="Y" value=""> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</li> -->
<!-- 			<li class="wAuto"> -->
<!-- 				<div class="tit">온/오프구분</div> -->
<!-- 				<div class="txt"> -->
<!-- 					<div class="mFlex2"> -->
<!-- 						<span class="flex"> -->
<%--                         	<code:commCode name="callTy" id="callTy" codeCd="CU210" prefixLabel="전체" prefixValue=""/> --%>
<!--                         </span> -->
                              
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</li> -->
<!-- 			<li class="wAuto"> -->
<!-- 				<div class="tit"></div> -->
<!-- 				<div class="txt"> -->
<!-- 					<div class="mFlex2"> -->
<!-- 						<span class="flex"> -->
<!-- 							<input type="text" class="it" title=제품명 name="godsNm" id="godsNm" data-enter="search27"> -->
<!--                         </span> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</li> -->
<!-- 		</ul> -->
<!-- 		<div class="button posRt"> 우측 정렬 : class="posRt" -->
<!--             <a href="#" data-click="search27" class="mBtn1">검색</a> -->
<!--         </div> -->
<!-- 	</div> -->
</form>
 
<div  id="divGrid27" style="height:${rightBoxHeight2}"  data-grid-id="grdList27" 
	data-pagenation="N" 
	data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
	data-type="grid" 
	data-grid-callback="onGridLoad" 
	data-tpl-url="<c:url value='/static/gridTemplate/cst/CR024.xml'/>">
</div>


<script>
/* 공통코드 그리드 load */
function grdList27_load(gridView, gridId) {
	search27();
}

function search27()
{
    var url = "<c:url value='${urlPrefix}/getCrmCustBosHcHstList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    if(parent.parenItgCustNo != "")
    {
    	param.itgCustNo = parent.parenItgCustNo;
    	grdList27.loadUrl(url,param);
    } 
}

/* 그리드 셀 더블 클릭 */
function onGridCellDblClick(gridView, itemIndex, column, json, value){
	//showDetail12(json); 
}

/* 상세화면 팝업 로드(수정) */
function showDetail27(json){
// //	var url = "<c:url value='${urlPrefix}/cot/cmmCustPhnCnslDtlHist${urlSuffix}'/>";
// 	var url = "<c:url value='${urlPrefix}/trn/cmmCustBosCntrtTxnDtlHist'/>/" + json.cnslHistNo + "/" + json.aspCustKey + "/" + json.itgCustNo;
// //	var url = "<c:url value='${urlPrefix}/sub/cmmCustCntplcBas/mod${urlSuffix}'/>?cntplcSeq="+ grdList1.getJsonRow(rowIndex).cntplcSeq;
//     Utilities.openModal(url,1000,600);
}


//setToday(); 

</script>