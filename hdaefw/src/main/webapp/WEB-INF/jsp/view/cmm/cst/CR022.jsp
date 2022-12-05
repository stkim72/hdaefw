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
        <h1>AS 상세</h1>
<!--         <a href="javascript:window.close();" class="close">팝업 닫기</a> -->
        	<a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
    </div>
    <!-- //header -->

    <!-- cont -->
    <div class="cont">
        
        <!-- grid -->
        <div class="mGrid2">
            <!-- left -->
            <div class="lt">
                <div class="gTitle1 line">
                    <h3 class="mTitle1">고객정보</h3>
                </div>
                <!-- board -->
                <div class="mBoard2"> 
                    <table>
                        <caption>고객정보</caption>
                        <colgroup>
                            <col width="15%">
                            <col width="16%">
                            <col width="13%">
                            <col width="21%">
                            <col width="13%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th class="left" scope="row">통합고객번호</th>
                                <td >
                                    <input type="text" class="it" title="통합고객번호" value="${vo.itgCustNo}" disabled="disabled">
                                </td>
                                <th class="left" scope="row">이름</th>
                                <td>
                                    <input type="text" class="it" title="이름" value="${vo.custNm}" disabled="disabled">
                                </td>
                                <th class="left" scope="row">휴대폰</th>
                                <td>
                                    <input type="text" class="it" title="휴대폰" value="${vo.mphonNo}" disabled="disabled">
                                </td>                                
                            </tr>
                            <tr>
								<th scope="row" class="left">주소</th>
								<td colspan="5">
									<div class="mFlex2">
										<div class="mFind1">
											<input type="text" class="it" title="우편번호" name="zipCd" id="zipCd" value="${vo.zipCd}" disabled="disabled">
										</div>
										<input type="text" class="it" title="주소" name="addr1Ctnts" id="addr1Ctnts" value="${vo.addr1Ctnts}" disabled="disabled">
										
										<input type="text" class="it w70" title="상세주소" name="addr2Ctnts" id="addr2Ctnts" value="${vo.addr2Ctnts}" disabled="disabled">
									</div>
								</td>
                            </tr>
                            <tr>
                                <th class="left" scope="row">AS총건수</th>
                                <td class="left">
                                    <input type="text" class="it right w50" title="AS총건수"  name="totalCnt" id="totalCnt" value="${vo.totalCnt}" disabled="disabled"> 건
                                </td>
                                <th class="left" scope="row">AS취소</th>
                                <td class="left">
                                    <input type="text" class="it right w50" title="AS취소"  name="cancelCnt" id="cancelCnt" value="${vo.cancelCnt}" disabled="disabled"> 건
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
                
                <div class="gTitle1 line mt18">
                    <h3 class="mTitle1">비용</h3>
                </div>
                <!-- board -->
<%-- <form role="form" id="frmMain">                 --%>
                <div class="mBoard2"> 
                    <table>
                        <caption>비용</caption>
                        <colgroup>
                            <col width="15%">
                            <col width="40%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th class="left" scope="row">발생비용</th>
                                <td class="left br0">
									<input type="text" class="it right" style="width:205px"  id="totAmt" name="totAmt" value="${vo.totAmt}" disabled="disabled"> 원
                                    <div class="mList2">
                                        <ul>
                                     
                                            <li>
                                                <span class="t">출장비</span>
                                                <span class="c">
                                                    <input type="text" class="it right" title="출장비" id="tvexpnsAmt" name="tvexpnsAmt"  value="${vo.tvexpnsAmt}​" disabled="disabled"> 원
                                                </span>
                                            </li>
                                            <li>
                                                <span class="t">자재비용</span>
                                                <span class="c">
                                                    <input type="text" class="it right" title="서비스비용" id="payAmt" name="payAmt" value="${vo.payAmt}​" disabled="disabled"> 원
                                                </span>
                                            </li>
                                            <li>
                                                <span class="t">할인금액</span>
                                                <span class="c">
                                                    <input type="text" class="it right" title="설치비"  id="dcAmt" name="dcAmt" value="${vo.dcAmt}" disabled="disabled"> 원
                                                </span>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                                <td class="bl0">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
<%-- </form>                 --%>
                <!-- //board -->
                
                <div class="gTitle1 line mt18">
                    <h3 class="mTitle1">AS처리내역</h3>
                </div>
                <!-- board -->
                <div class="mBoard2"> 
                    <table>
                        <caption>AS처리내역</caption>
                        <colgroup>
                            <col width="15%">
                            <col width="*">

                            <col width="22%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th class="left" scope="row">AS담당자</th>
                                <td colspan="3">
                                    <input type="text" class="it" title="AS담당자" value="${vo.trtPicNm}" disabled="disabled">
                                </td>
                                <th class="left" scope="row">AS처리상태</th>
                                <td colspan="1">
                                	<input type="text" class="it" title="AS처리상태" value="${vo.asTrtDivCdNm}" disabled="disabled">
<!--                                     <select class="select" title="접수상태"> -->
<!--                                         <option>접수</option> -->
<!--                                     </select> -->

                                </td>                                
                            </tr>
                            <tr>
                            	
                                <th class="left" scope="row">방문일시</th>
                                <td colspan="3" class="left">
									<div class="mFlex2">
	                                    <input type="text" maxlength="10" data-type="datetime" class="it w70" title="방문일시" value="${vo.visitExptDay}" disabled="disabled">
	                                    <input type="text" class="it w35 ml7" title="시" value="${vo.visitExptHour}" disabled="disabled"> 시
	                                    <input type="text" class="it w35 ml7" title="분" value="" disabled="disabled"> 분
                                    </div>
                                </td>


                                
                                <th class="left" scope="row">처리완료일자</th>
                                <td class="left" colspan="1">
                                    <input type="text" maxlength="10" data-type="datetime" class="it" title="완료일시" value="${vo.trtCmptDt}" disabled="disabled">                           
                                </td>
                             
                            </tr>
                            <tr>
                                <th class="left" scope="row">조치사항</th>
                                <td colspan="5">
                                    <textarea class="textarea" title="AS내용" rows="9" disabled="disabled">${vo.trtRmark}</textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
            </div>
            <!-- //left -->
            <!-- right -->
            <div class="rt">
                <div class="gTitle1 line">
                    <h3 class="mTitle1">AS 접수내역</h3>
                    <div class="gRt">
<!--                         <a href="#" class="mBtn1 lPrimary">확인</a> -->
                    </div>
                </div>
                <!-- board -->
                <div class="mBoard2"> 
                    <table>
                        <caption>AS 접수내역</caption>
                        <colgroup>
                            <col width="15%">
                            <col width="18.3%">
                            <col width="15%">
                            <col width="18.3%">
                            <col width="15%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th class="left" scope="row">접수일자</th>
                                <td class="left" colspan="3">
                                    <input type="text" maxlength="10" data-type="datetime" class="it" title="완료일시" value="${vo.submitDate}" disabled="disabled">                           
                                </td>                            
                                <th class="left" scope="row">접수일련번호</th>
                                <td colspan="2">
                                    <input type="text" class="it" title="접수일련번호" value="${vo.asSubmitNo}" disabled="disabled">
                                </td>

                            </tr>
                            <tr>
                                <th class="left" scope="row">등록채널</th>
                                <td class="left" colspan="3" >
                                    <input type="text" class="it" title="접수자" value="${vo.regChlCd}" disabled="disabled">
                                </td>                            
                                <th class="left" scope="row">접수담당자</th>
                                <td colspan="2">
                                    <input type="text" class="it" title="접수자" value="${vo.cnslgPrsnEmpNm}" disabled="disabled">
                                </td>                            

                            </tr>
                            <tr>
                                <th class="left" scope="row">AS접수상태</th>
                                <td colspan="5">
                                	<input type="text" class="it" title="접수상태명" value="${vo.asStatusCdNm}" disabled="disabled">
<!--                                     <select class="select" title="접수상태"> -->
<!--                                         <option>접수</option> -->
<!--                                     </select> -->

                                </td>
                            </tr>                            

                            <tr>
								<th scope="row" class="left">AS주소</th>
								<td colspan="5">
									<div class="mFlex2">
										<div class="mFind1">
											<input type="text" class="it" title="우편번호" name="zipCd" id="zipCd" value="${vo.zipCd}" disabled="disabled">
										</div>
										<input type="text" class="it" title="주소" name="addr1Ctnts" id="addr1Ctnts" value="${vo.addr1Ctnts}" disabled="disabled">
										
										<input type="text" class="it w70" title="상세주소" name="addr2Ctnts" id="addr2Ctnts" value="${vo.addr2Ctnts}" disabled="disabled">
									</div>
								</td>
                            </tr>

<!--                             <tr> -->
<!--                                 <th class="left" scope="row">방문일시</th> -->
<!--                                 <td class="left" colspan="5"> -->
<%--                                     <input type="text" maxlength="10" data-type="datetime" class="it w70" title="방문일시" value="${vo.visitExptDay}" disabled="disabled"> --%>
<%--                                     <input type="text" class="it w35 ml7" title="완료시" value="${vo.visitExptHour}" disabled="disabled">시 --%>
<!--                                     <input type="text" class="it w35 ml7" title="완료시" value="" disabled="disabled">분                                 -->
<!--                                 </td> -->
<!--                             </tr> -->
                            <tr>
                                <th class="left" scope="row">불량증상</th>
                                <td colspan="5">
                                    <textarea class="textarea" title="상담내용" rows="7" disabled="disabled">${vo.submitRmark}</textarea>
                                </td>
                            </tr>
                            <tr>
                                <th class="left" scope="row">접수내용</th>
                                <td colspan="5">
                                    <textarea class="textarea" title="상담내용" rows="7" disabled="disabled">${vo.submitRmark}</textarea>
                                </td>
                            </tr>                            
                            <tr>
                                <th class="left" scope="row" rowspan="2">첨부사진</th>
<!--                                 <td class="left" colspan="5"> -->
<!--                                     <div class="mFile1"> -->
<!--                                         <div class="file"> -->
<!--                                             <input type="file" title="첨부파일"> -->
<!--                                             <a href="#" class="mBtn1 lWhite">불러오기</a> -->
<!--                                         </div> -->
<!--                                         <span class="txt"> -->
<!--                                             첨부파일 -->
<!--                                             <span class="txtRed"><strong>0</strong>개</span> -->
<!--                                             <span class="ts">0 KB</span> -->
<!--                                         </span> -->
<!--                                     </div> -->
<!--                                 </td> -->
                            </tr>
                            <tr>
                                <td class="left" colspan="5">
                                    <div class="mAttach1">
                                        <ul>
                                            <li>${vo.trtAttchFileId}</li>
<!--                                             <li><span>photo123.jpg (100 KB) <a href="#" class="delete">삭제</a></span></li> -->
<!--                                             <li><span>photo1.jpg (100 KB) <a href="#" class="delete">삭제</a></span></li> -->
<!--                                             <li><span>photo123.jpg (100 KB) <a href="#" class="delete">삭제</a></span></li> -->
<!--                                             <li><span>photo1.jpg (100 KB) <a href="#" class="delete">삭제</a></span></li> -->
<!--                                             <li><span>photo123.jpg (100 KB) <a href="#" class="delete">삭제</a></span></li> -->
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
            </div>
            <!-- //right -->
        </div>
        <!-- //grid -->
        
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
//  	var param = Utilities.formToMap("frmMain");
	
//  	console.log("데이터 : " , param );
	$("#totAmt").val(addComma($("#totAmt").val()));
	$("#tvexpnsAmt").val(addComma($("#tvexpnsAmt").val()));
	$("#payAmt").val(addComma($("#payAmt").val()));
	$("#dcAmt").val(addComma($("#dcAmt").val()));
	
}
	
</script>