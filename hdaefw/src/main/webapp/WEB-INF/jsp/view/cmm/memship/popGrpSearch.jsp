<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 




<div class="mPopup1">
    
    <!-- header -->
    <div class="title">
        <h1>그룹조회</h1>
        <a href="#" data-click="closeModal" class="close">팝업 닫기</a>
    </div>
    <!-- //header -->

   <form role="form" id="frmSearch" name="frmSearch">
         	
				<input type="hidden" id="stat" name="stat" value="${addMode}"/>
				<input type="hidden" id="mshipCoupnBasNo" name="mshipCoupnBasNo" value="${mshipCoupnBasNo}"/>
         		
      
    <!-- cont -->
    <div class="cont">

 
        <div class="gTitle1 line">
            <h3 class="mTitle1">기본조건</h3>
            <div class="gRt">
                <a href="#" class="mBtn1 lGray" data-click="search">검색</a>
            </div>
        </div>
        
     
      
      
        <!-- board -->
        <div class="mBoard2"> 
            <table>
                <caption>계정정보</caption>
                <colgroup>
                    <col width="9%">
                    <col width="*">
                </colgroup>
                <tbody>
                    <tr>
                        <!-- <th class="left" scope="row">지역</th> -->
                        <td class="left" >
                           <!--  <select class="select w80" title="권한">
                                <option>선택</option>
                            </select> -->
                            <%--  <code:commCode  className="select w120" id="gndrCd" name="gndrCd" codeCd="GR020" prefixLabel="그룹유형" prefixValue=""/> --%>  <!-- 그룹유형 제거 필요없음 -->
                       		 

								<code:commCode name="searchUseDateType" codeCd="S090" className="select w100" prefixLabel="전체" />
                                <input type="text" class="it date w80" title="사용 시작일" placeholder="사용 시작일"  data-type="dateRangeStart" data-range-end="searchUseEndDay"   id="searchUseStaDay" name="searchUseStaDay" value="">
								<span class="bar">~</span>
								<input type="text" class="it date w80" title="사용 마지막일"  placeholder="사용 마지막일"  data-button="Y"   id="searchUseEndDay" name="searchUseEndDay"  value="">
                            
                            
                            
                       		<code:commCode id="ottpYn" name="ottpYn"  codeCd="S050" prefixLabel="공개여부" className="select w80" />
                       		<code:commCode id="useYn"  name="useYn" codeCd="S050" className="select w106"  prefixLabel="사용여부" /> 
                       		<input type="text" class="it w140" title="고객그룹명" id="custGrpNm" name="custGrpNm" value="" placeholder="고객그룹명">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- //board -->
        
        
         <div class="gTitle1 line">
            <h3 class="mTitle1">목록</h3>
            <div class="gRt">
                <a href="#" class="mBtn1 lGray" data-click="closeModal">취소</a>
                <a href="#" class="mBtn1 lPrimary" data-click="sndData">선택</a>
            </div>
        </div>
        
        
        <div id="divGrid" style="height:500px"
			  data-post="Y"
			  data-grid-id="grdList"
			  data-pagenation="Y"
			  data-get-url="<c:url value='/cmmMshipCoupnBas/getGrpSearchList'/>"
			  data-type="grid" 
			  data-tpl-url="<c:url value='/static/gridTemplate/cst/cmmCustGrpBas.xml'/>"
			  >
			</div>

    </div>
    <!-- //cont -->
    
    </form>
	
</div>


<script>


	
	/* 공통코드 그리드 load */
	function grdList_load(gridView, gridId) {
		search();
	}
	
	/* 하부코드 그리드 load */
	function grdDetail_load(gridView, gridId) {
	}
	
	/* 공통코드 Row클릭 시 */
	function grdList_rowChanged(grdList, oldRow, newRow, rowData) {
		
	}
	
	
	function onGridLoad(gridView, gridId) {
	}
	
	
	
	/* 그리드 컬럼 클릭 */
	function onGridCellClick(gridView, rowIndex, columnName, colIndex, fieldIndex) {
	
	}
	
	function grdList_cellClick(gridView, itemIndex, column, index, field){
	
		//var url = "<c:url value='${urlPrefix}/add${urlSuffix}'/>?mshipCoupnBasNo="+ gridView.getCurrentJson().mshipCoupnBasNo ;
		//Utilities.openModal(url, "100%", 1800);
		//location.href = url;
	
	}
	
	
	
	/* 그리드 컬럼 더블 클릭 */
	function onGridCellDblClick(gridView, rowIndex, columnName, colIndex,
			fieldIndex) {
	
	}
	
	function onGridRowChanged(gridView, oldRow, newRow) {
	
	}
	
	/* 검색조건 검색 */
	function search() {
		$("form#frmSearch").find("#currentPageNo").val(1);
	 	var url = "<c:url value='${urlPrefix}/getGrpSearchList${urlSuffix}'/>";
		var param = Utilities.formToMap("frmSearch");
		param.recordCountPerPage = 20;
		grdList.loadUrl(url, param);
	}

	function sndData(){
		var grpNm = "";
		var grpId = "";
		var grpCnt = 0;
		var arrJson = grdList.getCheckedJson();
		$.each(arrJson, function(i){
			grpNm += ( ( i > 0) ? ','+ this.custGrpNm :  this.custGrpNm );
			grpId += ( ( i > 0) ? ','+ this.custGrpNo :  this.custGrpNo );
			grpCnt += this.custCnt;
		});
		
		
		Utilities.getOpener().rtnGrpInfo(grpNm, grpId, grpCnt);
		closeModal();
	}


	function closeModal(){
		Utilities.closeModal();
	}


</script>