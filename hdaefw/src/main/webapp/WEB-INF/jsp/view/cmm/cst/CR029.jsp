<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<form role="form" id="frmMain">
	
	<div class="mSort2 medium">
		<ul>
			<li class="w22per">
				<div class="tit">검색기간</div>
				<div class="txt">
					<div class="mDate1">
						<input class="it" type="text" data-type="dateRangeStart" data-range-end="regEndDt" id="regStaDt" name="regStaDt" data-enter="search" data-button="Y"/>
						<span class="bar">~</span>
						<input class="it" type="text" id="regEndDt" name="regEndDt" data-enter="search" data-button="Y"/>
					</div>
				</div>
			</li>
			<li class="w15per">
				<div class="tit">이름</div>
				<div class="txt">
					<span class="flex"><input type="text" class="it" id="custNm" name="custNm" title="이름"></span>	
				</div>
			</li>
			<li class="w15per">
				<div class="tit">휴대전화번호</div>
				<div class="txt">
					<span class="flex"><input type="text" class="it" id="mphonNo" name="mphonNo" title="휴대전화번호"></span>
				</div>
			</li>
			
			<li class="w11per">
				<div class="tit">추천종류</div>
				<div class="txt">
					<code:commCode id="rcmdTypeCd" name="rcmdTypeCd" codeCd="CU340" prefixLabel="전체" prefixValue=""/>
				</div>
			</li>
			<div class="right">
				<button class="mBtn1" data-click="search">검색</button>
			</div>
		</ul>
	</div>
	
	<div class="list">
		<div id="divGrid"   style="height:335px" 
							data-grid-id="grdList" 
							data-pagenation="Y"
							data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
							data-type="grid" 
							data-grid-callback="onGridLoad"
							data-tpl-url="<c:url value='/static/gridTemplate/cst/CR029.xml'/>">
		</div>
	</div>

</form>

<script>

/* 조회 */
function search(){
    var url = "<c:url value='${urlPrefix}/getRecommendList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmMain");
    //if(parent.document.all["itgCustNo"].value != "")
    if(parent.parenItgCustNo)	
    {
    	//param.itgCustNo = parent.document.all["itgCustNo"].value;
    	param.itgCustNo = parent.parenItgCustNo;
    	grdList.loadUrl(url,param);
    }
}

/* 그리드 로드 */
function grdList_load(gridView,gridId){
    search();
}

</script>