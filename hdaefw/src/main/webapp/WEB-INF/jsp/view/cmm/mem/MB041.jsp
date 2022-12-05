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
	        <h3 class="mTitle1">프로모션 모니터링</h3>
	    </div>
    
    	<!-- sort -->
		<div class="mSort2 type3">
			<form role="form" id="frmSearch" name="frmSearch">
			
			<div class="row">
				<ul>
					<li class="w12per">
	            		<div class="tit w100">프로모션유형</div>
	            		<div class="txt">
	                		<code:commCode name="searchPromTypeCd" id="searchPromTypeCd" codeCd="PM100" prefixLabel="전체" prefixValue=""/>
	    				</div>
					</li>
					<li class="w12per">
					    <div class="tit w100">상태</div>
					    <div class="txt">
					        <code:commCode className="select data-check w160" id="searchStatusCd" name="searchStatusCd" codeCd="PM110" prefixLabel="전체" prefixValue="" selectedValue="002" />
					    </div>
					</li>
					
					<li class="w20per">
			        	<div class="tit w100">프로모션명</div>
	                  	<div class="txt">
	                  		<input type="text" class="it" id="searchPromBasNm" name="searchPromBasNm" title="프로모션명">
	                  	</div>
	              	</li>
					
					<li class="w33per">
     		 			<div class="tit w100">시작일</div>
	                  	<div class="txt">
                        	<div class="mDate1">
                        		<input class="it" type="text" data-type="dateRangeStart" data-range-end="searchPromEndYmd" id="searchPromStaYmd" name="searchPromStaYmd" data-enter="search" data-button="Y"/>
                           		<span class="bar">~</span>
                           		<input class="it" type="text" id="searchPromEndYmd" name="searchPromEndYmd" data-enter="search" data-button="Y"/>
                       		</div>
                  	 	</div>
              		</li>
              		<div class="right">
						<button class="mBtn1" data-click="search">검색</button>
					</div>
				</ul>
			</div>
			
   		</form>
	</div>
<!-- //sort -->

	<div class="gTitle1">
    	<h3 class="mTitle1">프로모션 목록</h3>
    	<div class="gRt">
        	<a href="#" class="mBtn1 lWhite" data-click="pausePromotion">중지</a>
        	<a href="#" class="mBtn1 lPrimary" data-click="restartPromotion">실행</a>
    	</div>
	</div>

	<div id="divGrid" style="height:${rightBoxHeight4}" 
					  data-grid-id="grdList" 
                      data-pagenation="Y" 
                      data-block-ui="Y"
                      data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
                      data-type="grid" 
                      data-grid-callback="onGridLoad" 
                      data-tpl-url="<c:url value='/static/gridTemplate/mem/MB041.xml'/>">
	</div>
	
</div>
<!-- //cont -->

<script>

/* 포인트 발생 목록 조회 */
function search(){
	var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    grdList.loadUrl(url,param);
}

/* 그리드 로드 */
function grdList_load(gridView,gridId){
    //search();
}

/*  중지 버튼 클릭 */
function pausePromotion(){
	var saveJson = grdList.getCheckedJson();
	
	if (saveJson.length == 0) {
		alert("중지할 프로모션을 선택해주세요.");
		return;
	}
	
	if( saveJson.length > 1){
		alert("중지할 프로모션 1건만 선택해 주세요.");
		return;
	}
	
	if( saveJson[0].statusCd != "002"){
		alert("진행상태가 진행중인 프로모션만 중지할 수 있습니다.");
		return;
	}
	
	if (saveJson.length) {
		if (!confirm("선택된 프로모션을 중지하시겠습니까?"))
			return;
		
		saveJson[0].statusCd = "001";
		
		var url = "<c:url value='${urlPrefix}/savePromotionStatus${urlSuffix}'/>";
		Utilities.getAjax(url, saveJson[0], true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "프로모션 중지에 실패했습니다.")) {
				alert("프로모션 중지가 완료되었습니다.");
				search();
			}
		});
	} else {
		alert("선택된 데이터가 없습니다.");
	}
}

/*  재실행 버튼 클릭 */
function restartPromotion(){
	var saveJson = grdList.getCheckedJson();

	if (saveJson.length == 0) {
		alert("재실행할 프로모션을 선택해주세요.");
		return;
	}
	
	if( saveJson.length > 1){
		alert("재실행할 프로모션 1건만 선택해 주세요.");
		return;
	}
	
	if( saveJson[0].statusCd != "001"){
		alert("진행상태가 대기중인 프로모션만 재실행할 수 있습니다.");
		return;
	}
	
	if (saveJson.length) {
		if (!confirm("선택된 프로모션을 재실행하시겠습니까?"))
			return;
		
		saveJson[0].statusCd = "002";
		
		var url = "<c:url value='${urlPrefix}/savePromotionStatus${urlSuffix}'/>";
		Utilities.getAjax(url, saveJson[0], true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "프로모션 재실행에 실패했습니다.")) {
				alert("프로모션 재실행이 완료되었습니다.");
				search();
			}
		});
	} else {
		alert("선택된 데이터가 없습니다.");
	}
}

/* 그리드 셀(직접반응,간접반응) 더블 클릭 */
function onGridCellDblClick(gridView, itemIndex, column, json, value){
	
	// 간접반응 셀 더블 클릭
	if(column == "indirectReactionBos"){
		var mshipPromBasNo = grdList.getValue(itemIndex, "mshipPromBasNo");
		
		var url = "<c:url value='${urlPrefix}/indirectPopupBos'/>/" + mshipPromBasNo;
	    Utilities.openModal(url,1000,600);
	}
	
	if(column == "indirectReactionPos"){
		var mshipPromBasNo = grdList.getValue(itemIndex, "mshipPromBasNo");
		
		var url = "<c:url value='${urlPrefix}/indirectPopupPos'/>/" + mshipPromBasNo;
	    Utilities.openModal(url,1000,600);
	}
}

</script>