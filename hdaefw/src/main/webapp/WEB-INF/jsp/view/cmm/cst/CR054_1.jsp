<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="title">
	<h1>고객그룹</h1>
	<a href="#" data-btn-type="closeModal"  class="close">팝업 닫기</a>
</div>

<div class="cont">
    <div class="gTitle1 line">
        <h3 class="mTitle1">대상고객</h3>
        <div class="gRt">
            <a href="#" class="mBtn1 lPrimary" data-auth-type="c" style="display:none" data-click="targetCondInfoNRelListSave">대상고객 등록</a>
        </div>
    </div>
    <div id="divTargetGrid" style="height:540px" 
		data-post="Y" 
		data-grid-id="grdTarget" 
		data-pagenation="Y" 
		data-get-url="" 
		data-block-ui="Y"
		data-type="grid" 
		data-grid-callback="onGridLoad" 
		data-tpl-url="<c:url value='/static/gridTemplate/cst/cmmCustGrpTargetSearch.xml'/>">
	</div>
	<!-- 
	<div class="mInfo1">
		현재 선택하신 조건에 해당하는 고객은 <span class="count" id="targetCondCustCount">0</span> 명 입니다.
	</div>
	 -->
</div>

<script>
	var currCustGrpNo = '<c:out value="${custGrpNo}"/>';
	
	$("document").ready(function(){
		
	});

	function grdTarget_load(grid, gridId){
		targetSearch();
	}

	function targetSearch(){
		if(currCustGrpNo == ""){
			alert("고객그룹을 선택해주세요.");
			return false;
		}

		grdTarget.clear();
		
		//고객마스터,접촉이력,거래이력 전체 JSON 파라미터 전달
		var param = Utilities.getOpener().getTotalTargetCondInput(true);
		var url = "<c:url value='${urlPrefix}/custGroup/getTargetSearchPagingList'/>${urlSuffix}";

		//console.log("=======> 고객그룹 기본페이지 초기화");
		grdTarget.loadUrl(url,param);

		/*		
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "대상고객 검색에 실패했습니다.")) {
				grdTarget.loadJson(data);
				
				var totalCount = data.data.pagination.totalCount;
				if(totalCount != null){
					totalCount = totalCount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					$('#targetCondCustCount').text(totalCount);
				}
			}
		});*/
	}

	function targetCondInfoNRelListSave(){
		var saveJson = grdTarget.getData();
		if (saveJson.length == 0) {
			alert("저장할 데이터가 없습니다.");
			return;
		}

		if(!Utilities.getOpener().gridTargetNullChk(grdTarget)) return false;
		if (!confirm("기존 저장된 대상고객 데이터는 삭제됩니다.\n계속하시겠습니까?"))
			return;

		Utilities.blockUI();
		
		var param = Utilities.getOpener().getTotalTargetCondInput(true);
//console.log("=======> 고객그룹 조건정보 : "+ JSON.stringify(param));return;
		var url = "<c:url value='${urlPrefix}/custGroup/saveTargetCondNRelList${urlSuffix}'/>";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
//console.log(">>>>>>> jqXHR.status : "+ jqXHR.status +" / "+ jqXHR.statusText);
			if(jqXHR.status == 200){
				if (Utilities.processResult(data, jqXHR, "")) {
					Utilities.unblockUI();
					Utilities.getOpener().tabCall("#targetRelTabBtn");
					Utilities.getOpener().totalInfoInit();
					
					alert("대상조건 및 고객정보 등록에 성공했습니다.");
					Utilities.closeModal();
				}
			}else{
				alert("대상조건 및 고객정보 등록에 실패했습니다.");
				Utilities.unblockUI();
				Utilities.getOpener().location.reload();	//오프너를 모달팝업 닫기전에 사용해야한다.
				Utilities.closeModal();
			}
		});
	}

	function targetQueryCopy(){
		Utilities.getOpener().tabCall("#targetRelTabBtn");
	}

	function birthdayAge(grid,row,col,json,value){
		return Utilities.getBirthdayAge(value);
	}
</script>