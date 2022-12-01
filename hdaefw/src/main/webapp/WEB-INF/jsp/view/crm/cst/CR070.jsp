<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="mPopup1">
    <form id="frmMain">
    <!-- header -->
    <div class="title">
        <h1>주의고객 이력 상세</h1>
        <a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
    </div>
    
    <div class="cont">
        
        <!-- grid -->
        <div class="mGrid2">
            <div class="gTitle1 line">
                <h3 class="mTitle1">주의고객 이력 상세 목록</h3>
                <div class="gRt">
		            <button class="mBtn1" data-click="saveBlackDel" >해제</button>
		        </div>
            </div>
            
            <div  id="divGrid" style="height:${rightBoxHeight2}" data-grid-id="grdList" 
		         data-pagenation="Y" 
		         data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
		         data-type="grid" 
		         data-grid-callback="onGridLoad" 
		         data-tpl-url="<c:url value='/static/gridTemplate/cst/CR070.xml'/>">
            </div>
    
        </div>
        <div class="right">
		    <a href="#" data-btn-type="closeModal" class="mBtn1">창닫기</a>
		</div>
    </div>
    </form>
</div>
                



<script>

function search()
{
	var param = {};
    var url = "<c:url value='${urlPrefix}/getBlackHistoryList${urlSuffix}'/>";
    param.itgCustNo = '${itgCustNo}';
//    var param = Utilities.formToMap("frmSearch");
    grdList.loadUrl(url,param);
}

/* 그리드 로드 */
function grdList_load(gridView,gridId){
    search();
}

function saveBlackDel()
{
	/* alert("작업중입니다.");
	return; */
	var saveJson = grdList.getCheckedJson();
	
	if (saveJson.length == 0) {
		alert("해제할 블랙리스트목록을 선택해주세요.");
		return;
	}
	
	if( saveJson.length > 1){
		alert("해제할 블랙리스트목록을 한개만 선택해 주세요.");
		return;
	}
	
	
	
/* 	for(var i=0; i<saveJson.length; i++)
	{
		saveJson[i].bllkmshpYn = "N";
		saveJson[i].bllkRegDt = "";
	}	 */
	
	if (saveJson.length) {
		
		if (!confirm("선택된 블랙리스트목록을 해제하시겠습니까?"))
			return;
		
		var url = "<c:url value='${urlPrefix}/deleteBlackList${urlSuffix}'/>";
		Utilities.getAjax(url, saveJson, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "블랙리스트 해제가 실패했습니다.")) {
				alert("블랙리스트 해제가 완료되었습니다.");
					//search();
					Utilities.getOpener().search();
					Utilities.closeModal()
					$("#frmSearch")[0].reset();
			}
		});
	} else {
		alert("선택된 데이터가 없습니다.");
	}
}

setToday(); 
</script>