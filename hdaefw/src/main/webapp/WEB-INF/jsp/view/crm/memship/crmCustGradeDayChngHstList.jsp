<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 



<div id="wrapIframe" class="closed"> <!-- 고객정보 닫힘 -->
		
    <!-- cont -->
    <div class="cont">
        
        <div class="gTitle1 line">
            <h3 class="mTitle1">고객승급점수 일일 검색</h3>
        </div>
        
        
	
			<!-- sort -->
			<div class="mSort2 type2">
			
				<form role="form" id="frmGradeDay" name="frmGradeDay">
			
			
				<ul>
					<li class="w20per">
						<div class="tit">발생기간</div>
						<div class="txt">
							<div class="mDate1">
								<input class="it data-check" type="text" data-type="dateRangeStart" data-range-end="pblsEndDt" id="pblsStaDt" name="pblsStaDt" data-enter="search" data-button="Y"/>
								<span class="bar">~</span>
								<input class="it data-check" type="text" id="pblsEndDt" name="pblsEndDt" data-enter="search" data-button="Y"/>
							</div>
						</div>
					</li>
					
					
					<li class="w20per">
						<div class="tit">변경예정등급</div>
						<div class="txt">
							<div class="mFlex2">
								<code:commCode  className="select w100" id="mshpGradeCd" name="mshpGradeCd" codeCd="MB020" prefixLabel="전체" prefixValue=""/>

								
							</div>
						</div>
					</li>
					
						<li class="w20per">
						<div class="tit">변경전등급</div>
						<div class="txt">
							<div class="mFlex2">
								<code:commCode  className="select w100" id="chngPreMshpGradeCd" name="chngPreMshpGradeCd" codeCd="MB020" prefixLabel="전체" prefixValue=""/>

								
							</div>
						</div>
					</li>
					
					<li class="w20per">
						<div class="tit">회원명</div>
						<div class="txt">
							<div class="mFlex2">
								<span class="flex"><input type="text" class="it" id="custNm" name="custNm" placeholder="전체" title="회원명" ></span>
								
							</div>
						</div>
					</li>
					
					
					<div class="" style="margin-left:50px">
						<button class="mBtn1" onclick="$('#frmGradeDay')[0].reset()" style="margin-right: 5px">초기화</button>
						<button class="mBtn1" data-click="search" style="margin-right: 10px">검색</button>
					</div>
					
				</ul>
				
			
				
		</form>
			</div>
			<!-- //sort -->
			

	<div class="gTitle1">
			<h3 class="mTitle1">고객승급점수 일일 목록</h3>
			<div class="gRt">
			
			</div>
	</div>
	 <div id="divCardHst" style="height:540px"
			  data-post="Y"
			  data-grid-id="grdList"
			  data-pagenation="Y"
			  data-get-url="<c:url value='/cmmCustGradeDayChngHst/getList'/>"
			  data-type="grid" 
                    	data-block-ui="Y"
			  data-tpl-url="<c:url value='/static/gridTemplate/memship/cmmCustGradeDayChngHst.xml'/>">
						
	</div>
</div>

<script>

window.onload = function(){
	dateSetting();
}

function dateSetting(){
	var strStartDay= moment().subtract(1, 'month').format('YYYYMMDD');
    var strEndDay = moment().format("YYYYMMDD");
    
    $("#pblsStaDt").val(strStartDay);
    $("#pblsEndDt").val(strEndDay);
}

/* 조회 */
function search() {
	if($("#custNm").val() == "" && ($("#pblsStaDt").val() != $("#pblsEndDt").val())){
		alert("조회 조건 중 회원명이 없으면 1일 조회만 가능합니다.");
		return;
	}
	
	var valid = validateForm("#frmGradeDay"); //  class='data-check' 인 경우만 체크
	if(!valid) {
		alert("필수 항목들을 기입해 주세요.");
		return;
	}
	
	$("form#frmCardHst").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmGradeDay");
	param.recordCountPerPage = 20;
	grdList.loadUrl(url, param);
} 


/* 그리드 로드 */
function grdList_load(gridView,gridId){
    //search();
}

/* 그리드 셀 더블 클릭 */
function onGridCellDblClick(gridView, itemIndex, column, json, value){
	//showDetail(json); 
}


</script>