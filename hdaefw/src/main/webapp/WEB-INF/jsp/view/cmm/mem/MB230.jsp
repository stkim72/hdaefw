<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="mPopup1">
    <form id="frmMain">
    
    
    <input type="hidden" name="mshipCoupnBasNo" id="mshipCoupnBasNo" value="">
    <input type="hidden" name="mshipGradeCd" id="mshipGradeCd" value="${coupnIssue.mshipGradeCd}">
    
    
    
    
    <!-- header -->
    <div class="title">
        <h1>쿠폰 발급</h1>
        <a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
    </div>
    <!-- //header -->

    <!-- cont -->
    <div class="cont" id="testDiv">
        
        <!-- grid -->
        <div class="mGrid2">
                
                <!-- board -->
                <div class="mBoard2"> 
                	
                    <table>
                        <caption>쿠폰발급</caption>
                        <colgroup>
                            <col width="15%">
                            <col width="25%">
                            <col width="15%">
                            <col width="10%">
                            <col width="5%">
                            <col width="15%">
                            <col width="15%">
                        </colgroup>
                        <tbody>
                        
                        <tr>
                                <th class="left" scope="row">쿠폰마스터</th>
                                <td>
                                    <input type="text" class="it" id="coupnBasNm" name="coupnBasNm" value="" readonly onclick="searchCoupn()" placeholder="선택하세요"/>
                                </td>
                                <th class="left" scope="row">이벤트명</th>
                                <td colspan="2">
                                    <code:commCode id="pblsDivCd" name="pblsDivCd" codeCd="EV100" prefixLabel=" " prefixValue="" selectedValue="950" />
                                </td>
                               
                                 <th class="left" scope="row">발급일</th>
                                <td>
                                    <input type="text" class="it" id="pblsDt" name="pblsDt" value="${coupnIssue.pblsDt}" readonly/>
                                </td>
                            </tr>
                            
                            <tr>
                                <th class="left" scope="row">회원명</th>
                                <td>
                                    <input type="text" class="it" id="custNm" name="custNm" value="${coupnIssue.custNm}" readonly/>
                                </td>
                                 <th class="left" scope="row">휴대전화번호</th>
                                <td colspan=2>
                                    <input type="text" class="it" id="mphonNo" name="mphonNo" value="${coupnIssue.mphonNo}" readonly/>
                                </td>
                               
                                <th class="left" scope="row">발급자</th>
                                <td>
                                    <input type="text" class="it" id="issuer" name="issuer" readonly/>
                                </td>
                               
                            </tr>
                           
                            <tr>
                                <th class="left" scope="row">통합고객번호</th>
                                <td>
                                    <input type="text" class="it" id="custNo" name="custNo" value="${coupnIssue.itgCustNo}" readonly/>
                                </td>
                                
                                <th class="left" scope="row">회원등급</th>
                                <td colspan=2>
                                    <input type="text" class="it" id="mshipGradeNm" name="mshipGradeNm" value="${coupnIssue.mshipGradeNm}" readonly/>
                                </td>
                               <th class="left" scope="row">쿠폰 발행 매수</th>
                                <td>
                                    <input type="number" min="1" max="100" class="it" id="issuCnt" name="issuCnt"  oninput="checkIssuCnt(this)"/>
                                </td>
                            </tr>
                            <%-- <tr>
                                
                                 <th class="left" scope="row">매장코드</th>
                                <td>
                                    <input type="text" class="it" id="storNo" name="storNo" value="${coupnIssue.storNo}"/>
                                </td>
                                
                                 <th class="left" scope="row">전표번호</th>
                                <td colspan=4>
                                    <input type="text" class="it" id="chitNo" name="chitNo" value="${coupnIssue.chitNo}"/>
                                </td>
                                
                                
                            </tr> --%>
                          
                        </tbody>
                    </table>
                </div>
                <!-- //board -->

        </div>
        <!-- //grid -->
        
    </div>
    <!-- //cont -->
	</form>
</div>

<div class="right" style="margin-right: 30px">
	<a href="#;" class="mBtn1" id="btnCoupn">쿠폰발급</a>
	<a href="#" data-btn-type="closeModal" class="mBtn1">창닫기</a>
</div>




<script>

/* 화면 로드 */
window.onload = function(){
	
	var today = moment();
    var dt = today.format("YYYY-MM-DD");
	
    $("#issuer").val('${LOGIN_USER.userNm}');
    
    if($("#pblsDt").val() == ""){
    	$("#pblsDt").val(dt);
    	
    	//$("#storNo").val("141359");
    	//$("#storNo").attr("readonly", true);
        //$("#chitNo").attr("readonly", true);
    }else{
    	$("#btnCoupn").hide();
    	
        $("#occurPointScore").attr("readonly", true);
        //$("#storNo").attr("readonly", true);
        //$("#chitNo").attr("readonly", true);
        $("#saleAmt").attr("readonly", true);
    }
}

/* 쿠폰 발급 버튼 클릭 */
$("#btnCoupn").click(function(){
	
	
	if( $('#mshipCoupnBasNo').val() == '' ){
        alert("발급할 쿠폰 마스터를 선택해 주세요.");
        $("#coupnBasNm").focus();
        return false;
    }
	
	
	var bConfirm = confirm("쿠폰를 발급하시겠습니까?");
	if(!bConfirm){
		return;
	}
	
	var today = moment();
	var dt = today.format("YYYYMMDDhhmmss");
	
	$("#pblsDt").val(dt);
	
	var param = Utilities.formToMap("frmMain");
	console.log(param);
	//return;
	if(!validate(param))
		return;
	
	var url = "<c:url value='${urlPrefix}/sub/coupnPopup/saveCoupnIssue${urlSuffix}'/>";
	Utilities.getAjax(url,param,true,function(data,jqXHR){
		if(Utilities.processResult(data,jqXHR,"쿠폰 발급에 실패했습니다."))
		{
			alert("쿠폰 발급에 성공했습니다.");
			Utilities.closeModal();
		}
	});
});

/* 필수 값 체크 */
function validate(param){

	if(!param.pblsDivCd){
        alert("이벤트명은 필수입니다.");
        $("#pblsDivCd").focus();
        return false;
    }
    
	return true;
}


function searchCoupn() {

	var url = "<c:url value='${urlPrefix}/sub/popCoupn${urlSuffix}'/>";
 	Utilities.openModal(url, 900, 650);
	
}

function closeCoupnPop() {
	$('.mLayer1').hide();
}

function bindCoupn(data){
	
	if(data != null){
		$("#coupnBasNm").val( data.coupnBasNm );
		$("#mshipCoupnBasNo").val( data.mshipCoupnBasNo );
	}	
	
	
}

function checkIssuCnt (e) {
	if (e.value < 1 && e.value > 100) {
        alert("쿠폰발행 매수는 1 ~ 100 이내로 입력해 주세요.");
        e.value = e.value.substring(0,2);
    }
}

</script>