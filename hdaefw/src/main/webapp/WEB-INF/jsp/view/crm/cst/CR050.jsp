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
        <h1>블랙리스트 등록</h1>
        <a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
    </div>
    <!-- //header -->

    <!-- cont -->
    <div class="cont">
        
        <!-- grid -->
        <div class="mGrid2">
            
                <div class="gTitle1 line">
                    <h3 class="mTitle1">블랙리스트 등록</h3>
                </div>
                
                <!-- board -->
                <div class="mBoard2"> 
                    <table>
                        <caption>블랙리스트 등록</caption>
                         <colgroup>
                            <col width="15%">
                            <col width="35%">
                            <col width="15%">
                            <col width="35">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th class="left" scope="row">회원명</th>
                                <td>
                                	<div class="mFlex2">
		                                <span class="flex">
		                                    <input type="text" class="it" id="custNm" name="custNm" value="${Black.custNm}"/>
		                                </span>
		                                <a href="#" class="mBtn1 m lWhite" id="btnSearch" data-click="searchPop">검색</a>
		                            </div>
                                </td>
                                <th class="left" scope="row">통합고객번호</th>
                                <td>
                                    <input type="text" class="it" id="itgCustNo" name="itgCustNo" value="${Black.itgCustNo}"/>
                                </td>
                            </tr>
                            <tr>
                                <th class="left" scope="row">휴대전화번호</th>
                                <td>
                                	<input type="text" class="it" id="mphonNo" name="mphonNo" value="${Black.mphonNo}"/>
                                </td>
                                <th class="left" scope="row">등록일</th>
								<td>
									<input type="text" class="it" title="등록일" id="bllkRegDt" name="bllkRegDt" value="${Black.bllkRegDt}">
								</td>
                            </tr>
                            <tr>
                                <th class="left" scope="row">블랙등록 채널코드</th>
								<td>
									<input type="text" class="it" id="bllkRegChlCd" name="bllkRegChlCd" value="${Black.bllkRegChlCd}"/>
									<%-- <code:commCode id="bllkRegChlCd" name="bllkRegChlCd" codeCd="S000" selectedValue="${Black.bllkRegChlCd}"/> --%>
								</td>
								<th class="left" scope="row">등록자</th>
								<td>
									<input type="text" class="it" id="regrId" name="regrId" readOnly value="${Black.regrId}"/> <%--  --%>
								</td>
                            </tr>
                            <tr>
<%--                                 <th class="left" scope="row">블랙등록매장</th>
                                <td>
                                    <code:commCode id="bllkRegStorNo" name="bllkRegStorNo" codeCd="코드필요" selectedValue=""/>
                                </td> --%>
                                <th class="left" scope="row">블랙고객등록사유</th>
                                <td>
									<code:commCode id="bllkRegWhyCd" name="bllkRegWhyCd" codeCd="CU320" selectedValue="${Black.bllkRegWhyCd}"/>
								</td>
                            </tr>
                            <tr>
                                <th class="left" scope="row">비고</th>
                                <td colspan="4">
                                    <textarea class="it" style="height:280px" id="bllkRegWhyCtnts" name="bllkRegWhyCtnts">${Black.bllkRegWhyCtnts}</textarea>
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
	<a href="#;" class="mBtn1" id="btnBlackSave">블랙등록</a>
	<a href="#" data-btn-type="closeModal" class="mBtn1">창닫기</a>
</div>

<script>

window.onload = function(){
	
	var today = moment();
    var dt = today.format("YYYYMMDD");
    
	$("#custNm").attr("disabled", true);
	$("#itgCustNo").attr("disabled", true);
	$("#mphonNo").attr("disabled", true);
	$("#bllkRegDt").attr("disabled", true);
	$("#bllkRegChlCd").attr("disabled", true);
	$("#regrId").attr("disabled", true);
	/* $("#bllkRegStorNo").attr("disabled", true);
	$("#bllkRegWhyCd").attr("disabled", true); */
	
	if('${addMode}' == "C") 
	{
		$("#regrId").val('${LOGIN_USER.userNm }');
		$("#bllkRegChlCd").val("CRM");
		$("#bllkRegDt").val(dt);
		
	}
	else
	{
		$("#btnBlackSave").hide();
		$("#btnSearch").hide();
		$("#bllkRegWhyCtnts").attr("disabled", true);
		
	}
}

/* 회원목록 검색 팝업 로드 */
function searchPop(){
	var url = "/util/searchCust/" + "Y";
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

	if(!param.bllkRegWhyCtnts || !param.bllkRegWhyCtnts){
        alert("비고란을 입력해주세요.");
        $("#custNm").focus();
        return false;
    }
    
	return true;
}

//saveBlackList

$("#btnBlackSave").click(function(){
	var bConfirm = confirm("블랙리스트에 등록하시겠습니까?");
	if(!bConfirm){
		return;
	}
	
	var param = Utilities.formToMap("frmMain");
	
	param.bllkmshpYn="Y";
	if(!validate(param))
		return;
	
	var url = "<c:url value='${urlPrefix}/saveBlack${urlSuffix}'/>";
	Utilities.blockUI();
	Utilities.getAjax(url,param,true,function(data,jqXHR){
		Utilities.unblockUI();
		if(Utilities.processResult(data,jqXHR,"블랙리스트 등록에 실패했습니다."))
		{
			alert("블랙리스트 등록에 성공했습니다.");
			Utilities.getOpener().search();
			Utilities.closeModal()
		}
	});
});

setToday(); 
</script>