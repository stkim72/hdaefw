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
        <h1>약관 상세</h1>
        <a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
    </div>
    <!-- //header -->

    <!-- cont -->
    <div class="cont">
        
        <!-- grid -->
        <div class="mGrid2">
            
                <div class="gTitle1 line">
                    <h3 class="mTitle1">기본정보</h3>
                </div>
                
                <!-- board -->
                <div class="mBoard2"> 
                    <table>
                        <caption>기본정보</caption>
                        <colgroup>
                            <col width="10%">
                            <col width="20%">
                            <col width="10%">
                            <col width="20">
                            <col width="40%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th class="left" scope="row">약관번호</th>
                                <td>
                                    <input type="text" class="it" id="stpltNo" name="stpltNo" placeholder="자동 채번" disabled="disabled" value="${Stipulation.stpltNo}"/>
                                </td>
                                <th class="left" scope="row">약관명</th>
                                <td colspan="2">
                                    <input type="text" class="it" id="stpltNm" name="stpltNm" value="${Stipulation.stpltNm}"/>
                                </td>
                            </tr>
                            <tr>
                                <th class="left" scope="row">약관구분</th>
                                <td colspan="2">
                                    <code:commCode id="stpltTypeCd" name="stpltTypeCd" codeCd="CU310" selectedValue="${Stipulation.stpltTypeCd}"/>
                                </td>
                            </tr>
                            <tr>
                                <th class="left" scope="row">약관시작일</th>
								<td>
									<input class="it" type="text" data-type="dateRangeStart" data-range-end="stpltEndYmd" id="stpltStaYmd" name="stpltStaYmd" data-enter="search" data-button="Y" value="${Stipulation.stpltStaYmd}"/>
								</td>
								<th class="left" scope="row">약관종료일</th>
								<td>
									<input class="it" type="text" id="stpltEndYmd" name="stpltEndYmd" data-enter="search" data-button="Y" value="${Stipulation.stpltEndYmd}"/>
								</td>
                            </tr>
                            <tr>
                                <th class="left" scope="row">약관사용여부</th>
                                <td>
                                    <code:commCode id="useYn" name="useYn" codeCd="S050" selectedValue="${Stipulation.useYn}"/>
                                </td>
                            </tr>
                            <tr>
                                <th class="left" scope="row">약관내용</th>
                                <td colspan="4">
                                    <textarea class="it" style="height:280px" id="stpltCtnts" name="stpltCtnts">${Stipulation.stpltCtnts}</textarea>
                                </td>
                            </tr>
                            <tr>
	                            <th class="left" scope="row">첨부파일</th>
	                            <td colspan="4">
	                            <div id="attFiles" class="left" style="min-height:110px" data-type="attachFiles" data-file-cd="${Stipulation.stpltNo}"  data-mode="edit"></div>
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
	<a href="#;" class="mBtn1" id="btnInsert">등록</a>
	<a href="#;" class="mBtn1" id="btnUpdate">수정</a>
	<a href="#;" class="mBtn1 primary" id="btnDelete">삭제</a>
	<a href="#" data-btn-type="closeModal" class="mBtn1">창닫기</a>
</div>

<script>

/* 화면 로드 시 */
window.onload = function(){
	var param = Utilities.formToMap("frmMain");
	if(param.stpltNm == ""){
		$("#btnUpdate").hide();
		$("#btnDelete").hide();
		$("#stpltNo").attr("readonly",true);
		getKey();
	}else{
		$("#btnInsert").hide();
	}
}

/* 등록 버튼 클릭 */
$("#btnInsert").click(function(){
	var bConfirm = confirm("등록하시겠습니까?");
	if(!bConfirm){
		return;
	}
	
	var param = Utilities.formToMap("frmMain");
	
	param.stat="C";
	if(!validate(param))
		return;
	
	var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
	Utilities.getAjax(url,param,true,function(data,jqXHR){
		if(Utilities.processResult(data,jqXHR,"등록에 실패했습니다."))
		{
			alert("등록에 성공했습니다.");
			Utilities.getOpener().search();
			Utilities.closeModal();
		}
	});
});

/* 수정 버튼 클릭 */
$("#btnUpdate").click(function(){

	var bConfirm = confirm("수정하시겠습니까?");
	if(!bConfirm){
		return;
	}
	
	var param = Utilities.formToMap("frmMain");
	
	param.stat="U";
	if(!validate(param))
		return;
	
	var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
	Utilities.getAjax(url,param,true,function(data,jqXHR){
		if(Utilities.processResult(data,jqXHR,"수정에 실패했습니다."))
		{
			alert("수정에 성공했습니다.");
			Utilities.getOpener().search();
			Utilities.closeModal();
		}
	});
});

/* 삭제 버튼 클릭 */
$("#btnDelete").click(function(){
	
	var bConfirm = confirm("삭제하시겠습니까?");
	if(!bConfirm){
		return;
	}
	
	var param = Utilities.formToMap("frmMain");
	
	param.stat="D";

	var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
	Utilities.getAjax(url,param,true,function(data,jqXHR){
		if(Utilities.processResult(data,jqXHR,"삭제에 실패했습니다."))
		{
			alert("삭제에 성공했습니다.");
			Utilities.getOpener().search();
			Utilities.closeModal();
		}
	});
});

/* 필수 값 체크 */
function validate(param){

	if(!param.stpltNm){
        alert("약관 명은 필수입니다.");
        $("#stpltNm").focus();
        return false;
    }
	if(!param.stpltTypeCd){
        alert("약관 구분은 필수입니다.");
        $("#stpltTypeCd").focus();
        return false;
    }
	if(!param.stpltStaYmd){
        alert("약관 시작일은 필수입니다.");
        $("#stpltStaYmd").focus();
        return false;
    }
	if(!param.stpltEndYmd){
        alert("약관 종료일은 필수입니다.");
        $("#stpltEndYmd").focus();
        return false;
    }
    if(!param.useYn){
        alert("약관 사용 여부는 필수입니다.");
        $("#useYn").focus();
        return false;
    }
    if(!param.stpltCtnts){
        alert("약관 내용은 필수입니다.");
        $("#stpltCtnts").focus();
        return false;
    }
    
	return true;
}

</script>