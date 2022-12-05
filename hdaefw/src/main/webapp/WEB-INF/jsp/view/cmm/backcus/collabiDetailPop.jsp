<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class="title">
	<h1>상담 상세</h1>
	<a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
</div>
<div class="cont">
	<!-- form start -->
	<form id="frmMain">
		<div class="mBoard2">
			<table>
				<colgroup>
					<col width="10%">
					<col width="20%">
					<col width="10%">
                    <col width="20%">
                    <col width="10%">
                    <col width="30%">
				</colgroup>
				<tbody>
				    <tr>
                        <th>SEQ</th>
                            <td>
                                ${collabiDetail.collabiSeq}
                            </td>
                        <th>상담일자</th>
                            <td colspan="3">
                            	${collabiDetail.counselDt} 
                            </td>
                    </tr>
					<tr>
                        <th>상담원</th>
                            <td>
                                ${collabiDetail.agentNm}
                            </td>
                        <th>고객명</th>
                            <td>
                            	${collabiDetail.clientNm} 
                            </td>
                        <th>고객전화번호</th>
                            <td>
                            	${collabiDetail.userPhone} 
                            </td>
                    </tr>
					<tr>
                        <th>질문</th>
                            <td colspan="5">
                                ${collabiDetail.clientQ}
                            </td>
                    </tr>
                    <tr>
                        <th>답변</th>
                            <td colspan="5">
                                ${collabiDetail.clientA}
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