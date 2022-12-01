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
		    <h3 class="mTitle1">등급별 회원통계 검색</h3>
		</div>
		    
	    <div class="mSort2 type2">
		       <form role="form" id="frmSearch">
					<ul class="w100per">
                        <li class="wAuto">
			                <div class="tit">조회기간</div>
			                <div class="txt">
			                    <div class="mDate1">
			                        <input type="text" class="it date" title="조회일" data-type="date" id="searchDt" name="searchDt" data-enter="search" data-button="Y" value="" onChange="this.value=this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');">
			                    </div>
			                </div>
			            </li>
					</ul>
					<div class="gRt">
                        <div class="mFlex2">
                            <a href="#" class="mBtn1" data-click="search">검색</a>
                        </div>
                    </div>
			</form>
	    </div>
	 
		<div class="gTitle1">
			<h3 class="mTitle1" style="display:inline;">등급별 회원통계 목록</h3>
			<h4 style="display:inline;">(조회 당시의 등급별회원)</h4>
			<div class="gRt">
				<code:btnGroup name="gradeStat" hideDelete="true" hideInsert="true" hideSave="true" dispName="등급별 회원통계 목록" gridId="grdList"/>
			</div>
		</div>
			
		<div id="divGrid"  style="height:${rightBoxHeight4}"
	        data-grid-id="grdList" 
			data-pagenation="N" 
			data-get-url="<c:url value='${urlPrefix}/getGradeStat1List${urlSuffix}'/>" 
			data-type="grid" 
			data-block-ui="Y"
			data-grid-callback="onGridLoad" 
			data-tpl-url="<c:url value='/static/gridTemplate/cst/gradeStat.xml'/>">
		</div>
		
        
	</div>
</div>
<script>

window.onload = function(){
	
 	var today = moment();
    var dt = today.format("YYYYMMDD");
    
	$("#searchDt").val(dt);

}


function search()
{
	searchGrid1();
}

function searchGrid1()
{
    var url = "<c:url value='${urlPrefix}/getGradeStat1List${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    grdList.loadUrl(url,param);
}

setToday(); 

</script>