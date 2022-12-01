<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<form role="form" id="frmSearch">
<div id="wrapIframe" class="closed"> <!-- 고객정보 닫힘 -->
		
	<div class="mGrid1">
		<!-- right -->
		<div class="gRight">
			<div class="gTitle1 line">
                <h3 class="mTitle1">추천 통계</h3>
            </div>
            
			<!-- sort -->
			<div class="mSort2 type2">
            	
            	<div class="gRadio1">
                    <div class="cont">
                        <label class="mRadio1 type2">
                            <input type="radio" title="월간" checked="true" value="month" name="searchDiv" id="searchDiv">
                            <span class="label">월간</span>
                        </label>
                        <label class="mRadio1 type2">
                            <input type="radio" title="일간" value="day" name="searchDiv" id="searchDiv">
                            <span class="label">일간</span>
                        </label>
                    </div>
                </div>
                
				<ul>
					<li class="w12per">
						<div class="tit">기간</div>
						<div class="txt" id="test">
							<div class="mDate1">
								<input type="text" title="시작일" data-type="month" data-range-end="endDtM" id="strtDtM" name="strtDtM" data-enter="search" data-button="Y" value="">
								<span class="bar">~</span>
								<input type="text" title="마지막일" data-type="month" id="endDtM" name="endDtM" data-enter="search" data-button="Y" value="">
							</div>
						</div>
						<div class="txt" id="test2" hidden="true">
                        	<div class="mDate1">
								<input type="text" class="it date" title="시작일" data-type="dateRangeStart" data-range-end="endDtD" id="strtDtD" name="strtDtD" data-enter="search" data-button="Y" value="">
								<span class="bar">~</span>
								<input type="text" class="it date" title="마지막일" id="endDtD" name="endDtD" data-enter="search" data-button="Y" value="">
							</div>
						</div>
					</li>
				</ul>
				<div class="gRt">
                    <div class="mFlex2">
                        <a href="#" class="mBtn1" data-click="search">검색</a>
                    </div>
                </div>
			</div>
			
			<div class="gTitle1">
					<h3 class="mTitle1">연령분포</h3>
					<div class="gRt">
						<code:btnGroup name="reccommendStat" hideDelete="true" hideInsert="true" hideSave="true" dispName="연령분포" gridId="grdList2"/>
					</div>
			</div>
			<div id="divGrid"  style="height:226px"
				   data-grid-id="grdList2" 
                      data-pagenation="N" 
                      data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
                      data-type="grid" 
                      data-grid-callback="onGridLoad" 
                      data-tpl-url="<c:url value='/static/gridTemplate/cst/CR216_2.xml'/>">
			</div>
			
			<div class="gTitle1">
					<h3 class="mTitle1">성별분포</h3>
					<div class="gRt">
						<code:btnGroup name="reccommendStat" hideDelete="true" hideInsert="true" hideSave="true" dispName="성별분포" gridId="grdList1"/>
					</div>
			</div>
			<div id="divGrid"  style="height:226px"
				   data-grid-id="grdList1" 
                      data-pagenation="N" 
                      data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
                      data-type="grid" 
                      data-grid-callback="onGridLoad" 
                      data-tpl-url="<c:url value='/static/gridTemplate/cst/CR216_1.xml'/>">
			</div>
			
			<div class="gTitle1">
					<h3 class="mTitle1">일별 추천 회원</h3>
					<div class="gRt">
						<code:btnGroup name="reccommendStat" hideDelete="true" hideInsert="true" hideSave="true" dispName="일별추천회원" gridId="grdList3"/>
					</div>
			</div>
			<div id="divGrid"  style="height:296px"
				   data-grid-id="grdList3" 
                      data-pagenation="N" 
                      data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
                      data-type="grid" 
                      data-grid-callback="onGridLoad" 
                      data-tpl-url="<c:url value='/static/gridTemplate/cst/CR216_3.xml'/>">
			</div>
			
			<!-- <div class="mGrid2 type2" style="height:200px;"> -->
			    <!-- left -->
			    <!-- //체험추천 그리드영역 -->
			   <%--  <div class="lt" style="width:30%;margin-right:90px">
			        <div class="gTitle1 mb10">
			            <h3 class="mTitle1">체험추천 Top 10 매장</h3>
			            <div class="gRt">
							<code:btnGroup name="reccommendStat" hideDelete="true" hideInsert="true" hideSave="true" dispName="체험추천 Top 10 매장" gridId="grdList4"/>
						</div>
			        </div>
					<div id="divGrid"  style="height:401px"
				      data-grid-id="grdList4" 
                      data-pagenation="N" 
                      data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
                      data-type="grid" 
                      data-grid-callback="onGridLoad" 
                      data-tpl-url="<c:url value='/static/gridTemplate/cst/CR216_4.xml'/>">
					</div>
			    </div> --%>
			    <!-- //left -->
			    
			    <!-- center -->
			    <!-- //구매추천 그리드영역 -->
			    <%-- <div class="lt" style="width:30%;">
			    	<div class="gTitle1 mb10">
			            <h3 class="mTitle1">구매추천 Top 10 매장</h3>
			            <div class="gRt">
							<code:btnGroup name="reccommendStat" hideDelete="true" hideInsert="true" hideSave="true" dispName="구매추천 Top 10 매장" gridId="grdList5"/>
						</div>
			        </div>
			        <div id="divGrid"  style="height:401px"
				   	  data-grid-id="grdList5" 
                      data-pagenation="N" 
                      data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
                      data-type="grid" 
                      data-grid-callback="onGridLoad" 
                      data-tpl-url="<c:url value='/static/gridTemplate/cst/CR216_4.xml'/>">
					</div>
			    </div> --%>
			    <!-- center -->
			    <!-- right -->
			    <!-- //가입추천 그리드영역 -->
			    <%-- <div class="rt" style="width:30%">
			        <div class="gTitle1 mb10">
			            <h3 class="mTitle1">가입추천 Top 10 회원</h3>
			            <div class="gRt">
							<code:btnGroup name="reccommendStat" hideDelete="true" hideInsert="true" hideSave="true" dispName="가입추천 Top 10 회원" gridId="grdList6"/>
						</div>
			        </div>
					<div id="divGrid"  style="height:401px"
				      data-grid-id="grdList6" 
                      data-pagenation="N" 
                      data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
                      data-type="grid" 
                      data-grid-callback="onGridLoad" 
                      data-tpl-url="<c:url value='/static/gridTemplate/cst/CR216_5.xml'/>">
					</div>
			    </div> --%>
			    <!-- //right -->
			<!-- </div> -->
		</div>
		<!-- //right -->
	</div>
</div>
</form>

<script>

$("input[name='searchDiv']:radio").change(function () {
	
    //라디오 버튼 값을 가져온다.
    var noticeCat = this.value;
    if(noticeCat == "month")
    {
    	$("#test2").hide();
    	$("#test").show();
    }
    else if(noticeCat == "day")
    {
    	$("#test").hide();
        $("#test2").show();
    }
});

function search(){
	 search1();
	 search2();
	 search3();
	 search4();
	 search5();
	 search6();
}

function search1(){
	var url = "<c:url value='${urlPrefix}/getRecommendStat1List${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    grdList1.loadUrl(url,param);
}

function search2(){
	var url = "<c:url value='${urlPrefix}/getRecommendStat2List${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    grdList2.loadUrl(url,param);
}

function search3(){
	var url = "<c:url value='${urlPrefix}/getRecommendStat3List${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    grdList3.loadUrl(url,param);
}

/* function search4(){
	var url = "<c:url value='${urlPrefix}/getRecommendStat4List${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    grdList4.loadUrl(url,param);
} */

/* function search5(){
	var url = "<c:url value='${urlPrefix}/getRecommendStat5List${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    grdList5.loadUrl(url,param);
} */

/* function search6(){
	var url = "<c:url value='${urlPrefix}/getRecommendStat6List${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    grdList6.loadUrl(url,param);
} */

/* 그리드 로드 */
function grdList1_load(gridView,gridId){
    //search1();
}

</script>