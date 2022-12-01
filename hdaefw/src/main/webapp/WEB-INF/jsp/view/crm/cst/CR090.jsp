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
	        <h3 class="mTitle1">체험고객 검색</h3>
	    </div>
	        
	    <div class="mSort2 type2">
	        <form role="form" id="frmSearch">
		       <!-- 고객유형코드 [001 : 잠재고객 , 002 : 가망고객 , 003 : 체험고객 , 004 : 구매고객 , 005 : 추천고객 , 006 : 충성고객]        */  -->
		       <input type="hidden" id="custTypeCd" name="custTypeCd" title="고객유형코드" value="003">
					<ul class="w100per">
						<li class="w12per">
							<div class="tit w100">체험구분</div>
							<div class="txt">
								<select class="select w100" id="exprnType" name="exprnType">
					              	<option value="">전체</option>
					              	<option value="001">웰카페</option>
					              	<option value="002">홈체험</option>
								</select>
	                            <%-- <code:commCode id="exprnType" name="exprnType" codeCd="" prefixLabel="전체" prefixValue=""/> --%>
							</div>
						</li>
						<li class="w18per">
							<div class="tit w100">체험기기</div>
							<div class="txt">
	                            <code:commCode id="itemCd" name="itemCd" codeCd="GD050" prefixLabel="전체" prefixValue=""/>
							</div>
						</li>
						<li class="w11per">
							<div class="tit w100">체험횟수</div>
							<div class="txt">
								<input type="text" id="cnt" name="cnt" class="it" title="총 구매횟수" oninput="this.value=this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');">
							</div>
						</li>
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
						
					</ul>
					<div class="gRt">
                        <div class="mFlex2">
                            <a href="#" class="mBtn1" data-click="search">검색</a>
                        </div>
                    </div>
			</form>
		</div>
		<div class="gTitle1">
			<h3 class="mTitle1">체험고객 목록</h3>
			<div class="gRt">
			    <a href="#" class="mBtn1 gray" data-auth-type="u" style="display:none"  data-click="getDownloadReason">엑셀다운로드</a>
				<%-- <code:btnGroup name="blackList" hideDelete="true" hideInsert="true" hideSave="true" dispName="체험고객 목록" gridId="grdList"/> --%>
			</div>
		</div>
			
		<div  id="divGrid" style="height:${rightBoxHeight4}" 
	        data-grid-id="grdList" 
			data-pagenation="Y" 
			data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
			data-type="grid"
			data-block-ui="Y"
			data-grid-callback="onGridLoad" 
			data-tpl-url="<c:url value='/static/gridTemplate/cst/CR090.xml'/>">
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
	var strStartDay= moment().subtract(1, 'month').format('YYYYMMDD');
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
    grdList.loadUrl(url,param);
}

/* 그리드 셀 더블 클릭 */
function onGridCellDblClick(gridView, itemIndex, column, json, value){
	showDetail(json); 
}

/* 상세화면 팝업 로드(수정) */
function showDetail(json){
	var url = "<c:url value='${urlPrefix}/detail${urlSuffix}'/>?itgCustNo="+json.itgCustNo+"&custNm="+json.custNm+"&salesDivCd="+json.salesDivCd;	
    Utilities.openModal(url,1200,630);
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
    grdList.exportExcel("체험고객 목록.xlsx",true,null,param)
}

//setToday(); 

</script>