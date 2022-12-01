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
			<div class="tit">거래일</div>
			<div class="txt">
				<div class="mDate1">
					<input type="text" class="it date" title="계약 시작일" data-type="dateRangeStart" data-range-end="endDt" id="strtDt" name="strtDt" data-enter="search10" data-button="Y" value="">
					<span class="bar">~</span>
					<input type="text" class="it date" title="계약 종료일" id="endDt" name="endDt" data-enter="search10" data-button="Y" value="">
				</div>
			</div>
		</li>
		<li class="wAuto">
<!-- 			<div class="tit w105">매장명</div> -->
<!-- 			<div class="txt"> -->
<!-- 				<input type="text" class="it" id="storNo" name="storNo" value="" /> -->
<!-- 			</div> -->
          	<div class="tit">매장명</div>
			<a href="#;" data-click="storeSearchPop" class="mBtn1 m lWhite" style="cursor: pointer;">매장검색</a>
			<a href="#;" data-click="storeAllRemove" class="mBtn1 m lGray" style="cursor: pointer;">전체삭제</a>		
		</li>	
		
	</ul>
	<ul>
		<li class="wAuto">
			<div class="tit"></div>
			<div class="txt">
				<div class="mDate1">

				</div>
			</div>
		</li>	
		<li class="w50per">
			<div class="tit"></div>
            <span class="flex">
				<input type="text" id="rcmdStorNo" name="rcmdStorNo" data-type="storeSelect" data-max-cnt="10" readonly />
            </span>
		</li>		
	</ul>
	<div class="gRt">
		<div class="mFlex2">
			<a href="#" class="mBtn1" data-click="search10">검색</a>
		</div>
	</div>
<!-- 	<div class="button posVm"> 버튼 상하 가운데 정렬 : class="posVm" -->
<!-- 		<a href="#" class="mBtn1" data-click="search10">검색</a> -->
<!-- 	</div>				 -->
<!-- 	<div > -->
<!-- 		<input type="text" id="rcmdStorNo" name="rcmdStorNo" data-type="storeSelect" data-max-cnt="10" readonly /> -->
<!-- 	</div> -->

</div>	
	
</form>					
 
<div class="mBox1">
	<div class="gTitle1">
		<h3 class="mTitle1">기간별정산현황</h3>
		<div class="gRt">
			<code:btnGroup name="pointUseList" hideDelete="true" hideInsert="true" hideSave="true" dispName="기간별정산현황" gridId="grdList9"/>
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
		data-tpl-url="<c:url value='/static/gridTemplate/mem/MB053.xml'/>">
	</div>
</div> 



<script>

/* 화면 로드 */
window.onload = function(){
	var today = moment();
	var todayMonth = today.format("YYYYMM");
    var todayYmd = today.format("YYYYMMDD");
    $('#strtDt').val(todayMonth+"01");
    $('#endDt').val(todayYmd);
}

/* 공통코드 그리드 load */
function grdList9_load(gridView, gridId) {
	//search10();
}

function search10()
{
    var url = "<c:url value='${urlPrefix}/getCalculateStatusList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");

   	grdList9.loadUrl(url,param);

}

/* 그리드 셀 더블 클릭 */
function onGridCellDblClick(gridView, itemIndex, column, json, value){
// 	showDetail10(json, column); 
}

/* 상세화면 팝업 로드(수정) */
function showDetail10(json, colNm){
	
	var strStrtDt = $("#strtDt").val();
	var strEndDt = $("#endDt").val();
	var url = "";
	
	if(colNm == "coupnCnt"){
		url = "<c:url value='${urlPrefix}/detailCoupon${urlSuffix}'/>?strtDt="+strStrtDt+"&endDt="+strEndDt+"&storNo="+json.storNo+"&storNm="+encodeURI(json.storNm);
		Utilities.openModal(url,1200,650);
	}else if(colNm == "pointScore"){
		url = "<c:url value='${urlPrefix}/detailPoint${urlSuffix}'/>?strtDt="+strStrtDt+"&endDt="+strEndDt+"&storNo="+json.storNo+"&storNm="+encodeURI(json.storNm);
		Utilities.openModal(url,1200,650);
	}
	
}

//==================================================== 매장검색관련함수 시작
//매장팝업을 호출한다
function storeSearchPop(){
	console.log("매장팝업 호출 : "  );
	Utilities.openStorePop("storeSearchInfoGet", "Y");
}
// 매장팝업의 콜백함수
function storeSearchInfoGet(data){
	if(data != null){
		var storeNoStr = "";
		for(key in data) {
			storeNoStr += ","+ data[key].storNo;
		}
		storeNoStr = storeNoStr.substr(1, storeNoStr.length)
		storeInfoSetting($('#frmSearch [name="rcmdStorNo"]')[0], storeNoStr);
	}
	console.log(" 매장번호 : " , $("#rcmdStorNo").val());
}

// 전체매장 삭제버튼 함수
function storeAllRemove(){
	var storeNoStr = $('#frmSearch [name="rcmdStorNo"]')[0].selectize;
	storeNoStr.clear();
	storeNoStr.clearOptions();
}

// 매장 데이터 셋팅
function storeInfoSetting(element, storeList){
	var storeSelt = element.selectize;
	var storeMap = element.storeMap;
    var maxItems = $(element).data("maxCnt");
    if(!maxItems || maxItems < 0)
    	maxItems = 10000;

	if(storeList != null && storeList != ""){
		var orgList = storeSelt.getValue();
		if(orgList.length > 0){
			orgList += ",";
		}
		var totList = orgList + storeList;
		var totArr = totList.split(",");
		var totOpts = [];
		var totMaps = {};
		var totItems = [];
		var itemLeft = false;
		for(var i=0; i<totArr.length ; i++){
			if(totMaps[totArr[i]])
				continue;
			totMaps[totArr[i]] = storeMap[totArr[i]];
			totOpts.push(storeMap[totArr[i]]);
			totItems.push(totArr[i]);
			if(maxItems <= totOpts.length)
			{
				itemLeft = maxItems < totArr.length;
				break;
			}
		}
		storeSelt.addOption(totOpts);
		storeSelt.setValue(totItems);
		if(itemLeft){
			alert("최대 " + maxItems + " 개 매장만 추가 가능합니다." )
		}
	}
}
//==================================================== 매장검색관련함수 끝

//setToday(); 

</script>