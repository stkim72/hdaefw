<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class="title">
	<h1>고객 상세</h1>
	<a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
</div>
<div class="cont">
	<!-- form start -->
	<form id="frmMain">
		<div class="mBoard2">
			<table>
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="15%">
                       <col width="35%">
				</colgroup>
				<tbody>
					<tr>
                           <th>사용자명</th>
                            <td>
                                ${userInfoDetail.userName}
                            </td>
                           <th>사용자 ID</th>
                            <td>
                            	${userInfoDetail.loginId} 
                            </td>
                       </tr>
					<tr>
                           <th>전화번호</th>
                            <td>
                                ${userInfoDetail.userPhoneNumber}
                            </td>
                           <th>성별</th>
                            <td>
                            	${userInfoDetail.userGender} 
                            </td>
                       </tr>
					<tr>
                           <th>생년월일</th>
                            <td>
                                ${userInfoDetail.userBirth}
                            </td>
                           <th>사용자 특이사항</th>
                            <td>
                            	${userInfoDetail.userMemo} 
                            </td>
                       </tr>
                       <tr>
                           <th>등록일시</th>
                            <td>
                                ${userInfoDetail.createdAt}
                            </td>
                           <th>수정일시</th>
                            <td>
                            	${userInfoDetail.updatedAt} 
                            </td>
                       </tr>
                       <tr>
                           <th>사용자 등급코드</th>
                            <td>
                                ${userInfoDetail.gradeCd}
                            </td>
                           <th>사용자 등급레벨</th>
                            <td>
                            	${userInfoDetail.gradeLevel} 
                            </td>
                       </tr>
                       <tr>
                           <th>사용자 이메일</th>
                            <td>
                                ${userInfoDetail.userEmail}
                            </td>
                           <th>외국인 여부</th>
                            <td>
                            	${userInfoDetail.foreignUser} 
                            </td>
                       </tr>
                       <tr>
                           <th>방문여부</th>
                            <td>
                                ${userInfoDetail.storeVisit}
                            </td>
                           <th>추천직원 ID</th>
                            <td>
                            	${ususerInfoDetailerInfo.recomStoreId} 
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