<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%>

<form role="form" id="frmSearch">
	<div class="mSort2 medium">
		<ul>
			<li class="wAuto">
				<div class="tit">기간</div>
				<div class="txt">
					<div class="mDate1">
						<input type="text" class="it date" title="시작일" data-type="dateRangeStart" data-range-end="endDt" id="strtDt" name="strtDt" data-enter="search" data-button="Y" value="">
						<span class="bar">~</span>
						<input type="text" class="it date" title="마지막일" id="endDt" name="endDt" data-enter="search" data-button="Y" value="">
					</div>
				</div>
			</li>
		</ul>
		<div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
            <a href="#" data-click="search" class="mBtn1">검색</a>
        </div>
	</div>
</form>

<div  id="divGrid" style="height:335px" data-grid-id="grdList" 
    data-pagenation="Y" 
    data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
    data-type="grid" 
    data-grid-callback="onGridLoad" 
    data-tpl-url="<c:url value='/static/gridTemplate/cst/CR025.xml'/>">
</div>


<script>

function search()
{
    var url = "<c:url value='${urlPrefix}/getCeraCkList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    //if(parent.document.all["itgCustNo"].value != "")
    if(parent.parenItgCustNo)	
    {
    	//param.itgCustNo = parent.document.all["itgCustNo"].value;
    	param.itgCustNo = parent.parenItgCustNo;
    	grdList.loadUrl(url,param);
    }
}

function onGridCellDblClick(gridView,itemIndex, column, json, value){
	//parmaSend(json);
}

function parmaSend(json){
	
	var callbackName = "custNmSelect";
    var win = Utilities.getOpener();
    try{
        if(win[callbackName])
            win[callbackName](json);    
    }catch(e){}
    Utilities.closeModal();
}

function grdList_load(gridView,gridId){
    search();
}

/* 그리드 셀 더블 클릭 */
function onGridCellDblClick(gridView, itemIndex, column, json, value){
	showDetail(json); 
}

/* 상세화면 팝업 로드(수정) */
function showDetail(json){
	var url = "<c:url value='${urlPrefix}/sub/ceraCkPop${urlSuffix}'/>/"+json.neuroMeasureNo+"/"+json.itgCustNo;
	Utilities.openModal(url,1600,750);
}
//setToday(); 
// set1month();
</script>