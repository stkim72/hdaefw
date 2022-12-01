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
            <h3 class="mTitle1">쿠폰내역(건별) 검색</h3>
        </div>        
           
        <div class="mSort2 type2">
            <form role="form" id="frmSearch">
				<ul>
					<li class="wAuto">
                        <div class="tit">거래일</div>
                        <div class="txt">
                        <input type="text" data-type="month" id="searchMonth" name="searchMonth" data-enter="search" data-button="Y" value=""/>
                            <!-- <div class="mDate1">
                                <input type="text" class="it date" title="거래 시작일" data-type="dateRangeStart" data-range-end="endDt" id="strtDt" name="strtDt" data-enter="search10" data-button="Y" value="">
                                <span class="bar">~</span>
                                <input type="text" class="it date" title="거래 종료일" id="endDt" name="endDt" data-enter="search" data-button="Y" value="">
                            </div> -->
                        </div>
                    </li>
					<li class="wAuto">
			            <div class="tit">정산기준일</div>
			            <div class="txt">
			                <div class="mDate1">
			                    <input type="text" class="it date" title="정산기준 시작일" data-type="dateRangeStart" data-range-end="endCalDt" id="strtCalDt" name="strtCalDt" data-enter="search" data-button="Y" value="">
                                <span class="bar">~</span>
                                <input type="text" class="it date" title="정산기준 종료일" id="endCalDt" name="endCalDt" data-enter="search" data-button="Y" value="">
			                </div>
			            </div>
			        </li>
			        <li class="wAuto">
			            <div class="tit">매장구분</div>
			            <div class="txt">
			                <code:commCode id="storDivCd" name="storDivCd" codeCd="ST010" prefixLabel="전체" prefixValue=""/>
			            </div>
			        </li>
			        <li class="wAuto">
			            <div class="tit">매장번호</div>
			            <div class="txt">
			                <input type="text" class="it" id="storNo" name="storNo" value="" oninput="this.value=this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');" />
			            </div>
			        </li> 
					<li class="wAuto">
						<div class="tit w105">매장명</div>
						<div class="txt">
							<input type="text" class="it" id="storNm" name="storNm" value="" />
						</div>
					</li>
					
				</ul>
			    <ul>
			        <li class="wAuto">
			            <div class="tit">거래번호</div>
			            <div class="txt">
			                <input type="text" class="it" id="chitNo" name="chitNo" value="" />
			            </div>
			        </li>
			        <li class="w18per">
			            <div class="tit w105">통합고객번호</div>
			            <div class="txt">
			                <input type="text" id="itgCustNo" name="itgCustNo" class="it" title="통합고객번호">
			            </div>
			        </li>
			        <li class="w18per">
			            <div class="tit w105">쿠폰마스터NO</div>
			            <div class="txt">
			                <input type="text" id="mshipCoupnBasNo" name="mshipCoupnBasNo" class="it" title="쿠폰마스터" >
			            </div>
			        </li>
			    </ul>
			    <div class="button posVm"> <!-- 버튼 상하 가운데 정렬 : class="posVm" -->
                    <a href="#" class="mBtn1" data-click="search">검색</a>
                </div> 
            </form>
        </div>	
	
			
 

		<div class="gTitle1">
			<h3 class="mTitle1">쿠폰내역(건별) 목록</h3>
			<div class="gRt">
				<code:btnGroup name="pointUseList" hideDelete="true" hideInsert="true" hideSave="true" dispName="쿠폰내역(건별)" gridId="grdList"/>
			</div>
		</div>
		
		<div  id="divGrid" style="height:${rightBoxHeight4}" data-grid-id="grdList" 
		                                        data-pagenation="Y" 
		                                        data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
		                                        data-type="grid" 
		                                        data-block-ui="Y"
		                                        data-grid-callback="onGridLoad" 
		                                        data-tpl-url="<c:url value='/static/gridTemplate/mem/MB056.xml'/>">
		</div>
	</div>
</div>

<script>

/* 공통코드 그리드 load */
function grdList_load(gridView, gridId) {
	search();
}

function search()
{
	var url = "<c:url value='${urlPrefix}/getCouponList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");

   	grdList.loadUrl(url,param);

}

//setToday(); 

</script>