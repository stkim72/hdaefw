<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<form role="form" id="frmSearch">
<div id="wrapIframe" class="closed"> <!-- 고객정보 닫힘 -->
		
	<div class="mGrid1">
		<!-- right -->
		<div class="gRight">
			<div class="gTitle1 line">
                <h3 class="mTitle1">부정적립 포인트 검색</h3>
            </div>
            
			<!-- sort -->
			<div class="mSort2 type2">
            
            <input type="hidden" id="itgCustNo" name="itgCustNo"/>    
				<ul>
					<li class="w20per">
						<div class="tit">기간</div>
						<div class="txt">
							<div class="mDate1">
								<input class="it data-check" type="text" data-type="dateRangeStart" data-range-end="pblsEndDt" id="pblsStaDt" name="pblsStaDt" data-enter="search" data-button="Y"/>
								<span class="bar">~</span>
								<input class="it data-check" type="text" id="pblsEndDt" name="pblsEndDt" data-enter="search" data-button="Y"/>
							</div>
						</div>
					</li>
					<li class="w15per">
						<div class="tit">매장코드</div>
						<div class="txt">
							<div class="mFlex2">
								<span class="flex"><input type="text" class="it" id="storNo" name="storNo" placeholder="전체" title="매장코드" disabled></span>
								<a href="#" class="mBtn1 lWhite" data-click="storeSearchPop">검색</a>
							</div>
						</div>
					</li>
					<li class="w15per">
						<div class="tit">매장명</div>
						<div class="txt">
							<input type="text" class="it" id="storNm" name="storNm" placeholder="전체" disabled/>
						</div>
					</li>
				</ul>
				
				<ul>
					<li class="w20per">
						<div class="tit">회원명</div>
						<div class="txt">
							<div class="mFlex2">
								<span class="flex"><input type="text" class="it" id="custNm" name="custNm" placeholder="전체" title="회원명" disabled></span>
								<a href="#" class="mBtn1 lWhite" data-click="searchPop">검색</a>
							</div>
						</div>
					</li>
					<li class="w15per">
						<div class="tit">채널코드</div>
						<div class="txt">
							<div class="mFlex2">
								<span class="flex"><input type="text" class="it" id="pblsChlCd" name="pblsChlCd" placeholder="전체" title="채널코드"></span>
								<!-- <a href="#" class="mBtn1 lWhite" data-click="1111">검색</a> -->
							</div>
						</div>
					</li>
					<li class="w15per">
						<div class="tit">사용구분</div>
						<div class="txt">
							<code:commCode id="useTypeCd" name="useTypeCd" codeCd="PO010" prefixLabel="전체" prefixValue=""/>
						</div>
					</li>
					<li class="w15per">
						<div class="tit">이벤트명</div>
						<div class="txt">
							<code:commCode id="pblsDivCd" name="pblsDivCd" codeCd="EV100" prefixLabel="전체" prefixValue=""/>
						</div>
					</li>
					<div class="right">
						<button class="mBtn1" data-click="initSearch" style="margin-right: 5px">초기화</button>
						<button class="mBtn1" data-click="search" style="margin-right: 10px">검색</button>
					</div>
				</ul>
				
			</div>
			
			<div class="gTitle1">
		    	<h3 class="mTitle1">부정적립 포인트 목록</h3>
			</div>
			<div id="divGrid"  style="height:${rightBoxHeight4}" data-grid-id="grdList" 
			                                        data-pagenation="Y" 
			                                        data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
			                                        data-type="grid" 
			                                        data-block-ui="Y"
			                                        data-grid-callback="onGridLoad" 
			                                        data-tpl-url="<c:url value='/static/gridTemplate/mem/MB022.xml'/>"
			>
			</div>
			
		</div>
		<!-- //right -->
	</div>
	
</div>
</form>


<script>

window.onload = function(){
	dateSetting();
}

function dateSetting(){
	var strStartDay= moment().subtract(1, 'month').format('YYYYMMDD');
    var strEndDay = moment().format("YYYYMMDD");
    
    $("#pblsStaDt").val(strStartDay);
    $("#pblsEndDt").val(strEndDay);
}

/* 검색조건 초기화 */
function initSearch(){
	Utilities.mapToForm({}, "frmSearch");
	// hidden 필드 초기화
	$("#itgCustNo").val("");
	grdList.clear();
}

/* 포인트 발생 목록 조회 */
function search(){
	var valid = validateForm("#frmSearch"); //  class='data-check' 인 경우만 체크
	if(!valid) {
		alert("필수 항목들을 기입해 주세요.");
		return;
	}
	
	var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    grdList.loadUrl(url,param);
}

/* 그리드 로드 */
function grdList_load(gridView,gridId){
    //search();
}

/* 그리드 셀 더블 클릭 */
function onGridCellDblClick(gridView, itemIndex, column, json, value){
	showDetail(json); 
}

/* 상세화면 팝업 로드(수정) */
function showDetail(json){
	var url = "<c:url value='${urlPrefix}/detail'/>/" + json.pointHstSeq;
    Utilities.openModal(url,1000,640);
}

var strBeforePoint = 0;
var strRemainPoint = 0;

/* 그리드 셀(포인트발생내역) 클릭 */
/*
function grdList_cellClick(gridView, itemIndex, column, index, field){
	
	if(column == "occurPointScore"){
		var bConfirm = confirm("증감 내역을 수정하시겠습니까?");
		if(!bConfirm){
			return;
		}
		
		strBeforePoint = grdList.getValue(itemIndex, "occurPointScore");
		strRemainPoint = grdList.getValue(itemIndex, "remainPointScore");
		
		var callbackName = "updateOccurPointScore";
		var url = "/pointIssue/IncreasePop?callback=" + callbackName;
		Utilities.openModal(url,220,180);
	}
}
*/

/* 증감 내역 팝업 종료 후처리 */
/*
function updateOccurPointScore(strOccurPointScore){
	var { rowKey, columnName } = grdList.getFocusedCell();
	
	strRemainPoint = Number(strRemainPoint) - Number(strBeforePoint) + Number(strOccurPointScore);
	
	grdList.setValue(rowKey, columnName, strOccurPointScore, false);
	grdList.setValue(rowKey, "remainPointScore", strRemainPoint, false);
	
	var saveJson = grdList.getSaveJson();
	
	var url = "<c:url value='${urlPrefix}/savePointScoreList${urlSuffix}'/>";
	Utilities.getAjax(url, saveJson, true, function(data, jqXHR) {
		if (Utilities.processResult(data, jqXHR, "오류로 인해 포인트 증감 내역이 수정되지 않았습니다.")) {
			alert("포인트 증감 내역이 수정되었습니다.");
		}
	});
	
	search();
}
*/

/* 회원목록 검색 팝업 로드 */
function searchPop(){
	var url = "/util/searchCust";
    Utilities.openModal(url,1000,500);
}

/* 회원목록 검색 팝업 종료 후처리 */
function custNmSelect(data){
	$("#itgCustNo").val(data.itgCustNo);
	$("#custNm").val(data.custNm);
}

/* 매장목록 검색 팝업 로드 */
function storeSearchPop(){
	Utilities.openStorePop("storeSearchInfoGet");
}

/* 매장목록 검색 팝업 종료 후처리 */
function storeSearchInfoGet(data){
	if(data != null){
		if(data.storNo == $('#storNo').val()){
			alert("같은 매장입니다.");
			return false;
		}
		
		$('#storNo').val(data.storNo);
		$('#storNm').val(data.storNm);
	}
}

</script>