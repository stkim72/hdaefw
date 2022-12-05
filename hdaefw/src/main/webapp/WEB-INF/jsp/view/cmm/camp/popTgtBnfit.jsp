<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 





<div class="mPopup1">
    
    <!-- header -->
    <div class="title">
        <h1>혜택 선택</h1>
        <a href="#" data-click="closeModal" class="close">팝업 닫기</a>
    </div>
    <!-- //header -->

	
</div>

<!-- layer -->
<div id="jsLayer21" class="mLayer12"  style="margin:20px">

    <!-- cont -->
    <div class="cont mCustomScrollbar">
        <div class="con">


            <form name="frmSearch" id="frmSearch">
            <input type="hidden" name="campBasNo" id="campBasNo" value="${campBasNo}">
    
            <div class="gTitle1 line">
                <h3 class="mTitle1">1 혜택 선택(포인트)</h3>
            </div>
            <!-- board -->
            <div class="mBoard2"> 
                <table>
                    <caption>1 혜택 선택 ( 포인트 )</caption>
                    <colgroup>
                        <col width="12%">
                        <col width="*">
                    </colgroup>
                    <tbody>
                        <!-- <tr>
                            <th class="left" scope="row">혜택 유형</th>
                            <td class="left">
                                <select class="select w190" title="혜택 유형">
                                    <option></option>
                                </select>
                            </td>
                        </tr> -->
                        <tr>
                            <th class="left" scope="row">적용</th>
                            <td class="left">
                                <input type="text" class="it w60 comma" data-type="number2" title="Point" id="applyPoint"  name="applyPoint" value=""  onchange="chkPoint(this)" > Point
                             <!--    <input type="text" class="it w60 ml25 comma" data-type="number2" title="명" id="applyCustCnt"  name="applyCustCnt"  value="" placeholder="포인트시작유효기간"> 명
                                <span class="bar3">~</span>
                                <input type="text" class="it w185 comma" data-type="number2" title="Point 발행" id="applyPointAll" name=""  value=""   placeholder="포인트종료유효기간"> Point 발행
                                 -->
                            
                            </td>
                           
                            
                            <th class="left" scope="row">포인트유효기간</th>
                            <td class="left">
                              
                              
                               <input type="text" class="it data-check  w80" title="포인트유효기간" data-type="number"  id="applyPointValidPerd" name="applyPointValidPerd" value="12" maxlength="8">  개월
								
                            <!--     <input type="text" class="it data-check date w80" title="포인트유효기간시작년월일" data-type="dateRangeStart" data-range-end="applyPointEndYmd" id="applyPointStaYmd" name="applyPointStaYmd" value="">
									<span class="bar">~</span> 
								<input type="text" class="it data-check date w80" title="포인트유효기간종료년월일"  data-button="Y" id="applyPointEndYmd" name="applyPointEndYmd" value=""> -->
									
									
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- //board -->
            
            
            
            
            <div class="gTitle1 line">
                <h3 class="mTitle1">2 혜택 선택(쿠폰)
                
                &nbsp; &nbsp; &nbsp;-&nbsp;&nbsp; 쿠폰 개수 <select name="coupnIssueCnt" id="coupnIssueCnt">
                
                <option value="">선택</option>
                
                
                	<c:forEach begin="1" end="10" var="idx" step="1">
							<option value="<c:out value="${idx}" />"><c:out value="${idx}" />
							</option>
					</c:forEach>
                </select>
                매
                
                </h3>
                
                
               
                
            </div>
            
            
            <!-- board -->
            <div class="mBoard2"> 
            
            
                
					<div id="divGrid" style="height:450px"
					  data-post="Y"
					  data-grid-id="grdList"
					  data-pagenation="Y"
					  data-get-url="<c:url value='/cmmMshipCoupnBas/getList'/>"
					  data-type="grid" 
                    	data-block-ui="Y"
					  data-tpl-url="<c:url value='/static/gridTemplate/memship/cmmMshipCoupnBas2.xml'/>"
					  >
					</div>
                
                <div class="mSort2 medium"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
			<ul>
				<li class="wAuto ml20">
					<div class="tit"></div>
					<div class="txt">
						
					</div>
				</li>
			</ul>
			<div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
			    <a href="#" class="mBtn1 lWhite"  data-click="closeModal" >취소</a>
				<a href="#" class="mBtn1 primary" data-click="sendBnfit">적용</a>
			</div>
		</div>
                
            </div>
            <!-- //board -->
            
            </form>
            
        </div>
    </div>
    
    
    <!-- //cont
    <div class="button">
        <a href="#jsLayer1" class="jsBtnClose1" data-click="closeModal" >취소</a>
        <a href="#jsLayer1" class="jsBtnClose1" data-click="sendBnfit" ><strong>선택</strong></a>
    </div>
     -->
     
</div>
<!-- //layer -->


<script>


// 켐페인 대상군 추가
function popTarget(){
	
	var url = "<c:url value='${urlPrefix}/add${urlSuffix}'/>?campBasNo=";
 	Utilities.openModal(url, 1200, 600);
}

/* 공통코드 그리드 load */
function grdList_load(gridView, gridId) {
	search();
}

/* 하부코드 그리드 load */
function grdDetail_load(gridView, gridId) {
}

/* 공통코드 Row클릭 시 */
function grdList_rowChanged(grdList, oldRow, newRow, rowData) {
	
}


function onGridLoad(gridView, gridId) {
}



/* 그리드 컬럼 클릭 */
function onGridCellClick(gridView, rowIndex, columnName, colIndex, fieldIndex) {

}

function grdList_cellClick(gridView, itemIndex, column, index, field){

}


function grdList_cellDblClick(gridView, itemIndex, column,json, value){
	
}




/* 검색조건 검색 */
function search() {
	$("form#frmSearch").find("#currentPageNo").val(1);
 	var url = "<c:url value='cmmMshipCoupnBas/getList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmSearch");
	param.recordCountPerPage = 20;
	grdList.loadUrl(url, param);
}


function sendBnfit(){
	
	var selectedData = grdList.getCheckedJson();
	if( $("#applyPoint").val() == "" && selectedData == null ){
		alert("포인트 또는 쿠폰 혜택을 선택해 주세요.");
		return false;
	}
	
	
	if( $("#applyPoint").val() != "" && ( $("#applyPointValidPerd").val() == "" || $("#applyPointValidPerd").val() == "0" ) ){
		alert("포인트 유효기간을 입력해 주세요.");
		$("#applyPointValidPerd").focus();
		return false;
	}
	

	$("#coupnIssueCnt").prop("disabled", false);
	
	var valid = validateForm("#frmSearch"); //  class='data-check' 인 경우만 체크
	var saveJson = Utilities.formToMap("frmSearch");
	
	
	// 쿠폰을 선택했다면
	if( selectedData != null ){
		saveJson.applyCoupnBasNo = selectedData.mshipCoupnBasNo;
		saveJson.applyCoupnBasNoNm = selectedData.coupnBasNm;		
		
		if( $("#coupnIssueCnt").val() == "" ){
			alert("쿠폰 발급 개수를 선택해 주세요.");
			$("#coupnIssueCnt").focus();
			return false;
		}
		

	}

	saveJson.stat = "U";
	
	Utilities.getOpener().bindBenfit( saveJson );
	closeModal();
	
	
}


// 혜택 선택 저장
function save(){
	
	var selectedData = grdList.getCheckedJson();
	if( $("#applyPoint").val() == "" && $("#applyCustCnt").val() == "" && selectedData == null ){
		alert("포인트 또는 쿠폰 혜택을 선택해 주세요.");
		return false;
	}

	$("#coupnIssueCnt").prop("disabled", false);
	
	var valid = validateForm("#frmSearch"); //  class='data-check' 인 경우만 체크
	
	var saveJson = Utilities.formToMap("frmSearch");
	
	
	// 쿠폰을 선택했다면
	if( selectedData != null ){
		saveJson.applyCoupnBasNo = selectedData.mshipCoupnBasNo;
	}

	saveJson.stat = "U";
	
	//log( saveJson );
	
	
	var url = "<c:url value='${urlPrefix}/saveBenfit${urlSuffix}'/>";
	Utilities.getAjax(url, saveJson, true, function(data, jqXHR) {
		if (Utilities.processResult(data, jqXHR, "캠페인 혜택 저장에 실패했습니다.")) {
			alert("캠페인 혜택 저장이 완료되었습니다.");
			closeModal();
		}
	});
	
}

// 포인트 금액이 있을 경우 쿠폰 무조건 1개만 선택 가능 함
function chkPoint( obj ){

	if( $.trim( $(obj).val() ) != 0 && $.trim( $(obj).val() ) != "" ){
		
		if( $("#coupnIssueCnt").val() > 0 ){
			alert('포인트와 쿠폰을 함께 지급시 쿠폰개수는 1매만 선택 가능합니다.');
		}
		$("#coupnIssueCnt").val(1);
		$("#coupnIssueCnt").prop("disabled", true);
		
	}else{
		$("#coupnIssueCnt").val(1);
		$("#coupnIssueCnt").prop("disabled", false);
	}
}


function chkCoupn( obj ){

	if( $.trim( $(obj).val() ) != 0 || $.trim( $(obj).val() ) != "" ){
		$("#coupnIssueCnt").val(1);
		$("#coupnIssueCnt").prop("disabled", true);
	}
}
</script>
