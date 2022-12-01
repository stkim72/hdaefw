<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="mTab3" id="mshipGradeCd"></div><br>
<div class="gTitle1 line">
	<h3 class="mTitle1">대상고객 목록</h3>
	<div class="gRt posT-5">    	
		수신그룹 
    	<code:commCode name="sendGrpType" id="sendGrpType" codeCd="RG100" className="select wAuto" prefixLabel="선택" />
    	<a href="#" class="mBtn1 lPrimary" data-click="sendTargetGroupSave">선택저장</a>
		<a href="#" class="mBtn1" data-click="sendTotalTargetGroupSave">전체저장</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		발송방법 
		<code:commCode name="sendType" id="sendType" codeCd="SD010" useYn6="Y" className="select wAuto" prefixLabel="선택" />
		<a href="#" class="mBtn1 lPrimary" data-click="targetMsgSendPop">선택발송</a>
		<a href="#" class="mBtn1" data-click="totalTargetMsgSendPop">전체발송</a>
    </div>
</div>
<form role="form" id="frmSearch">
<div class="mSort2 mini">
	<ul>
		<li class="wAuto">
			<div class="tit">SMS 수신동의</div>
			<div class="txt">
				<code:commCode name="smsRcvAgreeYn" codeCd="S050" className="select w50" prefixLabel="전체" />
			</div>
		</li>
		<li class="wAuto">
			<div class="tit">이메일 수신동의</div>
			<div class="txt">
				<code:commCode name="emailRcvAgreeYn" codeCd="S050" className="select w50" prefixLabel="전체" />
			</div>
		</li>
		<li class="wAuto">
			<div class="tit">알림톡 수신동의</div>
			<div class="txt">
				<code:commCode name="alrmTkRcvAgreeYn" codeCd="S050" className="select w50" prefixLabel="전체" />
			</div>
		</li>
		<%-- <li class="wAuto">
			<div class="tit">PUSH 수신동의</div>
			<div class="txt">
				<code:commCode name="pushRcvAgreeYn" codeCd="S050" className="select w50" prefixLabel="전체" />
			</div>
		</li> --%>
		<li class="wAuto">
			<div class="tit">이름</div>
			<div class="txt">
				<input type="text" class="it w70" title="정책코드" name="custNm" placeholder="이름 검색">
			</div>
		</li>
		<li class="wAuto">
			<div class="tit">연락처</div>
			<div class="txt">
				<input type="text" class="it w90" title="정책코드" name="mphonNo" placeholder="연락처 검색">
			</div>&nbsp;&nbsp;
			<a href="#" class="mBtn1 lGray" data-click="targetCustInfoGet">검색</a>
		</li>
	</ul>
	<div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
		<a href="#" class="mBtn1 lWhite" data-click="targetCustListDownload">엑셀 다운로드</a>
	</div>
</div>
</form>
<form id="sendForm" name="sendForm">
	<input type="hidden" id="USERID" name="USERID" value="${eonUser}">
	<input type="hidden" id="VTYPE" name="VTYPE" value="">
	<input type="hidden" id="CLIENT" name="CLIENT" value="">
	<input type="hidden" id="CAMPAIGN_ID" name="CAMPAIGN_ID" value="">
	<input type="hidden" id="MENU_ID" name="MENU_ID" value="">
</form>
<div id="divTargetCustGrid" style="height:485px" 
	data-post="Y" 
	data-grid-id="grdTargetCust" 
	data-pagenation="Y" 
	data-get-url="" 
	data-block-ui="Y"
	data-type="grid" 
	data-grid-callback="onGridLoad" 
	data-tpl-url="<c:url value='/static/gridTemplate/cst/crmCustGrpTargetCust.xml'/>">
</div>
<!-- //grid -->

<script>
	var currCustGrpNo = "";	//현재 선택된 고객그룹번호
	var gridLoaded = 0;	//그리드가 로드되기 전에 호출되는 것을 방지하기 위한 변수값
	var eonSendPageURL = "${eonUrl}";
	
	$("document").ready(function(){
	});

	//서브페이지의 정보가 수정되면 부모페이지의 고객그룹목록부터 새로가져옵니다.(모든 하위항목까지 새로고침 됩니다.)
	function totalInfoInit(){
		parent.groupBasListInit();
	}

	function initPage(custGrpNo){
		currCustGrpNo = custGrpNo;
//console.log("=======> 대상고객 목록페이지 초기화 : "+ currCustGrpNo);
		if(custGrpNo == "" && typeof grdTargetCust !== "undefined"){
			grdTargetCust.clear();
			return false;
		}

		targetCustInfoGet();
	}

	//initPage보다 먼저 호출될경우를 위해(팝업에서 호출될때?)
	function onGridLoad(grid, gridId){
		++gridLoaded;
		if(currCustGrpNo != "" && gridLoaded >= 1){
			targetCustInfoGet();
		}
	}

	function targetCustGradeInfoLoading(){
		var param = {
				custGrpNo : currCustGrpNo
			};
		var url = "<c:url value='${urlPrefix}/custGroup/getTargetCustGradeList${urlSuffix}'/>";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "대상고객 회원등급 로딩에 실패했습니다.")) {
				targetCustGradeInfoSetting(data);
			}
		});
	}

	function targetCustGradeInfoSetting(data){
		$('input[name="mshipGradeCd"]').removeAttr('onclick');
		$("#mshipGradeCd").html("");
		
		var htmlTxt = "";
		for(var i=0; i<data.length; i++){
			let eData = data[i];
			var gradeCnt = eData.GRADE_CNT;
			gradeCnt = gradeCnt.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			htmlTxt += '<a href="javascript:void(0);" name="mshipGradeCd" class="mBtn1 r5 lWhite" active="false" val="'+ eData.COMN_CD +'" onClick="mshipGradeclick(this)">';
			htmlTxt += eData.COMN_CD_NM +' ('+ gradeCnt +')';
			htmlTxt += '</a>&nbsp;&nbsp;';
			/*
			htmlTxt += '<label class="mRadio1 type3">';
			htmlTxt += '<input type="radio" name="mshipGradeCd_'+ i +'" title="'+ eData.COMN_CD_NM +'" value="'+ eData.COMN_CD +'" onclick="mshipGradeclick(this);">';
			htmlTxt += '<span class="label">'+ eData.COMN_CD_NM +' '+ eData.GRADE_CNT +'</span>';
			htmlTxt += '</label>';*/
		}
		$("#mshipGradeCd").append(htmlTxt);
	}

	function mshipGradeclick(obj){
		var mshipGrade = $(obj).attr("val");
//console.log("mshipGradeclick : "+ mshipGrade);
		$("a[name=mshipGradeCd]").each(function(index, item){
			if($(obj)[0] === $(item)[0]){
				if($(obj).attr("active") == "true"){
					$(obj).attr("class", "mBtn1 r5 lWhite");
					$(obj).attr("active", "false");
					targetCustInfoLoading();
				}else{
					$(obj).attr("class", "mBtn1 r5 lPrimary");
					$(obj).attr("active", "true");
					targetCustInfoLoading(mshipGrade);
				}
			}else{
				$(item).attr("class", "mBtn1 r5 lWhite");
				$(item).attr("active", "false");
			}
		});
	}

	function targetCustInfoGet(){
		targetCustGradeInfoLoading();
		targetCustInfoLoading();
	}

	function targetCustInfoLoading(mshipGrade){
		var url = "<c:url value='${urlPrefix}/custGroup/getTargetCustList'/>${urlSuffix}";

		var param = {};
		if(mshipGrade != null){
			param.mshipGradeCd = mshipGrade;
		}else{
			param = Utilities.formToMap("frmSearch");
		}
		param.custGrpNo = currCustGrpNo;

		if(typeof grdTargetCust !== "undefined"){
			grdTargetCust.loadUrl(url, param);
		}
	}

	function sendTargetGroupSave(){
		var sendGrpType = $("#sendGrpType").val();
		if(sendGrpType.length == 0){
			$("#sendGrpType").focus();
			alert("저장할 수신그룹 타입을 선택해주세요.");
			return;
		}

		var paramData = [];
		var targetData = grdTargetCust.getCheckedJson();
		if (targetData.length == 0) {
			alert("저장할 대상고객을 선택해주세요.");
			return;
		}
		if (!confirm("선택한 대상고객을 수신그룹으로 저장하시겠습니까?")) return;

		var param = {
				sendGrpType : sendGrpType,
				custGrpNo : currCustGrpNo,
				targetData : targetData
			}
//console.log("== param\n"+ JSON.stringify(param));return;
		Utilities.blockUI();
		var url = "<c:url value='${urlPrefix}/custGroup/saveTargetSendGroupInfo${urlSuffix}'/>";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "수신그룹 저장에 실패했습니다.")) {
				Utilities.unblockUI();
				alert("수신그룹으로 저장되었습니다.");
			}
		});
	}

	function sendTotalTargetGroupSave(){
		var sendGrpType = $("#sendGrpType").val();
		if(sendGrpType.length == 0){
			$("#sendGrpType").focus();
			alert("저장할 수신그룹 타입을 선택해주세요.");
			return;
		}

		var selGradeCd = "";
		$("a[name=mshipGradeCd]").each(function(index, item){
			if($(item).attr("active") == "true"){
				selGradeCd = $(item).attr("val");
			}
		});

		var param = {};
		if(selGradeCd != ""){
			param.mshipGradeCd = selGradeCd;
		}else{
			param = Utilities.formToMap("frmSearch");
		}
		param.custGrpNo = currCustGrpNo;
		param.sendGrpType = sendGrpType;

		var targetData = grdTargetCust.getData();
		if (targetData.length == 0) {
			alert("저장할 대상고객이 없습니다.");
			return;
		}

		if (!confirm("전체 대상고객을 수신그룹으로 저장하시겠습니까?")) return;
		Utilities.blockUI();
//console.log("== param\n"+ JSON.stringify(param));return;
		var url = "<c:url value='${urlPrefix}/custGroup/saveTotalTargetSendGroupInfo${urlSuffix}'/>";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "수신그룹 저장에 실패했습니다.")) {
				Utilities.unblockUI();
				alert("수신그룹으로 저장되었습니다.");
			}
		});
	}

	function targetMsgSendPop(){
		var sendType = $("#sendType").val();
		if(sendType.length == 0){
			$("#sendType").focus();
			alert("발송할 매체를 선택해주세요");
			return;
		}
		
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
		var campId = "CR058_"+ new Date().getTime();
		var clientId = "099";

		var paramData = [];
		var targetData = grdTargetCust.getCheckedJson();
		if (targetData.length == 0) {
			alert("발송할 대상고객을 선택해주세요.");
			return;
		}
		if (!confirm(vTypeMsg +" 발송을 진행하시겠습니까?")) return;

		var param = {
				sendType : sendType,
				custGrpNo : currCustGrpNo,
				clientId : clientId,
				campId : campId,
				targetData : targetData
			}
//console.log("== param\n"+ JSON.stringify(param));return;
		var url = "<c:url value='${urlPrefix}/custGroup/saveTargetSendInfo${urlSuffix}'/>";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "발송할 대상고객 저장에 실패했습니다.")) {
				//$('#sendForm [name="USERID"]').val("crm_1");
				$('#sendForm [name="VTYPE"]').val(vType);
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

	function totalTargetMsgSendPop(){
		var sendType = $("#sendType").val();
		if(sendType.length == 0){
			$("#sendType").focus();
			alert("발송할 매체를 선택해주세요");
			return;
		}
		
		var selGradeCd = "";
		$("a[name=mshipGradeCd]").each(function(index, item){
			if($(item).attr("active") == "true"){
				selGradeCd = $(item).attr("val");
			}
		});

		var param = {};
		if(selGradeCd != ""){
			param.mshipGradeCd = selGradeCd;
		}else{
			param = Utilities.formToMap("frmSearch");
		}
		param.custGrpNo = currCustGrpNo;

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
		var targetData = grdTargetCust.getData();
		if (targetData.length == 0) {
			alert("발송할 대상고객이 없습니다.");
			return;
		}

		if (!confirm(vTypeMsg +" 전체발송을 진행하시겠습니까?")) return;
		var campId = "CR058_"+ new Date().getTime();
		var clientId = "099";
		
		param.sendType = sendType;
		param.clientId = clientId;
		param.campId = campId;
//console.log("== param\n"+ JSON.stringify(param));return;
		var url = "<c:url value='${urlPrefix}/custGroup/saveTotalTargetSendInfo${urlSuffix}'/>";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "발송할 대상고객 저장에 실패했습니다.")) {
				//$('#sendForm [name="USERID"]').val("crm_1");
				$('#sendForm [name="VTYPE"]').val(vType);
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

	function targetMsgSendHistPop(){
		var campId = "CR058_"+ new Date().getTime();
		
		//$('#sendForm [name="USERID"]').val("crm_1");
		$('#sendForm [name="VTYPE"]').val("4");
		$('#sendForm [name="CLIENT"]').val("");
		$('#sendForm [name="CAMPAIGN_ID"]').val("");
		$('#sendForm [name="MENU_ID"]').val("WSOMC261P0");//WSOMS450P0 (문자발송 링크), WSOMR264P0(설문조사 링크)

		var pop_title = "sendHistPopup" ;
		window.open("", pop_title, "width=1500, height=800, resizable=yes, scrollbars=no") ;
		
		var frmData = document.sendForm;
		frmData.target = pop_title;
		frmData.method = "post";
		frmData.action = eonSendPageURL;
		
		frmData.submit() ;
	}

	function targetCustListDownload(){
		var saveJson = grdTargetCust.getData();
		if (saveJson.length == 0) {
			alert("저장할 데이터가 존재하지 않습니다.");
			return;
		}
		
		if (!confirm("대상고객 엑셀파일을 다운로드 하시겠습니까?")) return;
		grdTargetCust.exportExcel("대상고객 엑셀파일.xlsx", true);
	}
</script>