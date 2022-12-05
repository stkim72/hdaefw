<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="mPopup1">
    <form id="frmMain">
   		<input type="hidden" id="mshipCoupnBasNo" name="mshipCoupnBasNo" value="${mshipCoupnBasNo}"/>
    	<input type="hidden" id="fromPblsStdDay" name="fromPblsStdDay" value="${fromPblsStdDay}"/>
    	<input type="hidden" id="toPblsStdDay" name="toPblsStdDay" value="${toPblsStdDay}"/>
    	<input type="hidden" id="toBuysDay" name="toBuysDay" value="${toBuysDay}"/>
		<div class="title">
			<h1>쿠폰사용후 구매 상세 목록</h1>
			<a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
		</div>
		<div class="cont">
    	<!-- <div class="mSort2 medium"> --> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
	        <!-- <ul> -->
	            <!-- <li class="wAuto">
	                <div class="tit w100">주문일</div>
                  		<div class="txt">
                    	<div class="mDate1">
                    		<input class="it" type="text" data-type="dateRangeStart" data-range-end="cntrEndDt" id="cntrStaDt" name="cntrStaDt" data-enter="search" data-button="Y"/>
                    		<span class="bar">~</span>
                    		<input class="it" type="text" id="cntrEndDt" name="cntrEndDt" data-enter="search" data-button="Y"/>
                    	</div>
                 	</div>
	            </li> -->
	            <!-- <li class="wAuto">
	                <div class="tit">회원명</div>
	                <div class="txt">
	                    <input type="text" name="custNm" id="custNm" class="it w120" title="회원명" value="">
	                </div>
	            </li> -->
	            <!-- <li class="wAuto ml35">
	                <div class="tit">휴대전화번호</div>
	                <div class="txt">
	                    <input type="text" name="itgCustNo" id="itgCustNo" class="it w185" title="휴대전화번호" value="">
	                </div>
	            </li> -->
	        <!-- </ul> -->
	       <!--  <div class="button posRt">
            	<a href="#" data-click="search" class="mBtn1">검색</a>
        	</div> -->
    	<!-- </div> -->
    		<div class="gTitle1">
				<h3 class="mTitle1">쿠폰사용후 구매 상세</h3>
				<div class="gRt">
					<code:btnGroup name="gradeStat" hideDelete="true" hideInsert="true" hideSave="true" dispName="쿠폰사용후 구매통계 상세" gridId="grdList"/>
				</div>
			</div>
    	</div>
   	</form>
    <div class="mBox1 p24">	
	   	<div  id="divGrid" style="height:500px" data-grid-id="grdList" 
			data-pagenation="N" 
			data-get-url="<c:url value='/example/getList'/>" 
			data-type="grid"
			data-scroll-x="Y"  
			data-block-ui="Y"
			data-grid-callback="onGridLoad" 
			data-tpl-url="<c:url value='/static/gridTemplate/cusstatus/couponUsedBuysDetail.xml'/>">		<!-- MB210.xml // mem/MB049.xml-->
		</div>
	</div>
</div>

<script>

/* 제휴사 목록 조회 */
function search(){
    var url = "<c:url value='${urlPrefix}/getCouponUsedBuysDetail${urlSuffix}'/>";
    var param = Utilities.formToMap("frmMain");
    grdList.loadUrl(url,param);
}

/* 그리드 로드 */
function grdList_load(gridView,gridId){
    search();
}

</script>