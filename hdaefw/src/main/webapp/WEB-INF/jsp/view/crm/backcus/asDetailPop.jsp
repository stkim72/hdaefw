<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class="title">
	<h1>AS 상세</h1>
	<a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
</div>
<div class="cont">
	<!-- form start -->
	<form id="frmMain">
		<div class="mBoard2">
			<table>
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="5%">
                    <col width="10%">
                    <col width="5%">
                    <col width="15%">
                    <col width="10%">
                    <col width="15%">
				</colgroup>
				<tbody>
				    <tr>
                        <th>AS CASE ID</th>
                            <td>
                                ${asDetail.asCaseId}
                            </td>
                        <th>고객 ID</th>
                            <td>
                            	${asDetail.customerId} 
                            </td>
                        <th>고객명</th>
                            <td>
                                ${asDetail.customerName}
                            </td>
                        <th>이메일</th>
                            <td>
                                ${asDetail.asEmail}
                            </td>
                    </tr>
                    <tr>
                        <th>우편번호</th>
                            <td>
                                ${asDetail.asZipcode}
                            </td>
                        <th>주소</th>
                            <td colspan="3">
                                ${asDetail.asAddress}
                            </td>
                        <th>상세주소</th>
                            <td>
                                ${asDetail.detailAddr}
                            </td>
                    </tr>
					<tr>
                        <th>방문비용</th>
                            <td>
                                ${asDetail.visitCost}
                            </td>
                        <th>서비스비용</th>
                            <td>
                            	${asDetail.serviceCost} 
                            </td>
                        <th>설치비용</th>
                            <td>
                            	${asDetail.installationCost} 
                            </td>
                        <th>총 비용</th>
                            <td>
                            	${asDetail.totalCost} 
                            </td>
                    </tr>
                    <tr>
                    	<th>고객휴대전화번호</th>
                            <td>
                                ${asDetail.asMobile}
                            </td>
                        <th>완료일자</th>
                            <td>
                                ${asDetail.completeDate}
                            </td>
                        <th>완료시간</th>
                            <td>
                                ${asDetail.completeTime}
                            </td>
                        <th>기사ID</th>
                            <td>
                                ${asDetail.asEngineerId}
                            </td>
                    </tr>
					<tr>
                        <th>질문</th>
                            <td colspan="7">
                                ${asDetail.acceptRemark}
                            </td>
                    </tr>
                    <tr>
                        <th>답변</th>
                            <td colspan="7">
                                ${asDetail.completeRemark}
                            </td>
                    </tr>
                </tbody>
			    </table>
		</div>
	</form>
</div>

<!-- /.card -->
<!-- Horizontal Form -->
<!-- searchBox -->

<script>

</script>