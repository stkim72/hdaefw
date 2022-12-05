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
		<input type="hidden" id="repHshldNo" name="repHshldNo" value="${vo.repHshldNo }"/>
<%--  	   	<input type="hidden" id="itgCustNo"  name="itgCustNo" value="${vo.itgCustNo }"/>  --%>
<%-- 	   	<input type="hidden" id="useTypeCd" name="useTypeCd" value="${vo.useTypeCd }"/> --%>
<%-- 	   	<input type="hidden" id="famlyRelCd" name="famlyRelCd" value="${vo.famlyRelCd }"/> --%>

    
	   	<input type="hidden" id="delYn" name="delYn" value="${vo.delYn }"/>
	   	<input type="hidden" id="amdrId" name="amdrId" value="${vo.amdrId }"/>
	   	<input type="hidden" id="amdDt" name="amdDt" value="${vo.amdDt }"/>
	   	<input type="hidden" id="regrId" name="regrId" value="${vo.regrId }"/>
	   	<input type="hidden" id="regDt" name="regDt" value="${vo.regDt }"/>
	   	<input type="hidden" id="regChlCd" name="regChlCd" value="${vo.regChlCd }"/>
	   	<input type="hidden" id="selectedFamCd" name="selectedFamCd" value="${vo.famlyRelCd }"/>
 		   		
		<div class="title">
	        <h1>${addMode? "가구정보 등록" : "가구정보 수정" }</h1>
	        <a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
	    </div>
	    
		<div class="cont">
	  	
			<div class="gTitle1 line">
				<h3 class="mTitle1">가구정보 상세정보</h3>	
				<div class="gRt">
					<code:btnGroup name="Contact" hideDelete="${addMode? true:false }" hideInsert="true" />

	            </div>	
	        </div>
	        <!-- board -->
	        <div class="mBoard2"> 
	            <table>
	                <caption>가구정보 상세정보</caption>
	                <colgroup>
	                    <col width="15%">
	                    <col width="*%">
	                    <col width="16%">
	                </colgroup>
	                <tbody>
	                    <tr>
							<th class="left" scope="row">관계코드</th>
							<td class="left" colspan="2">
								<code:commCode id="famlyRelCd" name="famlyRelCd" codeCd="CU040" prefixValue="" multiple="false" others="${vo.famlyRelCd eq '000' ? 'disabled' : null }"   selectedValue="${addMode eq true ? null :  vo.famlyRelCd}" />
							</td>
	                    </tr>	                
	                    <tr>
							
							<th scope="row" class="left">회원검색</th>
							<td colspan="2">
								<div class="mFlex2">
									<div class="mFind1">
										<span class="flex"><input type="text" class="it" id="custNm" name="custNm" placeholder="전체" title="회원명" ${addMode eq true ? "" : "disabled"} value="${vo.custNm }"></span>
<!-- 										<input type="text" class="it" title="통합회원번호" name="itgCustNo1" id="itgCustNo1" disabled="disabled"> -->
<!-- 										<a href="#;" data-click="popupCust" id="btnPopupCust" class="iFind">검색</a> -->
										<a href="#" class="iFind" data-click="searchPop" ${addMode eq true ? "disabled" : "" } >검색</a>
									</div>
									
									<input type="text" class="it" title="통합고객번호" name="itgCustNo" id="itgCustNo"  ${addMode eq true ? "" : "disabled"} value="${vo.itgCustNo }" />
									
								
								</div>
							</td>							
                        </tr>
	                    <tr>
							<th class="left" scope="row">사용유형코드</th>
							<td class="left" colspan="2">
								<code:commCode id="useTypeCd" name="useTypeCd" codeCd="CU070" prefixValue="" multiple="false"  selectedValue="${vo.useTypeCd }"/>
							</td>
	                    </tr>	                         
                                        
	                </tbody>
	            </table>

	        </div>
  	
		</div>
	</form>	



<script>

// 	$("#postStaDt").val(moment("${vo.postStaDt }").format("YYYYMMDD"));
//	$("#postEndDt").val(moment("${vo.postEndDt }").format("YYYYMMDD"));
	
	// 가구정보 등록 및 수정
	function saveContact(){
		var saveJson = Utilities.formToMap("frmMain");

		console.log("대표가구번호 : " , $("#repHshldNo").val() );
		console.log("대표가구번호 : " , saveJson.repHshldNo);
		
		if(!saveJson.famlyRelCd){
			alert("관계 유형을 입력하세요");
			$("#famlyRelCd")[0].focus();
			return;
			
		}
		
		console.log(saveJson.famlyRelCd);
		
		if(saveJson.famlyRelCd == '000' && $("#selectedFamCd").val() != "000"){
			alert("대표가구원이 이미 존재합니다. 본인은 한명만 있을 수 있습니다");
			$("#famlyRelCd")[0].focus();
			return;
			
		}	
	
		
		// 일단 주석
		// 가구정보에 등록된 가구원 이름 API에 없으므로 주석
// 		if(!saveJson.custNm){
// 			alert("회원을 선택 하세요");
// 			$("#custNm")[0].focus();
// 			return;
			
// 		}
		
		// 삭제 여부
		$("#delYn").val("N");
		// 삭제 여부
		$("#regChlCd").val("CRM");		

		var url = "<c:url value='${urlPrefix}/sub/cmmCustHshldBas/save${urlSuffix}'/>";

		Utilities.getAjax(url,saveJson,true,function(data , jqXHR){
            if(Utilities.processResult(data , jqXHR , "관계 저장에 실패했습니다."))
            {

                alert("관계 저장에 성공했습니다.");
                Utilities.getOpener().search1();
                Utilities.closeModal();
            }
        });
	}
	
	// 가구정보 삭제
	function removeContact()
	{
		var saveJsonDel = Utilities.formToMap("frmMain");
// 		// 삭제 여부
// 		$("#delYn").val("Y");
// 		// 삭제 여부
// 		$("#regChlCd").val("CRM");		
		if(saveJsonDel.famlyRelCd == '000'){
			alert("등록한 가족관계 그룹이 해제 됩니다.");
			$("#famlyRelCd")[0].focus();
			/* return; */
			
		}		
		
		var url = "<c:url value='${urlPrefix}/sub/cmmCustHshldBas/remove${urlSuffix}'/>";
	    console.log("확인 : "+saveJsonDel.famlyRelCd);
		Utilities.getAjax(url,saveJsonDel,true,function(data , jqXHR){
            if(Utilities.processResult(data , jqXHR , "관계 삭제에 실패했습니다."))
            {

                alert("관계 삭제에 성공했습니다.");
                Utilities.getOpener().search1();
                Utilities.closeModal();
            }
        });

	}

//  회원팝업을 띄운다
// 	function onAddressSelect(data){

// 		$("#zipCd").val(data.zipNo);
// 		$("#addr1Ctnts").val(data.roadAddr);

// 	}

// 	/* 주소 팝업을 호출한다 */
// 	function popupCust(){
// 		//회원검색 팝업을 호출 한다.
		
// 		// 임시로 현태리 등록
// 		// CST22052015533702813 , 김충성
// 		// CST22051710320158408 , 구본혁
// 		// CST22051617194457761 , 김블랙
		
// 		$("#itgCustNo1").val("CST22052015533702813");
// 		$("#custNm").val("김충성");
		
// 		// 파라미터 콜백 함수를 넣는다
// 		//Utilities.openZipPop("onAddressSelect");
// 	}

/* 회원목록 검색 팝업 로드 */
function searchPop(){
	
	// addMode는 페이지 이동시 컨트로러 에서 던저주는 플래그 랎이다
	// true이면 등록모드 false이면 수정모드이다
	var modeVal = $("#stat").val();
	if(modeVal == "c"){
		var url = "/util/searchCust";
	    Utilities.openModal(url,1000,600);			
	}else{
	
	}

}

/* 회원목록 검색 팝업 종료 후처리 */
function custNmSelect(data){
	$("#itgCustNo").val(data.itgCustNo);
//	$("#itgCustNo1").val(data.itgCustNo1);
	$("#custNm").val(data.custNm);
}

</script>