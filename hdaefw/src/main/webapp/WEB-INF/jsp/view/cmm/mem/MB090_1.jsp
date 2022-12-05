<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<form role="form" id="frmMain">
	
	<div class="mSort2">
		<ul>
			<li class="w32per">
				<input type="hidden" id="cprtCmpNo" name="cprtCmpNo"/>
				<div class="tit">제휴사임직원명</div>
				<div class="txt">
				<div class="mFlex2">
					<span class="flex"><input type="text" class="it" id="execvdempNm" name="execvdempNm" title="제휴사임직원명"></span>	
				</div>
				</div>
			</li>
			<li class="w15per">
				<div class="tit">사원번호</div>
				<div class="txt">
					<span class="flex"><input type="text" class="it" id="cprtCmpIdfyNo" name="cprtCmpIdfyNo" title="사원번호"></span>	
				</div>
			</li>
			<li class="w22per">
				<div class="tit">휴대전화번호</div>
				<div class="txt">
					<span class="flex"><input type="text" class="it" id="mphonNo" name="mphonNo" title="휴대전화번호"></span>
				</div>
			</li>
		</ul>
		<ul>
			<li class="w32per">
				<div class="tit">등록일</div>
				<div class="txt">
					<div class="mDate1">
						<input class="it" type="text" data-type="dateRangeStart" data-range-end="regEndDt" id="regStaDt" name="regStaDt" data-enter="search" data-button="Y"/>
						<span class="bar">~</span>
						<input class="it" type="text" id="regEndDt" name="regEndDt" data-enter="search" data-button="Y"/>
					</div>
				</div>
			</li>
			<div class="right">
				<button class="mBtn1" data-click="searchTargetCust" style="margin-right: 10px">검색</button>
			</div>
		</ul>
		
	</div>
	
	<div class="gTitle1 mb10" style="margin-top: 10px">
		<h3 class="mTitle1">임직원 목록</h3>
		<div class="gRt posT-5">
			<!-- <a href="#" class="mBtn1 lWhite" data-click="checkAllTarget">전체선택</a> -->
			<a href="#" class="mBtn1 lGray" data-click="deleteAllTarget">전체삭제</a>
			<a href="#" class="mBtn1 lGray" data-click="deleteTarget">선택삭제</a>
		</div>
	</div>
		
	<div class="list">
		<div id="divGrid"   style="height:360px" 
							data-grid-id="grdTargetCust" 
							data-pagenation="Y"
							data-get-url="<c:url value='${urlPrefix}/getExecvdempList${urlSuffix}'/>" 
							data-type="grid" 
							data-grid-callback="onGridLoad"
							data-tpl-url="<c:url value='/static/gridTemplate/mem/MB090_1.xml'/>">
		</div>
	</div>

</form>

<script>

/* 대상 고객 조회 */
function searchTargetCust(){
	var strCprtCmpNo = parent.$("#cprtCmpNo").val();
	$("#cprtCmpNo").val(strCprtCmpNo);
	
	if(strCprtCmpNo == ""){
		alert("제휴사를 선택해주세요.");
		return;
	}
	
    var url = "<c:url value='${urlPrefix}/getExecvdempList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmMain");
    grdTargetCust.loadUrl(url,param);
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
//console.log("======> "+ JSON.stringify(param));
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

/* 대상고객 그리드 초기화 */
function clearTargetGrid(){
	grdTargetCust.clear();
	$("#execvdempNm").val("");
	$("#cprtCmpIdfyNo").val("");
	$("#mphonNo").val("");
	$("#regStaDt").val("");
	$("#regEndDt").val("");
}

</script>