<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%>
 
 
<div id="wrapIframe" class="closed"> <!-- 고객정보 닫힘 -->
    <div class="cont">
        <div class="gTitle1 line">
            <h3 class="mTitle1">통합고객 검색 - 법인</h3>
        </div>
            
        <div class="mSort2 type2">
               <form role="form" id="frmSearch">
                <div class="gRadio1">
                    <div class="cont">
                        <label class="mRadio1 type2">
                            <input type="radio" title="개인" checked="false" value="001" name="custDivCd" id="custDivCd" disabled>
                            <span class="label">개인</span>
                        </label>
                        <label class="mRadio1 type2">
                            <input type="radio" title="법인" checked="true" value="002" name="custDivCd" id="custDivCd" >
                            <span class="label">법인</span>
                        </label>
                    </div>
                </div>
				<ul>
<!-- 검색창 1로우 시작 -->				
					<li class="w18per">
						<div class="tit w105">통합고객번호</div>
						<div class="txt">
							<input type="text" class="it" title="통합고객번호" name="itgCustNo" id="itgCustNo" data-enter="search">
						</div>
					</li>				
					<li class="w18per">
						<div class="tit w105" >고객명</div>
						<div class="txt">
							<input type="text" class="it" title="고객명" name="custNmLike" id="custNmLike" data-enter="search">
						</div>
					</li>
					<li class="w18per">
						<div class="tit">사업자번호</div>
						<div class="txt">
							<input type="text" class="it" title="사업자번호" name="bizNo" id="bizNo" data-enter="search">
						</div>
					</li>
					<li class="w18per">
						<div class="tit">담당자명</div>
						<div class="txt">
							<input type="text" class="it" title="담당자명" name="picNm" id="picNm" data-enter="search">
						</div>
					</li>					
					<li class="w18per">
						<div class="tit">담당자휴대번호</div>
						<div class="txt">
							<input type="text" class="it" title="담당자휴대번호" name="picMphonNo" id="picMphonNo" data-enter="search">
						</div>
					</li>

<!-- 검색창 1로우 끝 -->
<!-- 검색창 2로우 시작 -->	
					<li class="w18per">
						<div class="tit w105">고객유형</div>
						<div class="txt">
							<code:commCode id="custTypeCd" name="custTypeCd" codeCd="CU030" prefixLabel="전체" prefixValue="" multiple="false" />
						</div>
					</li>		
					<li class="w18per">
						<div class="tit w105" >추천인고객번호</div>
						<div class="txt">
							<input type="text" class="it" title="추천인고객번호" name="rcmdrCustNo" id="rcmdrCustNo" data-enter="search">
						</div>
					</li>					
					<li class="w18per">
						<div class="tit">추천임직원번호</div>
						<div class="txt">
							<input type="text" class="it" title="추천임직원번호" name="rcmdExecvdempNo" id="rcmdExecvdempNo" data-enter="search">			
						</div>
					</li>

					<li class="w18per">
						<div class="tit">담당자이메일</div>
						<div class="txt">
							<input type="text" class="it" title="담당자이메일" name="picEmailAddr" id="picEmailAddr" data-enter="search">
						</div>
					</li>						
					<li class="w18per">
						<div class="tit">고객상태</div>
						<div class="txt">
							<code:commCode id="custStatusCd" name="custStatusCd" codeCd="CU020" prefixLabel="전체" prefixValue="" multiple="false"  />
						</div>
					</li>

<!-- 검색창 2로우 끝 -->
<!-- 검색창 3로우 시작 -->			
					<li class="w18per">
		            	<div class="tit w105" >가입매장</div>
						<a href="#;" data-click="storeSearchPop" class="mBtn1 m lWhite" style="cursor: pointer;">매장검색</a>
		                <a href="#;" data-click="storeAllRemove" class="mBtn1 m lGray" style="cursor: pointer;">전체삭제</a>	
					</li>
					<li class="w18per">
						<div class="tit w105">회원등급</div>
						<div class="txt">
							<code:commCode id="mshipGradeCd" name="mshipGradeCd" codeCd="MB020" prefixLabel="전체" prefixValue="" multiple="false"  />
						</div>
					</li>			
					<li class="w18per">
						<div class="tit">SMS수신동의</div>
						<div class="txt">
							<code:commCode id="smsRcvAgreeYn" name="smsRcvAgreeYn" codeCd="CU161" prefixLabel="전체" prefixValue="" multiple="false" />	
						</div>
					</li>
					<li class="w18per">
						<div class="tit">이메일수신동의</div>
						<div class="txt">
							<code:commCode id="emailRcvAgreeYn" name="emailRcvAgreeYn" codeCd="CU162" prefixLabel="전체" prefixValue="" multiple="false" />							
						</div>
					</li>
<!-- 					<li class="w18per"> -->
<!-- 						<div class="tit">알림톡수신동의</div> -->
<!-- 						<div class="txt"> -->
<%-- 							<code:commCode id="alrmTkRcvAgreeYn" name="alrmTkRcvAgreeYn" codeCd="CU161" prefixLabel="전체" prefixValue="" multiple="false" />						 --%>
<!-- 						</div> -->
<!-- 					</li> -->
<!-- 검색창 3로우 끝 -->	
<!-- 					<li class="w18per"> -->
<!-- 						<div class="tit w105">PUSH수신동의</div> -->
<!-- 						<div class="txt"> -->
<%-- 							<code:commCode id="pushRcvAgreeYn" name="pushRcvAgreeYn" codeCd="CU161" prefixLabel="전체" prefixValue="" multiple="false" />		 --%>
<!-- 						</div> -->
<!-- 					</li> -->
					<li class="w18per">
						<div class="tit">수신거부</div>
						<div class="txt">
							<code:commCode id="rcvRfslYn" name="rcvRfslYn" codeCd="CU161" prefixLabel="전체" prefixValue="" multiple="false" />		
						</div>
					</li>
<!-- 					<li class="w18per"> -->
<!-- 						<div class="tit"></div> -->
<!-- 						<div class="txt"> -->
<%-- 							<code:commCode id="rcvRfslYn" name="rcvRfslYn" codeCd="CU160" prefixLabel="전체" prefixValue="" multiple="false" /> --%>
<!-- 						</div> -->
<!-- 					</li> -->
					<li class="w50per">
						<div class="tit w105" >매장리스트</div>
						<div class="txt">
							<input type="text" id="rcmdStorNo" name="rcmdStorNo" data-type="storeSelect" data-max-cnt="10" readonly />
						</div>
					</li>
				</ul>
				<!-- <ul>
					<li class="w50per">
						<div class="txt">
							<input type="text" id="rcmdStorNo" name="rcmdStorNo" data-type="storeSelect" data-max-cnt="10" readonly />
						</div>
					</li>
				</ul>	 -->	
				<div class="button posVm"> <!-- 버튼 상하 가운데 정렬 : class="posVm" -->
					<a href="#" class="mBtn1" data-click="clear" style="margin-right: 5px">초기화</a>
					<a href="#" class="mBtn1" data-click="search">검색</a>
				</div>
			</form>
		</div>
			
			<!-- //sort -->

			<!-- box -->
				<div class="gTitle1">
					<h3 class="mTitle1">통합고객 목록 - 법인</h3>
					<div class="gRt">
						<code:commCode name="sendType" id="sendType" codeCd="SD010" useYn6="Y" className="select wAuto" others='data-auth-type="c" style="display:none" '/>
                    	<a href="#" class="mBtn1 lWhite" data-auth-type="c" style="display:none"   data-click="targetMsgSendPop">발송</a>
<!-- 						<a href="#" class="mBtn1 lWhite">고객그룹</a> -->
						<a href="#" class="mBtn1 gray" data-auth-type="u" style="display:none"   data-click="getDownloadReason">엑셀다운로드</a>
<!-- 						<a href="#" class="mBtn1 primary ml17">신규고객등록</a> -->
<!-- 						<a href="#" class="mBtn1 primary">관계등록</a> -->
<!-- 						<a href="#" class="mBtn1 lPrimary"><span class="iFace">블랙고객등록</span></a> -->
					</div>
				</div>
				<!-- board -->
<!-- 				<div class="mBoard1 mCustomScrollbar hSortRow3 pType1"> --> 
   					<div  id="divGrid" style="height:${rightBoxHeight4}" data-grid-id="grdList" 
						data-pagenation="Y" 
						data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
						data-type="grid" 
						data-scroll-x="Y"
						data-grid-callback="onGridLoad" 
						data-tpl-url="<c:url value='/static/gridTemplate/cst/CR003.xml'/>">
					</div>
<!-- 				</div> -->
				
			</div>
			<!-- //box -->

		</div>
		<!-- //right -->
		
<form id="sendForm" name="sendForm">
	<input type="hidden" id="USERID" name="USERID" value="crm_1">
	<input type="hidden" id="VTYPE" name="VTYPE" value="">
	<input type="hidden" id="CLIENT" name="CLIENT" value="">
	<input type="hidden" id="CAMPAIGN_ID" name="CAMPAIGN_ID" value="">
	<input type="hidden" id="MENU_ID" name="MENU_ID" value="">
</form>
		
<script>		


/* 공통코드 그리드 load */
function grdList_load(gridView, gridId) {
	//search();
	
}


/* 검색조건 검색 */
function search() {
	$("form#frmSearch").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmSearch");
// 	param.recordCountPerPage = 100000;
	grdList.loadUrl(url, param);

	//grid.setSelectionRange(grid.startIndex['0'], grid.endIndex['0']);
	  
	
	//grdList_rowChanged(grdList, 1, 1, null)
}

/* 그리드 셀 더블 클릭 */
function onGridCellDblClick(gridView, itemIndex, column, json, value){
	
// 	Utilities.openMenuTab("crmCustBas" , 'custDivCd=2&custNm=' + json.custNm);
	Utilities.openMenuTab("crmCustBas" , "custDivCd=2&custNm=" + json.custNm + "&itgCustNo=" + json.itgCustNo + "&searchFlag=" + "1");
}

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

//엑셀다운로드
function getDownloadReason(){
	Utilities.textDialog("","개인정보 다운로드 사유를 적으세요",false,700,500);
}

//사유저장
function changeText(reason){ 
	if(!reason)
		return;
	var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    param.indiInfoHandlPrsnNo = "${LOGIN_USER.userCd}";
    param.connPrsnIpAddr = "${peerIpAddr}";
    param.dnldTxn = reason;
    grdList.exportExcel("고객목록.xlsx",true,url,param)
//  param.recordCountPerPage = 100000;
//     grdList.ex(url, param);
}

function targetMsgSendPop(){
	var sendType = $("#sendType").val();
	var vType = "";
	var vTypeMsg = $("#sendType option:checked").text();
	if(sendType == "003"){	//이메일
		vType = "2";
	}else if(sendType == "004"){	//PUSH
		alert("서비스 준비중입니다.");
		return;
	}else{	//문자,알림톡
		vType = "1";
	}
	var campId = "CR003_"+ new Date().getTime();
	var clientId = "003";

	var paramData = [];
	var targetData = grdList.getCheckedJson();
	if (targetData.length == 0) {
		alert("발송할 대상고객을 선택해주세요.");
		return;
	}
	if (!confirm(vTypeMsg +" 발송을 진행하시겠습니까?")) return;

	var param = {
			sendType : sendType,
			/* custGrpNo : currCustGrpNo, */
			clientId : clientId,
			campId : campId,
			targetData : targetData
		}
//console.log("== param\n"+ JSON.stringify(param));return;
	var url = "<c:url value='crmCustBas/saveTargetSendInfo${urlSuffix}'/>";
	Utilities.getAjax(url, param, true, function(data, jqXHR) {
		if (Utilities.processResult(data, jqXHR, "발송할 대상고객 저장에 실패했습니다.")) {
			$('#sendForm [name="USERID"]').val("${eonUser}");
			$('#sendForm [name="VTYPE"]').val(vType);
			$('#sendForm [name="CLIENT"]').val(clientId);
			$('#sendForm [name="CAMPAIGN_ID"]').val(campId);
			$('#sendForm [name="MENU_ID"]').val("");

			var pop_title = "sendPopup" ;
			window.open("", pop_title, "width=1500, height=800, resizable=yes, scrollbars=no") ;
			
			var frmData = document.sendForm;
			frmData.target = pop_title;
			frmData.method = "post";
			frmData.action = "${eonUrl}";
			
			frmData.submit() ;
		}
	});
}

function clear(){
	$('#frmSearch').clearForm();
	
	/* 콤보박스 전체 셋팅 */
	$("#custStatusCd").val("");
	$("#custTypeCd").val("");
	$("#mshipGradeCd").val("");
	$("#rcvRfslYn").val("");
	$("#smsRcvAgreeYn").val("");
	$("#emailRcvAgreeYn").val("");
	
	/* 그리드초기화 */
	grdList.clear();
	storeAllRemove();
}
</script>