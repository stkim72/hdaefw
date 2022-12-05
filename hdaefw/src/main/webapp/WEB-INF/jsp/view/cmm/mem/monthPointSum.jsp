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
                <h3 class="mTitle1">월별 포인트 검색</h3>
            </div>
            
			<!-- sort -->
			<div class="mSort2 type2">
            
				<ul>
					<li class="w20per">
						<div class="tit">연도</div>
						<div class="txt">
							<div class="mDate1">
								<input type="text" data-type="year" id="searchYear" name="searchYear" data-enter="search" data-button="Y" value=""/>
							</div>
						</div>
					</li>
					<div class="right">
						<button class="mBtn1" data-click="search" style="margin-right: 10px">검색</button>
					</div>
				</ul>
				
			</div>
			<!-- //sort -->
			<div class="mBox1 ">
				
				<div class="gTitle1">
					<h3 class="mTitle1">월별 포인트 목록</h3>
					<div class="gRt">
						<code:btnGroup name="monthPointSumList" hideDelete="true" hideInsert="true" hideSave="true" dispName="월별 포인트" gridId="grdList"/>
					</div>
				</div>
				
				<div id="divGrid"  style="height:${rightBoxHeight4}" 
					   data-grid-id="grdList" 
                       data-pagenation=" N" 
                       data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
                       data-type="grid" 
                       data-grid-callback="onGridLoad" 
                       data-tpl-url="<c:url value='/static/gridTemplate/mem/monthPointSum.xml'/>">
				</div>
			</div>
			
		</div>
		<!-- //right -->
	</div>
	
</div>
</form>

<script>

/* 화면 로드 */
window.onload = function(){
	
}

/* 조회 */
function search(){
    var url = "<c:url value='${urlPrefix}/getMonthPointList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    
    //사용구분코드 세팅
    param.useCd = "001"; // 사용
    param.pblsCd = "002"; // 발급
    param.extncCd = "004"; // 소멸
    
    grdList.loadUrl(url,param);
}

/* 그리드 로드 */
function grdList_load(gridView,gridId){
	
	var today = moment();
    var todayYear = today.format("YYYY");
    $('#searchYear').val(todayYear);
    
    search();
}

</script>