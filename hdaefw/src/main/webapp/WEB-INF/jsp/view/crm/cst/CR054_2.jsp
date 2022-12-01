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
        <h3 class="mTitle1">검색쿼리</h3>
        <div class="gRt">
        	<!-- <a href="#" class="mBtn1 lWhite" data-click="targetQueryPop">쿼리</a> -->
            <a href="#" class="mBtn1 lPrimary" data-click="targetSearchQuerySave">SQL 저장</a>
        </div>
    </div>
    <textarea class="textarea" rows="27" title="쿼리" id="targetSearchQuery" readonly></textarea>
    <p>&nbsp;</p>
	<div class="mSort2 medium"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
		<ul>
			<li class="wAuto ml20">
				<div class="tit"></div>
				<div class="txt">
					
				</div>
			</li>
		</ul>
		<div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
			<a href="#" class="mBtn1 lWhite" data-click="targetQueryCopy">SQL 복사</a>
		</div>
	</div>
</div>

<script>
	var currCustGrpNo = '<c:out value="${custGrpNo}"/>';
	
	$("document").ready(function(){
		targetQueryGet();
	});

	function targetQueryGet(){
		var param = Utilities.getOpener().getTotalTargetCondInput(true);
		//console.log("===\n"+JSON.stringify(param));
		var url = "<c:url value='${urlPrefix}/custGroup/getTargetQuery${urlSuffix}'/>";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "대상고객쿼리 생성에 실패했습니다.")) {
				var sQuery = data.custGrpExtrSqlCtnts;
				if(sQuery != null){
					sQuery = "\t\t"+ sQuery;
					sQuery = sQuery.replace(/\n\s*\n/g, '\n');
					$("#targetSearchQuery").text(sQuery);
				}
			}
		});
	}

	function targetSearchQuerySave(){
		if (!confirm("SQL문을 저장하시겠습니까?")) return;
		
		var inputQuery = $('#targetSearchQuery').val();
		//console.log("inputQuery\n"+ inputQuery); return;
		var param = {
				custGrpNo : currCustGrpNo,
				inputQuery : inputQuery
			};
		var url = "<c:url value='${urlPrefix}/custGroup/saveTargetQuery'/>${urlSuffix}";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "대상고객 검색쿼리 저장에 실패했습니다.")) {
				Utilities.getOpener().totalInfoInit();
				alert("대상고객 검색쿼리를 저장하였습니다.");
				Utilities.closeModal();
			}
		});
	}

	function targetQueryCopy(){
		/*
		Utilities.getOpener().targetQueryCopy();
		console.log("===\n"+(Utilities.getOpener().document.body.innerHTML));
		var testObj = $("#targetExtIFrm", Utilities.getOpener().parent.parent.document);
		var parentObj = $("iframe[src='custGroup']", Utilities.getOpener().parent.parent.document);
		testObj.get(0).contentWindow.testCall2()
		console.log("testObj : "+ Utilities.getOpener().closest());
		console.log("===\n"+(Utilities.getOpener().parent.opener.document.body.innerHTML));
		*/
		$("#targetSearchQuery").select();
		document.execCommand("copy");
		
		alert("복사되었습니다.");
	}

</script>