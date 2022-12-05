<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<form role="form" id="frmSearch">
<div id="wrapIframe" class="closed"> <!-- 고객정보 닫힘 -->
		
	<div class="mGrid1">
		<!-- right -->
		<div class="gRight">
			<div class="gTitle1 line">
                <h3 class="mTitle1">약관 검색</h3>
            </div>
            
			<!-- sort -->
			<div class="mSort2 type2">
            
            <input type="hidden" id="stpltNo" name="stpltNo"/>
				<ul>
					<li class="w12per">
						<div class="tit">약관명</div>
						<div class="txt">
							<div class="mFlex2">
								<span class="flex"><input type="text" class="it" id="stpltNm" name="stpltNm" title="약관명"></span>	
							</div>
						</div>
					</li>
					<li class="w16per">
						<div class="tit">약관구분</div>
						<div class="txt">
							<code:commCode name="stpltTypeCd" id="stpltTypeCd" codeCd="CU310" prefixLabel="전체" prefixValue=""/>
						</div>
					</li>
					<li class="w12per">
						<div class="tit">사용여부</div>
						<div class="txt">
							<code:commCode id="useYn" name="useYn" codeCd="S050" prefixLabel="전체" prefixValue=""/>
						</div>
					</li>
					<div class="right">
						<button class="mBtn1" data-click="search" style="margin-right: 10px">검색</button>
					</div>
				</ul>
				
			</div>
			
				<div class="gTitle1">
						<h3 class="mTitle1">약관 목록</h3>
						<div class="gRt">
							<button class="mBtn1" data-click="regPopup" >
								약관등록
							</button>
						</div>
				</div>
				<div id="divGrid"  style="height:${rightBoxHeight4}" 
					   data-grid-id="grdList" 
                       data-pagenation="Y" 
                       data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
                       data-type="grid" 
                       data-grid-callback="onGridLoad" 
                       data-tpl-url="<c:url value='/static/gridTemplate/mem/MB072.xml'/>">
				</div>
			
		</div>
		<!-- //right -->
	</div>
	
</div>
</form>

<script>

/* 조회 */
function search(){
    var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    grdList.loadUrl(url,param);
}

/* 그리드 로드 */
function grdList_load(gridView,gridId){
    search();
}

/* 그리드 셀 더블 클릭 */
function onGridCellDblClick(gridView, itemIndex, column, json, value){
	showDetail(json); 
}

/* 상세화면 팝업 로드(수정) */
function showDetail(json){
	var url = "<c:url value='${urlPrefix}/detail'/>/" + json.stpltNo;
    Utilities.openModal(url,1000,730);
}

/* 상세화면 팝업 로드(등록) */
function regPopup(){
	var url = "<c:url value='${urlPrefix}/detail'/>/" + "null";
    Utilities.openModal(url,1000,730);
}

</script>