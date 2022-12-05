<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<form role="form" id="frmMain">
	<input type="hidden" id="cprtCmpNo" name="cprtCmpNo"/>
	<!-- grid -->
	<div class="mGrid2 type2">
		<!-- left -->
		<div class="lt">
			<div class="gTitle1 mb10" style="margin-top: 10px">
				<h3 class="mTitle1">업로드 고객</h3>
				<div class="gRt posT-5">
				<a href="#" class="mBtn1 lWhite" data-click="grdUploadCustClear">초기화</a>
				<a href="#" class="mBtn1 lWhite" data-click="checkAllUpload">전체선택</a>
				<a href="#" class="mBtn1 lGray" data-click="downloadExcel">양식 다운로드</a>
				<a href="#" class="mBtn1 lGray" data-click="uploadExcel">엑셀업로드</a>
				</div>
			</div>
			<!-- list -->
			<div class="list">
				<div id="divGrid"   style="height:440px" 
									data-grid-id="grdUploadCust" 
									data-pagenation="N"
									data-type="grid" 
									data-grid-callback="onGridLoad"
									data-tpl-url="<c:url value='/static/gridTemplate/mem/MB090_2.xml'/>">
				</div>
			</div>
			<!-- //list -->
		</div>
		<!-- //left -->
		
		<!-- prev/next -->
		<div class="mPn1 pos1">
			<a href="#" class="prev" data-click="insertExecvdempList">제휴사 임직원 엑셀업로드 일괄 등록</a>
		</div>
		<!-- //prev/next -->
		<!-- right -->
		<div class="rt">
			<div class="gTitle1 mb10" style="margin-top: 10px">
				<h3 class="mTitle1">대상고객</h3>
				<div class="gRt posT-5">
					<a href="#" class="mBtn1 lWhite" data-click="saveAllGrade">전체 등급부여</a>
					<a href="#" class="mBtn1 lWhite" data-click="saveGrade">선택 등급부여</a>
					<!-- <a href="#" class="mBtn1 lWhite" data-click="checkAllTarget">전체선택</a> -->
					<a href="#" class="mBtn1 lGray" data-click="deleteAllTarget">전체삭제</a>
					<a href="#" class="mBtn1 lGray" data-click="deleteTarget">선택삭제</a>
				</div>
			</div>
				<!-- list -->
			<div class="list">
				<div id="divGrid"   style="height:440px" 
									data-grid-id="grdTargetCust" 
									data-pagenation="Y"
									data-get-url="<c:url value='${urlPrefix}/getExecvdempList${urlSuffix}'/>" 
									data-type="grid" 
									data-grid-callback="onGridLoad"
									data-tpl-url="<c:url value='/static/gridTemplate/mem/MB090_1.xml'/>">
				</div>
			</div>
			
			<div style="display:none;">
				<div id="divTargetExcelSampleGrid" style="height:400px;" 
					data-post="Y" 
					data-grid-id="grdTargetExcelSample" 
					data-pagenation="N" 
					data-get-url="" 
					data-type="grid" 
					data-grid-callback="onGridLoad" 
					data-tpl-url="<c:url value='/static/gridTemplate/mem/MB090_3.xml'/>">
				</div>
			</div>
			<!-- //list -->
		</div>
		<!-- //right -->
	</div>
	<!-- //grid -->

</form>

<script>

/* 대상 고객 조회 */
function searchTargetCust(){
	var strCprtCmpNo = parent.$("#cprtCmpNo").val();
	$("#cprtCmpNo").val(strCprtCmpNo);
	
    var url = "<c:url value='${urlPrefix}/getExecvdempList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmMain");
    
    console.log("param = " + JSON.stringify(param));
    
    grdTargetCust.loadUrl(url,param);
}

/* 양식 다운로드 버튼 클릭 */
function downloadExcel(){
	grdTargetExcelSample.exportExcel("임직원정보 엑셀양식.xlsx");
}

/* 엑셀업로드 버튼 클릭 */
function uploadExcel(){
	if(parent.$("#cprtCmpNo").val() == ""){
		alert("제휴사를 선택해주세요.");
		return;
	}
	
	grdUploadCust.clear();
	
	grdUploadCust.importExcel();
}

function grdUploadCustClear() {
	grdUploadCust.clear();
}

/* 화살표 버튼 클릭(제휴사 임직원 엑셀업로드 일괄 등록) */
function insertExecvdempList(){
	// 그리드에 제휴사코드 세팅
	grdUploadCust.setColumnValues("cprtCmpNo", parent.$("#cprtCmpNo").val());
	
	var saveJson = grdUploadCust.getCheckedJson();
    if(saveJson.length ==0) {
        alert("체크된 데이터가 존재하지 않습니다.");
        return;
    }

    if(!gridTargetValidateChk()){
		return;
	}

	var bConfirm = confirm("선택한 임직원을 등록하시겠습니까?");
	if(!bConfirm){
		return;
	}
	
	if(saveJson.length) {
		var url = "<c:url value='${urlPrefix}/saveExecvdempList${urlSuffix}'/>";
		Utilities.getAjax(url, saveJson, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "임직원 등록에 실패했습니다.")) {
				alert("임직원 등록에 성공했습니다.");
				clearUploadGrid();
				parent.searchTargetCust();
			}
		});
	}
}

function gridTargetValidateChk(){
	var saveJson = grdUploadCust.getCheckedJson();

	if (saveJson.length > 0) {
		for(key in saveJson) {
			//임직원명 체크
			//console.log("==> "+ saveJson[key].execvdempNm +"("+ Utilities.getByteLength(saveJson[key].execvdempNm) +")");
			if(saveJson[key].cprtCmpIdfyNo.trim().length == 0){
				alert("식별번호에 빈값이 있습니다.");
				return false;
			}
			
			if(saveJson[key].execvdempNm.trim().length == 0){
				alert("임직원명에 빈값이 있습니다.");
				return false;
			}

			if(Utilities.getByteLength(saveJson[key].execvdempNm) > 20){
				alert("임직원명은 20바이트를 넘을 수 없습니다.");
				return false;
			}
		}
	}

	return true;
}

/* 전체선택(업로드고객) 버튼 클릭 */
function checkAllUpload(){
	grdUploadCust.checkAll(true);
}

/* 전체선택(대상고객) 버튼 클릭 */
function checkAllTarget(){
	grdTargetCust.checkAll(true);
}

/* 전체삭제(대상고객) 버튼 클릭 */
function deleteAllTarget(){
	var jsonData = grdTargetCust.getData();
    if(jsonData.length ==0) {
        alert("삭제할 데이터가 존재하지 않습니다.");
        return;
    }
    
	if(!confirm("전체 대상고객을 삭제하시겠습니까?")){
		return;
	}

	var param = Utilities.formToMap("frmMain");
//console.log("======> "+ JSON.stringify(param)); return;
	var url = "<c:url value='${urlPrefix}/deleteAllExecvdempList${urlSuffix}'/>";
	Utilities.getAjax(url, param, true, function(data, jqXHR) {
		if (Utilities.processResult(data, jqXHR, "전체 대상고객 삭제에 실패했습니다.")) {
			alert("전체 대상고객이 삭제되었습니다.");
			parent.searchTargetCust();
		}
	});
}

/* 삭제(대상고객) 버튼 클릭 */
function deleteTarget(){
	var saveJson = grdTargetCust.getCheckedJson();
    if(saveJson.length ==0) {
        alert("체크된 데이터가 존재하지 않습니다.");
        return;
    }
    
    var bConfirm = confirm("선택한 대상고객을 삭제하시겠습니까?");
	if(!bConfirm){
		return;
	}
	
	if (saveJson.length) {
		var url = "<c:url value='${urlPrefix}/deleteExecvdempList${urlSuffix}'/>";
		Utilities.getAjax(url, saveJson, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "대상고객 삭제에 실패했습니다.")) {
				alert("선택한 대상고객이 삭제되었습니다.");
				parent.searchTargetCust();
			}
		});
	}
}

/* 업로드 고객 그리드 초기화 */
function clearUploadGrid(){
	grdUploadCust.clear();
}

/* 대상고객 그리드 초기화 */
function clearTargetGrid(){
	grdTargetCust.clear();
}

/* 등급부여 버튼 클릭 */
function saveGrade(){
	var saveJson = grdTargetCust.getCheckedJson();
//console.log("saveJson = " + JSON.stringify(saveJson));
	
    if(saveJson.length ==0) {
        alert("체크된 데이터가 존재하지 않습니다.");
        return;
    }
    
    var bConfirm = confirm("선택한 대상고객에게 등급을 부여하시겠습니까?");
	if(!bConfirm){
		return;
	}
	
	if (saveJson.length) {
		var url = "<c:url value='${urlPrefix}/saveGrade'/>";
		Utilities.getAjax(url, saveJson, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "등급 부여에 실패했습니다.")) {
				alert("선택한 대상고객에 등급이 부여되었습니다.");
				parent.searchTargetCust();
			}
		});
	}
}

/* 전체(대상고객) 등급부여버튼 클릭 */
function saveAllGrade(){
	var jsonData = grdTargetCust.getData();
    if(jsonData.length ==0) {
        alert("등급을 부여할 데이터가 존재하지 않습니다.");
        return;
    }
    
	if(!confirm("전체 대상고객에게 등급을 부여하시겠습니까?")){
		return;
	}

	var param = Utilities.formToMap("frmMain");
//console.log("======> "+ JSON.stringify(param)); return;
	var url = "<c:url value='${urlPrefix}/saveAllGrade${urlSuffix}'/>";
	Utilities.getAjax(url, param, true, function(data, jqXHR) {
		if (Utilities.processResult(data, jqXHR, "등급부여에 실패했습니다.")) {
			alert("전체 대상고객에 등급이 부여되었습니다.");
			parent.searchTargetCust();
		}
	});
}
</script>