<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="gTitle1 line">
	<h3 class="mTitle1">발송이력</h3>
</div>
<form role="form" id="frmSearch">
<div class="mSort2 mini">
	<ul>
		<li class="wAuto">
			<div class="tit">발송유형</div>
			<div class="txt">
				<code:commCode name="sendType" id="sendType" codeCd="SD010" useYn6="Y" className="select" multiple="true" />
			</div>
		</li>
		<li class="wAuto">
			<div class="tit">캠페인 번호</div>
			<div class="txt">
				<input type="text" class="it w120" title="캠페인번호" name="orgCpId" placeholder="캠페인번호 검색">
			</div>
		</li>
		<li class="wAuto">
			<div class="tit">고객명</div>
			<div class="txt">
				<input type="text" class="it w80" title="고객명" name="custNm" placeholder="고객명 검색">
			</div>
		</li>
		<li class="wAuto">
			<div class="tit">발송주소</div>
			<div class="txt">
				<input type="text" class="it w160" title="발송주소" name="sendAddr" placeholder="발송주소 검색">
			</div>
		</li>
		<li class="wAuto">
			<div class="tit">성공여부</div>
			<div class="txt">
				<code:commCode name="sendResult" id="sendResult" codeCd="S050" className="select w70" prefixLabel="전체" />
			</div>
		</li>
		<li class="wAuto">
			<div class="tit">발송일</div>
			<div class="txt">
				<input type="text" class="it date w70" title="발송일" id="sendDate" name="sendDate" />
			</div>&nbsp;&nbsp;
			<a href="#" class="mBtn1 lGray" data-click="targetCustSendInfoGet">검색</a>
		</li>
	</ul>
</div>
</form>
<div id="divSendHistGrid" style="height:510px" 
	data-post="Y" 
	data-grid-id="grdSendHist" 
	data-pagenation="Y" 
	data-get-url="" 
	data-block-ui="Y"
	data-type="grid" 
	data-grid-callback="onGridLoad" 
	data-tpl-url="<c:url value='/static/gridTemplate/cst/crmCustSendHist.xml'/>">
</div>
<!-- //grid -->

<script>
	var currCustGrpNo = "";	//현재 선택된 고객그룹번호
	var gridLoaded = 0;	//그리드가 로드되기 전에 호출되는 것을 방지하기 위한 변수값
	
	$("document").ready(function(){
	});

	//서브페이지의 정보가 수정되면 부모페이지의 고객그룹목록부터 새로가져옵니다.(모든 하위항목까지 새로고침 됩니다.)
	function totalInfoInit(){
		parent.groupBasListInit();
	}

	function initPage(custGrpNo){
		currCustGrpNo = custGrpNo;
//console.log("=======> 고객전송이력 목록페이지 초기화 : "+ currCustGrpNo);return;
		if(custGrpNo == "" && typeof grdSendHist !== "undefined"){
			grdSendHist.clear();
			return false;
		}

		targetCustSendInfoGet();
	}

	//initPage보다 먼저 호출될경우를 위해(팝업에서 호출될때?)
	function onGridLoad(grid, gridId){
		++gridLoaded;
		if(currCustGrpNo != "" && gridLoaded >= 1){
			targetCustSendInfoGet();
		}
	}

	function targetCustSendInfoGet(){
		var url = "<c:url value='${urlPrefix}/custGroup/getTargetCustSendList'/>${urlSuffix}";

		var param = Utilities.formToMap("frmSearch");
		param.custGrpNo = currCustGrpNo;

		if(typeof grdSendHist !== "undefined"){
			grdSendHist.loadUrl(url, param);
		}
	}

	function printSendAddr(grid,row,col,json,value){
		var rtnVal = "";
		var sendAddr = json.sndAddr;

		try{
			if(json.sndType == "003"){	//이메일
				if(sendAddr.indexOf("@") > 3){
					const ar = sendAddr.split("@");
					rtnVal = ar[0].substr(0,ar[0].length-3) + "***@" + ar[1];
				} else if(sendAddr.indexOf("@")>-1){
					const ar = sendAddr.split("@");
					rtnVal = sendAddr+ "***@" + ar[1];
				} else {
					rtnVal = sendAddr.substring(0,val.length-3) + "***"; 
				}
			}else{	//전화번호
				sendAddr = sendAddr.replace("-","");
				if(sendAddr.length > 7){
					rtnVal = sendAddr.substring(0,3) + "-****-" + sendAddr.substring(7);
				} else {
					rtnVal = sendAddr.substring(0,3) + "-****" ;
				}
			}
		}catch(e){
			rtnVal = "";
		}
		
		return rtnVal;
	}
</script>