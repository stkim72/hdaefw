<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%>


<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<!--<div id='infodoc' style="position:absolute;left:0;top:0;width:100%">-->

 <div  class="mSort1 medium">
 	<div class="gTitle1">
		<h3 class="mTitle1">연락처 목록</h3>
			<div class="gRt">
				<code:btnGroup name="Contact" gridId="grdList1"  hideExcel="true" hideDelete="true" hideSave="true"  insertName="등록"/>
			</div>
	</div>
	<div  id="divGridList1" style="height:370px" 
		data-get-url="<c:url value='${urlPrefix}/sub/cmmCustCntplcBas/getList'/>${urlSuffix}"
		data-grid-id="grdList1" data-pagenation="N" data-type="grid"
		data-post="Y"
		data-tpl-url="<c:url value='/static/gridTemplate/cst/CR009.xml'/>">
	</div>	
</div>	
<%-- 	<div  id="divGridList1" style="height:${rightBoxHeight2}" --%>

		

<!--</div> -->
<!--</body>-->  
         
<script>

// function init(){
// 	  var doc = document.getElementById("infodoc");
// 	  doc.style.top=0;
// 	  doc.style.left=0;
// 	  pageheight = doc.offsetHeight;
// 	  pagewidth = doc.offsetWidth;
// 	  parent.frames["iframe"].resizeTo(pagewidth, pageheight);
// 	 }

// function callResize()  
// {  
//     //var height = document.body.scrollHeight;  
//     let element = document.getElementById('top');

//     parent.resizeTopIframe(element);  
// }  
// window.onload =callResize;  

// 부모창에 셋팅된 통합고객번호


/* 공통코드 그리드 load */
function grdList1_load(gridView, gridId) {
	
// 	var pcustDivCd = parent.parenCustDivCd;
	
// 	if(pcustDivCd == "001"){
// 		$("#divGridList1").attr("style", "height: auto; min-height: 100px;");	 
// 	}else{
		
// 	}
	search1();
}



/* 검색조건 검색 */
function search1() {
	
// 	var pitgCustNo = parent.document.all["itgCustNo"].value;
	// 고객구분값 : 001 : 개인 , 002 : 법인
	var pcustDivCd = parent.parenCustDivCd;
	var pitgCustNo = parent.parenItgCustNo;
	
	console.log(pcustDivCd);
	console.log(pitgCustNo);

	
	
	if(pitgCustNo != ''){
		var param = {
	            recordCountPerPage : 100000,
	            itgCustNo : pitgCustNo
	        };
		grdList1.loadUrl(null, param);		
	}
	

}

/* 연락처 등록 팝업호출 */
function newContact(){
	
	var pitgCustNo = parent.parenItgCustNo;

	var url = "<c:url value='${urlPrefix}/sub/cmmCustCntplcBas/add${urlSuffix}'/>?itgCustNo="+ pitgCustNo;
	Utilities.openModal(url,700,300);

}

function saveContact(){
	saveList(grdList1);
}

function deleteContact(){
	saveList(grdList1);
}

function deleteContact(pCntplcSeq){
	if(!pCntplcSeq)
		return;
	var url = "<c:url value='${urlPrefix}/sub/cmmCustCntplcBas/remove${urlSuffix}'/>";
	var saveJson = {
			cntplcSeq : pCntplcSeq
	}
	if(!confirm("연락처를 삭제하시겠습니까?"))
		return false;
	Utilities.blockUI();
	Utilities.getAjax(url,saveJson,true,function(data,jqXHR){
		Utilities.unblockUI();
        if(Utilities.processResult(data,jqXHR,"연락처 삭제에 실패했습니다."))
        {
        	
            alert("연락처 삭제 성공했습니다.");
            location.reload();
        }
    });
}


/* 저장 */
function saveList(gridView) {
	if(!saveValidate(gridView)) return;
	var saveJson = gridView.getSaveJson();
	if (saveJson.length) {
		if (!confirm("수정된 데이터를 저장하시겠습니까?"))
			return;
		if(saveValidate(gridView))
		var url = "<c:url value='${urlPrefix}/sub/cmmCustCntplcBas/saveList${urlSuffix}'/>";
		Utilities.getAjax(url, saveJson, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "시스템 저장에 실패했습니다.")) {
				alert("시스템 저장에  성공했습니다.");
				gridView.reload();
			}
		});
	} else {
		alert("수정된 데이터가 없습니다.");
	}
}


/* 행삭제 : 연락처 삭제 */
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
		var url = "<c:url value='${urlPrefix}/sub/cmmCustCntplcBas/deleteList${urlSuffix}'/>";
		Utilities.getAjax(url, saveJson, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "연락처 삭제에 실패했습니다.")) {
				alert("연락처 삭제에  성공했습니다.");
				gridView.reload();
			}
		});
	} else {
		alert("선택된 데이터가 없습니다.");
	}
}

/* 하부코드 수정 Validate*/
/* function saveValidate(gridView){
	var cuGridData = gridView.getSaveJson();
	for(var i=0; i<cuGridData.length; i++){
	    if(Utilities.isEmpty(cuGridData[i].comnCd)){
	    	alert("시스템코드를 입력하세요.");
	    	return false;
	    }

	    if(Utilities.isEmpty(cuGridData[i].comnCdNm)){
            alert("시스템코드명을 입력하세요.");
            return false;
        }
	}
	return true;
} */


/* 그리드 컬럼 클릭 */
// function onGridCellClick(gridView, rowIndex, columnName, colIndex, fieldIndex) {
// //	var url = "<c:url value='${urlPrefix}/mod${urlSuffix}'/>";
// 	var url = "<c:url value='${urlPrefix}/sub/cmmCustCntplcBas/mod${urlSuffix}'/>?cntplcSeq="+ grdList1.getJsonRow(rowIndex).cntplcSeq;
// 	Utilities.openModal(url,700,400);
// }
/* 그리드 셀 더블 클릭 */
function onGridCellDblClick(gridView, itemIndex, column, json, value){
	var url = "<c:url value='${urlPrefix}/sub/cmmCustCntplcBas/mod${urlSuffix}'/>?cntplcSeq="+ grdList1.getJsonRow(itemIndex).cntplcSeq;
	Utilities.openModal(url,700,300);
}
</script>

