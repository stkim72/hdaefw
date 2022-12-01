<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="mPopup1">
    <form id="frmMain">
    
    
    <input type="hidden" name="mshipCardBasNo" id="mshipCardBasNo" value="">
    <input type="hidden" name="mshipGradeCd" id="mshipGradeCd" value="${cardIssue.mshipGradeCd}">
    
    
    
    
    <!-- header -->
    <div class="title">
        <h1>카드 발급</h1>
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
                        <caption>카드발급</caption>
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
                                <th class="left" scope="row">카드마스터</th>
                                <td>
                                    <input type="text" class="it" id="cardBasNm" name="cardBasNm" value="" readonly onclick="searchCard()" placeholder="선택하세요"/>
                                </td>
                                <th class="left" scope="row">이벤트명</th>
                                <td colspan="2">
                                    <code:commCode id="pblsDivCd" name="pblsDivCd" codeCd="EV100" prefixLabel=" " prefixValue="" selectedValue="950" />
                                </td>
                               
                                 <th class="left" scope="row">발급일</th>
                                <td>
                                    <input type="text" class="it" id="pblsDt" name="pblsDt" value="${cardIssue.pblsDt}" readonly/>
                                </td>
                            </tr>
                            
                            
                            <tr>
                                <th class="left" scope="row">회원명</th>
                                <td>
                                    <input type="text" class="it" id="custNm" name="custNm" value="${cardIssue.custNm}" readonly/>
                                </td>
                                 <th class="left" scope="row">휴대전화번호</th>
                                <td colspan=2>
                                    <input type="text" class="it" id="mphonNo" name="mphonNo" value="${cardIssue.mphonNo}" readonly/>
                                </td>
                               
                                <th class="left" scope="row">발급자</th>
                                <td>
                                    <input type="text" class="it" id="issuer" name="issuer" readonly/>
                                </td>
                               
                            </tr>
                           
                            <tr>
                                <th class="left" scope="row">통합고객번호</th>
                                <td>
                                    <input type="text" class="it" id="itgCustNo" name="itgCustNo" value="${cardIssue.itgCustNo}" readonly/>
                                </td>
                                
                                <th class="left" scope="row">회원등급</th>
                                <td colspan=4>
                                    <input type="text" class="it" id="mshipGradeNm" name="mshipGradeNm" value="${cardIssue.mshipGradeNm}" readonly/>
                                </td>
                               
                            </tr>
                            
                            
                            <%-- <tr>
                                
                                 <th class="left" scope="row">매장코드</th>
                                <td>
                                    <input type="text" class="it" id="storNo" name="storNo" value="${cardIssue.storNo}"/>
                                </td>
                                
                                 <th class="left" scope="row">전표번호</th>
                                <td colspan=4>
                                    <input type="text" class="it" id="chitNo" name="chitNo" value="${cardIssue.chitNo}"/>
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
	<a href="#;" class="mBtn1" id="btnCard">카드발급</a>
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
    	
    	$("#storNo").val("1001");
    	//$("#chitNo").val("1001");
    	$("#storNo").attr("readonly", true);
        $("#chitNo").attr("readonly", true);
    }else{
    	$("#btnCard").hide();
    	
        $("#occurPointScore").attr("readonly", true);
        $("#storNo").attr("readonly", true);
        $("#chitNo").attr("readonly", true);
        $("#saleAmt").attr("readonly", true);
    }
}

/* 카드 발급 버튼 클릭 */
$("#btnCard").click(function(){
	
	
	if( $('#mshipCardBasNo').val() == '' ){
        alert("발급할 카드 마스터를 선택해 주세요.");
        $("#cardBasNm").focus();
        return false;
    }
	
	
	var bConfirm = confirm("카드를 발급하시겠습니까?");
	if(!bConfirm){
		return;
	}
	
	var today = moment();
	var dt = today.format("YYYYMMDDhhmmss");
	
	$("#pblsDt").val(dt);
	
	var param = Utilities.formToMap("frmMain");
	
	if(!validate(param))
		return;
	
	var url = "<c:url value='${urlPrefix}/sub/cardPopup/saveCardIssue${urlSuffix}'/>";
	Utilities.getAjax(url,param,true,function(data,jqXHR){
		if(Utilities.processResult(data,jqXHR,"카드 발급에 실패했습니다."))
		{
			alert("카드 발급에 성공했습니다.");
			var callbackName = "updatePop";
            var win = Utilities.getOpener();
            try{
                if(win[callbackName])
                    win[callbackName](data.cardBasNo);    
            }catch(e){}
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


function searchCard() {

	//var url = "<c:url value='${urlPrefix}/sub/popCard${urlSuffix}'/>";
	//Utilities.openModal(url, "1200", "700");
	
	var url = "<c:url value='${urlPrefix}/sub/popCard${urlSuffix}'/>";
 	Utilities.openModal(url, 900, 550);
	
}

function closeCardPop() {
	$('.mLayer1').hide();
}

function bindCard(data){
	
	
	if(data != null){
		$("#cardBasNm").val( data.cardBasNm );
		$("#mshipCardBasNo").val( data.mshipCardBasNo );
	}	
	
	
}

</script>