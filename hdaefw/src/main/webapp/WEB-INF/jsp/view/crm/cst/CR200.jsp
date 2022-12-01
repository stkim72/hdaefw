<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<form role="form" id="frmSearch" name="frmSearch">
	<!-- sort -->
	<div class="mSort2 medium">
		<ul>
			<li class="w20per">
				<div class="tit">발생기간</div>
				<div class="txt">
					<div class="mDate1">
						<input class="it" type="text" data-type="dateRangeStart" data-range-end="pblsEndDt" id="pblsStaDt" name="pblsStaDt" data-enter="search" data-button="Y"/>
						<span class="bar">~</span>
						<input class="it" type="text" id="pblsEndDt" name="pblsEndDt" data-enter="search" data-button="Y"/>
					</div>
				</div>
			</li>
		</ul>
		<div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
            <a href="#" data-click="search" class="mBtn1">검색</a>
        </div>
	</div>
	<!-- //sort -->
	
</form>

<div  id="divGrid" style="height:335px" data-grid-id="grdList" 
    data-pagenation="Y" 
    data-get-url="<c:url value='${urlPrefix}/getAdvncmtList${urlSuffix}'/>" 
    data-type="grid" 
    data-grid-callback="onGridLoad" 
    data-tpl-url="<c:url value='/static/gridTemplate/cst/CR200.xml'/>">
</div>

<script>

/* 조회 */
function search() {
	
	var url = "<c:url value='${urlPrefix}/getAdvncmtList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    
    if(parent.parenItgCustNo)   
    {
        param.itgCustNo = parent.parenItgCustNo;
        grdList.loadUrl(url,param);
    }
} 


/* 그리드 로드 */
function grdList_load(gridView,gridId){
    search();
}

</script>