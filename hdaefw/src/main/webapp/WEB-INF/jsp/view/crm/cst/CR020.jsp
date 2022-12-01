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
        <h1>상담상세(개인정보)</h1>
<!--         <a href="javascript:window.close();" class="close">팝업 닫기</a> -->
        <a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
    </div>
    <!-- //header -->

    <!-- cont -->
    <div class="cont">

        <div class="gTitle1 line">
            <h3 class="mTitle1">고객정보</h3>
        </div>
        <!-- board -->
        <div class="mBoard2"> 
            <table>
                <caption>고객정보</caption>
                <colgroup>
                    <col width="10%">
                    <col width="15%">
                    <col width="10%">
                    <col width="15%">
                    <col width="10%">
                    <col width="*">
                </colgroup>
                <tbody>
                    <tr>
                        <th class="left" scope="row">통합고객번호</th>
                        <td>
                            <input type="text" class="it" title="통합고객번호" value="${vo.itgCustNo}" disabled="disabled">
                        </td>
                        <th class="left" scope="row">이름</th>
                        <td>
                            <input type="text" class="it" title="이름" value="${vo.custNm}" disabled="disabled">
                        </td>
                        <th class="left" scope="row">휴대폰</th>
                        <td>
                            <input type="text" class="it" title="휴대폰" value="${vo.custTelNo}" disabled="disabled">
                        </td>
<!--                         <th class="left" scope="row">고객알림</th> -->
<!--                         <td class="left"> -->
<!--                             <label class="mCheckbox1"> -->
<!--                                 <input type="checkbox" title="상담 등록 알림" checked="checked"> -->
<!--                                 <span class="label">상담 등록 알림</span> -->
<!--                             </label> -->
<!--                         </td> -->
                    </tr>
<!--                     <tr> -->
<!--                         <th class="left" scope="row">총상담</th> -->
<!--                         <td class="left"> -->
<!--                             <input type="text" class="it right w50" title="총상담" value="3"> -->
<!--                             건 -->
<!--                         </td> -->
<!--                         <th class="left" scope="row">상담중</th> -->
<!--                         <td class="left"> -->
<!--                             <input type="text" class="it right w50" title="상담중" value="2"> -->
<!--                             건 -->
<!--                         </td> -->
<!--                         <th class="left" scope="row">취소</th> -->
<!--                         <td class="left" colspan="3"> -->
<!--                             <input type="text" class="it right w50" title="취소" value="3"> -->
<!--                             건 -->
<!--                         </td> -->
<!--                     </tr> -->
                </tbody>
            </table>
        </div>
        <!-- //board -->
        
        <div class="gTitle1 line">
            <h3 class="mTitle1">상담내역</h3>
        </div>
        <!-- board -->
        <div class="mBoard2"> 
            <table>
                <caption>상담내역</caption>
                <colgroup>
                    <col width="10%">
                    <col width="15%">
                    <col width="10%">
                    <col width="15%">
                    <col width="10%">
                    <col width="15%">
                    <col width="10%">                    
                    <col width="*">
                </colgroup>
                <tbody>
                	<tr>
                        <th class="left" scope="row">상담이력번호</th>
                        <td>
                            <input type="text" class="it" title="상담이력번호"  value="${vo.cnslHistNo}" disabled="disabled">
                        </td>
                        <th class="left" scope="row">상담시작일</th>
                        <td>
                            <input type="text" class="it" title="상담시작일"  value="${vo.cnslBeginDate}" disabled="disabled">
                        </td>
                        <th class="left" scope="row">상담시작시간</th>
                        <td>
                            <input type="text" class="it" title="상담시작시간"  value="${vo.cnslBeginTime}" disabled="disabled">
                        </td>
                        <th class="left" scope="row">콜유형</th>
                        <td>
                            <input type="text" class="it" title="콜유형"  value="${vo.callTy}" disabled="disabled">
                        </td>                                                                        
                    </tr>
                    <tr>
                        <th class="left" scope="row">채널</th>
                        <td>
                            <input type="text" class="it" title="채널" value="${vo.channel}" disabled="disabled">
                        </td>
                        <th class="left" scope="row">상품명</th>
                        <td>
                            <input type="text" class="it" title="상품명" value="${vo.productNm}" disabled="disabled">
                        </td>
                        <th class="left" scope="row">상품코드</th>
                        <td>
                            <input type="text" class="it" title="상품코드" value="${vo.productCd}" disabled="disabled">
                        </td>
                        <th class="left" scope="row">AS접수번호</th>
                        <td>
                            <input type="text" class="it" title="AS접수번호" value="${vo.asRecpNo}" disabled="disabled">
                        </td>                                                                        
                    </tr>
                    <tr>
                        <th class="left" scope="row">상담구분(대)</th>
                        <td>
                            <input type="text" class="it" title="상담구분(대)" value="${vo.cnslTypNm}" disabled="disabled">
                        </td>
                        <th class="left" scope="row">상담구분(중)</th>
                        <td>
                            <input type="text" class="it" title="상담구분(중)" value="${vo.cnslTypNm2}" disabled="disabled">
                        </td>
                        <th class="left" scope="row">상담구분(소)</th>
                        <td>
                            <input type="text" class="it" title="상담구분(소)" value="${vo.cnslTypNm3}" disabled="disabled">
                        </td>
                        <th class="left" scope="row">상담완료여부</th>
                        <td>
                            <input type="text" class="it" title="상담완료여부" value="${vo.cmplYn}" disabled="disabled">
                        </td>                                                                        
                    </tr>
                    <tr>
                        <th class="left" scope="row">녹취ID</th>
                        <td>
                            <input type="text" class="it" title="녹취ID" value="${vo.rdwtId}" disabled="disabled">
                        </td>
                        <th class="left" scope="row">상담사명</th>
                        <td>
                            <input type="text" class="it" title="상담사명" value="${vo.userNm}" disabled="disabled">
                        </td>
                        <th class="left" scope="row">처리결과코드</th>
                        <td>
                            <input type="text" class="it" title="procCodeLcls" value="${vo.procCodeLcls}" disabled="disabled">
                        </td>
                        <th class="left" scope="row">처리결과명</th>
                        <td>
                            <input type="text" class="it" title="procNmLcls" value="${vo.procNmLcls}" disabled="disabled">
                        </td>                                                                        
                    </tr>
 
                    <tr>
                        <th class="left va-top" scope="row" rowspan="9">상담내용</th>
                        <td rowspan="9" colspan="3">
                            <textarea class="textarea" title="상담내용" rows="14" disabled="disabled">${vo.cnslCntn}</textarea>
                        </td>
                        <th class="left va-top" scope="row" rowspan="9">답변내용</th>
                        <td rowspan="9" colspan="3">
                            <textarea class="textarea" title="답변내용" rows="14" disabled="disabled">${vo.repleCntn}</textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- //board -->

    </div>
    <!-- //cont -->
	
</div>

<div class="right" style="margin-right: 30px">
<!-- 	<a href="#;" class="mBtn1" id="btnInsert">등록</a>
	<a href="#;" class="mBtn1" id="btnUpdate">수정</a>
	<a href="#;" class="mBtn1 primary" id="btnDelete">삭제</a> -->
	<a href="#" data-btn-type="closeModal" class="mBtn1">창닫기</a>
</div>

<script>

/* 화면 로드 시 */
// window.onload = function(){
//	var param = Utilities.formToMap("frmMain");
// 	if(param.stpltNo == ""){
// 		$("#btnUpdate").hide();
// 		$("#btnDelete").hide();
// 		$("#stpltNo").attr("readonly",true);
// 	}else{
// 		$("#btnInsert").hide();
// 	}
// }

/* 등록 버튼 클릭 */
// $("#btnInsert").click(function(){
// 	var bConfirm = confirm("등록하시겠습니까?");
// 	if(!bConfirm){
// 		return;
// 	}
	
// 	var param = Utilities.formToMap("frmMain");
	
// 	param.stat="C";
// 	if(!validate(param))
// 		return;
	
// 	var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
// 	Utilities.getAjax(url,param,true,function(data,jqXHR){
// 		if(Utilities.processResult(data,jqXHR,"등록에 실패했습니다."))
// 		{
// 			alert("등록에 성공했습니다.");
// 			Utilities.getOpener().search();
// 			Utilities.closeModal();
// 		}
// 	});
// });

/* 수정 버튼 클릭 */
// $("#btnUpdate").click(function(){

// 	var bConfirm = confirm("수정하시겠습니까?");
// 	if(!bConfirm){
// 		return;
// 	}
	
// 	var param = Utilities.formToMap("frmMain");
	
// 	param.stat="U";
// 	if(!validate(param))
// 		return;
	
// 	var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
// 	Utilities.getAjax(url,param,true,function(data,jqXHR){
// 		if(Utilities.processResult(data,jqXHR,"수정에 실패했습니다."))
// 		{
// 			alert("수정에 성공했습니다.");
// 			Utilities.getOpener().search();
// 			Utilities.closeModal();
// 		}
// 	});
// });

/* 삭제 버튼 클릭 */
// $("#btnDelete").click(function(){
	
// 	var bConfirm = confirm("삭제하시겠습니까?");
// 	if(!bConfirm){
// 		return;
// 	}
	
// 	var param = Utilities.formToMap("frmMain");
	
// 	param.stat="D";

// 	var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
// 	Utilities.getAjax(url,param,true,function(data,jqXHR){
// 		if(Utilities.processResult(data,jqXHR,"삭제에 실패했습니다."))
// 		{
// 			alert("삭제에 성공했습니다.");
// 			Utilities.getOpener().search();
// 			Utilities.closeModal();
// 		}
// 	});
// });

/* 필수 값 체크 */
function validate(param){

// 	if(!param.stpltNm){
//         alert("약관 명은 필수입니다.");
//         $("#stpltNm").focus();
//         return false;
//     }
// 	if(!param.stpltTypeCd){
//         alert("약관 구분은 필수입니다.");
//         $("#stpltTypeCd").focus();
//         return false;
//     }
// 	if(!param.stpltStaYmd){
//         alert("약관 시작일은 필수입니다.");
//         $("#stpltStaYmd").focus();
//         return false;
//     }
// 	if(!param.stpltEndYmd){
//         alert("약관 종료일은 필수입니다.");
//         $("#stpltEndYmd").focus();
//         return false;
//     }
//     if(!param.useYn){
//         alert("약관 사용 여부는 필수입니다.");
//         $("#useYn").focus();
//         return false;
//     }
//     if(!param.stpltCtnts){
//         alert("약관 내용은 필수입니다.");
//         $("#stpltCtnts").focus();
//         return false;
//     }
    
	return true;
}

</script>