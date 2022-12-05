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
            <h3 class="mTitle1">발행카드 검색</h3>
        </div>
        

			<div class="mSort2 type3">
			
			
		<form role="form" id="frmCardHst" name="frmCardHst">
			
			<input type="hidden" id="stpltNo" name="stpltNo"/>
			
			 <div class="row">
			
				<ul>
				
						<li class="w20per">
						<div class="tit">발행기간</div>
						<div class="txt">
							<div class="mDate1">
								<input class="it data-check" type="text" data-type="dateRangeStart" data-range-end="pblsEndDt" id="pblsStaDt" name="pblsStaDt" data-enter="search" data-button="Y"/>
								<span class="bar">~</span>
								<input class="it data-check" type="text" id="pblsEndDt" name="pblsEndDt" data-enter="search" data-button="Y"/>
							</div>
						</div>
					</li>
					
					
					
					<li class="w20per">
						<div class="tit">카드유형</div>
						<div class="txt">
							<div class="mFlex2">
								<span class="flex"> <code:commCode  className="select data-check" id="cardTypeCd" name="cardTypeCd" codeCd="CD010" prefixLabel="전체" prefixValue=""/></span>	
							</div>
						</div>
					</li>
					<li class="w20per">
						<div class="tit">카드마스터명</div>
						<div class="txt">
							 <input type="text" class="it" title="카드마스터명" name="cardBasNm" id="cardBasNm" value="" >
						</div>
					</li>
					
				</ul>
				
				
				<ul>
					<li class="w20per">
						<div class="tit">카드번호</div>
						<div class="txt">
							<div class="mFlex2">
								<span class="flex"><input type="text" name="cardBasNo" id="cardBasNo" class="it" value=""/></span>	
							</div>
						</div>
					</li>
					<li class="w20per">
						<div class="tit">회원명</div>
						<div class="txt">
							<input type="text" name="custNm" id="custNm"  class="it" value=""/>
						</div>
					</li>
					<li class="w20per">
						<div class="tit">연락처</div>
						<div class="txt">
							<input type="text" name="mphonNo" id="mphonNo"  class="it" value=""/>
						</div>
					</li>
					
					<li class="w20per">
					 <div class="button posRt">
                        <a href="#" class="mBtn1"  data-click="search">검색</a>
                    </div>
                    </li>
                    
				</ul>
				
				
				
			</div>
			
		</form>
	</div>


	<div class="gTitle1">
			<h3 class="mTitle1">발행카드 목록</h3>
			<!-- <div class="gRt">
			
			</div> -->
	</div>
	 <div id="divCardHst" style="height:540px"
			  data-post="Y"
			  data-grid-id="grdList"
			  data-pagenation="Y"
			  data-get-url="<c:url value='/cmmMshipCardBas/grdCardHstList'/>"
			  data-type="grid" 
              data-block-ui="Y"
			  data-tpl-url="<c:url value='/static/gridTemplate/memship/cmmCardPblsHst2.xml'/>">
						
	</div>
</div>


<script>

/* 조회 */
function search() {
	$("form#frmCardHst").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getCardHstList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmCardHst");
	param.recordCountPerPage = 20;
	grdList.loadUrl(url, param);
} 

function dateSetting(){
	var strStartDay= moment().subtract(1, 'month').format('YYYYMMDD');
    var strEndDay = moment().format("YYYYMMDD");
    
    $("#pblsStaDt").val(strStartDay);
    $("#pblsEndDt").val(strEndDay);
}



window.onload = function(){
	dateSetting();
}


/* 그리드 로드 */
function grdList_load(gridView,gridId){
   // search();
}

/* 그리드 셀 더블 클릭 */
function onGridCellDblClick(gridView, itemIndex, column, json, value){
	//showDetail(json); 
}


</script>