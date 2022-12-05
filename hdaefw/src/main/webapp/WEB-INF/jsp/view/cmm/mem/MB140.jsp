<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="mPopup1">
    <form id="frmMain">
    
        
    <input type="hidden" name="mshipGradeCd" id="mshipGradeCd" value="${advncmtIssue.mshipGradeCd}">
    
    
    
    <!-- header -->
    <div class="title">
        <h1>승급점수 발급</h1>
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
                        <caption>승급점수지급</caption>
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
                                <th class="left" scope="row">회원명</th>
                                <td>
                                    <input type="text" class="it" id="custNm" name="custNm" value="${advncmtIssue.custNm}" readonly/>
                                </td>
                                <th class="left" scope="row">보유승급점수</th>
                                <td>
                                    <input type="text" class="it comma" data-type="number2" id="remainAdvncmtScore" name="remainAdvncmtScore1" value="${advncmtIssue.mshipAdvnCmtScore}" readonly/>
                                </td>
                                <td>
                                    점
                                </td>
                                <th class="left" scope="row">발급일</th>
                                <td>
                                    <input type="text" class="it" id="pblsDt" name="pblsDt" value="${advncmtIssue.pblsDt}" readonly/>
                                </td>
                            </tr>
                            
                            <tr>
                                <th class="left" scope="row">휴대전화번호</th>
                                <td>
                                    <input type="text" class="it" id="mphonNo" name="mphonNo" value="${advncmtIssue.mphonNo}" readonly/>
                                </td>
                                <th class="left" scope="row">이벤트명</th>
                                <td colspan="2">
                                    <code:commCode id="pblsDivCd" name="pblsDivCd" codeCd="EV100" prefixLabel=" " prefixValue="" selectedValue="950" useYn4="Y"/>
                                </td>
                                <th class="left" scope="row">발급자</th>
                                <td>
                                    <input type="text" class="it" id="issuer" name="issuer" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th class="left" scope="row">통합고객번호</th>
                                <td>
                                    <input type="text" class="it" id="itgCustNo" name="itgCustNo" value="${advncmtIssue.itgCustNo}" readonly/>
                                </td>
                                <th class="left" scope="row">발급 승급점수</th>
                                <td>
                                    <input type="text" class="it" id="occurAdvncmtScore" name="occurAdvncmtScore" value="${advncmtIssue.occurAdvncmtScore}"/>
                                </td>
                                <td>
                                    점
                                </td>
                                <th class="left" scope="row"></th>
                                <td>
                                   
                                </td>
                            </tr>
                            <tr>
                                <th class="left" scope="row">회원등급</th>
                                <td>
                                    <input type="text" class="it" id="mshipGradeNm" name="mshipGradeNm" value="${advncmtIssue.mshipGradeNm}" readonly/>
                                </td>
                                  <th class="left" scope="row">매장코드</th>
                                <td colspan=2>
                                    <input type="text" class="it" id="storNo" name="storNo" value="${advncmtIssue.storNo}"/>
                                </td>
                                 <th class="left" scope="row">전표번호</th>
                                <td>
                                    <input type="text" class="it" id="chitNo" name="chitNo" value="${advncmtIssue.chitNo}"/>
                                </td>
                            </tr>
                          
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
	<a href="#;" class="mBtn1" id="btnAdvncmt">승급점수발급</a>
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
    	
    	$("#storNo").val("141359");
    	//$("#chitNo").val("1001");
    	$("#storNo").attr("readonly", true);
       // $("#chitNo").attr("readonly", true);
    }else{
    	$("#btnAdvncmt").hide();
    	
        $("#occurAdvncmtScore").attr("readonly", true);
        $("#storNo").attr("readonly", true);
      //  $("#chitNo").attr("readonly", true);
        $("#saleAmt").attr("readonly", true);
    }
    
}

/* 승급점수를 발급 버튼 클릭 */
$("#btnAdvncmt").click(function(){
	
	if( $("#occurAdvncmtScore").val() == '' ){
		
		alert('발급 승급점수를 입력해 주세요.');
		$("#occurAdvncmtScore").focus();
		return false;
		
	}
	
	
	
	// 수기지급
	if( $("#pblsDivCd").val() == "950" && Number($("#occurAdvncmtScore").val()) < 0  ){
		
		alert("수기지급은 (-) 처리가 불가 합니다.");
		return false;
		
	}

	// 수기차감
	if( $("#pblsDivCd").val() == "940" && Number($("#occurAdvncmtScore").val()) > 0  ){
		
		alert("수기차감은 (+) 처리가 불가 합니다.");
		return false;
		
	}
	
	
	
	var bConfirm = confirm("승급점수를 발급하시겠습니까?");
	if(!bConfirm){
		return;
	}
	
	var today = moment();
	var dt = today.format("YYYYMMDDhhmmss");
	
	$("#pblsDt").val(dt);
	
	fnMinusComma();
	
	var param = Utilities.formToMap("frmMain");
	
	if(!validate(param))
		return;
	
	var url = "<c:url value='${urlSuffix}saveAdvncmtScore${urlSuffix}'/>";
	Utilities.getAjax(url,param,true,function(data,jqXHR){
		if(Utilities.processResult(data,jqXHR,"승급점수 지급에 실패했습니다."))
		{
			
			if( data.cnt > 0 ){
				alert("승급점수 지급에 성공했습니다.");
			}else{
				alert("승급점수 지급에 실패했습니다.");
			}

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

/* 포인트필드 comma 추가 */
function fnAddComma(){
    $("#remainPointScore").val(addComma($("#remainPointScore").val()));
    $("#occurPointScore").val(addComma($("#occurPointScore").val()));
}

/* 포인트필드 comma 삭제 */
function fnMinusComma(){
	$("#remainAdvncmtScore").val(minusComma($("#remainAdvncmtScore").val()));
	$("#occurAdvncmtScore").val(minusComma($("#occurAdvncmtScore").val()));
}

</script>