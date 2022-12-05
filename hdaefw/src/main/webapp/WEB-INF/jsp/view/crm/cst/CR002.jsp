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
            <h3 class="mTitle1">통합고객 검색 - 개인</h3>
        </div>
            
        <div class="mSort2 type2">
               <form role="form" id="frmSearch">
                <div class="gRadio1">
                    <div class="cont">
                        <label class="mRadio1 type2">
                            <input type="radio" title="개인" checked="true" value="001" name="custDivCd" id="custDivCd" >
                            <span class="label">개인</span>
                        </label>
                        <label class="mRadio1 type2">
                            <input type="radio" title="법인" value="002" name="custDivCd" id="custDivCd" disabled>
                            <span class="label">법인</span>
                        </label>
                    </div>
                </div>

                <ul>
                    <li class="w13per">
                        <div class="tit">고객명</div>
                        <div class="txt">
                            <input type="text" class="it" title="고객명" name="custNm" id="custNm" data-enter="search">
                        </div>
                    </li>
                    <li class="w20per">
                        <div class="tit w105">통합고객번호</div>
                        <div class="txt">
                            <input type="text" class="it" title="통합고객번호" name="itgCustNo" id="itgCustNo" data-enter="search">
                        </div>
                    </li>
                    <li class="w12per">
                        <div class="tit">성별</div>
                        <div class="txt">
                            <code:commCode id="gndrCd" name="gndrCd" codeCd="CU170" prefixLabel="전체" prefixValue="" multiple="false" />
                        </div>
                    </li>
                   <!--  <li class="w15per">
                        <div class="tit">생년월일</div>
                        <div class="txt">
                            <input type="text" maxlength="8" class="it" title="생년월일" name="birtymd" id="birtymd" data-enter="search">
                        </div>
                    </li> -->
                    <li class="w15per">
                        <div class="tit">멤버십유형</div>
                        <div class="txt">
                            <code:commCode id="mshipTypeCd" name="mshipTypeCd" codeCd="MB010" prefixLabel="전체" prefixValue="" multiple="false" change="chkGrade" />
                        </div>
                    </li>
                    <li class="w18per">
                        <div class="tit">휴대번호</div>
                        <div class="txt">
                            <input type="text" class="it" title="휴대번호" name="mphonNo" id="mphonNo" data-enter="search">
                        </div>
                    </li>
                    <li class="w22per">
                        <div class="tit">이메일</div>
                        <div class="txt">
                            <input type="text" class="it" title="이메일" name="emailAddr" id="emailAddr">
                        </div>
                    </li>
                    
                    <li class="w13per">
                        <div class="tit">결혼여부</div>
                        <div class="txt">
                            <code:commCode id="marryYn" name="marryYn" codeCd="CU130" prefixLabel="전체" prefixValue="" multiple="false"  />
                        </div>                  

                    </li>
                    <li class="w20per">
                        <div class="tit w105">고객상태</div>
                        <div class="txt">
                            <code:commCode id="custStatusCd" name="custStatusCd" codeCd="CU020" prefixLabel="전체" prefixValue="" multiple="false"  />
                        </div>
                    </li>
                    <li class="w12per">
                        <div class="tit">고객유형</div>
                        <div class="txt">
                            <code:commCode id="custTypeCd" name="custTypeCd" codeCd="CU030" prefixLabel="전체" prefixValue="" multiple="false" />
                        </div>
                    </li>
                    <li class="w15per">
                        <div class="tit">회원등급</div>
                        <div class="txt">
                            <code:commCode id="mshipGradeCd" name="mshipGradeCd" codeCd="MB020" prefixLabel="전체" prefixValue="" multiple="false" others="disabled"  />
                        </div>
                    </li>
                    <li class="w18per">
                        <div class="tit">추천인</div>
                        <div class="txt">
                            <input type="text" class="it" title="추천인" name="rcmdrCustNo" id="rcmdrCustNo">
                        </div>
                    </li>
                    <li class="w22per">
                        <div class="tit">추천임직원</div>
                        <div class="txt">
                            <input type="text" class="it" title="추천임직원" name="rcmdExecvdempNo" id="rcmdExecvdempNo">
                        </div>
                    </li>
                    <li class="w13per">
                        <div class="tit">주의여부</div>
                        <div class="txt">
                            <code:commCode id="bllkmshpYn" name="bllkmshpYn" codeCd="CU180" prefixLabel="전체" prefixValue="" multiple="false"  />
                        </div>
                    </li>
<%--                    <li class="w17per">
                        <div class="tit w105">가족관계</div>
                        <div class="txt">
                            <code:commCode id="famlyRelCd" name="famlyRelCd" codeCd="CU040" prefixLabel="전체" prefixValue="" multiple="false"  />
                        </div>
                    </li> --%>
                    <li class="w20per">
                        <div class="tit w105">주거평수</div>
                        <div class="txt">
                            <code:commCode id="dwelNfpyCd" name="dwelNfpyCd" codeCd="CU050" prefixLabel="전체" prefixValue="" multiple="false" />
                        </div>
                    </li>
                    <li class="w12per">

                        <div class="tit">수신거부</div>
                        <div class="txt">
                            <code:commCode id="rcvRfslYn" name="rcvRfslYn" codeCd="CU160" prefixLabel="전체" prefixValue="" multiple="false" />
                        </div>                      
                    </li>
                    <li class="w15per">
                        <div class="tit">SMS수신동의</div>
                        <div class="txt">
                            <code:commCode id="smsRcvAgreeYn" name="smsRcvAgreeYn" codeCd="CU161" prefixLabel="전체" prefixValue="" multiple="false" />
                        </div>
                    </li>
<!--                    <li class="w24per"> -->
<!--                        <div class="tit">알림톡수신동의</div> -->
<!--                        <div class="txt"> -->
<%--                            <code:commCode id="alrmTkRcvAgreeYn" name="alrmTkRcvAgreeYn" codeCd="CU161" prefixLabel="전체" prefixValue="" multiple="false" />                      --%>
<!--                        </div> -->
<!--                    </li> -->
                    
<!--                    <li class="w12per"> -->
<!--                        <div class="tit w105">PUSH수신동의</div> -->
<!--                        <div class="txt"> -->
<%--                            <code:commCode id="pushRcvAgreeYn" name="pushRcvAgreeYn" codeCd="CU161" prefixLabel="전체" prefixValue="" multiple="false" />      --%>
<!--                        </div> -->
<!--                    </li>                    -->
                    <li class="w18per">
                        <div class="tit">이메일 수신동의</div>
                        <div class="txt">
                            <code:commCode id="emailRcvAgreeYn" name="emailRcvAgreeYn" codeCd="CU162" prefixLabel="전체" prefixValue="" multiple="false" />
                        </div>
                    </li>
                    <li class="w22per">
                        <div class="tit">멤버십 가입여부</div>
                        <div class="txt">
                            <code:commCode id="mshipSbscYn" name="mshipSbscYn" codeCd="CU161" prefixLabel="전체" prefixValue="" multiple="false" />
                        </div>
                    </li>
                    
                    <li class="w13per">
                        <div class="tit">CI인증여부</div>
                        <div class="txt">
                            <code:commCode id="ciCertfYn" name="ciCertfYn" codeCd="CU161" prefixLabel="전체" prefixValue="" multiple="false" />
                        </div>
                    </li>
                    
                    <li class="w20per">
                        <div class="tit w105">멤버십 ID</div>
                        <div class="txt">
                            <input type="text" class="it" title="통합고객번호" name="mshipLoginId" id="mshipLoginId" data-enter="search">
                        </div>
                    </li>
                    
                    <li class="w24per">
                        <div class="tit w105">승급점수</div>
                        <div class="txt">
                            <div class="mDate1">
                                <input type="text" class="it right data-check comma" maxlength="12" data-type="number2" id="fromMshipAdvncmtScore" name="fromMshipAdvncmtScore">
                                <span class="bar">~</span>
                                <input type="text" class="it right data-check comma" maxlength="12" data-type="number2" id="toMshipAdvncmtScore" name="toMshipAdvncmtScore">
                            </div>
                        </div>
                    </li>
                    
                    <li class="w40per">
                        <div class="tit">매출금액</div>
                        <div class="txt">
                            <div class="mDate1">
                                <input type="text" class="it right data-check comma" maxlength="13" data-type="number2" id="fromSaleAggrAmt" name="fromSaleAggrAmt">
                                <span class="bar">~</span>
                                <input type="text" class="it right data-check comma" maxlength="13" data-type="number2" id="toSaleAggrAmt" name="toSaleAggrAmt">
                            </div>
                        </div>
                    </li>
                    
                    
                    <li class="w13per">
                        <div class="tit">가입매장</div>
                        <a href="#;" data-click="storeSearchPop" class="mBtn1 m lWhite" style="cursor: pointer;">매장검색</a>
                        <a href="#;" data-click="storeAllRemove" class="mBtn1 m lGray" style="cursor: pointer;">전체삭제</a>                            
                    </li>

                    <li class="w50per">
                        <div class="txt">
                            <input type="text" id="rcmdStorNo" name="rcmdStorNo" data-type="storeSelect" data-max-cnt="10" readonly />
                        </div>
                    </li>
                    <!-- <li class="w14per">
                        <div class="tit"></div>
                        <div class="txt">
                        </div>
                    </li>
                    <li class="w15per">
                        <div class="tit"></div>
                        <div class="txt">
                        </div>                      
                    </li>
                    <li class="w18per">
                        <div class="tit"></div>
                        <div class="txt">
                        </div>
                    </li>
                    <li class="w24per">
                        <div class="tit"></div>
                        <div class="txt">
                        </div>
                    </li>
                    <li class="w24per">
                        <div class="tit"></div>
                        <div class="txt">
                        </div>
                    </li> -->
                </ul>
                <!-- <ul>
                    <li class="wAuto">
                        <span class="flex">
                            <input type="text" id="rcmdStorNo" name="rcmdStorNo" data-type="storeSelect" data-max-cnt="10" readonly />
                        </span>
                    </li>                   
                </ul> -->
                <div class="gRt">
                    <div class="mFlex2">
                        <a href="#" class="mBtn1" data-click="clear" style="margin-right: 5px">초기화</a>
                        <a href="#" class="mBtn1" data-click="search">검색</a>
                    </div>
                </div>
            </form>
        </div>
            
            <!-- //sort -->

            <div class="gTitle1">
                <h3 class="mTitle1">통합고객 목록 - 개인</h3>
                <div class="gRt">
                	<code:commCode name="sendType" id="sendType" codeCd="SD010" useYn6="Y" className="select wAuto" others='data-auth-type="c" style="display:none"  '/>
                    <a href="#" class="mBtn1 lWhite" data-auth-type="c" style="display:none"   data-click="targetMsgSendPop">발송</a>
<!--                        <a href="#" class="mBtn1 lWhite">고객그룹</a> -->
                    <a href="#" class="mBtn1 gray" data-auth-type="u" style="display:none"   data-click="getDownloadReason">엑셀다운로드</a>
<!--                        <a href="#" class="mBtn1 primary ml17">신규고객등록</a> -->
<!--                        <a href="#" class="mBtn1 primary">관계등록</a> -->
                    <a href="#" class="mBtn1 lPrimary" data-auth-type="c" style="display:none"   data-click="popupBlack"><span class="iFace">주의고객등록</span></a>
                </div>
            </div>
<!--                <div class="mBoard1 mCustomScrollbar hSortRow3 pType1"> --> 
                    <div  id="divGrid" style="height:${rightBoxHeight4}" data-grid-id="grdList" 
                    data-pagenation="Y" 
                    data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
                    data-type="grid" 
                    data-scroll-x="Y"
                    data-block-ui="Y"
                    data-grid-callback="onGridLoad" 
                    data-tpl-url="<c:url value='/static/gridTemplate/cst/CR002.xml'/>">
                </div>
                
    </div>
</div>

<form id="sendForm" name="sendForm">
	<input type="hidden" id="USERID" name="USERID" value="cmm_1">
	<input type="hidden" id="VTYPE" name="VTYPE" value="1">
	<input type="hidden" id="CLIENT" name="CLIENT" value="099">
	<input type="hidden" id="CAMPAIGN_ID" name="CAMPAIGN_ID" value="GRP_20220713172404">
</form>

<script>    

function clear()
{
	$('#frmSearch').clearForm();
	/* 콤보박스 전체 셋팅 */
	$("#gndrCd").val("");
	$("#marryYn").val("");
	$("#custStatusCd").val("");
	$("#custTypeCd").val("");
	$("#mshipGradeCd").val("");
	$("#bllkmshpYn").val("");
	$("#dwelNfpyCd").val("");
	$("#rcvRfslYn").val("");
	$("#smsRcvAgreeYn").val("");
	$("#emailRcvAgreeYn").val("");
	$("#mshipSbscYn").val("");
	$("#ciCertfYn").val("");
	$("#mshipTypeCd").val("");
	/* 그리드초기화 */
	grdList.clear();
	storeAllRemove();
}
// 매장팝업을 호출한다
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

/* 공통코드 그리드 load */
function grdList_load(gridView, gridId) {
    //search();
    
}
function getDownloadReason(){
    Utilities.textDialog("","개인정보 다운로드 사유를 적으세요",false,700,500);
}
function changeText(reason){ 
    if(!reason)
        return;
    var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    param.indiInfoHandlPrsnNo = "${LOGIN_USER.userId}";
    param.connPrsnIpAddr = "${peerIpAddr}";
    param.dnldTxn = reason;
    param.pfmWorkCd = "003";
    grdList.exportExcel("고객목록.xlsx",true,url,param)
//  param.recordCountPerPage = 100000;
//     grdList.ex(url, param);
}
/* 검색조건 검색 */
function search() {
	
	fnMinusComma();
	
    $("form#frmSearch").find("#currentPageNo").val(1);
    var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    
//  param.recordCountPerPage = 100000;
    grdList.loadUrl(url, param);
    
    fnAddComma();
}

function fnMinusComma()
{ 
	$("#fromMshipAdvncmtScore").val(minusComma($("#fromMshipAdvncmtScore").val()));
    $("#toMshipAdvncmtScore").val(minusComma($("#toMshipAdvncmtScore").val()));
    $("#fromSaleAggrAmt").val(minusComma($("#fromSaleAggrAmt").val()));
    $("#toSaleAggrAmt").val(minusComma($("#toSaleAggrAmt").val()));
}

function fnAddComma()
{
	$("#fromMshipAdvncmtScore").val(addComma($("#fromMshipAdvncmtScore").val()));
	$("#toMshipAdvncmtScore").val(addComma($("#toMshipAdvncmtScore").val()));
	$("#fromSaleAggrAmt").val(addComma($("#fromSaleAggrAmt").val()));
	$("#toSaleAggrAmt").val(addComma($("#toSaleAggrAmt").val()));
}
/* 그리드 컬럼 클릭 */
/* 공통코드 Row클릭 시 */
function grdList_rowChanged(grdList, oldRow, newRow, rowData) {

    var _current_itgCustNo = rowData.itgCustNo;
    
    if (newRow > -1) {
        //탭화면으로 이동
//      Utilities.openMenuTab("CusCampaignList");
        
        
//      var colInfo =  grdList.gridWrapper.columns[0];

//         var chkth = grdList.gridWrapper.gridWrap.find("th.tui-grid-cell-header[data-column-name='chkgrd']");
        
//         var chkList = grdList.gridWrapper.gridWrap.find("input[type=checkbox][data-row-key='"+ newRow +"'][name='checkbox_grdList']");
        
//         if(chkList.is("checked") == true){
//          chkList.prop("checked", false);
//         }else{
//          chkList.prop("checked", true);
//         } 
            
//      var saveJson = grdList.getCheckedJson();
    
//      if(saveJson.length == 0){
//          grdList.checkItem(newRow, true);
//      }else{
//          grdList.checkItem(newRow, false);
//      }
        
//         console.log(chkList);
//         chkList.prop("checked", true);
 //       $("input:checkbox[name='checkbox_grdList']").is(":checked") == true : false;

        
        

//      Utilities.mapToForm(rowData,"frmDetail");

//      $("#mshipSbscDt").val(rowData.mshipSbscDt); 
//      //셀렉트박스 변경 값선택
//      $("#gndrCd").val(rowData.gndrCd).prop("selected", true);
    
    }
}


/* 우측상단 블랙고객등록 팝업 */
//블랙고객
function popupBlack(){

    var selectedData = grdList.getCheckedJson();
    if(selectedData.length == 1){
        var pitgCustNo = selectedData[0].itgCustNo;

        console.log("그리드 체크된 데이터 : " , selectedData);
        console.log("그리드 체크된 데이터 로우넘 : " + selectedData[0]._attributes.rowNum);
        console.log("그리드 체크된 그리드 로우의 통합고객번호 : " + selectedData[0].itgCustNo);
        
        // 블랙등록 회원 파라미터로 넘기면 ?? 블랙등록 이력 상세가 뜬다??
        var url = "<c:url value='blackCus/detail'/>/" + "null";
        Utilities.openModal(url,1000,600);      
    }else{
        if(selectedData.length > 1){
            alert("그리드에서 블랙등록할 회원을 한명만 선택 하세요.");
        }else{
            alert("그리드에서 블랙등록할 회원을 선택하세요.");
        }
    }


}

/* 그리드 셀 더블 클릭 */
function onGridCellDblClick(gridView, itemIndex, column, json, value){

    Utilities.openMenuTab("cmmCustBas" , "custDivCd=1&custNm=" + json.custNm + "&itgCustNo=" + json.itgCustNo + "&searchFlag=" + "1");

}

function chkGrade(obj){

    if( $(obj).val() == "003" )
    {
        $("#frmSearch #mshipGradeCd").attr("disabled", false);
        $("#frmSearch #mshipGradeCd").val(""); 
    }
    else
    {
    	$("#frmSearch #mshipGradeCd").attr("disabled", true);
        $("#frmSearch #mshipGradeCd").val("");
    }
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
	var campId = "CR002_"+ new Date().getTime();
	var clientId = "002";

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
	var url = "<c:url value='cmmCustBas/saveTargetSendInfo${urlSuffix}'/>";
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

</script>           