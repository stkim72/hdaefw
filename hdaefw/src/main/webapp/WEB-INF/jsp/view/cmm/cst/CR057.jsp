<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<p>&nbsp;</p>
<div class="mGrid2 type2">
    <!-- left -->
    <div class="lt">
        <div class="gTitle1 mb10">
            <h3 class="mTitle1">검색고객</h3>
            <div class="gRt posT-5">
            	<a href="#" class="mBtn1 lPrimary" data-click="allTargetCustNoApply" data-target="left">통합고객번호 적용</a>
            	<a href="#" class="mBtn1 lWhite" data-click="targetRelAllMove" data-target="left">전체추가</a>
            </div>
        </div>
        <!-- //비대상고객 그리드영역 -->
		<div id="divTargetLeftGrid" style="height:565px" 
			data-post="Y" 
			data-grid-id="grdTargetLeft" 
			data-pagenation="Y" 
			data-get-url="" 
			data-type="grid" 
			data-block-ui="Y"
			data-grid-callback="onGridLoad" 
			data-tpl-url="<c:url value='/static/gridTemplate/cst/cmmCustGrpTargetRel.xml'/>">
		</div>
		<!-- //비대상고객 그리드영역 -->
    </div>
    <!-- //left -->
    <!-- prev/next -->
    <div class="mPn1">
        <a href="#" class="prev" id="btnTargetAdd">왼쪽으로 이동</a>
        <a href="#" class="next" id="btnTargetDel">오른쪽으로 이동</a>
    </div>
    <!-- //prev/next -->
    <!-- right -->
    <div class="rt">
        <div class="gTitle1 mb10">
            <h3 class="mTitle1">대상고객</h3>
            <div class="gRt posT-5">
                <a href="#" class="mBtn1 lWhite" data-click="targetRelAllMove" data-target="right">전체해제</a>
            </div>
        </div>
        <!-- //대상고객 그리드영역 -->
		<div id="divTargetRightGrid" style="height:565px" 
			data-post="Y" 
			data-grid-id="grdTargetRight" 
			data-pagenation="Y" 
			data-get-url="" 
			data-block-ui="Y"
			data-type="grid" 
			data-grid-callback="onGridLoad" 
			data-tpl-url="<c:url value='/static/gridTemplate/cst/cmmCustGrpTargetRel.xml'/>">
		</div>
		<!-- //대상고객 그리드영역 -->
    </div>
    <!-- //right -->
</div>
<!-- //grid -->

<script>
	var currCustGrpNo = "";	//현재 선택된 고객그룹번호
	var gridLoaded = 0;	//그리드가 로드되기 전에 호출되는 것을 방지하기 위한 변수값
	
	$("document").ready(function(){
		$("#btnTargetAdd").on("click", function(){
			targetRelListUpd(true);
		});

		$("#btnTargetDel").on("click", function(){
			targetRelListUpd(false);
		});
	});

	//서브페이지의 정보가 수정되면 부모페이지의 고객그룹목록부터 새로가져옵니다.(모든 하위항목까지 새로고침 됩니다.)
	function totalInfoInit(){
		parent.groupBasListInit();
	}

	function initPage(custGrpNo){
		currCustGrpNo = custGrpNo;
//console.log("=======> 대상고객 선택페이지 초기화 : "+ currCustGrpNo);
		if(custGrpNo == "" && typeof grdTargetLeft !== "undefined" && typeof grdTargetRight !== "undefined"){
			grdTargetLeft.clear();
			grdTargetRight.clear();
			return false;
		}
		targetRelInfoLoading();
	}

	//initPage보다 먼저 호출될경우를 위해(팝업에서 호출될때?)
	function onGridLoad(grid, gridId){
		++gridLoaded;
		if(currCustGrpNo != "" && gridLoaded >= 2){
			targetRelInfoLoading();
		}
	}

	function targetRelInfoLoading(){
		var url = "<c:url value='${urlPrefix}/custGroup/getTargetRelList'/>${urlSuffix}";
		var leftParam = {
			custGrpNo : currCustGrpNo,
			targetYN : "N"
		};
		var rightParam = {
			custGrpNo : currCustGrpNo,
			targetYN : "Y"
		};

		if(typeof grdTargetLeft !== "undefined" && typeof grdTargetRight !== "undefined"){
			grdTargetLeft.loadUrl(url, leftParam);
			grdTargetRight.loadUrl(url, rightParam);
		}
	}

	function allTargetCustNoApply(){
		var applyData = grdTargetLeft.getData();
		if (applyData.length == 0) {
			alert("적용할 데이터가 없습니다.");
			return;
		}
		
		if (!confirm("통합고객번호를 적용하시겠습니까?\n적용된 데이터는 되돌릴 수 없습니다.")) return;
		
		var param = {
				custGrpNo : currCustGrpNo
			};
		
		var url = "<c:url value='${urlPrefix}/custGroup/updTargetSearchCustNo${urlSuffix}'/>";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "통합고객번호 적용에 실패했습니다.")) {
				Utilities.unblockUI();
				alert("통합고객번호 적용에 성공했습니다.");
				totalInfoInit();			//모든 서브페이지 정보 새로고침
			}
		});
	}

	function targetRelAllMove(element,data){
		var moveMsg = "";
		var targetYN = "";
		if(data.target == "left"){
			currGridObj = grdTargetLeft;
			targetYN = "Y";
			moveMsg = "대상고객을 전체추가 하시겠습니까?";
		}else{
			currGridObj = grdTargetRight;
			targetYN = "N";
			moveMsg = "대상고객을 전체해제 하시겠습니까?";
		}

		var moveData = currGridObj.getData();
		if (moveData.length == 0) {
			alert("이동할 데이터가 없습니다.");
			return;
		}

		if (!confirm(moveMsg)) return;
		
		var param = {
			custGrpNo : currCustGrpNo,
			targetYN : targetYN
		};
		Utilities.blockUI();
//console.log("===\n"+JSON.stringify(param));
		var url = "<c:url value='${urlPrefix}/custGroup/updTargetRelList${urlSuffix}'/>";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "대상고객 저장에 실패했습니다.")) {
				Utilities.unblockUI();
				alert("대상고객 저장에 성공했습니다.");
				totalInfoInit();			//모든 서브페이지 정보 새로고침
			}
		});
	}

	function targetRelListUpd(isTarget){
		var currGridObj = null;
		var targetYN = "";
		if(isTarget){
			currGridObj = grdTargetLeft;
			targetYN = "Y";
		}else{
			currGridObj = grdTargetRight;
			targetYN = "N";
		}
		
		var saveJson = currGridObj.getCheckedJson();
		if (saveJson.length == 0) {
			alert("저장할 데이터를 선택해주세요.");
			return;
		}

		var param = {
			custGrpNo : currCustGrpNo,
			targetYN : targetYN,
			targetData : saveJson
		};
//console.log("===\n"+JSON.stringify(param));
		var url = "<c:url value='${urlPrefix}/custGroup/updTargetRelList${urlSuffix}'/>";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "대상고객 저장에 실패했습니다.")) {
				alert("대상고객 저장에 성공했습니다.");
				totalInfoInit();			//모든 서브페이지 정보 새로고침
			}
		});
	}

	function birthdayAge(grid,row,col,json,value){
		return Utilities.getBirthdayAge(value);
	}
</script>