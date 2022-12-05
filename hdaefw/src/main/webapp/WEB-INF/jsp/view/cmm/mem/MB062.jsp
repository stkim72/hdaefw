<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="title">
	<h1>회원이관</h1>
	<a href="#" data-btn-type="closeModal"  class="close">팝업 닫기</a>
</div>

<div class="cont">
	<div class="mGrid2 type2">
	    <!-- left -->
	    <div class="lt">
	    	<div class="gTitle1 mb10">
                <h3 class="mTitle1">이관전 매장</h3>
            </div>
	    	<div class="mBoard2">
		        <table>
	                <caption>이관전 매장</caption>
	                <colgroup>
	                    <col width="15%">
	                    <col width="25%">
	                    <col width="15%">
	                    <col width="35%">
	                </colgroup>
	                <tbody>
	                    <tr>
	                        <th scope="row" class="left">매장코드</th>
	                        <td>
	                            <input type="text" class="it" title="매장코드" id="currStorNo" disabled>
	                        </td>
	                        <th scope="row" class="left">매장명</th>
	                        <td>
	                            <input type="text" class="it" title="매장명" id="currStorNm" disabled>
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
	        <!-- //비대상고객 그리드영역 -->
			<div id="divStoreCustLeftGrid" style="height:550px" 
				data-post="Y" 
				data-grid-id="grdStoreCustLeft" 
				data-pagenation="N" 
				data-get-url="" 
				data-type="grid" 
				data-block-ui="Y"
				data-grid-callback="onGridLoad" 
				data-tpl-url="<c:url value='/static/gridTemplate/mem/cmmStoreCustMove.xml'/>">
			</div>
			<!-- //비대상고객 그리드영역 -->
	    </div>
	    <!-- //left -->
	    <!-- prev/next -->
	    <div class="mPn1">
	    	<span class="arr"></span>
	        <!-- <a href="#" class="prev" id="btnTargetDel">왼쪽으로 이동</a>
	        <a href="#" class="next" id="btnTargetAdd">오른쪽으로 이동</a> -->
	    </div>
	    <!-- //prev/next -->
	    <!-- right -->
	    <div class="rt">
	    	<div class="gTitle1 mb10">
                <h3 class="mTitle1">이관받을 매장</h3>
            </div>
	        <div class="mBoard2">
		        <table>
	                <caption>이관받을 매장</caption>
	                <colgroup>
	                    <col width="15%">
	                    <col width="25%">
	                    <col width="15%">
	                    <col width="35%">
	                </colgroup>
	                <tbody>
	                    <tr>
	                        <th scope="row" class="left">매장코드</th>
	                        <td>
	                            <input type="text" class="it" title="매장코드" id="trgtStorNo" disabled>
	                        </td>
	                        <th scope="row" class="left">매장명</th>
	                        <td>
	                            <div class="mFind1">
									<input type="text" class="it" title="매장명" id="trgtStorNm" disabled>
									<a href="#;" class="iFind" data-click="storeSearchPop">검색</a>
								</div>
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
	        <!-- //대상고객 그리드영역 -->
			<div id="divStoreCustRightGrid" style="height:550px" 
				data-post="Y" 
				data-grid-id="grdStoreCustRight" 
				data-pagenation="N" 
				data-get-url=""
				data-type="grid" 
				data-block-ui="Y"
				data-grid-callback="onGridLoad" 
				data-tpl-url="<c:url value='/static/gridTemplate/mem/cmmStoreCustMove.xml'/>">
			</div>
			<!-- //대상고객 그리드영역 -->
	    </div>
	    <!-- //right -->
	</div>
	<!-- //grid -->
	<p>&nbsp;</p>
	<div class="mSort2 medium"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
		<ul>
			<li class="wAuto ml20">
				<div class="tit"></div>
				<div class="txt">
					
				</div>
			</li>
		</ul>
		<div class="gRt posT-5">
            <a href="#" class="mBtn1 lPrimary" data-click="storeCustMoveUpd">이관처리</a>
        </div>
	</div>
</div>

<script>
	var currStorNo = '<c:out value="${storNo}"/>';
	var isAll = '<c:out value="${isAll}"/>';
	
	$("document").ready(function(){
		//initPage();
	});

	//서브페이지의 정보가 수정되면 부모페이지의 고객그룹목록부터 새로가져옵니다.(모든 하위항목까지 새로고침 됩니다.)
	function grdStoreCustLeft_load(grid, gridId) {
		var currData = Utilities.getOpener().currStoreCustInfoGet();
		currStorNo = currData.currStorNo;
		$('#currStorNo').val(currData.currStorNo);
		$('#currStorNm').val(currData.currStorNm);
		
		if(isAll == "Y"){
			trgtStoreCustListGet(grdStoreCustLeft, currData.currStorNo);
		}else{
			//console.log("=======> 현재 매장\n"+ JSON.stringify(currData));	
			grdStoreCustLeft.loadJson(currData);
		}
	}

	function initPage(){
		grdStoreCustLeft.clear();
		grdStoreCustRight.clear();
	}

	function birthdayAge(grid,row,col,json,value){
		return Utilities.getBirthdayAge(value);
	}

	function storeSearchPop(){
		Utilities.openStorePop("storeSearchInfoGet");
	}

	function storeSearchInfoGet(data){
		grdStoreCustRight.clear();
		
		if(data != null){
			if(data.storNo == $('#currStorNo').val()){
				alert("같은 매장입니다.");
				return false;
			}
			
			$('#trgtStorNo').val(data.storNo);
			$('#trgtStorNm').val(data.storNm);
			trgtStoreCustListGet(grdStoreCustRight, data.storNo);
		}
	}

	function trgtStoreCustListGet(grid, storNo){
		var url = "<c:url value='${urlPrefix}/getStoreCustList${urlSuffix}'/>";
		var param = {
			storNo : storNo
		}
		grid.loadUrl(url,param);
	}

	function storeCustMoveUpd(){
		var trgtStorNo = $('#trgtStorNo').val();
		var custList = grdStoreCustLeft.getData();//.getCheckedJson();
		
		if(grdStoreCustLeft.getRowCount() <= 0){
			alert("이관할 회원이 없습니다.");
			return false;
		}
		
		if(trgtStorNo == ""){
			alert("이관받을 매장을 선택해주세요.");
			return false;
		}

		if (!confirm("회원이관을 실행하시겠습니까?"))
			return;

		Utilities.blockUI();
		var param = {
				isAll : isAll,
				storNo : trgtStorNo,
				currStorNo : currStorNo,
				custList : custList
			}
//console.log("==> 이관정보 : "+ JSON.stringify(param));return;
		var url = "<c:url value='${urlPrefix}/updStoreCustMove${urlSuffix}'/>";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "회원이관에 실패했습니다.")) {
				alert("회원이관에 성공했습니다.");
				Utilities.unblockUI();
				grdStoreCustLeft.clear();
				trgtStoreCustListGet(grdStoreCustRight, trgtStorNo);
				Utilities.getOpener().storeBasListInit();
			}
		});
	}
</script>