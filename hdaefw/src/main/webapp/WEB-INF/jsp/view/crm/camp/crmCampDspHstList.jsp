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
            <h3 class="mTitle1">캠페인 검색</h3>
        </div>


 	
 	
			<!-- sort -->
			<div class="mSort2">
			
			
 <form role="form" id="frmSearch" name="frmSearch">
 
 	<input type="hidden" name="orgId" id="orgId" value="">
 	
 	
				<ul>
					<li class="w28per">
						<div class="tit">발송기간</div>
						<div class="txt">
                           
							<div class="mDate1">
								<input type="text" class="it date" title="캠페인 시작일"  data-type="dateRangeStart" data-range-end="hstEndYmd"   id="hstStaYmd" name="hstStaYmd" value="">
								<span class="bar">~</span>
								<input type="text" class="it date" title="캠페인 마지막일" data-button="Y"   id="hstEndYmd" name="hstEndYmd"  value="">
							</div>
									          
						</div>
					</li>
					
					<li class="w50per">
						<div class="tit">캠페인번호</div>
						<div class="txt">
							<input type="text" class="it w200" title="캠페인번호"  id="campBasNo" name="campBasNo"  value="">
						</div>
						
						<div class="tit">캠페인명</div>
						<div class="txt">
							<input type="text" class="it w200" title="캠페인명"  id="campBasNm" name="campBasNm"  value="">
						</div>
					</li>
					
					<li class="w50per">
						<div class="tit">통합고객번호</div>
						<div class="txt">
							<input type="text" class="it w200" title="통합고객번호"  id="itgCustNo" name="itgCustNo"  value="">
						</div>
						
						<div class="tit">고객명</div>
						<div class="txt">
							<div class="mFlex2">
								<span class="flex">
                                    <input type="text" class="it" title="고객명" name="custNm" id="custNm" value="">
                                </span>
                             
							</div>
						</div>
					
					</li>
					
				<!-- 	<li class="">
						<div class="tit">발송매체</div>
						<div class="txt">
							
							<select name="dspType" id="dspType">
							<option value="">선택</option>
							<option value="SMS">SMS</option>
							<option value="LMS">LMS/MMS</option>
							<option value="BARCODE">BARCODE</option>
							<option value="PUSH">PUSH</option>
							
		                    </select>   
						</div>
					</li>  -->
					
					
					<li class="">
					
						<div class="txt">
							<div class="mFlex2">
								
                               <!--  <a href="#" class="mBtn1 lWhite">버튼</a> -->
                                <span class="button">
                                    <a href="#" class="mBtn1" data-click="search" >검색</a>
                                </span>
							</div>
					
					</li>
				</ul>
				
				
</form>


			</div>
			<!-- //sort -->
			<!-- box -->
				
				<div class="gTitle1">
					<h3 class="mTitle1">캠페인 발송이력</h3>
					<div class="gRt">
						<!-- <a href="#" class="mBtn1 lPrimary" data-click="newBdget">신규등록</a> -->
					</div>
				</div>
				<!-- board -->
				
				
				
				<div id="divGrid" class='' 
						style="height:${rightBoxHeight3}" 
						data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>"
      					data-grid-id="grdList" 
      					data-pagenation="Y"
                    	data-block-ui="Y"
      					data-type="grid" 
      					data-tpl-url="<c:url value='/static/gridTemplate/camp/crmCampDspHst.xml'/>">
      

			</div>
			</div>
			<!-- //box -->
			
			
			
			
			

		</div>
		<!-- //right -->
	</div>
	
</div>



<script>



/* 공통코드 그리드 load */
function grdList_load(gridView, gridId) {
	search();
}

/* 하부코드 그리드 load */
function grdDetail_load(gridView, gridId) {
}

/* 공통코드 Row클릭 시 */
function grdTree_rowChanged(grdList, oldRow, newRow, rowData) {

}


function onGridLoad(gridView, gridId) {
}



/* 그리드 컬럼 클릭 */
function onGridCellClick(gridView, rowIndex, columnName, colIndex, fieldIndex) {
	
	newBdget( gridView.getCurrentJson() );

}

function grdTree_cellClick(gridView, itemIndex, column, index, field){
	
}


/* 그리드 컬럼 더블 클릭 */
function onGridCellDblClick(gridView, rowIndex, columnName, colIndex,
		fieldIndex) {

}

function onGridRowChanged(gridView, oldRow, newRow) {

}

/* 검색조건 검색 */
function search() {
	

	$("form#frmSearch").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmSearch");
	param.recordCountPerPage=20;
	grdList.loadUrl(url, param);
}





/* 대분류 저장 */
function save(){
	var valid = validateForm("#frmDetail"); //  class='data-check' 인 경우만 체크
	
	if(valid) {
		
		var saveJson = Utilities.formToMap("frmDetail");
		

		var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
		Utilities.getAjax(url,saveJson,true,function(data,jqXHR){
	        if(Utilities.processResult(data,jqXHR,"예상건수 저장에 실패했습니다."))
	        {
	            alert("예상건수 저장이 완료되었습니다.");
	            search();
	          
	        }
	    });
	
	}else{
		
		alert("필수 항목들을 기입해 주세요.");
		return false;
	}
}



</script>