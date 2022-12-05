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
				<div class="tit">발송기간</div>
				<div class="txt">
					<div class="mDate1">
						<input type="text" class="it date" title="시작일" data-type="dateRangeStart" data-range-end="endDt" id="strtDt" name="strtDt" data-enter="search" data-button="Y" value="">
						<span class="bar">~</span>
						<input type="text" class="it date" title="마지막일" id="endDt" name="endDt" data-enter="search" data-button="Y" value="">
					</div>
				</div>
			</li>
			<li class="wAuto"> 
				<div class="tit">발송방법</div>
				<div class="txt">
					<div class="mFlex2">
						<span class="flex">
                        	<code:commCode name="dspCtntTypeCd" id="dspCtntTypeCd" codeCd="SD010" prefixLabel="전체" prefixValue=""/>
                        </span>
                              
					</div>
				</div>
			</li>
			<li class="wAuto">
				<div class="tit">설문구분</div>
				<div class="txt">
					<div class="mFlex2">
						<span class="flex">
                        	<code:commCode name="qstnrDivCd" id="qstnrDivCd" codeCd="CU350" prefixLabel="전체" prefixValue=""/>
                        </span>
					</div>
				</div>
			</li>
		</ul>
		<div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
            <a href="#" data-click="search" class="mBtn1">검색</a>
            <a href="#" class="mBtn1 primary">전체 응답 보기</a>
        </div>
	</div>
</form>

<div  id="divGrid" style="height:335px" data-grid-id="grdList" 
	data-pagenation="Y" 
	data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
	data-type="grid" 
	data-grid-callback="onGridLoad" 
	data-tpl-url="<c:url value='/static/gridTemplate/cst/CR046.xml'/>">
</div>




<script>

function search()
{
    var url = "<c:url value='${urlPrefix}/getSurveyList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    //if(parent.document.all["itgCustNo"].value != "")
    if(parent.parenItgCustNo)	
    {
    	//param.itgCustNo = parent.document.all["itgCustNo"].value;
    	param.itgCustNo = parent.parenItgCustNo;
    	grdList.loadUrl(url,param);
    }
}

function grdList_load(gridView,gridId){
     search();
}

/*
function grdList_btnDetail_buttonClicked(gridView,row,col,json){
    showDetail(json);
} */
/* 그리드 컬럼 더블 클릭 */
/* function onGridCellDblClick(gridView,itemIndex, column, json, value){
	showDetail(json);
}

function showDetail(json){
	var url = "<c:url value='${urlPrefix}/detail${urlSuffix}'/>/"+ json.apiHstCd;
    Utilities.openModal(url,1500,550);
}*/
//setToday(); 
// set1month();
</script>