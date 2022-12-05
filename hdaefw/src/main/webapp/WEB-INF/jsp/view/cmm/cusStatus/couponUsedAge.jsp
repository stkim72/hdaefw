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
		    <h3 class="mTitle1">연령별 사용쿠폰 TOP10</h3>
		</div>
	    <div class="mSort2 type2">
		       <form role="form" id="frmSearch">
					<ul class="w100per">
                        <li class="wAuto">
			                <%-- <div class="tit">성별</div>
			                <div class="txt w120">
							   <code:commCode  className="select" id="coupnTypeCd" name="coupnTypeCd" codeCd="S040" prefixLabel="선택" prefixValue="" change="chkCoupnType"/>
							</div> --%>
							<div class="tit">쿠폰 발행일</div>
			                <div class="txt">
			                    <div class="mDate1">
		                          	<input type="text" class="it w80 data-check" title="기간 시작일"  data-type="dateRangeStart" data-range-end="toPblsStdDay"  data-button="Y"  name="fromPblsStdDay" id="fromPblsStdDay" value="">
		                            <span class="bar">~</span>
									<input type="text" class="it  w80 data-check" title="기간 마지막일" name="toPblsStdDay" id="toPblsStdDay" data-button="Y"  value="">
		                        </div>
			                </div>
			                <div class="tit">쿠폰 분류</div>
			                <div class="txt w120">
							   <code:commCode  className="select" id="coupnTypeCd" name="coupnTypeCd" codeCd="MB080" prefixLabel="선택" prefixValue="" />
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
			<h3 class="mTitle1">사용쿠폰 성별</h3>
			<div class="gRt">
				<%-- <code:btnGroup name="gradeStat" hideDelete="true" hideInsert="true" hideSave="true" dispName="연령별 쿠폰사용 통계" gridId="grdList"/> --%>
				<!-- <a href="#" class="mBtn1" data-click="search">조회</a> -->
			</div>
		</div>
		
		<div id="divGrid"  style="height:550px"
	        data-grid-id="grdListGradeTot" 
			data-pagenation="N" 
			data-get-url="<c:url value='/example/getList'/>"  
			data-type="grid" 
			data-block-ui="Y"
			data-grid-callback="onGridLoad" 
			data-tpl-url="<c:url value='/static/gridTemplate/cusstatus/couponUsedGradeTot.xml'/>">
		</div>
		
		<div class="gTitle1">
			<h3 class="mTitle1">사용쿠폰 연령</h3>
			<div class="gRt">
				<%-- <code:btnGroup name="gradeStat" hideDelete="true" hideInsert="true" hideSave="true" dispName="연령별 쿠폰사용 통계" gridId="grdList"/> --%>
				<!-- <a href="#" class="mBtn1" data-click="search">조회</a> -->
			</div>
		</div>
		
		<div id="divGrid"  style="height:550px"
	        data-grid-id="grdListAgeTot" 
			data-pagenation="N" 
			data-get-url="<c:url value='/example/getList'/>"  
			data-type="grid" 
			data-block-ui="Y"
			data-grid-callback="onGridLoad" 
			data-tpl-url="<c:url value='/static/gridTemplate/cusstatus/couponUsedAgeTot.xml'/>">
		</div>
		
		<div class="gTitle1">
			<h3 class="mTitle1">연령별 사용쿠폰 TOP10</h3>
			<div class="gRt">
				<code:btnGroup name="gradeStat" hideDelete="true" hideInsert="true" hideSave="true" dispName="연령별 쿠폰사용 통계" gridId="grdList"/>
				<!-- <a href="#" class="mBtn1" data-click="search">조회</a> -->
			</div>
		</div>
		
		<!-- <c:url value='/example/getList'/> -->
		<!-- <c:url value='${urlPrefix}/getGradeStat1List${urlSuffix}'/> -->
		<!-- height:${rightBoxHeight4} -->
		<div id="divGrid"  style="height:500px"
	        data-grid-id="grdList" 
			data-pagenation="N" 
			data-get-url="<c:url value='/example/getList'/>"  
			data-type="grid" 
			data-block-ui="Y"
			data-scroll-x="Y"
			data-grid-callback="onGridLoad" 
			data-tpl-url="<c:url value='/static/gridTemplate/cusstatus/couponUsedAge.xml'/>">
		</div>
		
        
	</div>
</div>
<script>

window.onload = function(){
	dateSetting();
	// search();
}

function search()
{
    var url = "<c:url value='${urlPrefix}/getCoupnUsedAgeList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    grdList.loadUrl(url,param);
    grdListAgeTot.loadUrl("<c:url value='${urlPrefix}/getCoupnUsedAgeTot${urlSuffix}'/>",param);
    grdListGradeTot.loadUrl("<c:url value='${urlPrefix}/getCoupnUsedGradeTot${urlSuffix}'/>",param);
}

// setToday(); 

function chkCoupnType(obj){
	$('#coupnMaster').find('option').not(':first').remove();
	if ($(obj).val() == '') return;
    var param = {coupnTypeCd : $(obj).val()}
	var url = "<c:url value='${urlPrefix}/getCoupnMasterForSelect${urlSuffix}'/>";
	Utilities.getAjax(url, param, true, function(data, jqXHR) {
		if (Utilities.processResult(data, jqXHR, "쿠폰 마스터를 가져오지 못했습니다.")) {
			// console.log(data.data.contents); // "coupnMaster"
			// $('#coupnMaster').neq(0).remove();
			
			$.each(data.data.contents,function(item,idx){
				$('#coupnMaster').append('<option value="'+this.mshipCoupnBasNo+'">'+this.coupnBasNm+'</option>');
			});
		}
	});
    
}

function dateSetting(){
	var strStartDay= moment().subtract(1, 'month').format('YYYYMMDD');
    var strEndDay = moment().format("YYYYMMDD");
    
    $("#fromPblsStdDay").val(strStartDay);
    $("#toPblsStdDay").val(strEndDay);
    
    $("#fromBuysDay").val(strStartDay);
    $("#toBuysDay").val(strEndDay);
}

/* 그리드 셀(쿠폰 사용후 구매) 더블 클릭 */
function onGridCellDblClick(gridView, itemIndex, column, json, value){
	if(column == "buyCnt"){
		var mshipCoupnBasNo = grdList.getValue(itemIndex, "mshipCoupnBasNo");
		console.log(mshipCoupnBasNo);
		var url = "<c:url value='${urlPrefix}/coupnUsedBuysPopup'/>/" + mshipCoupnBasNo+"/"+$('#fromPblsStdDay').val()+"/"+$('#toPblsStdDay').val()+"/"+$('#toBuysDay').val();
	    Utilities.openModal(url,1500,678);
		/* var mshipCoupnBasNo = grdList.getValue(itemIndex, "mshipCoupnBasNo");
		var url = "<c:url value='${urlPrefix}/indirectPopup'/>/" + mshipPromBasNo;
	    Utilities.openModal(url,1000,600); */
	}
}
</script>