<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="mPopup1">
    
    <!-- header -->
    <div class="title">
        <h1>캠페인 대상 - 발송 템플릿 선택</h1>
        <a href="#" data-click="closeModal" class="close">팝업 닫기</a>
    </div>
    <!-- //header -->

    <!-- cont -->
    <div class="cont">

        <div class="gTitle1 mb10">
            <h3 class="mTitle1">발송 템플릿 선택 </h3>
            <div class="gRt posT-5">
             	<input type="text" class="mBtn1 " data-type="phone" name="testSmsNo" id="testSmsNo" value="" placeholder="테스트발송 번호" style="background:#ffff;color:#000000;height:24px;" maxlength="11">
                <a href="#" class="mBtn1 lGray"  data-click="sndTstMsg">테스트발송</a>
                <a href="#" class="mBtn1 lPrimary" data-click="sndTemplet">선택</a>
            </div>
        </div>
        <!-- box -->
         
        <div class="mBox1 p5">
            <div class="mGrid3">
                <!-- board -->
                <div class="">
                 
                
                     <div class="mDir1  mCustomScrollbar" style="width:100px;float:left">
                        <ul>
                        
                       	 <li style="margin-bottom:20px">
	                            <label class="mCheckbox1">
	                                <span class="label hand" onclick="search()">전체</span>
	                            </label>
	                        </li>
	                        
	                        
	 						<c:forEach items="${chlList}" var="m"  varStatus="status">
	                    
	                        <li style="margin-bottom:20px">
	                            <label class="mCheckbox1">
	                               <%--  <input type="checkbox" title="${m.campDspChlNm}"  name="campDspBasNo" id="campDspBasNo" value="${m.campDspBasNo}"> --%>
	                                <span class="label hand" onclick="search('${m.campDspBasNo}')">${m.campDspChlNm}</span>
	                            </label>
	                        </li>
	                    	    
	                    	</c:forEach>
                    	 </ul> 
                    </div>
                    
                               
				<form name="frmSearch" id="frmSearch">

				 <input type="hidden" name="tmpltTypeCd" id="tmpltTypeCd" value="">
				 <input type="hidden" name="campBasNo" id="campBasNo" value="${campBasNo}">
				 <input type="hidden" name="dspCtntTypeNo" id="dspCtntTypeNo" value="${dspCtntTypeNo}">
				 <input type="hidden" name="z023Group" id="z023Group" value="${z023Group}">
				 <input type="hidden" name="sendType" id="sendType" value="">
           
                    <div class="mDir1  mCustomScrollbar" style="width:550px;float:left;border:none;margin-top:-30px">
                       
                       <div id="divGrid" style="height:400px"
						  data-post="Y"
						  data-grid-id="grdList"
						  data-pagenation="Y"
                    	data-block-ui="Y"
						  data-get-url="<c:url value='/cmmCampTempltBas/getList'/>"
						  data-type="grid" 
						  data-tpl-url="<c:url value='/static/gridTemplate/camp/cmmCampTempltBas2.xml'/>"
						  >
						</div>
                       
                    </div>
               
                <!-- //board -->
                
  </div>
               
                
                <!-- detail -->
                <div class="gRight" >
                    <div class="mDetail1"   style="border:1px solid #c4c4c4" >
                        <div class="tit">템플릿 내용보기</div>
                        <div class="scroll mCustomScrollbar" >
                            <div class="txt" id="templetTxt">
                            
                            </div>
                        </div>
                         <!-- <div class="button">
                           <a href="#" class="mBtn1 m lWhite">템플릿 내용 수정</a>
                        </div> -->
                    </div>
                </div>
                <!-- //detail -->
                
                </form>
            
        
        </div>
        
        </div>
        <!-- //box -->
        
    </div>
    <!-- //cont -->
	
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
	
	// grid radio boa 체크
	//grdList.check(newRow);
	var ctnt = rowData.tmpltCtnts;

	$("#templetTxt").html( ctnt );
	$("#z023Group").val( rowData.z023Group );
	$("#sendType").val( rowData.tmpltTypeCd );
	
	if( rowData.tmpltTypeCd == "BARCODE"){
		
		var imgName = rowData.barcodeImg;
		if( imgName != "" ){
			$("#templetTxt").append( "<img style='width:90%' src='${barcodeUrl}/"+ imgName +"' border=0>" );
		}
	}
	
}


function onGridLoad(gridView, gridId) {
	
}

function grdList_dataLoaded(grid, jsonList, data){
	
	$.each(jsonList, function(i){		
		if( "${dspCtntTypeNo}" == this.campTempltBasNo ){
			 grdList.check(i);
			 grdList_rowChanged(grid, 0 , i, this);
			
		}
		
	});
}

/* 그리드 컬럼 클릭 */
function onGridCellClick(gridView, rowIndex, columnName, colIndex, fieldIndex) {
}

function grdList_cellClick(gridView, itemIndex, column, index, field){

}


/* 그리드 컬럼 더블 클릭 */
function onGridCellDblClick(gridView, rowIndex, columnName, colIndex,
		fieldIndex) {

}

function onGridRowChanged(gridView, oldRow, newRow) {

}

/* 검색조건 검색 */
function search(campDspBasNo) {
	
 	$("#frmSearch #tmpltTypeCd").val("");
 	if( typeof(campDspBasNo) == "string" ){
 		$("#frmSearch #tmpltTypeCd").val(campDspBasNo);
 	}
 	
	$("form#frmSearch").find("#currentPageNo").val(1);
 	var url = "<c:url value='cmmCampTempltBas/getList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmSearch");
	param.recordCountPerPage = 20;
	grdList.loadUrl(url, param);
}


function sndTemplet(){
	

	log( grdList.getCheckedJson()[0] );
	log( grdList.getCurrentJson() );
	
	if( grdList.getCurrentJson() == null ){
		alert("템플릿을 선택해 주세요");
		return false;
	}

	var data = grdList.getCurrentJson();
	
	
	Utilities.getOpener().bindTemplet( data );
	closeModal();
	
}

// sms 전송 테스트
function sndTstMsg(){
	

	var data = grdList.getCurrentJson();
	
	if(data == null){
		data = grdList.getCheckedJson(); 
	}

	
	if(  $("#campBasNo").val() == "" ){	
		alert("캠페인이 저장된 후에 발송가능합니다.");
		return false;
	}


	if( data == null ){
		alert("템플릿을 선택해 주세요");
		return false;
	}

	
    
    if( $("#z023Group").val() != "09" &&  $("#z023Group").val() != "10" &&  $("#z023Group").val() != "11" ){
    	alert("캠페인용 템플릿만 전송가능합니다.");
    	return false;
    }
    
    

	if( $("#testSmsNo").val() == "" ){		
		alert("테스트 발송 번호를 입력해 주세요");
		$("#testSmsNo").focus();
		return false;
	}
	
	var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
    if( !regPhone.test( $("#testSmsNo").val() ) ) {
        alert('올바른 휴대전화번호가 아닙니다.');
        $("#testSmsNo").val('');
        $("#testSmsNo").focus();
        return false;
    }

	
	var statChk = "";
    var obj = new Object(); //key, value형태로 저장할 Object
    
    obj.testSmsNo = $("#testSmsNo").val();
    obj.campBasNo =  $("#campBasNo").val();
    obj.z023Group =  $("#z023Group").val();
    obj.sendType = $("#sendType").val();
	
    if(confirm( $("#testSmsNo").val() + " 번호로 테스트 전송하시겠습니까?")){
    
		var url = "<c:url value='${urlPrefix}/sndTstMsg${urlSuffix}'/>";
		Utilities.getAjax(url, obj, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "테스트 전송에 실패했습니다.")) {
				alert("테스트 전송을 완료하였습니다.");
				//closeModal();
			}
		});
	
    }
    
    
	
	
}

</script>


</body>
</html>