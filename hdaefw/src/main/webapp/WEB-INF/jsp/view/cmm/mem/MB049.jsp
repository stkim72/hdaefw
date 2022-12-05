\<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<div class="tit">거래일</div>
				<div class="txt">
					<div class="mDate1">
						<input class="it" type="text" data-type="dateRangeStart" data-range-end="cntrtEndDt" id="cntrtStaDt" name="cntrtStaDt" data-enter="search" data-button="Y"/>
						<span class="bar">~</span>
						<input class="it" type="text" id="cntrtEndDt" name="cntrtEndDt" data-enter="search" data-button="Y"/>
					</div>
				</div>
			</li>
			<li class="w15per">
				<div class="tit">제품명</div>
				<div class="txt">
					<code:commCode id="" name="" codeCd="GD010" prefixLabel="전체" prefixValue=""/>
				</div>
			</li>
			<li class="w15per">
				<div class="tit">온/오프 구분</div>
				<div class="txt">
					<code:commCode id="" name="" codeCd="" prefixLabel="전체" prefixValue=""/>
				</div>
			</li>
			
			<li class="w11per">
				<div class="tit">일시불/렌탈 구분</div>
				<div class="txt">
					<code:commCode id="" name="" codeCd="" prefixLabel="전체" prefixValue=""/>
				</div>
			</li>
			<div class="right">
				<button class="mBtn1" data-click="search">검색</button>
			</div>
		</ul>
	</div>
	
	<div class="list">
		<div id="divGrid"   style="height:360px" 
							data-grid-id="grdList" 
							data-pagenation="Y"
							data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
							data-type="grid" 
							data-grid-callback="onGridLoad"
							data-tpl-url="<c:url value='/static/gridTemplate/mem/MB049.xml'/>">
		</div>
	</div>

</form>

<script>

/* 조회 */
function search(){
	var url = "<c:url value='promotionOrderList/getList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmMain");
    grdList.loadUrl(url,param);
}

/* 그리드 로드 */
function grdList_load(gridView,gridId){
    search();
}

</script>