<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<input type="hidden" id="initInput" name="initInput"/>
<form role="form" id="frmSearch">

<div class="mSort2">
    <div class="row">
			<ul class="searchCon">
				<li class="w12per">
                     <div class="tit w85">사용자명</div>
                     <div class="txt">
                     <input type="text" id="userName" data-enter="search" name="userName" class="it">
                     </div>
                </li>
                <li class="w12per">
                     <div class="tit w85">이메일</div>
                     <div class="txt">
                     <input type="text" id="userEmail" data-enter="search" name="userEmail" class="it">
                     </div>
                </li>
                <li class="w12per">
                     @
                     <div class="txt">
                     <input type="text" id="domain" name="domain" class="it"/>
                     </div>
                </li>
                <li class="w12per">
                     <div class="txt">
                     <select id="selectDomain" name="selectDomain" class="it">
			      				<option value="direct" selected>직접입력</option>
			      				<option value="naver.com">naver.com</option>
			      				<option value="google.com">google.com</option>
		      					<option value="daum.net">daum.net</option>
			      	 </select>
                     </div>
                     <div class="tit"></div>
				</li>
				<li class="w15per">
                     <div class="tit w85">전화번호</div>
                     <div class="txt"id="inputPhone">
                     <input type="text" id="userPhoneNumber" data-enter="search" name="userPhoneNumber" class="it">
                     </div>
                </li>
                <li class="w25per">
                     <a href="#" class="mBtn1" data-click="initSearch" >초기화</a>
                     <a href="#" class="mBtn1" data-click="search" >검색</a>
                </li>
		   </ul>
	</div>
</div>

<input type="text" id="tabData" name="tabData" class="it" value="BackCus" style="display:none;"></input>

</form>

<div class="mTab1 jsTab2">
    <ul class="tabs">
        <li value="BackCus" class="active"><a href="#userInfoGrid">과거고객정보</a></li>
        <li value="ASCUST"><a href="#asCustGrid">AS고객</a></li>
        <li value="AS"><a href="#asGrid">AS이력</a></li>
        <li value="MEM"><a href="#memGrid">멤버십</a></li>
        <li value="COLLABI"><a href="#collabiGrid">상담</a></li>
    </ul>
</div>

<div class="mBox1 tabCont" id="userInfoGrid">
	<div class="gTitle1">
		<h3 class="mTitle1">정보 조회</h3>
			<div class="gRt">
				<button id="excelDown1" type="button">엑셀</button>
			</div>
	</div>
 	<div id="divGrid"  style="height:520px" data-grid-id="grdList"
										data-pagenation="Y"
										data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>"
										data-type="grid"
										data-block-ui="Y"
										data-grid-callback="onGridLoad"
										data-tpl-url="<c:url value='/static/gridTemplate/backcus/userInfo.xml'/>" >
	</div>
</div>

<div class="mBox1 tabCont hidden" id="asCustGrid">
 	<div class="gTitle1">
		<h3 class="mTitle1">정보 조회</h3>
			<div class="gRt">
				<button id="excelDown5" type="button">엑셀</button>
			</div>
	</div>
 	<div id="divGrid2"  style="height:520px" data-grid-id="grdList1"
										data-pagenation="Y"
										data-get-url="<c:url value='${urlPrefix}/asGetList${urlSuffix}'/>"
										data-type="grid"
										data-block-ui="Y"
										data-grid-callback="onGridLoad"
										data-tpl-url="<c:url value='/static/gridTemplate/backcus/asCustGrid.xml'/>" >
	</div>
</div>

<div class="mBox1 tabCont hidden" id="asGrid">
 	<div class="gTitle1">
		<h3 class="mTitle1">정보 조회</h3>
			<div class="gRt">
				<button id="excelDown2" type="button">엑셀</button>
			</div>
	</div>
 	<div id="divGrid2"  style="height:520px" data-grid-id="grdList2"
										data-pagenation="Y"
										data-get-url="<c:url value='${urlPrefix}/asGetList${urlSuffix}'/>"
										data-type="grid"
										data-block-ui="Y"
										data-grid-callback="onGridLoad"
										data-tpl-url="<c:url value='/static/gridTemplate/backcus/asGrid.xml'/>" >
	</div>
</div>

<div class="mBox1 tabCont hidden" id="memGrid">
 	<div class="gTitle1">
		<h3 class="mTitle1">정보 조회</h3>
			<div class="gRt">
				<button id="excelDown3" type="button">엑셀</button>
			</div>
	</div>
 	<div id="divGrid3"  style="height:520px" data-grid-id="grdList3"
										data-pagenation="Y"
										data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>"
										data-type="grid"
										data-block-ui="Y"
										data-grid-callback="onGridLoad"
										data-tpl-url="<c:url value='/static/gridTemplate/backcus/memGrid.xml'/>" >
	</div>
</div>

<div class="mBox1 tabCont hidden" id="collabiGrid">
 	<div class="gTitle1">
		<h3 class="mTitle1">정보 조회</h3>
			<div class="gRt">
				<button id="excelDown4" type="button">엑셀</button>
			</div>
	</div>
 	<div id="divGrid4"  style="height:520px" data-grid-id="grdList4"
										data-pagenation="Y"
										data-get-url="<c:url value='${urlPrefix}/collabiGetList${urlSuffix}'/>"
										data-type="grid"
										data-block-ui="Y"
										data-grid-callback="onGridLoad"
										data-tpl-url="<c:url value='/static/gridTemplate/backcus/collabiGrid.xml'/>" >
	</div>
</div>

<script>

function search(){
	document.getElementById('tabData').value = $('ul.tabs li.active')[0].attributes[0].value;
    var url = "<c:url value='${urlPrefix}/getListMask${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");

    if(document.getElementById('tabData').value == "BackCus"){
    	grdList.loadUrl(url,param);
    }else if(document.getElementById('tabData').value == "ASCUST"){
    	grdList1.loadUrl("<c:url value='${urlPrefix}/asCustGetListMask${urlSuffix}'/>",param);
    }else if(document.getElementById('tabData').value == "MEM"){
    	grdList3.loadUrl(url,param);
    }else if(document.getElementById('tabData').value == "COLLABI"){
    	grdList4.loadUrl("<c:url value='${urlPrefix}/collabiGetListMask${urlSuffix}'/>", param);
    }else{
    	grdList2.loadUrl("<c:url value='${urlPrefix}/asGetListMask${urlSuffix}'/>",param);
    }
}

function grdList_pageMove(gridView,pageNo){
    $("form#frmSearch").find("#currentPageNo").val(pageNo);
    search();
}

function grdList_load(gridView,gridId){
     search();
}

/* 그리드 컬럼 더블 클릭 */
function onGridCellDblClick(gridView,itemIndex, column, json, value){
	if(document.getElementById('tabData').value == "BackCus"){
		showDetail(json);
	}

	if(document.getElementById('tabData').value == "MEM"){
		showMemDetail(json);
	}

	if(document.getElementById('tabData').value == "COLLABI"){
		showCollabiDetail(json);
	}

	if(document.getElementById('tabData').value == "AS"){
		showAsDetail(json);
	}
}

function showDetail(json){
	var url = "<c:url value='${urlPrefix}/detail${urlSuffix}'/>/"+ json.userNum;
    Utilities.openModal(url,1500,550);
}

function showMemDetail(json){
	if(json.loginId != null){
		var url = "<c:url value='${urlPrefix}/memDetail${urlSuffix}'/>/"+ json.loginId;
	    Utilities.openModal(url,1500,550);
	}else{
		alert('사용자 ID가 없습니다.');
	}
}

function showCollabiDetail(json){
	var url = "<c:url value='${urlPrefix}/collabiDetail${urlSuffix}'/>/"+ json.collabiSeq;
    Utilities.openModal(url,1500,550);
}

function showAsDetail(json){
	var url = "<c:url value='${urlPrefix}/asDetail${urlSuffix}'/>/"+ json.asCaseId;
    Utilities.openModal(url,1500,550);
}

function initSearch(){
	Utilities.mapToForm({}, "frmSearch");
	// hidden 필드 초기화
	$("#initInput").val("");
}

$(".jsTab2 li > a").off().on("click",function(){
	$(this).parent().parent().children().removeClass("active");
	$(this).parent().addClass("active");
	$(this).parent().parent().parent().parent().children(".tabCont").addClass("hidden");
	$($(this).attr("href") ).removeClass("hidden");

	if($(this).parent()[0].attributes[0].value == 'COLLABI'){
		$('#userEmail').attr('disabled', true);
		$('#domain').attr('disabled', true);
	}else{
		$('#userName').removeAttr('disabled');
		$('#userEmail').removeAttr('disabled');
		$('#userPhoneNumber').removeAttr('disabled');
		$('#domain').removeAttr('disabled');
	}

	search();
	return false;
})

$('#selectDomain').off().on("change",function(){
    $("#selectDomain option:selected").each(function () {
		if($(this).val()=='direct'){ //직접입력일 경우
			 $("#domain").val('');                        //값 초기화
		}else{ //직접입력이 아닐경우
			 $("#domain").val($(this).text());      //선택값 입력
		}
   });
});


async function excelFunc(url, param){
	const value = await fetch(url,{
    	method:"POST",
    	headers: {
  	      'Content-Type': 'application/json',
  	    },
    	body: JSON.stringify(param)
    });

	const jsonData = await value.json().then();
	return (jsonData.data.contents);
}

$("button").off().on("click", async function(){
	const dt = new Date();
	const year = dt.getFullYear();
	const month = ("0"+(dt.getMonth() + 1)).slice(-2);
	const day = ("0"+dt.getDate()).slice(-2);

	const excelTimestamp = year + month + day + ".xlsx"

    var param = Utilities.formToMap("frmSearch");

	if(this.id == "excelDown1"){
		var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
		param.perPage = grdList.searchParam.pagination.perPage;
		param.page = grdList.getCurrentPage();
		var data = await excelFunc(url, param);
		grdList.toExcel("과거고객정보_" + excelTimestamp, data, true);
	}else if(this.id == "excelDown2"){
		var url = "<c:url value='${urlPrefix}/asGetList${urlSuffix}'/>";
		param.perPage = grdList2.searchParam.pagination.perPage;
		param.page = grdList2.getCurrentPage();
		var data = await excelFunc(url, param);
		grdList2.toExcel( "AS_" + excelTimestamp, data, true);
	}else if(this.id == "excelDown5"){
		var url = "<c:url value='${urlPrefix}/asCustGetList${urlSuffix}'/>";
		param.perPage = grdList1.searchParam.pagination.perPage;
		param.page = grdList1.getCurrentPage();
		var data = await excelFunc(url, param);
		grdList2.toExcel( "AS_" + excelTimestamp, data, true);
	}else if(this.id == "excelDown3"){
		var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
		param.perPage = grdList3.searchParam.pagination.perPage;
		param.page = grdList3.getCurrentPage();
		var data = await excelFunc(url, param);
		grdList3.toExcel( "멤버십_" + excelTimestamp, data, true);
	}else{
		var url = "<c:url value='${urlPrefix}/collabiGetList${urlSuffix}'/>";
		param.perPage = grdList4.searchParam.pagination.perPage;
		param.page = grdList4.getCurrentPage();
		var data = await excelFunc(url, param);
		grdList4.toExcel( "상담_" + excelTimestamp, data, true);
	}
})

</script>

<style>
ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
	margin-top: 15px;
}

.mTab1 li a{
	padding: 0px;
}

input:disabled{
    background-color: rgba(0,0,0,.05) !important;
}

button{
    border: 1px solid #898989;
    background-color: #fff;
    display: inline-block;
    border-radius: 2px;
    color: #797979;
    letter-spacing: -1px;
    padding: 0 8px;
    height: 24px;
    font-size: 12px;
    font-family: "Noto Sans KR", "맑은 고딕", "돋움", dotum, sans-serif;
}
</style>