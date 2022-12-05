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
                <h3 class="mTitle1">멤버십 회원통계</h3>
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
					<h3 class="mTitle1">성별분포</h3>
					<div class="gRt">
						<code:btnGroup name="memberStat" hideDelete="true" hideInsert="true" hideSave="true" dispName="성별분포" gridId="grdList1"/>
					</div>
			</div>
			<div id="divGrid"  style="height:151px"
				   data-grid-id="grdList1" 
                      data-pagenation="N" 
                      data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
                      data-type="grid" 
                      data-grid-callback="onGridLoad" 
                      data-tpl-url="<c:url value='/static/gridTemplate/cst/memberStat_1.xml'/>">
			</div>
			
			<div class="gTitle1">
					<h3 class="mTitle1">연령분포</h3>
					<div class="gRt">
						<code:btnGroup name="memberStat" hideDelete="true" hideInsert="true" hideSave="true" dispName="연령분포" gridId="grdList2"/>
					</div>
			</div>
			<div id="divGrid"  style="height:221px"
				   data-grid-id="grdList2" 
                      data-pagenation="N" 
                      data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
                      data-type="grid" 
                      data-grid-callback="onGridLoad" 
                      data-tpl-url="<c:url value='/static/gridTemplate/cst/memberStat_2.xml'/>">
			</div>
			
			<div class="gTitle1">
					<h3 class="mTitle1">일별신규회원</h3>
					<div class="gRt">
						<code:btnGroup name="memberStat" hideDelete="true" hideInsert="true" hideSave="true" dispName="일별신규회원" gridId="grdList3"/>
					</div>
			</div>
			<div id="divGrid"  style="height:290px"
				   data-grid-id="grdList3" 
                      data-pagenation="N" 
                      data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
                      data-type="grid" 
                      data-grid-callback="onGridLoad" 
                      data-tpl-url="<c:url value='/static/gridTemplate/cst/memberStat_3.xml'/>">
			</div>
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
}

function search1(){
	var url = "<c:url value='${urlPrefix}/getMemberStat1List${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    grdList1.loadUrl(url,param);
}

function search2(){
	var url = "<c:url value='${urlPrefix}/getMemberStat2List${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    grdList2.loadUrl(url,param);
}

function search3(){
	var url = "<c:url value='${urlPrefix}/getMemberStat3List${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    grdList3.loadUrl(url,param);
}

/* 그리드 로드 */
function grdList1_load(gridView,gridId){
    //search1();
}

</script>