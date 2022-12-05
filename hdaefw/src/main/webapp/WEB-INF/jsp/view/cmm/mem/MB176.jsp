<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%>

<div id="wrapIframe" class="closed"> <!-- 고객정보 닫힘 -->
    <div class="cont">
		<div class="gTitle1 line">
		    <h3 class="mTitle1">소멸포인트내역(건별) 검색</h3>
		</div>        
        <form role="form" id="frmSearch">   
		<div class="mSort2 type2">
		    
                <ul>
					<li class="w16per">
						<div class="tit w105">소멸일</div>
						<div class="txt">
						    <input type="text" data-type="month" id="searchMonth" name="searchMonth" data-enter="search" data-button="Y" value=""/>
						</div>
					</li>
                    <li class="w18per">
                        <div class="tit">통합고객번호</div>
                        <div class="txt">
                            <input type="text" id="itgCustNo" name="itgCustNo" class="it" title="통합고객번호">
                        </div>
                    </li>
				</ul>
				<div class="button posVm"> <!-- 버튼 상하 가운데 정렬 : class="posVm" -->
					<a href="#" class="mBtn1" data-click="search">검색</a>
				</div>				
		</div>	

		<div class="gTitle1">
			<h3 class="mTitle1">소멸포인트내역(건별) 목록</h3>
			<div class="gRt">
				<code:btnGroup name="pointUseList" hideDelete="true" hideInsert="true" hideSave="true" dispName="포인트내역(건별)" gridId="grdList"/>
			</div>
		</div>
	   </form>
       <div  id="divGrid" style="height:${rightBoxHeight4}" data-grid-id="grdList" 
			data-pagenation="Y" 
			data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
			data-type="grid" 
			data-block-ui="Y"
			data-grid-callback="onGridLoad" 
			data-tpl-url="<c:url value='/static/gridTemplate/mem/MB176.xml'/>">
       </div>
    </div>
</div>


<script>

/* 공통코드 그리드 load */
function grdList_load(gridView, gridId) {
	search();
}

function search()
{
	var url = "<c:url value='${urlPrefix}/getPointExtinctionList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
   	grdList.loadUrl(url,param);

}
//setToday(); 

</script>