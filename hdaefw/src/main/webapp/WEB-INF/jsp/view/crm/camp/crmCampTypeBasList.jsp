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

           
            <!-- 캠페인 유형관리 -->
            <div class="mBox1">
                <!-- title -->
                <div class="gTitle1">
                    <h3 class="mTitle1">캠페인 유형관리</h3>
                </div>
                <!-- //title -->
                <!-- list -->
                <div class="mDir1 mCustomScrollbar">
                    <div class="dep1">캠페인 유형</div>
                    <ul>
                       
                       
 						<c:forEach items="${typeList}" var="m"  varStatus="status">
                    
	                        <li>
	                            <a href="#" onclick="search2('${m.comnCd}')">${m.comnCdNm}</a>
	                        </li>
                        
                    	</c:forEach>
                        
                        
                        
                        
                    </ul>
                </div>
                <!-- //list -->
            </div>
            <!-- //캠페인 유형관리 -->
            
        </div>
        <!-- //left -->
		<!-- right -->
		<div class="gRight">

			<!-- sort -->
			
					
<form name="frmSearch" id="frmSearch">
 <input type="hidden" name="campTypeCd" id="campTypeCd" value="">
                       
                       
			<div class="mSort2">
				<ul>
					<li class="w32per">
						<div class="tit">사용여부</div>
						<div class="txt">
							<div class="mFlex2">
								<span class="flex">
                                     <select class="select " name="useYn"  id="useYn" title="사용여부">
                                        <option value="">전체</option>
                                        <option value="Y">사용</option>
                                        <option value="N">미사용</option>
                                    </select>
                                </span>
                                <span class="button">
                                    <a href="#" class="mBtn1" data-click="search2">검색</a>
                                </span>
                                
                                
                                 <span class="button" style="margin-left:20px">
                                    <a href="#" class="mBtn1 primary" data-click="newType" >신규</a>
                                </span>
							</div>
						</div>
					</li>
				</ul>
			</div>

</form>			
			<!-- //sort -->

			<!-- box -->
			<div class=" p24" id="mBox1">
				
				
				
				<div id="divGrid" style="height:520px"
						  data-post="Y"
						  data-grid-id="grdList"
						  data-pagenation="Y"
                    	data-block-ui="Y"
						  data-get-url="<c:url value='/crmCampTypeBas/getList'/>"
						  data-type="grid" 
						  data-tpl-url="<c:url value='/static/gridTemplate/camp/crmCampTypeBas.xml'/>"
						  >
						</div>
						
						
			</div>
			<!-- //box -->



	<!-- box -->
			<div class="mBox1 p24 hidden" id="mBox2">
				
				<div class="mGrid2">
                    <!-- left -->
                    <div class="lt" style="width:70%;">
                    
                    
                       <form name="frmDetail" id="frmDetail">
                       
                       <input type="hidden" name="campTypeBasNo" id="campTypeBasNo" value="">
                       <input type="hidden" name="stat" id="stat" value="C">
                        
                        <!-- view -->
                        <div class="mView1">
                            <!-- sort -->
                            <div class="mSort2">
                                <ul>
                                    <li class="w100per">
                                        <div class="tit w90">메세지 유형</div>
                                        <div class="txt">
                                            <div class="mFlex2">
                                                <span class="flex w2">
                                               
                                                
                                                    <select class="select w120 data-check" name="campTypeCd" id="campTypeCd" title="유형" >
	                                                    
	                                                     <option value="">선택</option>
	                                                     
		                                                    <c:forEach items="${typeList}" var="m"  varStatus="status">
		                                                        <option value="${m.comnCd}">${m.comnCdNm}</a>
		                                                    </c:forEach>
	                                                    
                                                    </select>
                                                    
                                                </span>
                                                
                                                <div class="tit w60">사용여부</div>
                                                <select class="select w120 data-check" name="useYn"  id="useYn" title="사용여부">
			                                        <option value="">선택</option>
			                                        <option value="Y">사용</option>
			                                        <option value="N">미사용</option>
			                                    </select>
			                                    
			                                     <div class="tit w60">형태</div>
                                               <code:commCode  className="select w160 data-check" id="campShapCd" name="campShapCd" codeCd="CM020" prefixLabel="캠페인형태" prefixValue=""/>
			                                    
			                                    
                                            </div>
                                            
                                           
                                    </li>
                                    <li class="w100per">
                                 
                                        
                                                 
                                    
                                   	  <div class="tit w90">구분</div>
                                        <div class="">
	                                           <code:commCode  className="select w160 data-check" id="campDivCd" name="campDivCd" codeCd="CM060" prefixLabel="구분" prefixValue=""/>
                                        </div>
                                        
                                        
                                        <div class="tit w90">유형명</div>
                                        <div class="txt">
                                            <input type="text" class="data-check it w240" title="유형명" name="campTypeBasNm" id="campTypeBasNm"  value="">
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <!-- //sort -->

                           
                    	</form>
                    
                    
                     	<div class="mButton1">
                              
                                <a href="#" class="mBtn1 w68 lGray" onclick="$('#frmDetail')[0].reset();search2();">목록</a>
                                <a href="#" class="mBtn1 w68 lGray" onclick="$('#frmDetail')[0].reset();">다시쓰기</a>
                                <a href="#" class="mBtn1 w68 lPrimary" data-click="save">저장</a>
                        </div>
                            
                            
                    </div>
                    <!-- //left -->
                </div>
						
			</div>
			<!-- //box -->
			
			
			
		</div>
		<!-- //right -->
	</div>
	
</div>




<script>


/* 공통코드 그리드 load */
function grdList_load(gridView, gridId) {
	search2();
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

	newType( gridView.getCurrentJson() );

}


/* 그리드 컬럼 더블 클릭 */
function onGridCellDblClick(gridView, rowIndex, columnName, colIndex,
		fieldIndex) {

}

function onGridRowChanged(gridView, oldRow, newRow) {

}

/* 검색조건 검색 */
function search2(campTypeCd) {
	

 	$("#mBox1").show();
 	$("#mBox2").hide();

 	$("#frmSearch #campTypeCd").val("");
 	if( typeof(campTypeCd) == "string" ){
 		$("#frmSearch #campTypeCd").val(campTypeCd);
 	}
 	
 	
 	
	$("form#frmSearch").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmSearch");
	param.recordCountPerPage = 20;
	grdList.loadUrl(url, param);
}



/* 캠페인상세 */
function newType( jData ){

	log( jData );

	if( typeof( jData.campTypeBasNo ) == "string") {
		mapToForm(jData,"frmDetail");
		$("#stat").val("U");
	}else{
		
		$("#frmDetail")[0].reset();
		$("#stat").val("C");
		
	}
	
	
 	$("#mBox1").hide();
 	$("#mBox2").show();
 	
}



/*  저장 */
function save(){
	var valid = validateForm("#frmDetail"); //  class='data-check' 인 경우만 체크
	
	if(valid) {
		
		var saveJson = Utilities.formToMap("frmDetail");
		

		var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
		Utilities.getAjax(url,saveJson,true,function(data,jqXHR){
	        if(Utilities.processResult(data,jqXHR,"유형관리 저장에 실패했습니다."))
	        {
	            alert("유형관리 저장이 완료되었습니다.");
	            search2();
	          
	        }
	    });
	
	}else{
		
		alert("필수 항목들을 기입해 주세요.");
		return false;
	}
}




</script>