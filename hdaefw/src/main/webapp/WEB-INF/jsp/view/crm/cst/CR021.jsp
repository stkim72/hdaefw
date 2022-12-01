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
<!-- 				<div class="tit">AS접수기간</div> -->
<!-- 				<div class="txt"> -->
<!-- 					<div class="mDate1"> -->
<!-- 						<input type="text" class="it date" title="AS접수 시작일" data-type="dateRangeStart" data-range-end="endDt11" id="strtDt11" name="strtDt11" data-enter="search11" data-button="Y" value=""> -->
<!-- 						<span class="bar">~</span> -->
<!-- 						<input type="text" class="it date" title="AS접수 종료일" id="endDt11" name="endDt11" data-enter="search11" data-button="Y" value=""> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</li> -->
<!-- 			<li class="wAuto"> -->
<!-- 				<div class="tit">AS완료기간</div> -->
<!-- 				<div class="txt"> -->
<!-- 					<div class="mDate1"> -->
<!-- 						<input type="text" class="it date" title="AS완료 시작일" data-type="dateRangeStart" data-range-end="endDt12" id="strtDt12" name="strtDt12" data-enter="search11" data-button="Y" value=""> -->
<!-- 						<span class="bar">~</span> -->
<!-- 						<input type="text" class="it date" title="AS완료 종료일" id="endDt12" name="endDt12" data-enter="search11" data-button="Y" value=""> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</li>			 -->
<!-- 			<li class="wAuto"> -->
<!-- 				<div class="tit">해피콜완료기간</div> -->
<!-- 				<div class="txt"> -->
<!-- 					<div class="mDate1"> -->
<!-- 						<input type="text" class="it date" title="해피콜 시작일" data-type="dateRangeStart" data-range-end="endDt13" id="strtDt13" name="strtDt13" data-enter="search11" data-button="Y" value=""> -->
<!-- 						<span class="bar">~</span> -->
<!-- 						<input type="text" class="it date" title="해피콜 종료일" id="endDt13" name="endDt13" data-enter="search11" data-button="Y" value=""> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</li>				 -->
<!-- 			<li class="wAuto"> -->
<!-- 				<div class="tit">조치</div> -->
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
<!--                         </span> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</li> -->
<!-- 		</ul> -->
<!-- 		<div class="button posRt"> 우측 정렬 : class="posRt" -->
<!--             <a href="#" data-click="search10" class="mBtn1">검색</a> -->
<!--         </div> -->
<!-- 	</div> -->
</form>
 
<div  id="divGrid11" style="height:${rightBoxHeight2}" data-grid-id="grdList11" 
	data-pagenation="N" 
	data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
	data-type="grid" 
	data-scroll-x="Y"
	data-grid-callback="onGridLoad" 
	data-tpl-url="<c:url value='/static/gridTemplate/cst/CR021.xml'/>">
</div>


<script>
/* 공통코드 그리드 load */
function grdList11_load(gridView, gridId) {
	search10();
}

function search10()
{
    var url = "<c:url value='${urlPrefix}/getCrmCustAsSubmitHistList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
	var pVal = parent.parenItgCustNo;
    //var pVal = "315954";
    if(pVal != "")
    {
    	param.itgCustNo = pVal;
    	grdList11.loadUrl(url,param);
    } 
}

/* 그리드 셀 더블 클릭 */
function onGridCellDblClick(gridView, itemIndex, column, json, value){
//	showDetail11(json); 
}

/* 상세화면 팝업 로드(수정) */
function showDetail11(json){
//	var url = "<c:url value='${urlPrefix}/cot/crmCustPhnCnslDtlHist${urlSuffix}'/>";
//	var url = "<c:url value='${urlPrefix}/cot/crmCustAsSubmitDtlHist'/>/" + "315954" + "/" + json.asSubmitNo + "/" + json.submitDate;
//	var url = "<c:url value='${urlPrefix}/sub/crmCustCntplcBas/mod${urlSuffix}'/>?cntplcSeq="+ grdList1.getJsonRow(rowIndex).cntplcSeq;
	var url = "<c:url value='${urlPrefix}/cot/crmCustAsSubmitDtlHist'/>/" + parent.parenItgCustNo + "/" + json.asSubmitNo + "/" + json.submitDate;
    Utilities.openModal(url,1300,750);
}


//setToday(); 

</script>