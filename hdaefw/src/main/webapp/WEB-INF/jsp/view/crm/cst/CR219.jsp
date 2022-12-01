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
                <h3 class="mTitle1">체험 통계</h3>
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
				<h3 class="mTitle1">체험 목록</h3>
				<div class="gRt">
					<code:btnGroup name="experienceStat" hideDelete="true" hideInsert="true" hideSave="true" dispName="체험 목록" gridId="grdList"/>
				</div>
			</div>
			<div id="divGrid"  style="height:${rightBoxHeight4}" 
				   data-grid-id="grdList" 
                      data-pagenation="Y" 
                      data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
                      data-type="grid" 
                      data-block-ui="Y"
                      data-grid-callback="onGridLoad" 
                      data-tpl-url="<c:url value='/static/gridTemplate/cst/CR219.xml'/>">
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
	var url = "<c:url value='${urlPrefix}/getExperienceStatList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    if(param.searchDiv == "month"){
    	if(!param.strtDtM || !param.endDtM){
    		alert("검색기간을 선택하세요");
    		return;
    	}
    	param.strtDt = param.strtDtM + "01";
    	param.endDt = param.endDtM + "31";
    }else {
//     	if(!param.strtDtD || !param.endDtD){
//             alert("검색기간을 선택하세요");
//             return;
//         }
        param.strtDt = param.strtDtD;
        param.endDt = param.endDtD;
    }
    
    grdList.loadUrl(url,param);
}

/* 그리드 로드 */
function grdList_load(gridView,gridId){
    //search();
}

</script>