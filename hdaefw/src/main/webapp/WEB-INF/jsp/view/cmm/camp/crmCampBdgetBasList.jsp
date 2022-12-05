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
        
        
 	

            <!-- 조직별 발송 예산관리 -->
            <div class="mBox1">
                <!-- title -->
                <div class="gTitle1">
                    <h3 class="mTitle1">조직별 발송 예산관리</h3>
                </div>
                <!-- //title -->
                <div class="gRt">
					<div class="mFlex2">
                        <span class="flex">
                                  <input type="text" id="sWord" name="sWord" class="it" data-type="searchTree" data-tree="divTree" title="조직명" value="">
                        </span>
                        <a href="#;" class="mBtn1 m " data-type="searchTreeBtn" data-tree="divTree">검색</a>
                        </div>
<!-- 					<a href="#" data-click="syncOrg" id="btnSaveMenuDetail" class="mBtn1 m lWhite" style="cursor: pointer;">동기화</a> -->
					</div>

				
			<div class="tree mCustomScrollbar btnTopMargin" style="height:${leftBoxHeight1}">
                <div id="divTree"  style="height:100%" 
                data-type="tree" 
                    	data-block-ui="Y"
				data-get-url="<c:url value='organization/getTreeList'/>${urlSuffix}"
				data-change-seq="N"
				data-search="Y"
				>
				
			</div>

		</div>

            </div>
            
           
            <!-- //조직별 발송 예산관리 -->
            
        </div>
        <!-- //left -->
		<!-- right -->
		<div class="gRight">



 	
			<!-- sort -->
			<div class="mSort2">
			
			
 <form role="form" id="frmSearch" name="frmSearch">
 
 	<input type="hidden" name="orgId" id="orgId" value="">
 	
				<ul>
					<li class="w28per">
						<div class="tit">해당연도</div>
						<div class="txt">
                           
								<select class="select  data-check" title="시간"  name="applyYear" id="applyYear">
                                  <option value="">선택</option>
                                  <c:set var="start" value="2022" />												
						          <c:forEach begin="0" end="8" var="idx" step="1">							
						           <c:choose>
							          <c:when test="${ (start + idx) < 10 }">					
							           	<option value="<c:out value="0${start + idx}" />"   ><c:out value="0${start + idx}" /></option>
							           </c:when>
						           		<c:when test="${ (start + idx) >= 10 }">					
							           	<option value="<c:out value="${start + idx}" />"   ><c:out value="${start + idx}" /></option>
							           </c:when>
						           </c:choose>
						          </c:forEach>
                             </select>									          
						</div>
					</li>
					<li class="w40per">
						<div class="tit">부서명</div>
						<div class="txt">
							<div class="mFlex2">
								<span class="flex">
                                    <input type="text" class="it" title="부서명" name="orgNm" id="orgNm" value="">
                                </span>
                               <!--  <a href="#" class="mBtn1 lWhite">버튼</a> -->
                                <span class="button">
                                    <a href="#" class="mBtn1" data-click="search" >검색</a>
                                </span>
							</div>
						</div>
					</li>
				</ul>
				
				
</form>


			</div>
			<!-- //sort -->
			<!-- box -->
			<div class=" p24" id="mBox1" style="margin-top:15px">
				
				<div class="gTitle1">
					<h3 class="mTitle1">예산관리 목록</h3>
					<div class="gRt">
						<a href="#" class="mBtn1 lPrimary" data-click="newBdget">신규등록</a>
					</div>
				</div>
				<!-- board -->
				
				
				
				<div id="divGrid" class='' 
						style="height:${rightBoxHeight3}" 
						data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>"
      					data-grid-id="grdList" 
      					data-type="grid" 
      					data-tpl-url="<c:url value='/static/gridTemplate/camp/cmmCampBdgetBas.xml'/>">
      
      
			</div>
			</div>
			<!-- //box -->
			
			
			
			
				<!-- box -->
			<div class=" p24 hidden" id="mBox2" style="margin-top:15px">
			
			     
                     <form name="frmDetail" id="frmDetail">
                       
                       <input type="hidden" name="orgId" id="orgId" value="">
                       <input type="hidden" name="bdgetBasNo" data-type="number" id="bdgetBasNo" value="">
                       <input type="hidden" name="stat" id="stat" value="C">
                       
                       
                       
					 <!-- grid -->
                <div class="mGrid2">
                    <!-- left -->
                    <div class="lt">
                    
               
                       
                        <div class="gTitle1 line">
                            <h3 class="mTitle1">예상등록 상세</h3>
                        </div>
                        <!-- board -->
                        <div class="mBoard2"> 
                            <table>
                                <caption>고객정보</caption>
                                <colgroup>
                                    <col width="12%">
                                    <col width="21%">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th class="left" scope="row">해당연도</th>
                                        <td>
                                           
                                            <select class="select  data-check" title="시간"  name="applyYear" id="applyYear">
                                            	<option value="">선택</option>
                                              <c:set var="start" value="2022" />												
									          <c:forEach begin="0" end="8" var="idx" step="1">							
									           <c:choose>
										          <c:when test="${ (start + idx) < 10 }">					
										           	<option value="<c:out value="0${start + idx}" />"   <c:if test="${cpinfo.applyYear == '0'+ (start + idx)}"><c:out value="selected" /></c:if> ><c:out value="0${start + idx}" /></option>
										           </c:when>
									           		<c:when test="${ (start + idx) >= 10 }">					
										           	<option value="<c:out value="${start + idx}" />"   <c:if test="${cpinfo.applyYear == start + idx}"><c:out value="selected" /></c:if> ><c:out value="${start + idx}" /></option>
										           </c:when>
									           </c:choose>
									          </c:forEach>
                                            </select>
									          
									          
                                        </td>
                                    </tr>
                                    
                                     <tr>
                                     
                                        <th class="left" scope="row">부서명</th>
                                        <td>
                                            <input type="text" class="it data-check" title="부서명" name="orgIdNm" id="orgIdNm" value="" readonly >
                                        </td>
                                       
                                    </tr>
                                    
                                         
                                     <tr>
                                     
                                        <th class="left" scope="row">예상건수</th>
                                        <td>
                                            <input type="text" class="it data-check" title="예상건수" data-type="number" name="bdgetCnt" id="bdgetCnt" value="">
                                        </td>
                                       
                                    </tr>
                                    
                                           
                                     <tr>
                                     
                                        <th class="left" scope="row">상태</th>
                                        <td>
                                        
                                           <select class="select data-check" name="statusCd" id="statusCd">
                                           		<option value="">선택</option>
                                           		<option value="001">확정</option>
                                           		<option value="002">대기</option>                                           
                                           </select>
                                           
                                        </td>
                                       
                                    </tr>
                                    
                                    
                                </tbody>
                            </table>
                        </div>
                        <!-- //board -->
                       
                        
                      
                        <!-- //board -->      
                        
                        <div class="mButton1" style="margin-top:30px">
                                
                                <!-- <a href="#" class="mBtn1 w68 lGray" onclick="$('#frmDetail')[0].reset();">다시쓰기</a> -->
                                <a href="#" class="mBtn1 w68 lPrimary" data-click="save">저장</a>
                            </div> 
                                              
                    </div>
                    <!-- //left -->
                   

                    
                  
                            
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


function onTreeSelect(data,node,tree){
	
	//log('data = '+  data );
	
 	
	Utilities.mapToForm(data,frmSearch);
 	Utilities.mapToForm(data,frmDetail);
	search();
	
}



/* 공통코드 그리드 load */
function grdList_load(gridView, gridId) {	
}

/* 하부코드 그리드 load */
function grdDetail_load(gridView, gridId) {
}

/* 공통코드 Row클릭 시 */
function grdList_rowChanged(grdList, oldRow, newRow, rowData) {
	//log( 'rowChange = '+ rowData );
}



/* 공통코드 Row클릭 시 */
function grdTree_rowChanged(grdList, oldRow, newRow, rowData) {
	
}


function onGridLoad(gridView, gridId) {
}



/* 그리드 컬럼 클릭 */
function onGridCellClick(gridView, rowIndex, columnName, colIndex, fieldIndex) {
	
	newBdget( gridView.getCurrentJson() );

}

function grdTree_cellClick(gridView, itemIndex, column, index, field){
	
}


/* 그리드 컬럼 더블 클릭 */
function onGridCellDblClick(gridView, rowIndex, columnName, colIndex,
		fieldIndex) {

}

function onGridRowChanged(gridView, oldRow, newRow) {

}

/* 검색조건 검색 */
function search() {
	

 	$("#mBox1").show();
 	$("#mBox2").hide();

	$("form#frmSearch").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmSearch");
	param.recordCountPerPage=20;
	grdList.loadUrl(url, param);
}





/* 대분류 저장 */
function save(){
	var valid = validateForm("#frmDetail"); //  class='data-check' 인 경우만 체크
	
	if(valid) {
		
		var saveJson = Utilities.formToMap("frmDetail");
		

		var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
		Utilities.getAjax(url,saveJson,true,function(data,jqXHR){
	        if(Utilities.processResult(data,jqXHR,"예상건수 저장에 실패했습니다."))
	        {
	            alert("예상건수 저장이 완료되었습니다.");
	            search();
	          
	        }
	    });
	
	}else{
		
		alert("필수 항목들을 기입해 주세요.");
		return false;
	}
}

function newBdget( jData ){

	if( typeof( jData.bdgetBasNo ) == "string") {
		log( 'jData = '+ jData.orgIdNm );
		Utilities.mapToForm(jData,"frmDetail");
		$("#stat").val("U");
	}else{		
		//$("#frmDetail")[0].reset();
		$("#stat").val("C");
	}
	
	
 	$("#mBox1").hide();
 	$("#mBox2").show();
 	
}

</script>