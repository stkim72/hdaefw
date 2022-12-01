<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<style>

.ui-widget-content .ui-state-active:hover {
	border: 1px solid #003eff;
	background: #007fff;
	font-weight: normal;
	color: #ffffff;
}

.ui-menu-item b {
	color: red;
}

.tui-datetime-input{
	width:110px;
}

.select{
	width:110px;
}


.mBox1.h717 {
     height: 600px;
}

.mGrid2.type2 .mBoard1 {
    height: 500px !important;
}

.mBox1 {
    background-color: #fff;
    border: 1px solid #9c9c9c;
    padding: 17px 10px;
    height:600px;
    /* margin-right:10px */
}

 #frmDetail label.error { margin-left: 10px; color:red; }

.demoInputBox{padding:10px; border:#F0F0F0 1px solid; border-radius:4px;}
.btnAction{background-color:#2FC332;border:0;padding:10px 40px;color:#FFF;border:#F0F0F0 1px solid; border-radius:4px;}
.invalid{border:#FF0000 1px solid;}        
        
</style>


<script>
$(document).ready(function() {
	/* tab */
	$(".jsTab1 li > a").on("click",function(){
		$(this).parent().parent().children().removeClass("active");
		$(this).parent().addClass("active");
		return false;
	});
	$(".jsTab2 li > a").on("click",function(){
		$(this).parent().parent().children().removeClass("active");
		$(this).parent().addClass("active");
		$(this).parent().parent().parent().parent().children(".tabCont").addClass("hidden");
		$( $(this).attr("href") ).removeClass("hidden");
		return false;
	});
	/* //tab */
});
</script>



<div class="mPopup1">

	    <!-- header -->
    <div class="title">
    
        <h1>스탬프마스터 정보</h1>
        <a href="#"  data-click="closeModal"   class="close">팝업 닫기</a>
    </div>
    <!-- //header -->
    
    <div id="wrapIframe" class="closed"> <!-- 고객정보 닫힘 -->
    	
	<div class="mGrid1">
		<!-- right -->
		<div class="gRight">

<br>
			<!-- sort -->
			<div class="mSort2">
			
         	<form role="form" id="frmSearch" name="frmSearch">
				<ul>
					<li class="wAuto">
						<div class="tit">스탬프마스터</div>
						<div class="txt">
                            <div class="mFlex2">
								<span class="flex"><input type="text" class="it w185" name="mshipStmpBasNo" id="mshipStmpBasNo"  required="true" disabled placeholder="자동생성" value="${stmpInfo.mshipStmpBasNo}" title="스탬프마스터"></span>
                                <span class="button">
                                   <!--  <a href="#" class="mBtn1" data-click="searchGods">검색</a> -->
                                </span>
							</div>
						</div>
					</li>
				</ul>
            </form>    
			</div>
			<!-- //sort -->

            <!-- grid -->
            <div class="mGrid2">
                <!-- left -->
                <div class="lt">
                
         	<form role="form" id="frmDetail" name="frmDetail">
         	
         		<input type="hidden" name="mshipStmpBasNo" id="mshipStmpBasNo" value="${stmpInfo.mshipStmpBasNo}">
				
				<!-- box -->
				<div class="mBox1">
	                <div class="gTitle1 line">
	                    <h3 class="mTitle1">기본정보</h3>
	                </div>
	                <!-- board -->
	                <div class="mBoard2">
	                    <table>
	                        <caption>기본정보</caption>
	                        <colgroup>
	                            <col width="15%">
	                            <col width="20%">
	                            <col width="10%">
	                            <col width="10%">
	                            <col width="15%">
	                            <col width="30%">
	                        </colgroup>
	                        <tbody>
	                            <tr>
	                                <th scope="row" class="left">스탬프 마스터명</th>
	                                <td colspan="3">
	                                    <input type="text" class="it" title="스탬프 마스터명" name="stmpBasNm" id="stmpBasNm" value="${stmpInfo.stmpBasNm}" readonly>
	                                </td>
	                                <th scope="row" class="left">스탬프 유형</th>
	                                <td >
	                                    <select class="select data-check" title="스탬프 유형" name="stmpTypeCd" id="stmpTypeCd">
	                                        <option value="0">결제 시 적립</option>
	                                        <option value="1">이벤트시 적립</option>
	                                    </select>
	                                </td>
	                            </tr>
	                            <tr>
	                            	<th scope="row" class="left">스탬프 발행기간</th>
	                                <td class="left" colspan="3">
	                                    <input type="text" class="it w120 data-check" title="기간 시작일"  data-range-end="toUsePossDt"  name="fromUsePossDt" id="fromUsePossDt" value="${stmpInfo.fromUsePossDt}" readonly>
	                                    <span class="bar">~</span>
	                                    <input type="text" class="it  w120 data-check" title="기간 마지막일" name="toUsePossDt" id="toUsePossDt" value="${stmpInfo.toUsePossDt}" readonly>
	                                </td>
	                                <th scope="row" class="left">스탬프 1판 당 유효기간</th>
	                                <td class="left">
	                                    <label class="mCheckbox1">
	                                        <input type="checkbox" title="없음" checked="checked" name="chkValidPerd" data-value="Y" disabled>
	                                        <span class="label">없음</span>
	                                    </label>
	                                    <label class="mCheckbox1">
	                                        <input type="checkbox" title="있음" name="chkValidPerd" data-value="N" disabled>
	                                        <span class="label">있음</span>
	                                    </label>
	                                    <input type="hidden" id="validYn" name="validYn" >
	                                    <input type="text" class="it w75" title="일" id="validPerd" name="validPerd" value="${stmpInfo.validPerd}" readonly> 일
	                                </td>
	                            </tr>
	                            <tr>
	                            	<th scope="row" class="left">1판당 스탬프 수</th>
	                                <td class="left" >
	                                    <input type="text" class="it w75" title="1판당 스탬프 수" id="stmpQnty" name="stmpQnty" value="${stmpInfo.stmpQnty}" readonly> 개
	                                </td>
	                                <th scope="row" class="left">사용여부</th>
	                                <td>
	                                    <select class="select" title="기업유형" id="useYn" name="useYn">
	                                        <option value="Y">사용</option>
	                                        <option value="N">사용안함</option>
	                                    </select>
	                                </td>
	                            	<th scope="row" class="left">최대 판 수</th>
	                                <td class="left">
	                                    <label class="mCheckbox1">
	                                        <input type="checkbox" title="무제한" checked="checked" name="chkStmpMax" data-value="Y" disabled>
	                                        <span class="label">무제한</span>
	                                    </label>
	                                    <label class="mCheckbox1">
	                                        <input type="checkbox" title="최대" name="chkStmpMax" data-value="N" disabled>
	                                        <span class="label">최대</span>
	                                    </label>
	                                    <input type="hidden" name = "stmpMaxYn" id="stmpMaxYn">
	                                    <input type="text" class="it w75" title="판" id="stmpMaxCnt" name="stmpMaxCnt" value="${stmpInfo.stmpMaxCnt}" readonly> 판
	                                </td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
	                <!-- //board -->
	                
	                <div class="gTitle1 line mt13">
	                    <h3 class="mTitle1">발급정책</h3>
	                </div>
	                <!-- board -->
	                <div class="mBoard2">
	                    <table>
	                        <caption>발급정책</caption>
	                        <colgroup>
	                            <col width="10%">
	                            <col width="50%">
	                            <col width="15%">
	                            <col width="15%">
	                            <col width="10%">
	                        </colgroup>
	                        <tbody>
	                            <tr>
	                                <th scope="row" class="left">적립채널</th>
	                                <td class="left" >
	                                <c:forEach var="item" items="${chlList}" varStatus="vs">
	                                	<label class="mCheckbox1">
	                                        <input type="checkbox" title="${item.comnCdNm}" name="accumChl" data-value="${item.comnCd }" disabled>
	                                        <span class="label">${item.comnCdNm}</span>
	                                    </label>
	                                </c:forEach>
	                                </td>
	                                <th scope="row" class="left">쿠폰 할인 시 적립</th>
	                                <td colspan="2">
	                                    <select class="select data-check" title="쿠폰 할인 시 적립 여부" id="coupnAccumDcYn" name="coupnAccumDcYn">
	                                        <option value="Y">예</option>
	                                        <option value="N">아니오</option>
	                                    </select>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th scope="row" class="left">적용회원등급</th>
	                                <td class="left" >
	                                	<code:commCode  className="select data-check" id="mshipGradeCd" name="mshipGradeCd" codeCd="MB010" prefixLabel="맴버십등급" prefixValue=""/>
	                                    <code:commCode  className="select data-check" id="mshpGradeCd" name="mshpGradeCd" codeCd="MB020" prefixLabel="회원등급" prefixValue="" />
	                                    <select class="select w150 data-check"  name="cprtCmpNo" id="cprtCmpNo">
	                                    	<option value="">제휴사 선택</option>
	                                    </select>
	                                </td>
	                                <th scope="row" class="left">조건 금액 설정</th>
	                                <td class="br0" >
	                                    <div class="mFlex2">
	                                        <label class="mCheckbox1 notext">
	                                            <input type="checkbox" title="선택" id="chkCondYn" name="chkCondYn" checked="checked" disabled>
	                                            <span class="label">선택</span>
	                                        </label>
	                                        <input type="hidden" name="condYn" id="condYn">
	                                        <span class="flex">
	                                            <input type="text" class="it data-check" title="조건 금액 설정" id="condAmt" name="condAmt" readonly value="${stmpInfo.condAmt}"> 
	                                        </span>
	                                    </div>
	                                </td>
	                                <td class="left bl0">이상결제시 적립</td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
	                <!-- //board -->
	                
	                <div class="gTitle1 line mt13">
	                    <h3 class="mTitle1">혜택정책</h3>
	                </div>
	                <!-- board -->
	                <div class="mBoard2">
	                    <table border="1" >
	                        <caption>혜택정책</caption>
	                        <colgroup>
	                            <col width="10%">
	                            <col width="20%">
	                            <col width="8%">
	                            <col width="10%">
	                            <col width="10%">
	                        </colgroup>
	                        <tbody>
	                            <tr>
	                                <th scope="row" class="left">혜택 지급 기준</th>
	                                <td class="left">
	                                    <label class="mCheckbox1">
	                                        <input type="checkbox" name="bnfitCdView" title="쿠폰" data-value="2" disabled>
	                                        <span class="label">쿠폰</span>
	                                    </label>
	                                    <label class="mCheckbox1">
	                                        <input type="checkbox" name="bnfitCdView" title="포인트" data-value="1" disabled>
	                                        <span class="label">포인트</span>
	                                    </label>
	                                    <input type="hidden" name="bnfitCd" id = "bnfitCd">
	                                </td>
	                                <th scope="row" class="left">포인트 설정</th>
	                                <td>
	                                    <div class="mFlex2">
	                                        <span class="flex">
	                                            <input type="text" class="it" title="포인트" id="pointScore" readonly value="${stmpInfo.pointScore}">
	                                        </span>
	                                    </div>
	                                </td>
	                                <td>
	                                    포인트 적립
	                                </td>
	                                
	                            </tr>
	                            <tr>
	                            	<th scope="row" class="left">혜택 쿠폰 이름</th>
	                                <td>
	                                    <div class="mFlex2">
	                                        <span class="flex">
	                                            <input type="text" class="it" title="쿠폰" id="coupnNm" readonly value="${stmpInfo.coupnNm}">
	                                        </span>
	                                    </div>
	                                </td>
	                                <th scope="row" class="left">혜택 쿠폰 코드</th>
	                                <td colspan="2">
	                                    <div class="mFlex2">
	                                        <span class="flex">
	                                            <input type="text" class="it" title="쿠폰" id="coupnNo" readonly value="${stmpInfo.coupnNo}">
	                                        </span>
	                                    </div>
	                                </td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
	                <!-- //board -->
	            </div>
	            <!-- //box -->
	            <div class="button posRt" style="float:right">
                        <a href="#" class="mBtn1 lGray" data-click="closeModal"  id="btnClose" >닫기</a>
				</div>
			</form>
                </div>
                <!-- //left -->
                
                <!-- right -->
                <div class="rt">
                    
                    <!-- tab -->
                    <div class="mTab1 jsTab2">
                        <ul>
                            <li class="active"><a href="#jsTabCont1_1">적용매장</a></li>
                            <li><a href="#jsTabCont1_2">적용상품</a></li>
                            <li><a href="#jsTabCont1_4">발행스탬프</a></li>
                        </ul>
                    </div>
                    <!-- //tab -->
                    
                    <div id="jsTabCont1_1" class="mBox1 p10 tabCont">
                    
                    	 <!-- box -->
			             <form name="frmStore" id="frmStore" onsubmit="searchStoreRel();return false;">
            	
			            	<input type="hidden" name="mshipStmpBasNo" id="mshipStmpBasNo" value="${stmpInfo.mshipStmpBasNo}">
			            
			                <!-- sort -->
			                <div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
			                    <ul>
			                        <li class="wAuto ml20">
			                            <div class="tit">지역</div>
			                            <div class="txt">
			                                <code:commCode  className="select" id="distrctCd" name="distrctCd" codeCd="CU100" prefixLabel="선택" prefixValue=""/>
			                            </div>
			                        </li>
			                        <!-- <li class="wAuto ml20">
			                            <div class="tit">매장코드</div>
			                            <div class="txt">
			                                <input type="text"  className="it" id="storNo" name="storNo" codeCd="MB160" />
			                            </div>
			                        </li> -->
			                        <li class="wAuto ml35">
			                            <div class="tit">매장명</div>
			                            <div class="txt">
			                                 <input type="text" class="it" name="storNm" id="storNm" value=""/>
			                            </div>
			                            <span class="button">
			                                <button type="submit" class="mBtn1 btnSubmit"  data-file-info="button" data-click="searchStoreRel" >검색</a>
			                            </span>
			                        </li>
			                    </ul>
			                </div>
			                
			                </form>
			                <!-- //sort -->
			                
			                 <div id="divShop" style="height:540px"
								  data-post="Y"
								  data-grid-id="grdShopList"
								  data-pagenation="Y"
								  data-get-url="<c:url value='/crmMshipApplyStorRel/getList'/>"
								  data-type="grid" 
								  data-tpl-url="<c:url value='/static/gridTemplate/memship/crmMshipSmtpStorRel.xml'/>"
							  >
							</div>
			              <!-- //box -->
			              
                    </div>
                    
                    <div id="jsTabCont1_2" class="mBox1 p10 tabCont hidden">
                    	 <!-- box -->
			             <form name="frmGods" id="frmGods" onsubmit="searchGodsRel();return false;">
            	
			            	<input type="hidden" name="mshipStmpBasNo" id="mshipStmpBasNo" value="${stmpInfo.mshipStmpBasNo}">
			            
			                <!-- sort -->
			                <div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
			                    <ul>
			                        <li class="wAuto ml20">
			                            <div class="tit">제품군</div>
			                            <div class="txt">
			                                <select class="select ml20" id="godsTypeCd" name="godsTypeCd">
											   <option value="">선택해주세요.</option>
											     <c:forEach var="item" items="${godsLclss}">
											     	<option value="${item.godsLclssCd}">${item.godsLclssCdNm}</option>
											    </c:forEach>
											 </select>
			                            </div>
			                        </li>
			                    
			                        <li class="wAuto ml35">
			                            <div class="tit">제품명</div>
			                            <div class="txt">
			                                 <input type="text" class="it" name="godsNm" id="godsNm" value=""/>
			                            </div>
			                            <span class="button">
			                                <button type="submit" class="mBtn1 btnSubmit"  data-file-info="button" data-click="searchGodsRel" >검색</a>
			                            </span>
			                        </li>
			                    </ul>
			                </div>
			                
			                </form>
			                <!-- //sort -->
			                
			                 <div id="divGods" style="height:540px"
								  data-post="Y"
								  data-grid-id="grdGodsList"
								  data-pagenation="Y"
								  data-get-url="<c:url value='/crmMshipCoupnBas/getGodsRelList'/>"
								  data-type="grid" 
								  data-tpl-url="<c:url value='/static/gridTemplate/memship/crmMshipSmtpGodsRel.xml'/>"
							  >
							</div>
			            
			              <!-- //box -->
                    </div>
                    
						<div id="jsTabCont1_4" class="mBox1 p10 tabCont hidden">
						
							<form name="frmStmp" id="frmStmp" onsubmit="searchStmp();return false;">
            	
			            	<input type="hidden" name="mshipStmpBasNo" id="mshipStmpBasNo" value="${stmpInfo.mshipStmpBasNo}">
			            
			                <!-- sort -->
			                <div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
			                     <ul>
			                     	<li class="w25per">
			                            <div class="tit w75">사용자 아이디</div>
			                            <div class="txt">
			                               <input type="text" class="it w100" name="stmpItgCustNo" id="stmpItgCustNo" title="아이디"> 
			                            </div>
			                            <%-- <div class="tit">스탬프마스터상태</div>
			                            <div class="txt">
			                                <code:commCode  className="select" id="useYn" name="useYn" codeCd="S010" prefixLabel="선택" prefixValue=""/>
			                            </div> --%>
			                        </li>
			                        <li class="w45per">
			                            <div class="tit w80">적립기간</div>
			                            <div class="txt">
			                                <input type="text" class="it date w65" title="적립 시작일" value="" data-type="dateRangeStart" data-button="Y" name="fromAccumDt" id="fromAccumDt" data-range-end="toAccumDt">
			                                <span class="bar">~</span>
			                                <input type="text" class="it date w65" title="적립 완료일" value="" data-button="Y" name="toAccumDt" id="toAccumDt">
			                                
			                                <span class="button">
			                                    <button type="submit" class="mBtn1 btnSubmit" data-file-info="button" data-click="searchStmpList" style="cursor: pointer;">검색</button>
			                                </span>
			                            </div>
			                        </li>
			                   
			                    </ul>
			                </div>
			                
			                </form>
			                <!-- //sort -->
			                
			                    <div id="divHis" style="height:509px"
								  data-post="Y"
								  data-grid-id="grdStmpList"
								  data-pagenation="Y"
								  data-get-url="<c:url value='/crmMshipCardBasList/getHisList'/>"
								  data-type="grid" 
								  data-tpl-url="<c:url value='/static/gridTemplate/memship/crmMshipSmtpListRel.xml'/>"
								  >
								</div>
			                
						</div> 
                </div>
                <!-- //right -->
	</div>
	
</div>



<script>
var _current_code_cd = null;

/* 공통코드 엑셀 다운로드 */
function excelDownload() {
	grdShopList.exportExcel("공통코드 리스트.xlsx");
}

/* 공통코드 엑셀 업로드 */
function excelUpload() {
	grdShopList.importExcel();
}

/* 하부코드 그리드 load */
function grdDetail_load(gridView, gridId) {
}

/* 공통코드 Row클릭 시 */
function grdShopList_rowChanged(grdList, oldRow, newRow, rowData) {
	if(rowData.stat == "c")
		_current_code_cd = "c";
	else
		_current_code_cd = rowData.comnCd;
	if (newRow > -1) {
	
		var param = {
			topComnCd : rowData.topComnCd,
			prntsComnCd : rowData.comnCd,
			comnCdLvlNo : Number(rowData.comnCdLvlNo) + 1,
			recordCountPerPage : 100000
		};
		if(!param.prntsComnCd)
			param.prntsComnCd = "QWERTREWQ";
		var url = "<c:url value='${urlPrefix}/getList'/>${urlSuffix}";
		//grdDetail.loadUrl(url, param);
	}
}

function onGridLoad(gridView, gridId) {
	
}

/* 그리드 컬럼 클릭 */
function onGridCellClick(gridView, rowIndex, columnName, colIndex,
		fieldIndex) {

}

/* 그리드 컬럼 더블 클릭 */
function onGridCellDblClick(gridView, rowIndex, columnName, colIndex,
		fieldIndex) {

}

function onGridRowChanged(gridView, oldRow, newRow) {

}

/* 적용매장 검색 */
function searchStoreRel() {
	$("form#frmStore").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getListStoreRel${urlSuffix}'/>";
	var param = Utilities.formToMap("frmStore");
	param.recordCountPerPage = 100000;
	grdShopList.loadUrl(url, param);
	//grdDetail.clear();
} 



/* 적용상품 검색 */
function searchGodsRel() {
	$("form#frmGods").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getGodsRelList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmGods");
	param.recordCountPerPage = 100000;
	grdGodsList.loadUrl(url, param);
	//grdDetail.clear();
} 



/* 스탬프이력 검색 */
function searchStmpList() {
	$("form#frmStmp").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getListStmpRel${urlSuffix}'/>";
	var param = Utilities.formToMap("frmStmp");
	param.recordCountPerPage = 100000;
	grdStmpList.loadUrl(url, param);
} 

/* 발행스탬프 검색 */
function searchStmp() {
	/* $("form#frmStmp").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getStmpList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmStmp");
	param.recordCountPerPage = 100000;
	grdCpnList.loadUrl(url, param); */
} 

function saveStorePop(){
	var url = "<c:url value='${urlPrefix}/popStore${urlSuffix}'/>?mshipStmpBasNo=${stmpInfo.mshipStmpBasNo}";
	Utilities.openModal(url, "1000", "800");
}

function saveGodsPop(){
	var url = "<c:url value='${urlPrefix}/popGods${urlSuffix}'/>?mshipStmpBasNo=${stmpInfo.mshipStmpBasNo}";
	Utilities.openModal(url, "1000", "800");
}


function saveChlPop(){
	var url = "<c:url value='${urlPrefix}/popChl${urlSuffix}'/>?mshipStmpBasNo=${stmpInfo.mshipStmpBasNo}";
	Utilities.openModal(url, "1000", "800");
}


function closeModal(){
	
	 Utilities.closeModal();
     Utilities.getOpener().search();
}

/* 하부코드 수정 Validate*/
function saveValidate(gridView){
	var cuGridData = gridView.getSaveJson();
	for(var i=0; i<cuGridData.length; i++){
	    if(Utilities.isEmpty(cuGridData[i].comnCd)){
	    	alert("코드아이디를 입력하세요.");
	    	return false;
	    }
// 	    if(Utilities.isEmpty(cuGridData[i].comnCdOdrg)||cuGridData[i].comnCdOdrg<=0){
// 	    	alert("순번은 1이상입니다.");
// 	    	return false;
// 	    }
	    if(Utilities.isEmpty(cuGridData[i].comnCdNm)){
            alert("코드명을 입력하세요.");
            return false;
        }
	}
	return true;
}


// 자동검색
$(function() {
	
	if( "${stmpInfo.mshipStmpBasNo}" != ""){
		$("#btnDel").show();
	}
    
    var url = "<c:url value='${urlPrefix}/getGodsBaseList${urlSuffix}'/>";
    $('#godsNm').autocomplete({
    	delay: 200,
    	minLength: 2,
        source : function(request, response) {
            $.ajax({
            	type : 'get',
                url: url +"?godsNm="+ $('#godsNm').val() ,
                success : function(data) {
                    // 서버에서 json 데이터 response 후 목록 추가
                    response(
                        $.map(data, function(item) {
                            return {
                                value : item.godsNm , 
                                label : item.godsNm ,
                                test : item.godsNo
                            }
                        })
                    );
                }
            });
        }
    }).autocomplete('instance')._renderItem = function(ul, item) { // UI 변경
    	
    	return $("<li>")
        .append("<div class='autocomplete-item'><div class='autocomplete-img-container'></div><div onclick=\"searchGodsBase('"+ item.label +"', '"+ item.test +"')\"> " + item.label + "</div></div>")
          .appendTo(ul);
    	
    };
    
});


// 제품 검색후 값 지정
function searchGodsBase(label, val){
	$("#prsnttnGodsCd").val(val);
	$("#godsNm").val(label);
}

// 스탬프사용기간 설정 체크
function cpnUseDateChk(){
	
	if( $("#useStdDayCondCd").is(":checked") ){

		$("#fromUseStdDay").val("");
		$("#fromUseStdDay").attr("disabled", true);
		$("#toUseStdDay").val("");
		$("#toUseStdDay").attr("disabled", true);
		$("#coupnUsePossDay").val('');
		$("#coupnUsePossDay").attr("disabled", false);
		
	}else{
		
		$("#fromUseStdDay").val("");
		$("#fromUseStdDay").attr("disabled", false);
		$("#toUseStdDay").val("");
		$("#toUseStdDay").attr("disabled", false);
		$("#coupnUsePossDay").val('');
		$("#coupnUsePossDay").attr("disabled", true);
	}
}

$(document).ready(function(){
	
	// 제휴사 데이터 바인딩
	var url = "<c:url value='${urlPrefix}/getPartnerList${urlSuffix}'/>";
	Utilities.getAjax(url, null, true, function(data, jqXHR) {
		if (Utilities.processResult(data, jqXHR, "제휴사 데이터을 읽어오질 못했습니다.")) {
			$.each( data , function(i){
				$("#cprtCmpNo").append("<option value='"+ this.cprtCmpNo +"' "+  (("${stmpInfo.cprtCmpNo}" == this.cprtCmpNo) ? 'selected' : '' ) +">"+  this.cprtCmpNm +"</option>\n");
			});
			
		}
		
	});
	
	var mshipGradeCd = '${stmpInfo.mshipGradeCd}';
	$('#frmDetail #mshipGradeCd').val(mshipGradeCd).trigger('change').attr("disabled", true);
	
	var mshpGradeCd = '${stmpInfo.mshpGradeCd}';
	$('#frmDetail #mshpGradeCd').val(mshpGradeCd).trigger('change').attr("disabled", true);
	
	var cprtCmpNo = '${stmpInfo.cprtCmpNo}';
	$('#frmDetail #cprtCmpNo').val(cprtCmpNo).trigger('change').attr("disabled", true);
	
	var validYn = '${stmpInfo.validYn}';
	$('input[type="checkbox"][name="chkValidPerd"]').each(function (){
		$('input[type="checkbox"][name="chkValidPerd"]').prop('checked', false);
		if (validYn == $(this).data('value')) {
			$(this).prop('checked', true);
		}
	});
	
	var stmpMaxYn = '${stmpInfo.stmpMaxYn}';
	$('input[type="checkbox"][name="chkStmpMax"]').each(function (){
		$('input[type="checkbox"][name="chkStmpMax"]').prop('checked', false);
		if (stmpMaxYn == $(this).data('value')) {
			$(this).prop('checked', true);
		}
	});
	
	var condYn = '${stmpInfo.condYn}';
	if(condYn == 'Y') {
		$('input[type="checkbox"][name="chkCondYn"]').prop('checked', true);
	} else {
		$('input[type="checkbox"][name="chkCondYn"]').prop('checked', false);
	}
	
	var bnfitCd = '${stmpInfo.bnfitCd}';
	if(bnfitCd == '0') {
		$('input[type="checkbox"][name="bnfitCdView"]').eq(0).prop('checked', true);
		$('input[type="checkbox"][name="bnfitCdView"]').eq(1).prop('checked', false);
	} else {
		$('input[type="checkbox"][name="bnfitCdView"]').eq(0).prop('checked', false);
		$('input[type="checkbox"][name="bnfitCdView"]').eq(1).prop('checked', true);
	}
	
	var accumChlTxn = ${stmpInfo.accumChlTxn};
	$('input[type="checkbox"][name="accumChl"]').prop('checked', false);
	$.each(accumChlTxn ,function (key,value) {
		$('input[type="checkbox"][name="accumChl"]').each(function (){
			if (value == $(this).data('value')) {
				$(this).prop('checked', true);
			}
		});
	});
	
	var useYn = '${stmpInfo.useYn}';
	$("#frmDetail #useYn").val(useYn).trigger('change').attr("disabled", true);
	
	var stmpTypeCd = '${stmpInfo.stmpTypeCd}';
	$("#frmDetail #stmpTypeCd").val(stmpTypeCd).trigger('change').attr("disabled", true);
	
	var coupnAccumDcYn = '${stmpInfo.coupnAccumDcYn}';
	$("#frmDetail #coupnAccumDcYn").val(coupnAccumDcYn).trigger('change').attr("disabled", true);
});

</script>



