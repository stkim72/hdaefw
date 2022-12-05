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
        <h1>가망고객 마케팅수신동의 이력상세</h1>
        <a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
    </div>
    <!-- //header -->

    <!-- cont -->
    <div class="cont">
        
        <!-- grid -->
        <div class="mGrid2">
            	<div class="gTitle1 line">
		            <h3 class="mTitle1">가망고객 정보</h3>
		        </div>
		        
				<!-- board -->
                <div class="mBoard2"> 
                    <table>
                        <caption>가망고객 정보</caption>
                         <colgroup>
                         	<col width="15%">
                            <col width="25%">
                            <col width="15%">
                            <col width="25%">
                        </colgroup>
                        <tbody>
                            <tr>
                            	<th class="center" scope="row">이름</th>
                                <td>
									<input type="text" class="it" id="custNm" name="custNm" value="${ExpectCus.custNm}" disabled/>
                                </td>
                                <th class="center" scope="row">통합고객번호</th>
                                <td>
									<input type="text" class="it" id="itgCustNo" name="itgCustNo" value="${ExpectCus.itgCustNo}" disabled/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
                
                <!-- board -->
                <div class="gTitle1 line">
		            <h3 class="mTitle1">수신동의이력 정보</h3>
		        </div>
		        
                <div class="mBoard2"> 
                    <table>
                        <caption>수신동의이력 정보</caption>
                         <colgroup>
                         	<col width="7%">
                            <col width="30%">
                            <col width="30%">
                            <col width="30%">
                        </colgroup>
                        <tbody>
                            <tr>
                            	<th class="center" scope="row">NO.</th>
                                <th class="center" scope="row">매체명</th>
                                <th class="center" scope="row">동의채널</th>
                                <th class="center" scope="row">동의일자</th>
                            </tr>
                            <tr>
                            	<th class="center" scope="row">1</th>
                                <td>
                                	<input type="text" class="it center" id="SMS" name="SMS" value="SMS" disabled/>
                                </td>
                                <td>
                                	<input type="text" class="it center" id="smsRcvAgreeChlCd" name="smsRcvAgreeChlCd" value="${ExpectCus.smsRcvAgreeChlCd}" disabled />
                                </td>
                                <td>
                                	<input type="text" class="it center"  id="smsRcvAgreeDt" name="smsRcvAgreeDt" value="${ExpectCus.smsRcvAgreeDt}" disabled/>
                                </td>
                            </tr>
                            <tr>
                            	<th class="center" scope="row">2</th>
                                <td>
                                	<input type="text" class="it center" id="email" name="email" value="이메일" disabled/>
                                </td>
                                <td>
                                	<input type="text" class="it center" id="emailRcvAgreeChlCd" name="emailRcvAgreeChlCd" value="${ExpectCus.emailRcvAgreeChlCd}" disabled/>
                                </td>
                                <td>
                                	<input type="text" class="it center" id="emailRcvAgreeDt" name="emailRcvAgreeDt" value="${ExpectCus.emailRcvAgreeDt}" disabled/>
                                </td>
                            </tr>
                            <tr>
                            	<th class="center" scope="row">3</th>
                            	<td>
                                	<input type="text" class="it center" id="alrmTk" name="alrmTk" value="알림톡" disabled/>
                                </td>
                                <td>
                                	<input type="text" class="it center" id="alrmTkRcvAgreeChlCd" name="alrmTkRcvAgreeChlCd" value="${ExpectCus.alrmTkRcvAgreeChlCd}" disabled/>
                                </td>
                                <td>
                                	<input type="text" class="it center" id="alrmTkRcvAgreeDt" name="alrmTkRcvAgreeDt" value="${ExpectCus.alrmTkRcvAgreeDt}" disabled/>
                                </td>
                            </tr>
                            <tr>
                            	<th class="center" scope="row">4</th>
                                <td>
                                	<input type="text" class="it center" id="push" name="push" value="PUSH" disabled/>
                                </td>
                                <td>
                                	<input type="text" class="it center" id="pushRcvAgreeChlCd" name="pushRcvAgreeChlCd" value="${ExpectCus.pushRcvAgreeChlCd}" disabled/>
                                </td>
                                <td>
                                	<input type="text" class="it center" id="pushRcvAgreeDt" name="pushRcvAgreeDt" value="${ExpectCus.pushRcvAgreeDt}" disabled/>
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
	<a href="#" data-btn-type="closeModal" class="mBtn1">창닫기</a>
</div>

<script>

window.onload = function(){
	
}

/* 회원목록 검색 팝업 로드 */
function searchPop(){
	var url = "/util/searchCust";
    Utilities.openModal(url,1000,600);
}

/* 회원목록 검색 팝업 종료 후처리 */
function custNmSelect(data){
	
	$("#itgCustNo").val(data.itgCustNo);
	$("#custNm").val(data.custNm);
	$("#mphonNo").val(data.mphonNo);
	
}

/* 필수 값 체크 */
function validate(param){

	if(!param.custNm || !param.itgCustNo){
        alert("블랙등록하실 회원을 선택해주세요.");
        $("#custNm").focus();
        return false;
    }
    
	return true;
}


setToday(); 
</script>