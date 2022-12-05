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
        <h1>회원조회</h1>
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
                        <th class="left" scope="row">정보</th>
                        <td class="left" >
                            
                       		 <input type="text" class="it w120 data-check" title="통합고객번호" placeholder="통합고객번호"  id="itgCustNo" name="itgCustNo"  value="" >
                       		 <input type="text" class="it w120 data-check" title="이름" placeholder="이름"  id="custNm" name="custNm"  value="" >
                       		 <input type="text" class="it w130 data-check" title="연락처" placeholder="연락처"  id="mphonNo" name="mphonNo"  value="" > 
                       		 <code:commCode  className="select w120 data-check" id="gndrCd" name="gndrCd" codeCd="S040" prefixLabel="성별선택" prefixValue=""/>
                       		 <select class="select w120 data-check" id="ageStt" name="ageStt">
                       		 	<option value="">연령대선택</option>
                       		 	<option value="10">10대</option>
                       		 	<option value="20">20대</option>
                       		 	<option value="30">30대</option>
                       		 	<option value="40">40대</option>
                       		 	<option value="50">50대</option>
                       		 	<option value="60">60대</option>
                       		 	<option value="70">70대</option>
                       		 	<option value="80">80대</option>
                       		 </select>
                       		 <code:commCode  className="select w120 data-check" id="mshipTypeCd" name="mshipTypeCd" codeCd="MB010" prefixLabel="회원구분" prefixValue="" change="chkGrade"/>
                       		 <code:commCode  className="select w120 " id="mshipGradeCd" name="mshipGradeCd" codeCd="MB020" prefixLabel="회원등급" prefixValue=""/>
                       		 <select class="select w130 mshipGrp" name="cprtCmpNo" id="cprtCmpNo">
                             	<option value="">제휴사 선택</option>
                             </select>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- //board -->
        
        <div class="gTitle1 line">
            <h3 class="mTitle1">구매이력조건</h3>
        </div>
        <!-- board -->
        <div class="mBoard2"> 
            <table>
                <caption>기본정보</caption>
                <colgroup>
                    <col width="11%">
                    <col width="25%">
                    <col width="11%">
                    <col width="25%">
                </colgroup>
                <tbody>
                    <tr>
                        <th class="left" scope="row">구매총액</th>
                        <td>
                            <input type="text" class="it  w100" title="구매총액"  name="payTotAmtSta" id="payTotAmtSta" value=""> ~  
                            <input type="text" class="it  w100" title="구매총액" name="payTotAmtEnd" id="payTotAmtEnd" value="">
                        </td>
                        <th class="left" scope="row">기간</th>
                        <td>
                            <div class="mDate1">
                                <input type="text" class="it date w100" title="캠페인 시작일"  data-type="dateRangeStart" data-range-end="dealDayEnd"   id="dealDaySta" name="dealDaySta" value="">
								<span class="bar">~</span>
								<input type="text" class="it date w100" title="캠페인 마지막일" data-button="Y"   id="dealDayEnd" name="dealDayEnd"  value="">
                            </div>
                        </td>
                        
                    </tr>
                    
                </tbody>
            </table>
        </div>
        <!-- //board -->
        
        <div class="gTitle1 line">
            <h3 class="mTitle1">기타조건</h3>
        </div>
        <!-- board -->
        <div class="mBoard2"> 
            <table>
                <caption>주소</caption>
                <colgroup>
                    <col width="11%">
                    <col width="25%">
                    <col width="9%">
                    <col width="*">
                </colgroup>
                <tbody>
                    <tr>
                        <th class="left" scope="row">구매추천횟수</th>
                        <td  class="left" >
                            <input type="text" class="it  w80" title="구매추천횟수"  name="buyRcmdCntSta" id="buyRcmdCntSta" value=""> ~ 
                            <input type="text" class="it  w80" title="구매추천횟수" name="buyRcmdCntEnd" id="buyRcmdCntEnd" value="">
                        </td>
                        <th class="left" scope="row">매장체험횟수</th>
                        <td  class="left" >
                            <input type="text" class="it  w80" title="매장체험횟수"  name="storExprnCntSta" id="storExprnCntSta" value=""> ~ 
                            <input type="text" class="it  w80" title="매장체험횟수" name="storExprnCntEnd" id="storExprnCntEnd" value="">
                        </td>
                        <th class="left" scope="row">세라체크횟수</th>
                        <td  class="left" >
                            <input type="text" class="it  w80" title="세라체크횟수"  name="mesrCntSta" id="mesrCntSta" value=""> ~ 
                            <input type="text" class="it  w80" title="세라체크횟수" name="mesrCntEnd" id="mesrCntEnd" value="">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- //board -->
        
       <div class="gTitle1 line">
            <h3 class="mTitle1">목록</h3>
            <div class="gRt">
                <a href="#" class="mBtn1 lWhite" data-click="selectAll">전체선택</a>
                <a href="#" class="mBtn1 lGray" data-click="closeModal">취소</a>
                <a href="#" class="mBtn1 lPrimary" data-click="sndData">선택</a>
            </div>
        </div>
          
        
        <div id="divGrid" style="height:365px"
			  data-post="Y"
			  data-grid-id="grdList"
			  data-pagenation="Y"
			  data-scroll-x="Y"
			  data-get-url="<c:url value='/cmmMshipCoupnBas/getMemSearchList'/>"
			  data-type="grid" 
			  data-tpl-url="<c:url value='/static/gridTemplate/memship/cmmMemSearch.xml'/>"
			  >
			</div>

    </div>
    <!-- //cont -->
    
    </form>
	
</div>

<!-- popup2 -->
<div id="jsPopup2" class="mPopup2" style="display: none;">
    <div class="modalBg"></div>
    <div class="cont">
        <div class="text noresult">
            <p class="txt ico2">발급정책에 의해 일부회원은 제외됩니다.</p>
        </div>
        <div class="mButton1">
            <a href="#jsPopup2" class="jsBtnClose1"><strong>확인</strong></a>
        </div>
    </div>
</div>
<!-- //popup2 -->

<script>

	/* 화면 로드 */
	window.onload = function(){
		
		$("#frmSearch #mshipGradeCd").attr("disabled", true);
		$("#frmSearch #cprtCmpNo").attr("disabled", true);
		
		var applyMshpGradeCtnts = "${cpinfo.applyMshpGradeCtnts}"
		Utilities.setChkboxData("applyMshpGradeCtnts", "MB020", "mCheckbox1", applyMshpGradeCtnts);
		
		// 제휴사 데이터 바인딩
		var url = "<c:url value='${urlPrefix}/getPartnerList${urlSuffix}'/>";
		Utilities.getAjax(url, null, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "제휴사 데이터을 읽어오질 못했습니다.")) {
			
				$.each( data , function(i){
					$("#frmSearch #cprtCmpNo").append("<option value='"+ this.cprtCmpNo +"' "+  (("${cpinfo.cprtCmpNo}" == this.cprtCmpNo) ? 'selected' : '' ) +">"+  this.cprtCmpNm +"</option>\n");
				});
				
			}
		});
	
	}

	function chkGrade(obj){
		
		//cardTypeCd  mshipGradeApplyCtnts cprtCmpNo
		if( $(obj).val() == "" ){
			$("#frmSearch #mshipGradeCd").attr("disabled", true);
			$("#frmSearch #cprtCmpNo").attr("disabled", true);
			
			$("#frmSearch #mshipGradeCd").val("");
			$("#frmSearch #cprtCmpNo").val("");		
		}
		// 임직원
		if( $(obj).val() == "001" ){
			$("#frmSearch #mshipGradeCd").attr("disabled", true);
			$("#frmSearch #cprtCmpNo").attr("disabled", true);	
			
			$("#frmSearch #mshipGradeCd").val("");
			$("#frmSearch #cprtCmpNo").val("");			
		}
		// 제후
		if( $(obj).val() == "002" ){

			$("#frmSearch #mshipGradeCd").attr("disabled", true);
			$("#frmSearch #cprtCmpNo").attr("disabled", false);	
			
			$("#frmSearch #mshipGradeCd").val("");
		}
		// 회원
		if( $(obj).val() == "003" ){

			$("#frmSearch #mshipGradeCd").attr("disabled", false);
			$("#frmSearch #cprtCmpNo").attr("disabled", true);	
			
			$("#frmSearch #cprtCmpNo").val("");	
		}
		
	}
	
	/* 공통코드 그리드 load */
	function grdList_load(gridView, gridId) {
		// search(); // 회원이 많은관계로 바로검색 제거됨
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
		
		var valid = false;
		$.each($('.data-check'),function (){
			if ($.trim($(this).val()) != '') {
				valid = true;
			}
		});
		
		if (valid) {
			$("form#frmSearch").find("#currentPageNo").val(1);
		 	var url = "<c:url value='${urlPrefix}/getMemSearchList${urlSuffix}'/>";
			var param = Utilities.formToMap("frmSearch");
			param.recordCountPerPage = 20;
			grdList.loadUrl(url, param);
		} else {
			alert('검색 조건은 최소 1개가 필수 입니다.');
		}
	}
	
	/* 검색조건 검색 */
	function selectAll() {
		
		var valid = false;
		$.each($('.data-check'),function (){
			if ($.trim($(this).val()) != '') {
				valid = true;
			}
		});
		
		if (valid) {
			$("form#frmSearch").find("#currentPageNo").val(1);
		 	var url = "<c:url value='${urlPrefix}/getMemSearchListForAll${urlSuffix}'/>";
			var param = Utilities.formToMap("frmSearch");
			// param.recordCountPerPage = 20;
			// grdList.loadUrl(url, param);
			Utilities.getAjax(url, param ,true,function(data,jqXHR){
		        if(Utilities.processResult(data,jqXHR,"전체선택 중 오류가 발생하였습니다."))
		        {
		        	var custNo = "";
		    		var j=0;
		    		$.each(data.data.contents, function(i){
		    			custNo += ( ( i > 0) ? ','+ this.itgCustNo :  this.itgCustNo );
		    			j++;
		    		});
		    		Utilities.getOpener().rtnCustInfo(custNo, j);
		    		closeModal();
		        }
		    });
		} 
	}

	function sndData(){
		var custNo = "";
		var arrJson = grdList.getCheckedJson();
		if (arrJson.length < 1) {
			alert('선택된 내용이 없습니다.');
			return;
		}
		var j=0;
		$.each(arrJson, function(i){
			custNo += ( ( i > 0) ? ','+ this.itgCustNo :  this.itgCustNo );
			j++;
		});
		Utilities.getOpener().rtnCustInfo(custNo, j);
		//closeModal();
		$('#jsPopup2').show();
	}


	function closeModal(){
		Utilities.closeModal();
	}

	$(document).ready(function() {
		 /* button */
		$(".jsBtnShow1").on("click", function(){
			$( $(this).attr("href") ).show();
			return false;
		});
		$(".jsBtnClose1").on("click", function(){
			closeModal();
			$( $(this).attr("href") ).hide();
			return false;
		});
		 /* //button */
		
	});

</script>