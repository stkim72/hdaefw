<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 




<div id="wrapIframe">
		
	<div class="mGrid1 type2"> <!-- class="type2" => left width="263px" -->
        <!-- left -->
        <div class="gLeft">

            <!-- 발송채널 관리 -->
            <div class="mBox1">
                <!-- title -->
                <div class="gTitle1">
                    <h3 class="mTitle1">발송채널 관리</h3>
                </div>
                <!-- //title -->
                <!-- list -->
                <div class="mDir1 form2 mCustomScrollbar"> <!-- class="form2" : checkbox만 있는 리스트 -->
                    <ul>
                         <c:forEach items="${chlList}" var="m"  varStatus="status">
                    
                        <li>
                            <label class="mCheckbox1">
                               <%--  <input type="checkbox" title="${m.campDspChlNm}"  name="campDspBasNo" id="campDspBasNo" value="${m.campDspBasNo}"> --%>
                                <span class="label hand" onclick="search('${m.campDspBasNo}')">${m.campDspChlNm}</span>
                            </label>
                        </li>
                        
                    </c:forEach>    
                    </ul>
                </div>
                <!-- //list -->
            </div>
            <!-- //발송채널 관리 -->
            
        </div>
        <!-- //left -->
		<!-- right -->
		<div class="gRight">

		
                       
                       

			<div class="mSort2">
			
			
<form name="frmSearch" id="frmSearch">
 <input type="hidden" name="chlTypeCd" id="chlTypeCd" value="">
 
 
				<ul>
					<li class="w32per">
						<div class="tit">발송채널명</div>
						<div class="txt">
							 <input type="text" class="it" name="chlNm" id="chlNm" value="">
						</div>
					</li>
					<li class="w40per">
						<div class="tit">사용여부</div>
						<div class="txt">
							<div class="mFlex2">
								<span class="flex">
                                   <select class="select w120" name="useYn"  id="useYn" title="사용여부">
                                        <option value="">전체</option>
                                        <option value="Y">사용</option>
                                        <option value="N">미사용</option>
                                    </select>
                                </span>
                                <span class="button">
                                    <a href="#" class="mBtn1" data-click="search">검색</a>
                                </span>
                                
                                 <span class="button" style="margin-left:20px">
                                    <a href="#" class="mBtn1 primary" data-click="newTemplt" >신규</a>
                                </span>
							</div>
						</div>
					</li>
				</ul>
				
			
			
</form>
			</div>
			<!-- //sort -->

			<!-- box -->
				
				<div class="gTitle1">
					<h3 class="mTitle1">발송채널 목록</h3>
					<div class="gRt">
						<!-- <a href="#" class="mBtn1 gray">엑셀다운로드</a> -->
					</div>
				</div>
				
				
				
				<div id="divGrid" style="height:520px"
						  data-post="Y"
						  data-grid-id="grdList"
                    	data-block-ui="Y"
						  data-pagenation="Y"
						  data-get-url="<c:url value='/cmmCampChlBas/getList'/>"
						  data-type="grid" 
						  data-tpl-url="<c:url value='/static/gridTemplate/camp/cmmCampChlBas.xml'/>"
						  >
					
						
			</div>
			<!-- //box -->
			
			
				<!-- box -->
			<div class="mBox1 p24 hidden" id="mBox2">
			
			     
                     <form name="frmDetail" id="frmDetail">
                       
                       <input type="hidden" name="campChlBasNo" id="campChlBasNo" value="">
                       <input type="hidden" name="stat" id="stat" value="C">
                       
                       
                       
					 <!-- grid -->
                <div class="mGrid2">
                    <!-- left -->
                    <div class="lt">
                    
               
                       
                        <div class="gTitle1 line">
                            <h3 class="mTitle1">기본정보</h3>
                        </div>
                        <!-- board -->
                        <div class="mBoard2"> 
                            <table>
                                <caption>고객정보</caption>
                                <colgroup>
                                    <col width="12%">
                                    <col width="21%">
                                    <col width="12%">
                                    <col width="21%">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th class="left" scope="row">발송채널 ID</th>
                                        <td>
                                            <input type="text" class="it data-check" title="발송채널 ID" name="chlId" id="chlId" value="">
                                        </td>
                                     
                                        <th class="left" scope="row">발송채널명</th>
                                        <td>
                                            <select class="select  data-check" name="chlTypeCd" id="chlTypeCd" title="유형" >
                                                    
	                                                    
	                                                     <option value="">선택</option>
	                                                     
		                                                    <c:forEach items="${chlList}" var="m"  varStatus="status">
		                                                        <option value="${m.campDspBasNo}">${m.campDspChlNm}</option>
		                                                    </c:forEach>
	                                                    
                                                    </select>
                                        </td>
                                    </tr>
                                    
                                     <tr>
                                     
                                        <th class="left" scope="row">발송 채널명</th>
                                        <td>
                                            <input type="text" class="it data-check" title="발송 채널명" name="chlNm" id="chlNm" value="">
                                        </td>
                                        <th class="left" scope="row">프로토콜</th>
                                        <td>
                                            <select class="select data-check" title="프로토콜" name="chlProtCd" id="chlProtCd" >
                                                <option value="">선택</option>
                                                <option value="restapi">REST API</option>
                                            </select>
                                        </td>
                                    </tr>
                                    
                                     
                                     <tr>
                                     
                                        <th class="left" scope="row">사용여부</th>
                                        <td  colspan="3">
                                           <select class="select " name="useYn"  id="useYn" title="사용여부">
		                                        <option value="">전체</option>
		                                        <option value="Y">사용</option>
		                                        <option value="N">미사용</option>
		                                    </select>
                                        </td>
                                        
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- //board -->
                        
                        <div class="gTitle1 line">
                            <h3 class="mTitle1">로그정보</h3>
                        </div>
                        <!-- board -->
                        <div class="mBoard2"> 
                            <table>
                                <caption>로그정보</caption>
                                <colgroup>
                                    <col width="20%">
                                    <col width="21%">
                                    <col width="20%">
                                    <col width="21%">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th class="left" scope="row">마지막 성공일</th>
                                        <td  id="">
                                            <input type="text" class="it" title="성공일" name="lastSuccDate" id="lastSuccDate" value="" disabled>
                                            
                                        </td>
                                        <th class="left" scope="row">마지막 오류일</th>
                                        <td class="br0"  id="">
                                            <input type="text" class="it" title="오류일" name="lastErrDate" id="lastErrDate" value="" disabled>
                                           
                                        </td>
                                        <td class="br0 bl0"></td>
                                        <td class="bl0"></td>
                                    </tr>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- //board -->
                        
                        <div class="gTitle1 line">
                            <h3 class="mTitle1">등록자 정보</h3>
                        </div>
                        <!-- board -->
                        <div class="mBoard2"> 
                            <table>
                                <caption>등록자 정보</caption>
                                <colgroup>
                                    <col width="12%">
                                    <col width="*">
                                    <col width="12%">
                                    <col width="*">
                                    <col width="12%">
                                    <col width="*">
                                    <col width="12%">
                                    <col width="*">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th class="left" scope="row">최초 등록자</th>
                                        <td>
                                            <input type="text" class="it" title="최초 등록자" name="regrId" id="regrId" value="" disabled>
                                        </td>
                                        <th class="left" scope="row">최초 등록일</th>
                                        <td class="br0">
                                            <input type="text" class="it " data-type="number" title="최초 등록일" name="regDt" id="regDt" value="" disabled>
                                        </td>
                                        <th class="left" scope="row">최초 수정자</th>
                                        <td class="br0">
                                            <input type="text" class="it" title="최초 등록자" name="amdrId" id="amdrId" value="" disabled>
                                        </td>
                                        <th class="left" scope="row">최초 수정일</th>
                                        <td class="br0">
                                            <input type="text" class="it"  data-type="number"  title="최초 등록일" name="amdDt" id="amdDt" value="" disabled>
                                        </td>
                                    </tr>
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
                            <h3 class="mTitle1">부가정보</h3>
                        </div>
                        <!-- board -->
                        <div class="mBoard2"> 
                            <table>
                                <caption>부가정보</caption>
                                <colgroup>
                                    <col width="20%">
                                    <col width="21%">
                                    <col width="16%">
                                    <col width="*">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th class="left" scope="row">담당자</th>
                                        <td>
                                            <input type="text" class="it data-check" title="담당자" name="picNm" id="picNm" value="">
                                        </td>
                                        <th class="left" scope="row">담당자 연락처</th>
                                        <td class="br0">
                                            <input type="text" class="it data-check"  title="담당자 연락처" name="picMphonNo" id="picMphonNo" value="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="left" scope="row">접속정보</th>
                                        <td colspan="3">
                                            <textarea class="textarea data-check"   title="접속정보" rows="7"  name="connInfo" id="connInfo" ></textarea>
                                            
                                        </td>
                                    </tr>
                                    
                                     <tr>
                                        <th class="left" scope="row">API경로 및 호출정보</th>
                                        <td colspan="3">
                                            <textarea class="textarea data-check"   title="API경로 및 호출정보" rows="3"  name="apiCallInfo" id="apiCallInfo" ></textarea>
                                            
                                        </td>
                                    </tr>
                                </tr>
                                </tbody>
                            </table>
                            
                       
                        </div>
                        <!-- //board -->  
                        
                             <div class="mButton1" style="margin-top:30px">
                                
                                <a href="#" class="mBtn1 w68 lGray" onclick="$('#frmDetail')[0].reset();">다시쓰기</a>
                                <a href="#" class="mBtn1 w68 lPrimary" data-click="save">저장</a>
                            </div> 
                            
				
                          
                    </div>
                    <!-- //right -->
                    
                  
                            
                </div>
                <!-- //grid -->
				
			</div>
			     

		</div>
		<!-- //right -->
                </div>
                <!-- //grid -->
				
				</form>
				
			</div>
			<!-- //box -->

		</div>
		<!-- //right -->
	</div>
	
</div>



<script>
var _current_code_cd = null;


/* 공통코드 그리드 load */
function grdList_load(gridView, gridId) {
	search();
}

/* 하부코드 그리드 load */
function grdDetail_load(gridView, gridId) {
}

/* 공통코드 Row클릭 시 */
function grdList_rowChanged(grdList, oldRow, newRow, rowData) {
	
}


function onGridLoad(gridView, gridId) {
}



/* 그리드 컬럼 클릭 */
function onGridCellClick(gridView, rowIndex, columnName, colIndex, fieldIndex) {

}

function grdList_cellClick(gridView, itemIndex, column, index, field){

	newTemplt( gridView.getCurrentJson() );
}



/* 그리드 컬럼 더블 클릭 */
function onGridCellDblClick(gridView, rowIndex, columnName, colIndex,
		fieldIndex) {

}

function onGridRowChanged(gridView, oldRow, newRow) {

}

/* 검색조건 검색 */
function search(campDspBasNo) {
	
 	$("#mBox1").show();
 	$("#mBox2").hide();

 	$("#frmSearch #chlTypeCd").val("");
 	if( typeof(campDspBasNo) == "string" ){
 		$("#frmSearch #chlTypeCd").val(campDspBasNo);
 	}
 	
	$("form#frmSearch").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getChlList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmSearch");
	param.recordCountPerPage = 20;
	grdList.loadUrl(url, param);
}

/* 발송채널상세 */
function newTemplt( jData ){

	if( typeof( jData.campChlBasNo ) == "string") {
		mapToForm(jData,"frmDetail");
		$("#stat").val("U");
	}else{		
		$("#frmDetail")[0].reset();
		$("#stat").val("C");
	}
	
	
 	$("#mBox1").hide();
 	$("#mBox2").show();
 	
 	
}





/* 대분류 저장 */
function save(){
	var valid = validateForm("#frmDetail"); //  class='data-check' 인 경우만 체크
	
	if(valid) {
		
		var saveJson = Utilities.formToMap("frmDetail");
		

		var url = "<c:url value='${urlPrefix}/saveChl${urlSuffix}'/>";
		Utilities.getAjax(url,saveJson,true,function(data,jqXHR){
	        if(Utilities.processResult(data,jqXHR,"발송채널 저장에 실패했습니다."))
	        {
	            alert("발송채널 저장이 완료되었습니다.");
	            search();
	          
	        }
	    });
	
	}else{
		
		alert("필수 항목들을 기입해 주세요.");
		return false;
	}
}


</script>
