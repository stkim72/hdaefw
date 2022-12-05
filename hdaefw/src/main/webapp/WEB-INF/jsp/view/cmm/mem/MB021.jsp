<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="mPopup1">
    <form id="frmMain">
    <!-- header -->
    <div class="title">
        <h1 id="titleNm">포인트 발행 상세</h1>
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
                        <caption>포인트발행</caption>
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
                                    <input type="text" class="it" id="custNm" name="custNm" value="${PointIssue.custNm}" readonly/>
                                </td>
                                <th class="left" scope="row">보유포인트</th>
                                <td>
                                    <input type="text" class="it comma" data-type="number2" id="remainPointScore" name="remainPointScore" value="${PointIssue.remainPointScore}" readonly/>
                                </td>
                                <td>
                                    Point
                                </td>
                                <th class="left" scope="row">발급일</th>
                                <td>
                                    <input type="text" class="it" id="pblsDt" name="pblsDt" value="${PointIssue.pblsDt}" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th class="left" scope="row">휴대전화번호</th>
                                <td>
                                    <input type="text" class="it" id="mphonNo" name="mphonNo" value="${PointIssue.mphonNo}" readonly/>
                                </td>
                                <th class="left" scope="row">이벤트명</th>
                                <td colspan="2">
                                    <code:commCode id="pblsDivCd" name="pblsDivCd" codeCd="EV100" prefixLabel=" " prefixValue="" selectedValue="${PointIssue.pblsDivCd}"  useYn4="Y"/>
                                </td>
                                <th class="left" scope="row">발급자</th>
                                <td>
                                    <input type="text" class="it" id="issuer" name="issuer" value="${PointIssue.regrId}" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th class="left" scope="row">통합고객번호</th>
                                <td>
                                    <input type="text" class="it" id="itgCustNo" name="itgCustNo" value="${PointIssue.itgCustNo}" readonly/>
                                </td>
                                <th class="left" scope="row">발급포인트</th>
                                <td>
                                    <input type="text" class="it " data-type="number2" id="occurPointScore" name="occurPointScore" value="${PointIssue.occurPointScore}"/>
                                </td>
                                <td>
                                    Point
                                </td>
                                <th class="left" scope="row">유효기간</th>
                                <td>
                                   <select class="it" name="applyPointValidPerd" id="applyPointValidPerd">
                                   		
                                   		<option value="">선택</option>
                                   		<option value="1">1년</option>
                                   		<option value="2">2년</option>
                                   		<option value="3">3년</option>
                                   		<option value="4">4년</option>
                                   		<option value="5">5년</option>
                                   
                                   </select>
                                </td>
                            </tr>
                            <tr>
                                <th class="left" scope="row">회원등급</th>
                                <td>
                                    <input type="text" class="it" id="mshipGradeNm" name="mshipGradeNm" value="${PointIssue.mshipGradeNm}" readonly/>
                                </td>
                                 <th class="left" scope="row">매장코드</th>
                                <td colspan="2">
                                    <input type="text" class="it" id="storNo" name="storNo" value="${PointIssue.storNo}"/>
                                </td>
                                 <th class="left" scope="row">전표번호</th>
                                <td>
                                    <input type="text" class="it" id="chitNo" name="chitNo" value="${PointIssue.chitNo}"/>
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
	<a href="#;" class="mBtn1" id="btnIssuePoint">포인트발급</a>
	<a href="#" data-btn-type="closeModal" class="mBtn1">창닫기</a>
</div>

<script>

/* 화면 로드 */
window.onload = function(){
	
	var today = moment();
    var dt = today.format("YYYY-MM-DD");
    mphonNoChange();
    
    if($("#pblsDt").val() == ""){
    	$("#issuer").val('${LOGIN_USER.userNm}');
    	$("#pblsDt").val(dt);
    	
    	$("#storNo").val("141359");
    	//$("#chitNo").val("1001");
    	$("#storNo").attr("readonly", true);
        //$("#chitNo").attr("readonly", true);
        $("#titleNm").text("포인트 발급");
        $("#pblsDivCd").val("950");
    }else{
    	$("#btnIssuePoint").hide();
    	
        $("#occurPointScore").attr("readonly", true);
        $("#storNo").attr("readonly", true);
        $("#chitNo").attr("readonly", true);
        $("#saleAmt").attr("readonly", true);
        $("#titleNm").text("포인트 발행 상세");
    }
}

/* 포인트 발급 버튼 클릭 */
$("#btnIssuePoint").click(function(){
	
	if( $("#occurPointScore").val() == "" ){
		
		alert("발급 포인트를 입력해 주세요.");
		$("#occurPointScore").focus();
		return false;
	
	}
	
	
	
	if( $("#pblsDivCd").val() == "950" &&  $("#applyPointValidPerd").val() == "" ){
		
		alert("포인트 유효기간을 선택해 주세요.");
		$("#applyPointValidPerd").focus();
		return false;
	
	}else{
		
		$("#applyPointValidPerd").val("");
	}
	
	// 수기지급
	if( $("#pblsDivCd").val() == "950" && Number($("#occurPointScore").val()) < 0  ){
		
		alert("수기지급은 (-) 처리가 불가 합니다.");
		return false;
		
	}

	// 수기차감
	if( $("#pblsDivCd").val() == "940" && Number($("#occurPointScore").val()) > 0  ){
		
		alert("수기차감은 (+) 처리가 불가 합니다.");
		return false;
		
	}
	
	
	
	var bConfirm = confirm("포인트를 발급하시겠습니까?");
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
	
	var url = "<c:url value='savePointScore${urlSuffix}'/>";
	Utilities.getAjax(url,param,true,function(data,jqXHR){
		if(Utilities.processResult(data,jqXHR,"포인트 발급에 실패했습니다."))
		{
			alert("포인트 발급에 성공했습니다.");
			Utilities.closeModal();
		}
	});
	
	//fnAddComma();
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

/* 휴대전화 '-' 패턴 */
function mphonNoChange()
{
	if($("#mphonNo").val() != ""){	
		var strmphonNo = $("#mphonNo").val().replace(/-/g,"");
		var strFrontNo = strmphonNo.substr(0,3);
		var strMiddleNo = strmphonNo.substr(3,4);
		var strBackNo = strmphonNo.substr(7,4);
		strmphonNo = strFrontNo + "-" + strMiddleNo + "-" + strBackNo
		$("#mphonNo").val(strmphonNo);
	}
}

/* 포인트필드 comma 추가 */
function fnAddComma(){
	$("#remainPointScore").val(addComma($("#remainPointScore").val()));
	$("#occurPointScore").val(addComma($("#occurPointScore").val()));
}

/* 포인트필드 comma 삭제 */
function fnMinusComma(){
	$("#remainPointScore").val(minusComma($("#remainPointScore").val()));
	$("#occurPointScore").val(minusComma($("#occurPointScore").val()));
}

/* 키 입력할 때마다 최대 발급 포인트 초과 시 제한 */
$("#occurPointScore").on('keyup',function (){
	//fnMinusComma();
	
	if($("#occurPointScore").val() > 1000000){
		alert("수기 포인트 발급 최대 입력은 1,000,000까지 가능합니다");
		$("#occurPointScore").val("1000000");
		fnAddComma();
		return;
	}
	
	//fnAddComma();
});
</script>