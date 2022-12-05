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
            <h3 class="mTitle1">고객승급점수 검색</h3>
        </div>
        
        

			<!-- sort -->
			<div class="mSort2 type2">
			
					<form role="form" id="frmAdvnHst" name="frmAdvnHst">
			
			<input type="hidden" id="stpltNo" name="stpltNo"/>
			
            
           <!--  <input type="hidden" id="itgCustNo" name="itgCustNo"/>     -->
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
					<li class="w15per">
						<div class="tit">매장코드</div>
						<div class="txt">
							<div class="mFlex2">
								<span class="flex"><input type="text" class="it" id="storNo" name="storNo" placeholder="전체" title="매장코드" ></span>
							
							</div>
						</div>
					</li>
					<li class="w15per">
						<div class="tit">매장명</div>
						<div class="txt">
							<input type="text" class="it" id="storNm" name="storNm" placeholder="전체" />
						</div>
					</li>
					
					<li class="w15per">
						<div class="tit">통합회원번호</div>
						<div class="txt">
							<input type="text" class="it" id="itgCustNo" name="itgCustNo" value="" placeholder="전체" />
						</div>
					</li>
				</ul>
				
				<ul>
					<li class="w20per">
						<div class="tit">회원명</div>
						<div class="txt">
							<div class="mFlex2">
								<span class="flex"><input type="text" class="it" id="custNm" name="custNm" placeholder="전체" title="회원명" ></span>
								
							</div>
						</div>
					</li>
					<li class="w15per">
						<div class="tit">채널코드</div>
						<div class="txt">
							<div class="mFlex2">
								<span class="flex"><input type="text" class="it" id="pblsChlCd" name="pblsChlCd" placeholder="전체" title="채널코드"></span>
								
							</div>
						</div>
					</li>
				
					<li class="w15per">
						<div class="tit">전표번호</div>
						<div class="txt">
							<div class="mFlex2">
								<span class="flex"><input type="text" class="it" id="chitNo" name="chitNo" placeholder="전체" title="전표번호"></span>
								
							</div>
						</div>
					</li>
					
					<div class="right">
						<button class="mBtn1" onclick="$('#frmAdvnHst')[0].reset()" style="margin-right: 5px">초기화</button>
						<button class="mBtn1" data-click="search" style="margin-right: 10px">검색</button>
					</div>
				</ul>
		</form>
				
			</div>
			<!-- //sort -->
			
	


	<div class="gTitle1">
			<h3 class="mTitle1">고객승급점수 목록</h3>
			<div class="gRt">
			
			</div>
	</div>
	 <div id="divCardHst" style="height:540px"
			  data-post="Y"
			  data-grid-id="grdList"
			  data-pagenation="Y"
			  data-get-url="<c:url value='/cmmMshipPBas/grdCardHstList'/>"
			  data-type="grid" 
                    	data-block-ui="Y"
			  data-tpl-url="<c:url value='/static/gridTemplate/memship/cmmAdvncmtHst.xml'/>">
						
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
	var valid = validateForm("#frmAdvnHst"); //  class='data-check' 인 경우만 체크
	if(!valid) {
		alert("필수 항목들을 기입해 주세요.");
		return;
	}
	
	$("form#frmCardHst").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmAdvnHst");
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