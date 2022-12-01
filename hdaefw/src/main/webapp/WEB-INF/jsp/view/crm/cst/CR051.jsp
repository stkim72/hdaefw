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
		    <h3 class="mTitle1">잠재고객 검색</h3>
		</div>
		    
	    <div class="mSort2 type2">
		    <!-- 고객유형코드 [001 : 잠재고객 , 002 : 가망고객 , 003 : 체험고객 , 004 : 구매고객 , 005 : 추천고객 , 006 : 충성고객]        */  -->
		       <form role="form" id="frmSearch">
		           <input type="hidden" id="custTypeCd" name="custTypeCd" title="고객유형코드" value="001">
					<ul>
						<li class="w20per">	
							<div class="tit w80">등록일</div>
							<div class="txt">
								<div class="mDate1">
									<input type="text" class="it date data-check" title="시작일" data-type="dateRangeStart" data-range-end="endDt" id="strtDt" name="strtDt" data-enter="search" data-button="Y" value="">
									<span class="bar">~</span>
									<input type="text" class="it date data-check" title="마지막일" id="endDt" name="endDt" data-enter="search" data-button="Y" value="">
								</div>
							</div>
						</li>
						<li class="w11per">
							<div class="tit w60">성별</div>
							<div class="txt">
									<code:commCode id="gndrCd" name="gndrCd" codeCd="S040" prefixLabel="전체" prefixValue=""/>
							</div>
						</li>
						<li class="w20per">
							<div class="tit w100">생년월일</div>
							<div class="txt">
								<div class="mDate1">
									<input type="text" class="it date" title="생년월일시작일" data-type="dateRangeStart" data-range-end="birthdayEndDt" id="birthdayStrtDt" name="birthdayStrtDt" data-enter="search" data-button="Y" value="">
									<span class="bar">~</span>
									<input type="text" class="it date" title="생년월일마지막일" id="birthdayEndDt" name="birthdayEndDt" data-enter="search" data-button="Y" value="">
								</div>
							</div>
						</li>
						<%-- <li class="w100per">
                            <div class="tit w100">매장채널</div>
                            <div class="txt">
                                <div class="mFlex2">
                                    <code:commCode className="wAuto" id="storChlCd" name="storChlCd" codeCd="ST040" prefixLabel="전체" prefixValue=""/>
                                    <code:commCode className="wAuto" id="distrctCd" name="distrctCd" codeCd="CU100" prefixLabel="전체" prefixValue=""/>
                                    <code:commCode id="rcmdStorNo" name="rcmdStorNo" codeCd="" codeType="storeNo" select2="true" prefixLabel="전체" prefixValue=""/>
                                </div>
                            </div>
                        </li> --%>
                    </ul>
                    <ul>
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
					</ul>
					<div class="gRt">
                        <div class="mFlex2">
                            <a href="#" class="mBtn1" data-click="search">검색</a>
                        </div>
                    </div>
			</form>
	    </div>
	 
		<div class="gTitle1">
			<h3 class="mTitle1">잠재고객 목록</h3>
			<div class="gRt">
			     <a href="#" class="mBtn1 gray"  data-auth-type="u" style="display:none" data-click="getDownloadReason">엑셀다운로드</a>
			     <%-- <code:btnGroup name="blackList" hideDelete="true" hideInsert="true" hideSave="true" dispName="잠재고객 목록" gridId="grdList"/> --%>
			</div>
		</div>
			
		<div id="divGrid"  style="height:${rightBoxHeight4}"
	        data-grid-id="grdList" 
			data-pagenation="Y" 
			data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
			data-type="grid" 
			data-block-ui="Y"
			data-grid-callback="onGridLoad" 
			data-tpl-url="<c:url value='/static/gridTemplate/cst/CR051.xml'/>">
		</div>
	</div>
</div>
<script>

window.onload = function(){
	
/* 	var today = moment();
    var dt = today.format("YYYYMMDD");
    
	$("#birthdayStrtDt").val(dt);
	$("#birthdayEndDt").val(dt); */
	
	dateSetting();
}

function dateSetting(){
	var strStartDay= moment().subtract(3, 'month').format('YYYYMMDD');
    var strEndDay = moment().format("YYYYMMDD");
    
    $("#strtDt").val(strStartDay);
    $("#endDt").val(strEndDay);
}

function search()
{
	var valid = validateForm("#frmSearch"); //  class='data-check' 인 경우만 체크
	if(!valid) {
		alert("필수 항목들을 기입해 주세요.");
		return;
	}
	
    var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    var rcmdStorNos = param.rcmdStorNo;
    
    var date1 = new Date(param.strtDt.substr(0,4),param.strtDt.substr(4,2)-1,param.strtDt.substr(6,2));
    var date2 = new Date(param.endDt.substr(0,4),param.endDt.substr(4,2)-1,param.endDt.substr(6,2));

    var interval = date2 - date1;
    var day = 1000*60*60*24;
    var month = day*30;
    var year = month*12;

    if (parseInt(interval/month) > 3) {
    	alert('등록일 검색 범위는 3개월 이내로 입력해 주세요.');
	    return ;
    }
    
    if(rcmdStorNos.indexOf(",") > 0)
    {
        param.rcmdStorNo = rcmdStorNos.split(",");
    }
    grdList.loadUrl(url,param);
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

function getDownloadReason(){
    Utilities.textDialog("","개인정보 다운로드 사유를 적으세요",false,700,500);
}
function changeText(reason){ 
    if(!reason)
        return;
    var param = Utilities.formToMap("frmSearch");
    param.indiInfoHandlPrsnNo = "${LOGIN_USER.userCd}";
    param.connPrsnIpAddr = "${peerIpAddr}";
    param.dnldTxn = reason;
    param.pfmWorkCd = "003";
    grdList.exportExcel("잠재고객 목록.xlsx",true,null,param)
}
//setToday(); 

</script>