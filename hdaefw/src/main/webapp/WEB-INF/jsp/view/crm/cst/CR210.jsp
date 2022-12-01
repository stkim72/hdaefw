<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%>

<form role="form" id="frmSearch">

</form>

<div id="divGrid" style="height:390px" data-grid-id="grdList"
    data-pagenation="Y"
    data-get-url="<c:url value='${urlPrefix}/getCrmCustSynthesisHst2List${urlSuffix}'/>" 
    data-type="grid"
    data-grid-callback="onGridLoad" 
    data-tpl-url="<c:url value='/static/gridTemplate/cst/CR210.xml'/>">
</div>

<script>


/* 공통코드 그리드 load */
function grdList_load(gridView, gridId){
	search();
}

function search(){
    var url = "<c:url value='${urlPrefix}/getCrmCustSynthesisHst2List${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    if(parent.parenItgCustNo != ""){
    	param.itgCustNo = parent.parenItgCustNo;
    	grdList.loadUrl(url,param);
    } 
}

</script>