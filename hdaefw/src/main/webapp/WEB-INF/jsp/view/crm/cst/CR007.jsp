<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%>


 						
<form role="form" id="frmSearch">

							
<!-- 	<div class="gTitle1"> -->
<!-- 		<h3 class="mTitle1">관계목록</h3> -->
<!-- 		<div class="gRt"> -->
<!-- 			<a href="#" class="mBtn1 primary">관계등록</a> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!-- cont -->
<!-- <div class="cont"> -->

              
	<div class="mSort2 medium">
		<ul>
<!-- 			<li class="wAuto"> -->
<!-- 				<div class="tit">등록일</div> -->
<!-- 				<div class="txt"> -->
<!-- 					<div class="mDate1"> -->
<!-- 						<input type="text" class="it date" title="등록일 시작일" data-type="dateRangeStart" data-range-end="endDt" id="strtDt" name="strtDt" data-enter="search1" data-button="Y" value=""> -->
<!-- 						<span class="bar">~</span> -->
<!-- 						<input type="text" class="it date" title="등록일 종료일" id="endDt" name="endDt" data-enter="search1" data-button="Y" value=""> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</li> -->
			<li class="wAuto">
				<div class="tit">관계구분</div>
				<div class="txt">
					<div class="mDate1">
						<code:commCode name="famlyRelCd" id="famlyRelCd" codeCd="CU040" prefixLabel="전체" prefixValue=""/>
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
            <a href="#" data-click="search1" class="mBtn1">검색</a>
        </div>
	</div>
    <div class="gTitle1">
        <h3 class="mTitle1">가구정보목록</h3>
        <div class="gRt">
<!--             <a href="#" class="mBtn1 lWhite" data-click="cpyCoupon">복사</a> -->
            <a href="#" class="mBtn1 primary" data-click="newRel">신규등록</a>
        </div>
    </div>	

</form>


	<div  id="divGrid1" style="height:310px" data-grid-id="grdList1" 
		data-pagenation="N" 
		data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
		data-type="grid" 
		data-grid-callback="onGridLoad" 
		data-tpl-url="<c:url value='/static/gridTemplate/cst/CR007.xml'/>">
	</div>



<script>
/* 공통코드 그리드 load */
function grdList1_load(gridView, gridId) {
	search1();
}

function search1()
{
    var url = "<c:url value='${urlPrefix}/getCrmCustHshldBasList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    if(parent.parenItgCustNo != "")
    {
    	param.itgCustNo = parent.parenItgCustNo;
    	//param.itgCustNo = parent.parenItgCustNo;
    	grdList1.loadUrl(url,param);
    } 
}

/* 그리드 셀 더블 클릭 */
function onGridCellDblClick(gridView, itemIndex, column, json, value){
// 	var url = "<c:url value='${urlPrefix}/sub/crmCustHshldBas/mod${urlSuffix}'/>?itgCustNo="+ grdList1.getJsonRow(itemIndex).itgCustNo + "&repHshldNo="+ grdList1.getJsonRow(itemIndex).repHshldNo;
	
	var url = "<c:url value='${urlPrefix}/sub/crmCustHshldBas/mod'/>" + "/" + grdList1.getJsonRow(itemIndex).itgCustNo;

	Utilities.openModal(url,600, 300);
}

/* 신규등록(관계) */
function newRel(){
 	var pitgCustNo = parent.parenItgCustNo;
	
 	console.log(pitgCustNo);
 	
	var url = "<c:url value='${urlPrefix}/sub/crmCustHshldBas/add${urlSuffix}'/>?repHshldNo="+ pitgCustNo;
//	var url = "<c:url value='${urlPrefix}/sub/crmCustHshldBas/mod'/>/" + grdList1.getJsonRow(itemIndex).itgCustNo + "/" + grdList1.getJsonRow(itemIndex).repHshldNo;
 	// openModal :function(url,width,height,callFunc,callbackFunc,callbackWin)
 	Utilities.openModal(url, 600, 300);
 	//Utilities.windowOpen(url,  900, 730);
}


//setToday(); 

</script>