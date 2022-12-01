<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%>

<form role="form" id="frmSearch">
<div class="mSort2">
	<ul>
		<li class="wAuto">
			<div class="tit">정산기준월</div>
			<div class="txt">
				<div class="mDate1">
					<input type="text" data-type="month" maxlength= "6" class="it center" title="정산기준월" id="istDcsDe" name="istDcsDe" data-enter="search10" data-button="Y" value="">
				</div>
			</div>
			
		</li>
        <li class="wAuto">
            <div class="tit">수기항목 변경</div>
            <div class="txt">
                <code:commCode id="saveGb" name="saveGb" codeCd="WM010"/>
            </div>
        </li>
	</ul>
<!-- 	                <div class="gRt"> -->
<!-- 					<div class="mFlex2"> -->
<!--                         <span class="flex"> -->
<!--                                   <input type="text" id="sWord" name="sWord" class="it" data-type="searchTree" data-tree="divTree" title="조직명" value=""> -->
<!--                         </span> -->
<!--                         <a href="#;" class="mBtn1 m " data-type="searchTreeBtn" data-tree="divTree">검색</a> -->
<!--                     </div> -->
<!-- 					</div> -->
	<div class="gRt">
		<div class="mFlex2">
			<a href="#" class="mBtn1" data-click="search10">검색</a>
		</div>
	</div>
	<!-- 버튼 상하 가운데 정렬 : class="posVm" -->
<!-- 	<div class="button posVm">  -->
<!-- 		<a href="#" class="mBtn1" data-click="search10">검색</a> -->
<!-- 	</div>				 -->


</div>	
	
</form>					

<div class="mBox1">
	<div class="gTitle1">
		<h3 class="mTitle1">월별SAP(적립/소멸)</h3>
		<div class="gRt">
		    <a href="#;" class="mBtn1 r5 lPrimary" data-click="calculateStatusSAPExtinction" id="btnCalculateStatusSAPExtinction"><span>SAP IF</span></a>
			<code:btnGroup name="pointUseList" hideDelete="true" hideInsert="true" hideSave="true" dispName="월별SAP(적립/소멸)" gridId="grdList9"/>
<!-- 			<input type="text" class="it w40" id="percent" name="percent" onchange="perCentOnChange(this)"  oninput="this.value=this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');"/> -->
<!-- 			<button class="mBtn1" data-click="search" > -->
<!-- 				정산비율 적용 -->
<!-- 			</button> -->
		</div>
	</div>
		
	<div  id="divGrid9" style="height:${rightBoxHeight4}" data-grid-id="grdList9" 
		data-pagenation="Y" 
		data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
		data-type="grid" 
		data-block-ui="Y"
		data-grid-callback="onGridLoad" 
		data-tpl-url="<c:url value='/static/gridTemplate/mem/MB174.xml'/>">
	</div>
</div>
 
<%-- <div  id="divGrid9" style="height:${rightBoxHeight4}" data-grid-id="grdList9"  --%>
<!-- 	data-pagenation="Y"  -->
<%-- 	data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>"  --%>
<!-- 	data-type="grid"  -->
<!-- 	data-grid-callback="onGridLoad"  -->
<%-- 	data-tpl-url="<c:url value='/static/gridTemplate/mem/MB174.xml'/>"> --%>
<!-- </div> -->


<script>


window.onload = function(){
	$("#saveGb").val("04"); //수기항목 기본값 수기로 초기화 
}

/* 공통코드 그리드 load */
function grdList9_load(gridView, gridId) {
	search10();
}

function search10()
{
    var url = "<c:url value='${urlPrefix}/getCalculateStatusSAPExtinctionList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");

   	grdList9.loadUrl(url,param);

}

/* 그리드 셀 더블 클릭 */
function onGridCellDblClick(gridView, itemIndex, column, json, value){
// 	showDetail10(json, column); 
}

/* 상세화면 팝업 로드(수정) */
// function showDetail10(json, colNm){
	
// 	var strStrtDt = $("#strtDt").val();
// 	var strEndDt = $("#endDt").val();
// 	var url = "";
	
// 	if(colNm == "coupnCnt"){
// 		url = "<c:url value='${urlPrefix}/detailCoupon${urlSuffix}'/>?strtDt="+strStrtDt+"&endDt="+strEndDt+"&storNo="+json.storNo+"&storNm="+encodeURI(json.storNm);
// 		Utilities.openModal(url,1200,650);
// 	}else if(colNm == "pointScore"){
// 		url = "<c:url value='${urlPrefix}/detailPoint${urlSuffix}'/>?strtDt="+strStrtDt+"&endDt="+strEndDt+"&storNo="+json.storNo+"&storNm="+encodeURI(json.storNm);
// 		Utilities.openModal(url,1200,650);
// 	}
	
// }


//setToday();
function calculateStatusSAPExtinction()
{
    if (!confirm("SAP PNT 포인트적립/소멸 완료 처리를 하시겠습니까?"))
        return;
    
      var param = {
    		istDcsDe : $("#istDcsDe").val(),
            items : grdList9.getJsonRows()
    };
      
    var url = "<c:url value='${urlPrefix}/saveCalculateStatusSAPExtinction${urlSuffix}'/>";
    Utilities.getAjax(url, param, true, function(data, jqXHR) {
        if (Utilities.processResult(data, jqXHR, "SAP PNT 포인트적립/소멸 완료 처리가 실패했습니다.")) {
            alert("SAP PNT 포인트적립/소멸 완료 처리가 완료되었습니다.");
        }
    });
 }

</script>