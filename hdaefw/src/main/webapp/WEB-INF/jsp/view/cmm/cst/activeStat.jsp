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
		    <h3 class="mTitle1">멤버십 활동 회원 통계 검색</h3>
		</div>
		    
	    <div class="mSort2 type2">
		       <form role="form" id="frmSearch">
					<ul class="w100per">
                        <li class="w11per">
                            <div class="gRadio1">
			                    <div class="cont">
			                        <label class="mRadio1 type2">
			                            <input type="radio" title="월간" checked="true" value="month" name="searchDiv" id="searchDiv" >
			                            <span class="label">월간</span>
			                        </label>
			                        <label class="mRadio1 type2">
			                            <input type="radio" title="일간" value="day" name="searchDiv" id="searchDiv">
			                            <span class="label">일간</span>
			                        </label>
			                    </div>
			                </div>
                        </li>
                    
						<li class="w40per">	
							<div class="tit">최종활동 기간</div>
							<div class="txt" id="month">
								<div class="mDate1">
									<input type="text" title="시작일" data-type="month" data-range-end="endDtM" id="strtDtM" name="strtDtM" data-enter="search" data-button="Y" value="">
									<span class="bar">~</span>
									<input type="text" title="마지막일" data-type="month" id="endDtM" name="endDtM" data-enter="search" data-button="Y" value="">
								</div>
							</div>
							<div class="txt" id="day" hidden="true">
                                <div class="mDate1">
                                    <input type="text" class="it date" title="시작일" data-type="dateRangeStart" data-range-end="endDtD" id="strtDtD" name="strtDtD" data-enter="search" data-button="Y" value="">
                                    <span class="bar">~</span>
                                    <input type="text" class="it date" title="마지막일" id="endDtD" name="endDtD" data-enter="search" data-button="Y" value="">
                                </div>
                            </div>
                            
						</li>
						<!-- <li class="w20per">	
							<div class="txt">
								
							</div>
						</li> -->
					</ul>
					<div class="gRt">
                        <div class="mFlex2">
                            <a href="#" class="mBtn1" data-click="search">검색</a>
                        </div>
                    </div>
			</form>
	    </div>
	 
		<div class="gTitle1">
			<h3 class="mTitle1">멤버십 활동 회원 통계 목록 ( 성별분포 )</h3>
			<div class="gRt">
				<code:btnGroup name="active1" hideDelete="true" hideInsert="true" hideSave="true" dispName="멤버십 활동 회원 통계 목록 ( 성별분포 )" gridId="grdList"/>
			</div>
		</div>
			
		<div id="divGrid"  style="height:121px"
	        data-grid-id="grdList" 
			data-pagenation="N" 
			data-get-url="<c:url value='${urlPrefix}/getActiveStat1List${urlSuffix}'/>" 
			data-type="grid" 
			data-block-ui="Y"
			data-grid-callback="onGridLoad" 
			data-tpl-url="<c:url value='/static/gridTemplate/cst/activeStat_1.xml'/>">
		</div>
		
		<div class="gTitle1">
            <h3 class="mTitle1">멤버십 활동 회원 통계 목록 ( 연령분포 )</h3>
            <div class="gRt">
                <code:btnGroup name="active2" hideDelete="true" hideInsert="true" hideSave="true" dispName="멤버십 활동 회원 통계 목록 ( 연령분포 )" gridId="grdList2"/>
            </div>
        </div>
            
        <div id="divGrid2"  style="height:121px"
            data-grid-id="grdList2" 
            data-pagenation="N" 
            data-get-url="<c:url value='${urlPrefix}/getActiveStat2List${urlSuffix}'/>" 
            data-type="grid" 
            data-block-ui="Y"
            data-grid-callback="onGridLoad" 
            data-tpl-url="<c:url value='/static/gridTemplate/cst/activeStat_2.xml'/>">
        </div>
        
        <div class="gTitle1">
            <h3 class="mTitle1">멤버십 활동 회원 통계 목록 ( 등급별 )</h3>
            <div class="gRt">
                <code:btnGroup name="active3" hideDelete="true" hideInsert="true" hideSave="true" dispName="멤버십 활동 회원 통계 목록 ( 등급별 )" gridId="grdList3"/>
            </div>
        </div>
            
        <div id="divGrid3"  style="height:296px"
            data-grid-id="grdList3" 
            data-pagenation="N" 
            data-get-url="<c:url value='${urlPrefix}/getActiveStat3List${urlSuffix}'/>" 
            data-type="grid" 
            data-block-ui="N"
            data-grid-callback="onGridLoad" 
            data-tpl-url="<c:url value='/static/gridTemplate/cst/activeStat_3.xml'/>">
        </div>
        
	</div>
</div>
<script>

window.onload = function(){
	
	var today = moment();
    var dt = today.format("YYYYMMDD");
    
	$("#strtDtD").val(dt);
	$("#endDtD").val(dt);

}

$("input[name='searchDiv']:radio").change(function () {
    //라디오 버튼 값을 가져온다.
    var noticeCat = this.value;
    if(noticeCat == "month")
    {
    	$("#day").hide();
    	$("#month").show();
    }
    else if(noticeCat == "day")
    {
    	$("#month").hide();
        $("#day").show();
    }
    //
                    
   
});


function search()
{
	searchGrid1();
	searchGrid2();
	searchGrid3();
}

function searchGrid1()
{
    var url = "<c:url value='${urlPrefix}/getActiveStat1List${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    grdList.loadUrl(url,param);
}
function searchGrid2()
{
    var url = "<c:url value='${urlPrefix}/getActiveStat2List${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    grdList2.loadUrl(url,param);
}
function searchGrid3()
{
    var url = "<c:url value='${urlPrefix}/getActiveStat3List${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    grdList3.loadUrl(url,param);
}

setToday(); 

</script>