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
            <h3 class="mTitle1">쿠폰 발행 검색</h3>
        </div>
        
        <!-- sort -->
        <div class="mSort2 type3">
        
         <form role="form" id="frmSearch" name="frmSearch" onsubmit="searchCoupnIssue();return false;">
            <div class="row">
                <ul>
                	
                	<li class="wAuto">
                        <div class="tit w80">쿠폰리스트</div>
						<div class="txt w120">
						   <code:commCode  className="select" id="coupnTypeCd" name="coupnTypeCd" codeCd="MB080" prefixLabel="선택" prefixValue=""/>
						</div>
                    </li>
                    
                	<li class="wAuto">
                        <div class="tit w80">쿠폰발급방식</div>
						<div class="txt w120">
							<code:commCode  className="select" id="coupnClassCd" name="coupnClassCd" codeCd="MB120" prefixLabel="선택" prefixValue=""/>
						</div>
                    </li>
                
                    <li class="wAuto">
                        <div class="tit w80">쿠폰대상</div>
						<div class="txt w120">
							<code:commCode  className="select" id="coupnTgtCd" name="coupnTgtCd" codeCd="MB100" prefixLabel="선택" prefixValue=""/>
						</div>
                    </li>
                    <li class="wAuto">
                		<div class="tit w80">채널</div>
                        <div class="txt w120">
                              <code:commCode  className="select" id="applyChlCd" name="applyChlCd" codeCd="ST040" prefixLabel="선택" prefixValue=""/>
                        </div>
                	</li>
                    <li class="wAuto">
                        <div class="tit w100">쿠폰마스터상태</div>
						<div class="txt w120">
							<code:commCode  className="select" id="useYn" name="useYn" codeCd="S010" prefixLabel="선택" prefixValue=""/>
						</div>
                    </li>
                    
                    <li class="wAuto">
                        <div class="tit w80">쿠폰발행기간</div>
                        <div class="mDate11">
                          <input type="text" class="it w80 data-check" title="기간 시작일"  data-type="dateRangeStart" data-range-end="toPblsStdDay"  data-button="Y"  name="fromPblsStdDay" id="fromPblsStdDay" value="">
                                    
                            <span class="bar">~</span>
				                        
						<input type="text" class="it  w80 data-check" title="기간 마지막일" name="toPblsStdDay" id="toPblsStdDay" data-button="Y"  value="">
                        </div>
                    </li>
                    
                </ul>
                <ul>
                	<li class="wAuto">
                        <div class="tit w80">쿠폰 명</div>
                        <div class="txt">
                            <input type="text" class="it w200" title="쿠폰 명" name="coupnBasNm" id="coupnBasNm"   value="">
                        </div>
                    </li>
                	<li class="wAuto">
                        <div class="tit w80">쿠폰발행번호</div>
                        <div class="txt">
                            <input type="text" class="it w200" title="쿠폰발행번호" name="coupnPblsBasNo" id="coupnPblsBasNo"   value="">
                        </div>
                    </li>
                	<li class="wAuto">
                        <div class="tit w80">매장 명</div>
                        <div class="txt">
                            <input type="text" class="it w200" title="매장 명" name="storNm" id="storNm"   value="">
                        </div>
                    </li>
                    <li class="wAuto">
                        <div class="tit w80">통합고객번호</div>
                        <div class="txt">
                            <input type="text" class="it w200" title="회원코드" name="itgCustNo" id="itgCustNo"   value="">
                        </div>
                    </li>
                    <li class="wAuto">
                        <div class="tit w80">캠페인번호</div>
                        <div class="txt">
                            <input type="text" class="it w200" title="캠페인번호" name="campNo" id="campNo"   value="">
                        </div>
                    </li>
                </ul>
                <ul>
                	<li class="wAuto">
                        <div class="tit w80">프로모션번호</div>
                        <div class="txt">
                            <input type="text" class="it w200" title="프로모션번호" name="promNo" id="promNo"   value="">
                        </div>
                    </li>
                    <li class="wAuto">
                        <div class="tit w80">회원명</div>
                        <div class="txt">
                            <input type="text" class="it w200" title="회원명" name="custNm" id="custNm"   value="">
                        </div>
                    </li>
                    <li class="wAuto">
                        <div class="tit w80">구분</div>
                        <div class="txt">
                            <code:commCode  className="select" id="useDivCd" name="useDivCd" codeCd="MB140" prefixLabel="선택" prefixValue=""/>
                        </div>
                    </li>
                    <li class="wAuto">
                        <div class="tit w80">쿠폰사용기간</div>
                        <div class="mDate11">
                          <input type="text" class="it w80 " title="기간 시작일"  data-type="dateRangeStart" data-range-end="toUseDt"  data-button="Y"  name="fromUseDt" id="fromUseDt" value="">
                                    
                            <span class="bar">~</span>
				                        
						<input type="text" class="it  w80 " title="기간 마지막일" name="toUseDt" id="toUseDt" data-button="Y"  value="">
                        </div>
                    </li>
                    <div class=" "> <!-- 버튼 상하 가운데 정렬 : class="posVm" -->
			                <a class="mBtn1 lWhite" data-click="clean">초기화</a>
			                <a href="#" class="mBtn1" data-click="search">검색</a>
			            </div>
                </ul>
            </div>
            
            </form>
        </div>
        <!-- //sort -->
        
        <div class="gTitle1">
            <h3 class="mTitle1">쿠폰 발행 목록</h3>
            <div class="gRt">
            	<a href="#" class="mBtn1 lGray" data-click="sendMsgCouponAll">전체발송</a>
            	<a href="#" class="mBtn1" data-click="sendMsgCoupon">문자전송</a>
                <a href="#" data-click="excelDownload" id="excelDownload" class="mBtn1 m lPrimary">엑셀다운</a>
                <a href="#" class="mBtn1 lWhite" data-click="deleteCoupon">쿠폰삭제</a> <!-- 쿠폰사용취소 > 쿠폰삭제 [cancelCoupon , 취소처리]-->
                <!-- <a href="#" class="mBtn1 lPrimary" data-click="newCoupon">신규등록</a> --> <!-- 푸쉬 전송추후 -->
            </div>
        </div>
        


		<div id="divGrid" style="height:520px"
		  data-post="Y"
		  data-grid-id="grdList"
		  data-pagenation="Y"
		  data-get-url="<c:url value='/example/getList'/>"
		  data-type="grid" 
		  data-block-ui="Y"
		  data-tpl-url="<c:url value='/static/gridTemplate/memship/cmmMshipCoupnIssue.xml'/>"
		  >
		</div>
        
    </div>
    <!-- //cont -->
	                  
<form id="sendForm" name="sendForm">
	<input type="hidden" id="USERID" name="USERID" value="${eonUser}">
	<input type="hidden" id="VTYPE" name="VTYPE" value="">
	<input type="hidden" id="CLIENT" name="CLIENT" value="">
	<input type="hidden" id="CAMPAIGN_ID" name="CAMPAIGN_ID" value="">
	<input type="hidden" id="MENU_ID" name="MENU_ID" value="">
</form>


<script>
var _current_code_cd = null;
var eonSendPageURL = "${eonUrl}";

window.onload = function(){
	dateSetting();
}

function dateSetting(){
	//var strStartDay= moment().subtract(1, 'month').format('YYYYMMDD');
	var strStartDay= moment().format('YYYYMMDD');
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
 	var url = "<c:url value='${urlPrefix}/searchCoupnList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmSearch");
	param.recordCountPerPage = 20;
	grdList.loadUrl(url, param);
}

function deleteCoupon () {
	
	if (!confirm("쿠폰삭제 처리는 [발급상태]의 쿠폰만 해당됩니다. \n\n선택된 쿠폰을 삭제 하시겠습니까?"))
		return;
	
	var saveJson = grdList.getCheckedJson();
	if (saveJson.length == 0) {
		alert("선택된 내용이 없습니다.");
		return;
	}
	
	var arrJson = new Array();	
	var j = 0;
	for(var i=0 ; i < saveJson.length ; i++ ){
		if (saveJson[i].issuUseYn == 'N' ) {
			arrJson[j] = saveJson[i];
			j++;
		}
	}
	console.log(arrJson);

	if (arrJson.length > 0) {
		var url = "<c:url value='${urlPrefix}/deleteCoupon${urlSuffix}'/>";
		Utilities.blockUI();
		Utilities.getAjax(url, arrJson, true, function(data, jqXHR) {
			Utilities.unblockUI();
			if (Utilities.processResult(data, jqXHR, "취소처리 에 실패했습니다.")) {
				alert("취소처리 완료하였습니다.");
					search();
			}
		});
		
	}
	
}

function excelDownload() {
	grdList.exportExcel("쿠폰다운로드.xlsx");
}

function clean () {
	$('.select').val(null).trigger('change');
	$('input[type=text]').val('');
	dateSetting();
}


function sendMsgCoupon () {
	
	if (!confirm("쿠폰전송은 [발급] 상태만 해당됩니다. \n\n선택된 쿠폰을 문자전송 하시겠습니까?"))
		return;
	
	var saveJson = grdList.getCheckedJson();
	if (saveJson.length == 0) {
		alert("선택된 내용이 없습니다.");
		return;
	}
	
	var arrJson = new Array();	
	var j = 0;
	for(var i=0 ; i < saveJson.length ; i++ ){
		if (saveJson[i].itgCustNo != '' && saveJson[i].issuUseYn == 'N') {
			arrJson[j] = saveJson[i];
			j++;
		}
	}
	
	if (arrJson.length > 0) {
		
		var campId = "CR058_"+ new Date().getTime();
		var clientId = "099";
		
		var param = {
				clientId : clientId,
				campId : campId,
				arrJson : arrJson
			}
		
		/* arrJson.sendType = sendType;
		arrJson.sendGrpType = sendGrpType; */
		/* arrJson.clientId = clientId;
		arrJson.campId = campId;
		console.log(arrJson); */
		// return;
		var url = "<c:url value='${urlPrefix}/sendMsgCoupn${urlSuffix}'/>";
		Utilities.blockUI();
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			Utilities.unblockUI();
			if (Utilities.processResult(data, jqXHR, "문자전송 에 실패했습니다.")) {
				// alert("문자전송 완료하였습니다.");
				// search();
				
				$('#sendForm [name="VTYPE"]').val("1");		// 문자만
				$('#sendForm [name="CLIENT"]').val(clientId);
				$('#sendForm [name="CAMPAIGN_ID"]').val(campId);
				$('#sendForm [name="MENU_ID"]').val("");

				var pop_title = "sendPopup" ;
				window.open("", pop_title, "width=1500, height=800, resizable=yes, scrollbars=no") ;
				
				var frmData = document.sendForm;
				frmData.target = pop_title;
				frmData.method = "post";
				frmData.action = eonSendPageURL;

				frmData.submit() ;
			}
		});
		
	}
}

function sendMsgCouponAll () {
	
	if (!confirm("쿠폰전송은 [발급] 상태만 해당됩니다. \n\n검색된 쿠폰을 문자전송 하시겠습니까?"))
		return;
	
	var campId = "CR058_"+ new Date().getTime();
	var clientId = "099";
	var param = Utilities.formToMap("frmSearch");
	var url = "<c:url value='${urlPrefix}/sendMsgCoupnAll${urlSuffix}'/>";
	param.clientId = clientId;
	param.campId = campId;
	Utilities.blockUI();
	Utilities.getAjax(url, param, true, function(data, jqXHR) {
		Utilities.unblockUI();
		if (Utilities.processResult(data, jqXHR, "문자전송 에 실패했습니다.")) {
			
			$('#sendForm [name="VTYPE"]').val("1");		// 문자만
			$('#sendForm [name="CLIENT"]').val(clientId);
			$('#sendForm [name="CAMPAIGN_ID"]').val(campId);
			$('#sendForm [name="MENU_ID"]').val("");

			var pop_title = "sendPopup" ;
			window.open("", pop_title, "width=1500, height=800, resizable=yes, scrollbars=no") ;
			
			var frmData = document.sendForm;
			frmData.target = pop_title;
			frmData.method = "post";
			frmData.action = eonSendPageURL;

			frmData.submit() ;
		}
	});
}

</script>

