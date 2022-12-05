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
	            <h3 class="mTitle1">주의고객 검색</h3>
	        </div>        
			
			<div class="mSort2 type2">
	            <form role="form" id="frmSearch">
					<ul>
						<li class="w40per">
							<div class="tit">회원명</div>
							<div class="txt">
								<div class="mFlex2">
									<input type="text" id="custNm" name="custNm" class="it" title="이름" placeholder="이름">
									<code:commCode id="gndrCd" name="gndrCd" codeCd="S040" prefixLabel="전체" prefixValue=""/>
									<input type="text" id="birthday" name="birthday" class="it" title="생년월일" placeholder="생년월일">
									<input type="text" id="itgCustNo" name="itgCustNo" class="it" title="통합고객번호" placeholder="통합고객번호">
								</div>
							</div>
						</li>
						
						<li class="w50per">
							<div class="tit w105">휴대전화번호</div>
							<div class="txt">
								<input type="text" id="mphonNo" name="mphonNo" class="it" title="휴대번호" maxlength="11" oninput="this.value=this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');">
							</div>
							<div class="tit w105">이메일</div>
                            <div class="txt">
                                <input type="text" id="emailAddr" name="emailAddr" class="it" title="이메일">
                            </div>
                            <div class="tit w105">멤버십아이디</div>
                            <div class="txt">
                                <input type="text" id="mshipLoginId" name="mshipLoginId" class="it" title="이메일">
                            </div>
						</li>
<%-- 						<li class="w16per">
							<div class="tit w105">이메일</div>
								<div class="txt">
									<div class="mFlex2">
									<input type="text" id="emailAddr" name="emailAddr" class="it" title="이메일">
									<code:commCode id="" name="" codeCd="CU170"/>
	<!-- 								<select class="select" title="이메일">
										<option>선택</option>
										<option>@naver.com</option>
										<option>@daum.net</option>
									</select> -->
								</div>
							</div>
						</li>
 --%>						
						<li class="w40per">
							<div class="tit">등록채널</div>
							<div class="txt">
								<div class="mFlex2">
									<code:commCode id="regChlCd" name="regChlCd" codeCd="S000" prefixLabel="전체" prefixValue=""/>
									<!-- <input type="text" id="" name="" class="it w300" title="">
									<input type="text" id="" name="" class="it w300" title=""> -->
								</div>
							</div>
							<div class="tit">회원등급</div>
							<div class="txt">
	                            <code:commCode id="mshipGradeCd" name="mshipGradeCd" codeCd="MB020" prefixLabel="전체" prefixValue=""/>
							</div>
						</li>
						
			<!-- 			<li class="w20per">
							
						</li> -->
		 				<li class="w20per">
							<div class="tit">등록사유</div>
							<div class="txt">
	                            <code:commCode id="bllkRegWhyCd" name="bllkRegWhyCd" codeCd="CU320" prefixLabel="전체" prefixValue=""/>
							</div>
						</li>
														
						<li class="w20per">
							<div class="tit">등록일</div>
							<div class="txt">
								<div class="mDate1">
									<input type="text" class="it date" title="시작일" data-type="dateRangeStart" data-range-end="endDt" id="strtDt" name="strtDt" data-enter="search" data-button="Y" value="">
									<span class="bar">~</span>
									<input type="text" class="it date" title="마지막일" id="endDt" name="endDt" data-enter="search" data-button="Y" value="">
								</div>
							</div>
						</li>
					</ul>
					<div class="gRt">
				        <div class="mFlex2">
				            <a href="#" class="mBtn1" data-click="search">검색</a>
				        </div>
				    </div>
				</form>
					
				</div>
	
	
		<div class="gTitle1">
			<h3 class="mTitle1">주의고객 목록</h3>
			<div class="gRt">
				<button class="mBtn1" data-click="insertBlack" data-auth-type="c" style="display:none" >등록</button>
				<code:commCode name="sendType" id="sendType" codeCd="SD010" useYn6="Y" className="select wAuto"  others='data-auth-type="c" style="display:none" '/>
				<button class="mBtn1" data-click="targetMsgSendPop" data-auth-type="c" style="display:none" >발송</button>
				<a href="#" class="mBtn1 gray" data-click="getDownloadReason" data-auth-type="u" style="display:none" >엑셀다운로드</a>
				<%-- <code:btnGroup name="blackList" hideDelete="true" hideInsert="true" hideSave="true" dispName="블랙리스트 목록" gridId="grdList"/> --%>
			</div>
		</div>
		<form id="sendForm" name="sendForm">
		    <input type="hidden" id="USERID" name="USERID" value="cmm_1">
		    <input type="hidden" id="VTYPE" name="VTYPE" value="1">
		    <input type="hidden" id="CLIENT" name="CLIENT" value="099">
		    <input type="hidden" id="CAMPAIGN_ID" name="CAMPAIGN_ID" value="GRP_20220713172404">
		</form>
	
		<div  id="divGrid" style="height:${rightBoxHeight4}" data-grid-id="grdList" 
		                                        data-pagenation="Y" 
		                                        data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
		                                        data-type="grid"
		                                        data-block-ui="Y"
		                                        data-scroll-x="Y"
		                                        data-grid-callback="onGridLoad" 
		                                        data-tpl-url="<c:url value='/static/gridTemplate/cst/CR049.xml'/>">
		</div>
	
	
	</div>
</div>

<script>

function search()
{
    var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    grdList.loadUrl(url,param);
}

function insertBlack()
{
	var url = "<c:url value='${urlPrefix}/detail'/>/" + "null";
    Utilities.openModal(url,1000,600);
}

/* 그리드 셀 더블 클릭 */
function onGridCellDblClick(gridView, itemIndex, column, json, value){
	showDetail(json); 
}

/* 상세화면 팝업 로드(수정) */
function showDetail(json){
	var url = "<c:url value='${urlPrefix}/detailHistory'/>/" + json.itgCustNo;
    Utilities.openModal(url,1000,520);
}

function regPopup2()
{
	alert("작업중입니다.");
	return;
}

function targetMsgSendPop(){
	
/* 	alert("작업중입니다.");
    return; */
    
    var sendType = $("#sendType").val();
    var vType = "";
    var vTypeMsg = $("#sendType option:checked").text();
    if(sendType == "003"){  //이메일
        vType = "2";
    }else if(sendType == "004"){    //PUSH
        alert("서비스 준비중입니다.");
        return;
    }else{  //문자,알림톡
        vType = "1";
    }
    var campId = "CR049_"+ new Date().getTime();
    var clientId = "049";

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
    var url = "<c:url value='${urlPrefix}/saveTargetSendInfo${urlSuffix}'/>";
    Utilities.getAjax(url, param, true, function(data, jqXHR) {
    	   console.log("data = " + JSON.stringify(data));
        if (Utilities.processResult(data, jqXHR, "발송할 대상고객 저장에 실패했습니다.")) {
            $('#sendForm [name="USERID"]').val("${eonUser}");
            $('#sendForm [name="VTYPE"]').val(vType);
            $('#sendForm [name="CLIENT"]').val(clientId);
            $('#sendForm [name="CAMPAIGN_ID"]').val(campId);

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

function getDownloadReason(){
    Utilities.textDialog("","개인정보 다운로드 사유를 적으세요",false,700,500);
}
function changeText(reason){ 
    if(!reason)
        return;
    var param = Utilities.formToMap("frmSearch");
    param.indiInfoHandlPrsnNo = "${LOGIN_USER.userId}";
    param.connPrsnIpAddr = "${peerIpAddr}";
    param.dnldTxn = reason;
    param.pfmWorkCd = "003";
    grdList.exportExcel("블랙리스트 목록.xlsx",true,null,param)
}

//setToday(); 

</script>