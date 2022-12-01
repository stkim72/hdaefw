<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%>




<div class="mPopup1">
    
    <!-- header -->
    <div class="title">
        <h1>고객조회</h1>
        <a href="#" class="close" data-click="closeModal">팝업 닫기</a>
    </div>
    <!-- //header -->

	
</div>


<!-- layer -->
<div id="" class="mLayer132" style="margin:20px">


    <!-- sort -->
    
           <!-- board -->
               <form role="form" id="frmSearch" name="frmSearch" onsubmit="search()">
         	
				<input type="hidden" id="stat" name="stat" value="${addMode}"/>
				<input type="hidden" id="mshipCardBasNo" name="mshipCardBasNo" value="${mshipCardBasNo}"/>
				<input type="hidden" id="mshipGradeCd" name="mshipGradeCd" value="${mshipGradeCd}"/>
				<input type="hidden" id="itgCustNo" name="itgCustNo" value="${itgCustNo}"/>
				<input type="hidden" id="cardBasNo" name="cardBasNo" value=""/>
         		
         		
    <div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
        <ul>
            <li class="wAuto ml20">
                <div class="tit">이름</div>
                <div class="txt">
                    <input type="text" class="it w90 data-check" title="이름"  name="custNm" id="custNm" value="">
                </div>
            </li>
            <li class="wAuto ml35">
                <div class="tit">휴대전화</div>
                <div class="txt">
                    <input type="text" class="it w90 " title="휴대전화" name="mphonNo" id="mphonNo" value="">
                    <span class="button">
                        <button type="submit" class="mBtn1" data-click="search">검색</button>
                    </span>
                </div>
            </li>
        </ul>
        <div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
            <a href="#" class="mBtn1 lPrimary hidden" id="btnPubCard"  data-click="pubCard">발급하기</a>
        </div>
    </div>
    
    </form>
    
    
    	<div class="mList3 type3" style="position:fixed;z-index:1000;width:600px">
            
                <!-- col -->
                <div class="col hidden" id="exist" style="margin-left:30%;text-align:center">
                    <div class="ti">기존 멤버십 카드가 존재 합니다.</div>
                    <div class="tx2" id="cardNo">
						2345-3994-9393-008
						<br>유효기간 : 2022.12.31
					</div>
                    <a href="#" class="mBtn1 round"  data-click="closeModal" onclick="$('#exist').hide();$('#frmSearch')[0].reset();">확인</a>
                </div>
                <!-- //col -->
                
                
                <!-- col -->
                <div class="col hidden" id="new" style="margin-left:30%;text-align:center" >
                    <div class="ti"  id="nCardInfo" >신규 멤버십 카드를 발급 합니다.</div>
                     <div class="tx2"  id="nCardNo" style="display:none">
						<!-- 2345-3994-9393-008
						<br>유효기간 : 2022.12.31 -->
					</div> 
                     <a href="#" class="mBtn1 round"  data-click="closeModal" onclick="$('#exist').hide();$('#frmSearch')[0].reset();">확인</a>
                </div>
                <!-- //col -->
          
            
            
        </div>
						
						
						
    
     <div id="divCustInfo" style="height:400px"
		  data-post="Y"
		  data-grid-id="grdList"
		  data-pagenation="Y"
		  data-get-url="<c:url value='/crmMshipCardBas/getCardInfo'/>"
		  data-type="grid" 
		  data-tpl-url="<c:url value='/static/gridTemplate/memship/crmCardCustBas.xml'/>">
		</div>
		
		
		
			
</div>
<!-- //layer -->



<script>



/* 공통코드 그리드 load */
function grdList_load(gridView, gridId) {

}


/* 공통코드 Row클릭 시 */
function grdList_rowChanged(grdList, oldRow, newRow, rowData) {

	$("#frmSearch #mshipGradeCd").val( rowData.mshipGradeCd );
	$("#frmSearch #itgCustNo").val( rowData.itgCustNo );
	$("#frmSearch #cardBasNo").val( rowData.cardBasNo );
	
	if( typeof(rowData.cardBasNo) == "object" ){
		$("#btnPubCard").show();
	}else{
		$("#btnPubCard").hide();
	}
	
}


function onGridLoad(gridView, gridId) {
	
}

/* 그리드 컬럼 클릭 */
function onGridCellClick(gridView, rowIndex, columnName, colIndex, fieldIndex) {

}

/* 그리드 컬럼 더블 클릭 */
function onGridCellDblClick(gridView, rowIndex, columnName, colIndex, fieldIndex) {

}

function onGridRowChanged(gridView, oldRow, newRow) {

}


function search(){
	
	$("#exist").hide();
	$("#new").hide();
	
	var param = Utilities.formToMap("frmSearch");
	var url = "<c:url value='${urlPrefix}/getCustInfo${urlSuffix}'/>";
	//custNm mphonNo
	if( $("#frmSearch #custNm").val() == "" && $("#frmSearch #mphonNo").val() == "" ){
		$("#frmSearch #custNm").focus();
		alert("필수 항목을 기입해 주세요.");
		return false;
	}else{
		param.recordCountPerPage = 10;
		grdList.loadUrl(url, param);
	}
}

// 카드 발급 처리
function pubCard(){
	
	var sndData = Utilities.formToMap("frmSearch");
	var url = "<c:url value='${urlPrefix}/pubCard${urlSuffix}'/>";
	
	if( $("#frmSearch #cardCnt").val() > 0  ){
		alert("이미 카드가 존재하는 고객입니다. ");
		return false;
	}
	
	if( confirm("카드를 발급하시겠습니까?") ){
		Utilities.getAjax(url, sndData, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "카드발급을 실패하였습니다." )) {
				
				
				if( data.cnt > 0 ){
					
					$("#btnPubCard").hide();
					$("#nCardNo").html( cardDash( data.cardBasNo ) +"<br>유효기간 : "+ data.toUsePossDt );
					$("#nCardInfo").text("신규 멤버스 카드가 발급되었습니다.");
					$("#nCardNo").show();
					$('#frmSearch')[0].reset();
					
					$("#exist").hide();
					$("#new").show();
					
					
					alert("카드 발급이 완료 되었습니다.");
					
				}else{
					

					$("#exist").show();
					$("#new").hide();

					$("#btnPubCard").show();
					alert("카드발급을 실패하였습니다.");
					return false;
					
				}

			
			}
		});
	}
	
}

function pubFail(data){
	log(data);
	$("#btnPubCard").show();
	alert("카드발급을 실패하였습니다.");
	return false;
}
</script>