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
        <h1>거래상세(개인정보)</h1>
<!--         <a href="javascript:window.close();" class="close">팝업 닫기</a> -->
        	<a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
    </div>
    <!-- //header -->

    <!-- cont -->
    <div class="cont">
		<input type="hidden" class="it" title="계약번호" id="cntrNo" name="cntrNo" value="${vo.cntrNo}" disabled="disabled">
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
                    <%-- <col width="10%">
                    <col width="15%"> --%>
                    <%-- <col width="8%">
                    <col width="*"> --%>
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
                        <!-- <th class="left" scope="row">휴대폰</th>
                        <td>
                            <input type="text" class="it" title="휴대폰" value="" disabled="disabled">
                        </td> -->
                        <!-- <th class="left" scope="row">총 누계액</th>
                        <td>
                            <div class="mFlex2">
                                <input type="text" class="it right" title="총 누계액" value="" disabled="disabled">
                                <span class="bar5">원</span>
                            </div>
                        </td> -->
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- //board -->
        
        <div class="gTitle1 line">
            <h3 class="mTitle1">거래내역</h3>
        </div>
        <!-- board -->
        <div class="mBoard2"> 
            <table>
                <caption>상담내역</caption>
                <colgroup>
                    <col width="12%">
                    <col width="38%">
                    <col width="12%">
                    <col width="38">
                </colgroup>
                <tbody>
                    <tr>
                        <th class="left" scope="row">제품</th>
                        <td>
                            <div class="mFlex2">
                                <span class="tab jsTab3">
                                    <a id="saleSeCd1" href="#">일시불</a>
                                    <a id="saleSeCd2" href="#">렌탈</a>
                                    <input type="hidden" id="saleSeCd" name="saleSeCd" value="${vo.saleSeCd}" >
                                </span>
                                <span class="flex">
                                    <input type="text" class="it" title="제품" value="${vo.itemNm}" disabled="disabled">
                                </span>
                            </div>
                        </td>
                        <th class="left" scope="row">렌탈기간</th>
                        <td>
                            <div class="mFlex2">
                                <input type="text" class="it" title="렌탈기간 시작일" id="cntrStartDe" name="cntrStartDe" value="${vo.cntrStartDe }" disabled="disabled">
                                <span class="bar5">~</span>
                                <input type="text" class="it" title="렌탈기간 마지막일" id="cntrEndDe" name="cntrEndDe" value="${vo.cntrEndDe }" disabled="disabled">
                            </div>
                        </td>
                        <!-- <th class="left" scope="row">수납자</th>
                        <td>
                            <input type="text" class="it" title="수납자" value="" disabled="disabled">
                        </td> -->
                    </tr>
                    <tr>
                        <th class="left" scope="row">수량</th>
                        <td>
                            <div class="mFlex2">
                                <input type="text" class="it right" title="수량" value="${vo.cntrQy }" disabled="disabled">
                                <span class="bar5">개</span>
                            </div>
                        </td>
                        <th class="left" scope="row">선납금액</th>
                        <td>
                            <div class="mFlex2">
                                <input type="text" class="it right" id="prepayAmt" name="prepayAmt" title="선납금액" value="${vo.prepayAmt}" disabled="disabled">
                                <span class="bar5">원</span>
                            </div>
                        </td>
                        <!-- <th class="left" scope="row" rowspan="3">납부메모</th>
                        <td rowspan="3">
                            <textarea class="textarea" title="납부메모" rows="4" value="" disabled="disabled"></textarea>
                        </td> -->
                    </tr>
                    <tr>
                        <th class="left" scope="row">판매금액</th>
                        <td>
                            <div class="mFlex2">
                                <input type="text" class="it right" id="saleAmt" name="saleAmt" title="판매금액" value="${vo.saleAmt}" disabled="disabled">
                                <span class="bar5">원</span>
                            </div>
                        </td>
                        <th class="left" scope="row">렌탈금액</th>
                        <td>
                            <div class="mFlex2">
                                <input type="text" class="it right" id="rentAmt" name="rentAmt" title="렌탈금액" value="${vo.rentAmt}" disabled="disabled">
                                <span class="bar5">원</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th class="left" scope="row">결제금액</th>
                        <td>
                            <div class="mFlex2">
                                <input type="text" class="it right" data-type="integer" id="setlAmt" name="setlAmt" title="결제금액" value="${vo.setlAmt}" disabled="disabled">
                                <span class="bar5">원</span>
                            </div>
                        </td>
                        <th class="left" scope="row">정기결제방법</th>
                        <td>
                            <div class="mFlex2">
                                <input type="text" class="it" title="정기결제방법" value="${vo.fsetlMthCdNm}" disabled="disabled">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th class="left" scope="row">주문금액</th>
                        <td>
                            <div class="mFlex2">
                                <input type="text" class="it right" id="ordAmt" name="ordAmt" title="결제금액" value="${vo.ordAmt}" disabled="disabled">
                                <span class="bar5">원</span>
                            </div>
                        </td>
                        <th class="left" scope="row">정기결제일자</th>
                        <td>
                            <div class="mFlex2">
                                <input type="text" class="it" title="정기결제일자" value="${vo.sfetlDeCd}" disabled="disabled">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th class="left" scope="row">사용포인트</th>
                        <td>
                            <div class="mFlex2">
                                <input type="text" class="it right crucial txtRed" id="usePointScore" name="usePointScore" title="사용포인트" value="${vo.usePointScore}" disabled="disabled">
                                <span class="bar5">원</span>
                            </div>
                        </td>
                        <th class="left" scope="row">설치확정일자</th>
                        <td>
                            <div class="mFlex2">
                                <input type="text" class="it" title="설치확정일자" id="istDcsDe" name="istDcsDe" value="${vo.istDcsDe}" disabled="disabled">
                            </div>
                        </td>
                        <!-- <th class="left" scope="row">외상</th>
                        <td class="left">
                            <label class="mCheckbox1">
                                <input type="checkbox" title="외상거리" checked="checked" >
                                <span class="label">외상거리</span>
                            </label>
                        </td> -->
                    </tr>
                    <tr>
                        <th class="left" scope="row">발생포인트</th>
                        <td>
                            <div class="mFlex2">
                                <input type="text" class="it right crucial" id="occurPointScore" name="occurPointScore" title="발생포인트" disabled="disabled">
                                <span class="bar5">원</span>
                            </div>
                        </td>
                        <th class="left" scope="row">매출확정일자</th>
                        <td>
                            <div class="mFlex2">
                                <input type="text" class="it" title="매출확정일자" id="selngDcsDe" name="selngDcsDe" value="${vo.selngDcsDe}" disabled="disabled">
                            </div>
                        </td>
                        <!-- <th class="left" scope="row">영수증</th>
                        <td class="left">
                            <label class="mCheckbox1">
                                <input type="checkbox" title="전자영수증" checked="checked">
                                <span class="label">전자영수증</span>
                            </label>
                            <label class="mCheckbox1">
                                <input type="checkbox" title="현금영수증">
                                <span class="label">현금영수증</span>
                            </label>
                            <label class="mCheckbox1">
                                <input type="checkbox" title="세금계산서">
                                <span class="label">세금계산서</span>
                            </label>
                        </td> -->
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
window.onload = function(){
	
	// 색상변경
	if($("#saleSeCd").val() == 1000){
		//$("#saleSeCd1").removeClass("active");
		//$("#saleSeCd2").addClass("active");
		$("#saleSeCd2").addClass("it w35 bold");
	}else if($("#saleSeCd").val() == 2000){
		//$("#saleSeCd2").removeClass("active");
		//$("#saleSeCd1").addClass("active");
		$("#saleSeCd1").addClass("it w35 bold");
	}
	
	getOccurPointForBos();
	getUsePointForBos();
	fnDataFormat();
}

/* 계약번호로 포인트이력에서 발급포인트 조회 */
function getOccurPointForBos(){
	var param = {
			cntrNo : $("#cntrNo").val()
	};
	var url = "<c:url value='${urlPrefix}/getOccurPointForBos'/>${urlSuffix}";
	
	Utilities.getAjax(url, param, true, function(data, jqXHR) {
		if (Utilities.processResult(data, jqXHR, "발급포인트 정보 읽기에 실패했습니다.")) {
			if(data != null){
				$("#occurPointScore").val(data.occurPointScore);
			}
			fnAddComma($("#occurPointScore"));
		}
	});
}

/* 사용포인트 조회 */
function getUsePointForBos(){
	var param = {
			cntrNo : $("#cntrNo").val()
	};
	var url = "<c:url value='${urlPrefix}/getUsePointForBos'/>${urlSuffix}";
	
	Utilities.getAjax(url, param, true, function(data, jqXHR) {
		if (Utilities.processResult(data, jqXHR, "발급포인트 정보 읽기에 실패했습니다.")) {
			if(data != null){
				$("#usePointScore").val(data.occurPointScore);
			}
			fnAddComma($("#usePointScore"));
		}
	});
}

/* 날짜 '-' 패턴 */
function dateChange(obj){
	if($(obj).val() != ""){
		var strDay = $(obj).val().replace(/-/g,"");
		var strDayY = strDay.substr(0,4);
		var strDayM = strDay.substr(4,2);
		var strDayD = strDay.substr(6,2);
		strDay = strDayY + "-" + strDayM + "-" + strDayD;
		$(obj).val(strDay);
	}
}

/* 금액,점수필드 comma 추가 */
function fnAddComma(obj){
	var strData = parseInt($(obj).val());
	$(obj).val(addComma(strData));
}

/* 데이터 포맷 변경 */
function fnDataFormat(){
	dateChange($("#cntrStartDe"));
	dateChange($("#cntrEndDe"));
	dateChange($("#istDcsDe"));
	dateChange($("#selngDcsDe"));
	
	fnAddComma($("#prepayAmt"));
	fnAddComma($("#saleAmt"));
	fnAddComma($("#rentAmt"));
	fnAddComma($("#setlAmt"));
	fnAddComma($("#ordAmt"));
}

</script>