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
            <h3 class="mTitle1">쿠폰마스터 목록</h3>
        </div>
        
        <!-- sort -->
        <div class="mSort2 type3">
        
         <form role="form" id="frmSearch" name="frmSearch">
            <div class="row">
                <ul>
                
                    <li class="w12per">
                        <div class="tit w85">쿠폰리스트</div>
                        <div class="txt">
                            <code:commCode  className="select" id="coupnTypeCd" name="coupnTypeCd" codeCd="MB080" prefixLabel="전체" prefixValue=""/>
                        </div>
                    </li>
                    <li class="w12per">
                        <div class="tit w85">쿠폰발급방식</div>
                        <div class="txt">
                            <code:commCode  className="select" id="coupnClassCd" name="coupnClassCd" codeCd="MB120" prefixLabel="전체" prefixValue=""/>
                        </div>
                    </li>
                    <li class="w12per">
                        <div class="tit w85">쿠폰대상</div>
                        <div class="txt">
                            <code:commCode  className="select" id="coupnTgtCd" name="coupnTgtCd" codeCd="MB100" prefixLabel="전체" prefixValue=""/>
                        </div>
                    </li>
                    
                    <li class="w12per">
                        <div class="tit w85">쿠폰종류</div>
                        <div class="txt">
                            <code:commCode  className="select" id="coupnKndCd" name="coupnKndCd" codeCd="MB130" prefixLabel="전체" prefixValue=""/>
                        </div>
                    </li>
                    
                </ul>
            </div>
            <div class="row">
                <ul>
                    <li class="w20per">
                        <div class="tit">쿠폰마스터상태</div>
                        <div class="txt">
                            <code:commCode  className="select" id="useYn" name="useYn" codeCd="S010" prefixLabel="전체" prefixValue=""/>
                        </div>
                    </li>
                    
                    
                     <li class="w33per">
                        <div class="tit">쿠폰마스터명</div>
                        <div class="txt">
                            <input type="text" class="it" title="쿠폰마스터명" name="coupnBasNm" id="coupnBasNm"   value="">
                        </div>
                    </li>
                    
                    <li class="w20per">
                        <div class="tit">쿠폰마스터코드</div>
                        <div class="txt">
                            <input type="text" class="it" title="쿠폰마스터코드" name="mshipCoupnBasNo" id="mshipCoupnBasNo"   value="">
                        </div>
                    </li>
                   
                </ul>
            </div>
            <div class="row">
                <ul>
                
                    <li class="w33per">
                        <div class="tit">쿠폰발행기간</div>
                        <div class="mDate11">
                          <input type="text" class="it w120" title="기간 시작일"  data-type="dateRangeStart" data-range-end="toPblsStdDay"  data-button="Y"  name="fromPblsStdDay" id="fromPblsStdDay" value="">
                                    
                            <span class="bar">~</span>
				                        
						<input type="text" class="it  w120" title="기간 마지막일" name="toPblsStdDay" id="toPblsStdDay" data-button="Y"  value="">
                        </div>
                    </li>
                    
                    <li class="w33per">
                        <div class="tit">쿠폰사용기간</div>
                        <div class="mDate11">
                          <input type="text" class="it  w120" title="기간 시작일"  data-type="dateRangeStart" data-range-end="toUseStdDay"  data-button="Y"  name="fromUseStdDay" id="fromUseStdDay" value="">
                                    
                            <span class="bar">~</span>
				                        
						<input type="text" class="it  w120" title="기간 마지막일" name="toUseStdDay" id="toUseStdDay" data-button="Y"  value="">
                        </div>
                    </li>
                    
                      
            
               <div class=" "> <!-- 버튼 상하 가운데 정렬 : class="posVm" -->
			                <a href="#" class="mBtn1" data-click="search">검색</a>
			            </div>
            
                     
                </ul>
                
             
          
                    
            </div>
            
      
           
            
            </form>
        </div>
        <!-- //sort -->
        
        <div class="gTitle1">
            <h3 class="mTitle1">쿠폰 목록</h3>
            <div class="gRt">
                <a href="#" class="mBtn1 lWhite"  data-auth-type="c" style="display:none" data-click="cpyCoupon">복사</a>
                <a href="#" class="mBtn1 lPrimary"  data-auth-type="c" style="display:none"  data-click="newCoupon">신규등록</a>
            </div>
        </div>
        


		<div id="divGrid" style="height:520px"
		  data-post="Y"
		  data-grid-id="grdList"
		  data-pagenation="Y"
		  data-get-url="<c:url value='/example/getList'/>"
		  data-type="grid" 
		  data-block-ui="Y"
		  data-tpl-url="<c:url value='/static/gridTemplate/memship/cmmMshipCoupnBas.xml'/>"
		  >
		</div>
        
    </div>
    <!-- //cont -->
	                  



<script>
var _current_code_cd = null;


/* 공통코드 그리드 load */
function grdList_load(gridView, gridId) {
	// search();
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

	var url = "<c:url value='${urlPrefix}/add${urlSuffix}'/>?mshipCoupnBasNo="+ gridView.getCurrentJson().mshipCoupnBasNo ;
	Utilities.openModal(url, "100%", 1800);
	//location.href = url;

}

function cpyCoupon(){
	var saveJson = grdList.getCheckedJson();
	
	if (saveJson == null) {
		alert("복사할 정책을 선택해주세요.");
		return;
	}

	saveJson.stat = "c";
	//saveJson.mshipCoupnBasNo = null;
	saveJson._attributes = null;
	
	if (saveJson != null) {
		
		if (!confirm("쿠폰마스터 코드는 자동으로 생성됩니다. \n\n선택된 정책을 복사하시겠습니까?"))
			return;
		
		var url = "<c:url value='${urlPrefix}/cpyCoupon${urlSuffix}'/>";
		// var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
		Utilities.getAjax(url, saveJson, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "정책 복사가 실패했습니다.")) {
				alert("정책 복사가 완료되었습니다.");
					search();
					// $("#frmDetail")[0].reset();
			}
		});
	} else {
		alert("선택된 데이터가 없습니다.");
	}
	
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
	param.recordCountPerPage = 20;
	grdList.loadUrl(url, param);
}

function currnPg(cnt) {
	console.log(cnt);
	grdList.movePage(cnt);
}

/* 대분류 추가 */
function newCoupon(){
 	var url = "<c:url value='${urlPrefix}/add${urlSuffix}'/>?mshipCoupnBasNo=";
 	// openModal :function(url,width,height,callFunc,callbackFunc,callbackWin)
 	Utilities.openModal(url, "100%", 1500);
 	//Utilities.windowOpen(url,  900, 730);
}

/* 대분류 저장 */
function saveCode(){
	saveCodeList(grdList);
}


/* 저장 */
function saveCodeList(gridView) {
	if(!saveValidate(gridView)) return;
	var saveJson = gridView.getSaveJson();
	if (saveJson.length) {
		if (!confirm("수정된 데이터를 저장하시겠습니까?"))
			return;
		if(saveValidate(gridView))
		var url = "<c:url value='${urlPrefix}/saveList${urlSuffix}'/>";
		Utilities.getAjax(url, saveJson, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "코드 저장에 실패했습니다.")) {
				alert("코드 저장에  성공했습니다.");
				gridView.reload();
			}
		});
	} else {
		alert("수정된 데이터가 없습니다.");
	}
}

/* 소분류 행추가 */
function newCodeDetail(){
	
	alert("추가");
	return false;
	
	if(!_current_code_cd){
		alert("먼저 공통코드를 선택하세요.");
		return false;
	}
	if(_current_code_cd =="c"){
		alert("먼저 신규 대분류를 저장하세요");
		return false;
	}
	var data = {
			prntsComnCd : grdList.getCurrentJson().comnCd,
			comnCdLvlNo : grdList.getCurrentJson().comnCdLvlNo + 1,
			topComnCd : grdList.getCurrentJson().topComnCd,
		};
	addcode(data);
}

/* 행추가 */
function addcode(data){
	if (!data)
		return;
	data.stat = "n";
	if (data.codeLevel == 1)
		grdList.addRow(data);
	else{
		data.stat = "c";
		grdDetail.addRow(data);
	}
}

/* 대분류 삭제 */
function removeCode(){
	removeRow(grdList);
}

/* 소분류 삭제 */
function removeCodeDetail(){
	
	alert("삭제");
	return false;
	
	
	
	removeRow(grdDetail);
}

/* 코드삭제(행삭제) */
function removeRow(gridView) {
 	var list = gridView.getCheckedJson();
	if (list.length == 0) {
		alert("체크된 데이터가 존재하지 않습니다.");
		return;
	}
	var saveJson = gridView.getCheckedJson();
	if (saveJson.length) {
		if (!confirm("데이터를 삭제하면 복구할  수 없습니다. 계속하시겠습니까?"))
			return;
		var url = "<c:url value='${urlPrefix}/deleteList${urlSuffix}'/>";
		Utilities.getAjax(url, saveJson, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "코드 삭제에 실패했습니다.")) {
				alert("코드 삭제에  성공했습니다.");
				if(gridView == grdDetail){
					gridView.removeCheckRow();
				}
				else{
					search();
					grdDetail.clear();
				}
			}
		});
	} else {
		alert("선택된 데이터가 없습니다.");
	}
}

/* 하부코드 수정 Validate*/
function saveValidate(gridView){
	var cuGridData = gridView.getSaveJson();
	for(var i=0; i<cuGridData.length; i++){
	    if(Utilities.isEmpty(cuGridData[i].comnCd)){
	    	alert("코드아이디를 입력하세요.");
	    	return false;
	    }
// 	    if(Utilities.isEmpty(cuGridData[i].comnCdOdrg)||cuGridData[i].comnCdOdrg<=0){
// 	    	alert("순번은 1이상입니다.");
// 	    	return false;
// 	    }
	    if(Utilities.isEmpty(cuGridData[i].comnCdNm)){
            alert("코드명을 입력하세요.");
            return false;
        }
	}
	return true;
}

window.onload = function(){
	 dateSetting();
}

function dateSetting(){
	var strStartDay= moment().subtract(1, 'month').format('YYYYMMDD');
    var strEndDay = moment().format("YYYYMMDD");
    
    $("#fromPblsStdDay").val(strStartDay);
    $("#toPblsStdDay").val(strEndDay);
}

</script>

