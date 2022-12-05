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
				<div class="tit">등급변경</div>
				<div class="txt">
					<div class="mDate1">
						<input type="text" class="it date" title="등급변경 시작일" data-type="dateRangeStart" data-range-end="endDt5" id="strtDt5" name="strtDt5" data-enter="search5" data-button="Y" value="">
						<span class="bar">~</span>
						<input type="text" class="it date" title="등급변경 종료일" id="endDt5" name="endDt5" data-enter="search5" data-button="Y" value="">
					</div>
				</div>
			</li>
			<li class="wAuto">
				<div class="tit">등급만료</div>
				<div class="txt">
					<div class="mDate1">
						<input type="text" class="it date" title="등급만료 시작일" data-type="dateRangeStart" data-range-end="endDt6" id="strtDt6" name="strtDt6" data-enter="search5" data-button="Y" value="">
						<span class="bar">~</span>
						<input type="text" class="it date" title="등급만료 종료일" id="endDt6" name="endDt6" data-enter="search5" data-button="Y" value="">
					</div>
				</div>
			</li>			
			<li class="wAuto">
				<div class="tit"></div>
				<div class="txt">
					<div class="mDate1">
					</div>
				</div>
			</li>				
			<li class="wAuto">
				<div class="tit"></div>
				<div class="txt">
					<div class="mFlex2">
						<span class="flex">
                        	
                        </span>
                              
					</div>
				</div>
			</li>
			<li class="wAuto">
				<div class="tit"></div>
				<div class="txt">
					<div class="mFlex2">
						<span class="flex">
                        </span>
					</div>
				</div>
			</li>
		</ul>
		<div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
            <a href="#" data-click="search10" class="mBtn1">검색</a>
        </div>
	</div>
</form>
 
<div  id="divGrid5" style="height:335px" data-grid-id="grdList5" 
	data-pagenation="Y" 
	data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
	data-type="grid" 
	data-grid-callback="onGridLoad" 
	data-tpl-url="<c:url value='/static/gridTemplate/cst/CR015.xml'/>">
</div>


<script>
/* 공통코드 그리드 load */
function grdList5_load(gridView, gridId) {
	search10();
}

function search10()
{
    var url = "<c:url value='${urlPrefix}/getCrmCustGradeChngHstList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    if(parent.parenItgCustNo != "")
    {
    	param.itgCustNo = parent.parenItgCustNo;
    	grdList5.loadUrl(url,param);
    } 
}

/* 그리드 셀 더블 클릭 */
function onGridCellDblClick(gridView, itemIndex, column, json, value){
	//showDetail5(json); 
}

/* 상세화면 팝업 로드(수정) */
function showDetail5(json){
//	var url = "<c:url value='${urlPrefix}/cot/cmmCustPhnCnslDtlHist${urlSuffix}'/>";
	var url = "<c:url value='${urlPrefix}/cot/cmmCustAsSubmitDtlHist'/>/" + json.cnslHistNo + "/" + json.aspCustKey + "/" + json.itgCustNo;
//	var url = "<c:url value='${urlPrefix}/sub/cmmCustCntplcBas/mod${urlSuffix}'/>?cntplcSeq="+ grdList1.getJsonRow(rowIndex).cntplcSeq;
    Utilities.openModal(url,1000,600);
}


//setToday(); 

</script>