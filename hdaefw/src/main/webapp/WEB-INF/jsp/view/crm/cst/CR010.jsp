<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%>
<c:set var="addMode" value="${addMode==true}" />

	
	<form id="frmMain">
 
		<input type="hidden" id="stat" name="stat" value="${addMode ? 'c' : 'u'}"/>
		<input type="hidden" id="cntplcSeq" name="cntplcSeq" value="${vo.cntplcSeq }"/>
	   	<input type="hidden" id="itgCustNo"  name="itgCustNo" value="${vo.itgCustNo }"/>
	   	<!-- 
	   	<input type="hidden" id="cntplcTypeCd" name="cntplcTypeCd" value="${vo.cntplcTypeCd }" /> 
	   	<input type="hidden" id="repCntplcYn" name="repCntplcYn" value="${vo.repCntplcYn }" />
	   	<input type="hidden" id="telNo" name="telNo" value="${vo.telNo }"/>
	   	-->
	   	<input type="hidden" id="telNoEncVal" name="telNoEncVal" value="${vo.telNoEncVal }"/>
	   	<input type="hidden" id="telBkDgtNo" name="telBkDgtNo" value="${vo.telBkDgtNo }"/>
	   	<!-- 
	   	<input type="hidden" id="zipCd" name="zipCd" value="${vo.zipCd }"/>
	   	<input type="hidden" id="addr1Ctnts" name="addr1Ctnts" value="${vo.addr1Ctnts }"/>
	   	<input type="hidden" id="addr2Ctnts" name="addr2Ctnts" value="${vo.addr2Ctnts }"/>
	   	-->
	   	<input type="hidden" id="emailAddr" name="emailAddr" value="${vo.emailAddr }"/>
	   	<input type="hidden" id="regChlCd" name="regChlCd" value="${vo.regChlCd }"/>
	   	<input type="hidden" id="delYn" name="delYn" value="${vo.delYn }"/>
	   	<input type="hidden" id="amdrId" name="amdrId" value="${vo.amdrId }"/>
	   	<input type="hidden" id="amdDt" name="amdDt" value="${vo.amdDt }"/>
	   	<input type="hidden" id="regrId" name="regrId" value="${vo.regrId }"/>
	   	<input type="hidden" id="regDt" name="regDt" value="${vo.regDt }"/>
 		   		
		<div class="title">
	        <h1>${addMode? "연락처 등록" : "연락처 수정" }</h1>
	        <a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
	    </div>
	    
		<div class="cont">
	  	
			<div class="gTitle1 line">
				<h3 class="mTitle1">연락처 상세정보</h3>	
				<div class="gRt">
					<button class="mBtn1" data-click="saveRepCntplc">대표연락처설정</button>
					<code:btnGroup name="Contact" hideDelete="${addMode? true:false }" hideInsert="true" />
					
	            </div>	
	        </div>
	        <!-- board -->
	        <div class="mBoard2"> 
	            <table>
	                <caption>연락처 상세정보</caption>
	                <colgroup>
	                    <col width="15%">
	                    <col width="*%">
	                    <col width="16%">
	                </colgroup>
	                <tbody>
	                    <tr>
							<th class="left" scope="row">연락처유형</th>
							<td class="left" colspan="2">
								<code:commCode id="cntplcTypeCd" name="cntplcTypeCd" codeCd="CU300" prefixValue="" multiple="false" selectedValue="${vo.cntplcTypeCd }"/>
							</td>
	                    </tr>	                
	                    <tr>
	                        <th scope="row" class="left"><span class="iMust">연락처</span></th>
	                        <td colspan="2">
	                            <input type="text" class="it must" title="연락처" name="telNo" id="telNo" value="${vo.telNo }" >
	                        </td>
<!-- 	                        <td> -->
<!-- 	                            <a href="#" class="mBtn1 m lWhite">중복체크</a> -->
<!-- 	                        </td>	                         -->
	                    </tr>
	                    <tr>
							<th scope="row" class="left">우편번호</th>
							<td class="left" colspan="2">
								<div class="mFlex2">
									<div class="mFind1">
										<input type="text" class="it" title="우편번호" name="zipCd" id="zipCd" value="${vo.zipCd }" readonly="readonly" >
										<!-- <a href="#" class="iFind">검색</a>  -->
										<!-- 우편번호 팝업을 호출  -->
										<a href="#" data-click="popupZip" id="btnPopupZip" class="iFind">검색</a>
									</div>
								</div>
							</td>
                        </tr>

	                    <tr>
							<th scope="row" class="left">주소</th>
							<td class="left" colspan="2">
								<div class="mFlex2">
									<input type="text" class="it" title="주소" name="addr1Ctnts" id="addr1Ctnts" value="${vo.addr1Ctnts }" readonly="readonly">
								</div>
							</td>
                        </tr>
	                    <tr>
							<th scope="row" class="left">상세주소</th>
							<td class="left" colspan="2">
								<div class="mFlex2">
									<input type="text" class="it" title="상세주소" name="addr2Ctnts" id="addr2Ctnts" value="${vo.addr2Ctnts }" >
								</div>
							</td>
                        </tr>        
<!-- 	                    <tr> -->
<!-- 							<th scope="row" class="left">주연락처여부</th> -->
<!-- 							<td class="left" colspan="2"> -->
<!-- 								<label class="mCheckbox1"> -->
<%-- 									<input type="checkbox" title="주연락처여부" name="repCntplcYn" id="repCntplcYn" value="${vo.repCntplcYn }" > --%>
<!-- 									<span class="label">주연락처여부</span> -->
<!-- 								</label> -->
<!-- 							</td> -->
<!--                         </tr>                                                                     -->
	                </tbody>
	            </table>

	        </div>
  	
		</div>
	</form>	



<script>

// 	$("#postStaDt").val(moment("${vo.postStaDt }").format("YYYYMMDD"));
//	$("#postEndDt").val(moment("${vo.postEndDt }").format("YYYYMMDD"));
	
	// 연락처 등록 및 수정
	function saveContact(){
		var saveJson = Utilities.formToMap("frmMain");
		if(!saveJson.cntplcTypeCd){
			alert("연락처 유형을 입력하세요");
			$("#cntplcTypeCd")[0].focus();
			return;
			
		}
		if(!saveJson.telNo){
			alert("연락처를 입력하세요");
			$("#telNo")[0].focus();
			return;
			
		}
		
		// 주연락처 여부
		$("#repCntplcYn").prop("checked")? $("#repCntplcYn").val("Y") : $("#repCntplcYn").val("N");
		// 삭제 여부
		$("#delYn").val("N");
		// 삭제 여부
		$("#regChlCd").val("CRM");		

		var url = "<c:url value='${urlPrefix}/sub/crmCustCntplcBas/save${urlSuffix}'/>";
		Utilities.getAjax(url,saveJson,true,function(data , jqXHR){
            if(Utilities.processResult(data , jqXHR , "연락처 저장에 실패했습니다."))
            {
            	
                alert("연락처 저장에 성공했습니다.");
                Utilities.getOpener().search1();
                Utilities.closeModal();
            }
        });
	}
	
	// 연락처 삭제
	function removeContact()
	{
		Utilities.getOpener().deleteContact($("#cntplcSeq").val());
		Utilities.closeModal();
	}
	
	function onAddressSelect(data){

		$("#zipCd").val(data.zipNo);
		$("#addr1Ctnts").val(data.roadAddr);

	}
	
	/* 주소 팝업을 호출한다 */
	function popupZip(){
		
		// 파라미터 콜백 함수를 넣는다
		Utilities.openZipPop("onAddressSelect");
	}
	
	function saveRepCntplc(){
		var bConfirm = confirm("대표연락처로 설정하시겠습니까?");
		if(!bConfirm){
			return;
		}
		
		var param = Utilities.formToMap("frmMain");
		
		var url = "<c:url value='${urlPrefix}/saveRepCntplc${urlSuffix}'/>";
		Utilities.getAjax(url,param,true,function(data,jqXHR){
			if(Utilities.processResult(data,jqXHR,"수정에 실패했습니다."))
			{
				alert("대표연락처로 설정되었습니다.");
				Utilities.getOpener().search1();
				Utilities.closeModal();
			}
		});
	}
</script>