<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 


<script type="text/javascript" src="/static/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>


<div id="wrapIframe">
		
	<div class="mGrid1 type2"> <!-- class="type2" => left width="263px" -->
        <!-- left -->
        <div class="gLeft">

            <!-- 발송채널 관리 -->
            <div class="mBox1">
                <!-- title -->
                <div class="gTitle1">
                    <h3 class="mTitle1">발송 템플릿 관리</h3>
                </div>
                <!-- //title -->
                <!-- list -->
                <div class="mDir1 form2 mCustomScrollbar"> <!-- class="form2" : checkbox만 있는 리스트 -->
                
                    <ul>
                    
                      <li>
                            <label class="mCheckbox1">
                               <%--  <input type="checkbox" title="${m.campDspChlNm}"  name="campDspBasNo" id="campDspBasNo" value="${m.campDspBasNo}"> --%>
                                <span class="label hand" onclick="search()">전체</span>
                            </label>
                        </li>
                        
                        
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
 <input type="hidden" name="tmpltTypeCd" id="tmpltTypeCd" value="">
          
				<ul>
					<li class="w32per">
						<div class="tit">템플릿명</div>
						<div class="txt">
							 <input type="text" class="it" name="tmpltNm" id="tmpltNm" value="">
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
                                
                               <!--   <span class="button" style="margin-left:20px">
                                    <a href="#" class="mBtn1 primary" data-click="newTemplt" >신규</a>
                                </span> -->
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
					<h3 class="mTitle1">템플릿 목록</h3>
					<div class="gRt">
						<!-- <a href="#" class="mBtn1 gray">엑셀다운로드</a> -->
					</div>
				</div>
				
				
				
				<div id="divGrid" style="height:520px"
						  data-post="Y"
						  data-grid-id="grdList"
						  data-pagenation="Y"
						  data-get-url="<c:url value='/cmmCampTempltBas/getList'/>"
						  data-type="grid" 
                    	data-block-ui="Y"
						  data-tpl-url="<c:url value='/static/gridTemplate/camp/cmmCampTempltBas.xml'/>"
						  >
						</div>
						
			</div>
			<!-- //box -->
			
			
			
				<!-- box -->
			<div class=" hidden" id="mBox2" style="margin-top:15px">
				
				<div class="mGrid2">
                    <!-- left -->
                    <div class="lt" style="width:100%;">
                    
                        <!-- view -->
                        <div class="mView1">
                        
                        
                    
                       <form name="frmDetail" id="frmDetail">
                       
                       <input type="hidden" name="campTempltBasNo" id="campTempltBasNo" value="">
                       <input type="hidden" name="stat" id="stat" value="C">
                        
                        
                        
                            <!-- sort -->
                            <div class="mSort2">
                                <ul>
                                    <li class="w100per">
                                        <div class="tit w90">메세지 유형</div>
                                        <div class="txt">
                                            <div class="mFlex2">
                                                <span class="flex w2">
                                                
                                                    <div  title="유형" >
                                                     <input type="text" class="data-check it " title="발송 템플릿 명" name="tmpltTypeCd" id="tmpltTypeCd"  value="" readonly>
	                                                </div>
	                                                
                                                </span>
                                                
                                                <div class="tit w60">사용여부</div>
                                                
                                                <select class="select w120 data-check" name="useYn"  id="useYn" title="사용여부">
			                                        <option value="">선택</option>
			                                        <option value="Y">사용</option>
			                                        <option value="N">미사용</option>
			                                    </select>
			                                    
                                            </div>
                                            
                                           
                                    </li>
                                    <li class="w100per">
                                        <div class="tit w90">발송 템플릿 명</div>
                                        <div class="txt"  >
                                            <input type="text" class="data-check it " title="발송 템플릿 명" name="tmpltNm" id="tmpltNm"  value="" readonly>
                                        </div>
                                    </li>
                                    
                                    
                                    <li class="w100per">
                                     
                                        <div class="txt">
                                            <div class="mFlex2">
                                            
                                               <div class="tit w60">바코드타입</div>
                                                
                                              <input type="text"  class=" it "  style="width:100px"  maxlength="10" title="바코드타입"  name="barcodeType" id="barcodeType" value="" readonly>
                                             
                                                
                                                <div class="tit w60">바코드생성폭</div>
                                                    <input type="text"  class=" it comma " data-type="number2" style="width:100px"  maxlength="8" title="바코드생성폭"  name="barcodeWidth" id="barcodeWidth" value="" readonly>
                                                 
                                                
                                                  <div class="tit w60">바코드생성높이</div>
                                                    <input type="text"  class=" it comma " data-type="number2"  style="width:100px"  maxlength="8" title="바코드생성높이"  name="barcodeHeight" id="barcodeHeight" value="" readonly>
                                                 
                                                   <div class="tit w60">바코드삽입위치 X 좌표</div>
                                                    <input type="text"  class=" it comma  " data-type="number2"  style="width:100px"  maxlength="8" title="바코드삽입위치 X 좌표"  name="barcodePosX" id="barcodePosX" value="" readonly>
                                                 
											          
                                               
												<div class="tit w60">바코드삽입위치 Y 좌표</div>
                                                    <input type="text"  class=" it comma " data-type="number2"  style="width:100px"  maxlength="8" title="바코드삽입위치 Y 좌표"  name="barcodePosY" id="barcodePosY" value="" readonly>
                                                 
                                            </div>
                                            
                                           
                                    </li>
                                    
                                    
                                    
                                     
                                    
                                    
                                </ul>
                            </div>
                            <!-- //sort -->

                            <!-- article -->
                            <div class="article mCustomScrollbar _mCS_2">
                         
                                <div class="util">
                                   <!--  <span class="ti">@회원명 , @회원등급 , @쿠폰명 , @사용기간</span>
                                    <span class="cn"><em id="nowByte">0</em>/ <span id="maxByte">2000Byte</span></span> -->
                                </div>
                                <div class="txt"  style="width:98%; height:612px;">
                                   <!--  (광고) ㈜세라젬 
                                    <br><strong>홍길동</strong> 회원명님 안녕하세요.  

                                    세라젬 회원에 가입하시면 <strong>30%할인쿠폰</strong>을 제공해 드립니다.

                                    <ul class="list1">
                                        <li>가입기간 : 2022.11.01~11.30</li>
                                        <li>02-293-3939</li>
                                        <li>무료거부 080-2398-3883</li>
                                    </ul> -->
                                   
                                  <div style="width:50%; height:312px;background:#ffffff;display:none" id="ctnt"> 
                                   <textarea name="tmpltCtnts" id="tmpltCtnts" title="템플릿내용"  readonly class="it data-check" style="width:98%;height:300px;padding:5px;line-height:26px"></textarea>
                                 </div>
                                
                                 <div style="width:40%; height:312px;background:#ffffff;display:none" id="barcodeImg">
                                 </div>
                                
                                  <div style="width:100%; height:412px;background:#ffffff;" id="email">
                                	<textarea name="tmpltCtnts2" id="tmpltCtnts2" rows="10" cols="100"  style="width:100%; height:350px; min-width:310px; display:;"></textarea>
								
								</div>
			
                                
                                </div>
                            </div>
                            
                         
									<!-- <p>
										<input type="button" onclick="pasteHTML();" value="본문에 내용 넣기" />
										<input type="button" onclick="showHTML();" value="본문 내용 가져오기" />
										<input type="button" onclick="submitContents(this);" value="서버로 내용 전송" />
										<input type="button" onclick="setDefaultFont();" value="기본 폰트 지정하기 (궁서_24)" />
									</p> -->

                            <!-- //article -->

                            <div class="mButton1">
                               <a href="#" class="mBtn1 w68 lWhite"  data-click="search">목록</a> 
                               <!--  <a href="#" class="mBtn1 w68 lWhite" data-click="del"> 삭제</a>
                                <a href="#" class="mBtn1 w68 lGray" onclick="$('#frmDetail')[0].reset();">다시쓰기</a>
                                <a href="#" class="mBtn1 w68 lPrimary" data-click="save">저장</a> -->
                            </div>
                            
                            
                            
                    	</form>
                    	
                    	
                        </div>
                        <!-- //view -->
                    
                    
                    </div>
                    <!-- //left -->
                </div>
						
			</div>
			<!-- //box -->
						


		</div>
		<!-- //right -->
                </div>
                <!-- //grid -->
				
			</div>
			<!-- //box -->

		</div>
		<!-- //right -->
	</div>
	
</div>


<script>

var oEditors = [];



var _current_code_cd = null;


/* 공통코드 그리드 load */
function grdList_load(gridView, gridId) {
	//newTemplt();
	//setTimeout( function(){ search() }, 500 );
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

	//var url = "<c:url value='${urlPrefix}/add${urlSuffix}'/>?mshipCoupnBasNo="+ gridView.getCurrentJson().mshipCoupnBasNo ;
	//Utilities.openModal(url, "100%", 1800);
	//location.href = url;
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

 	$("#frmSearch #tmpltTypeCd").val("");
 	if( typeof(campDspBasNo) == "string" ){
 		$("#frmSearch #tmpltTypeCd").val(campDspBasNo);
 	}
 	
	$("form#frmSearch").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmSearch");
	param.recordCountPerPage = 20;
	grdList.loadUrl(url, param);
}

/* 캠페인상세 */
function newTemplt( jData ){

	if( jData != null && typeof( jData.campTempltBasNo ) == "string" ) {
		
		$("#barcodeImg").hide();
		
		mapToForm(jData,"frmDetail");
		
		
		if( jData.tmpltTypeCd == "BARCODE"){
			
			var imgName = jData.barcodeImg;
			
			if( imgName != "" ){
				$("#barcodeImg").html( "<img style='width:90%' src='${barcodeUrl}/"+ imgName +"' border=0>" );
				$("#barcodeImg").show();
			}
		}
		
		
		$("#stat").val("U");
		
		
		// 이메일일 경우
		if( jData.tmpltTypeCd == 'DCB007'  ){
			$("#ctnt").hide();
			$("#email").show();
			
			if( jData.tmpltCtnts != null){
				oEditors.getById["tmpltCtnts2"].exec("SET_IR", [""]); //내용초기화
				oEditors.getById["tmpltCtnts2"].exec("PASTE_HTML", ['']);
				oEditors.getById["tmpltCtnts2"].exec("PASTE_HTML", [jData.tmpltCtnts]);
			}
			
		}else{
			$("#ctnt").show();
			$("#email").hide();
		}
		
		
	}else{
		
		$("#frmDetail")[0].reset();
		$("#stat").val("C");
		
	}
	
	
	
 	$("#mBox1").hide();
 	$("#mBox2").show();
 	
 	
}





/*  저장 */
function save(){
	
	if( $("#frmDetail #tmpltTypeCd").val() == 'DCB007'   ){
		var sHTML = oEditors.getById["tmpltCtnts2"].getIR();
		$("#tmpltCtnts").val( sHTML );
	}
	
	
	
	var valid = validateForm("#frmDetail"); //  class='data-check' 인 경우만 체크
	
	if(valid) {
		
		
		var saveJson = Utilities.formToMap("frmDetail");
		

		var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
		Utilities.getAjax(url,saveJson,true,function(data,jqXHR){
	        if(Utilities.processResult(data,jqXHR,"캠페인 저장에 실패했습니다."))
	        {
	            alert("템플릿 저장이 완료되었습니다.");
	            search();
	        }
	    });
	
	}else{
		
		alert("필수 항목들을 기입해 주세요.");
		return false;
	}
}


function del(){
	var saveJson = Utilities.formToMap("frmDetail");
	if( confirm("해당 템플릿을 삭제하시겠습니까?") ){
		var url = "<c:url value='${urlPrefix}/delete${urlSuffix}'/>";
		Utilities.getAjax(url,saveJson,true,function(data,jqXHR){
	        if(Utilities.processResult(data,jqXHR,"캠페인 삭제에 실패했습니다."))
	        {
	            alert("템플릿이 삭제되었습니다.");
	            search();
	        }
	    });
		
	}	

}

function txtSize(){
	var maxSize = 0;
	// SMS
	if( $("#frmDetail #tmpltTypeCd").val() == "DCB001" ){		
		maxSize = 90;
	}else{
		maxSize = 2000;
	}
	
	if( $("#frmDetail #tmpltTypeCd").val() == "DCB007" ){	
		$("#ctnt").hide();
		$("#email").show();
	}else{
		$("#ctnt").show();
		$("#email").hide();
	}
	
	$("#maxByte").text( maxSize +"Byte");
}

function chkLng(){
	
	log( $("#frmDetail #tmpltTypeCd").val() );
	if( $("#frmDetail #tmpltTypeCd").val() == "" ){
		alert("메세지 유형을 선택해 주세요");
		$("#tmpltCtnts").val("");
		return false;
	}
	
	var maxSize = 0;
	// SMS
	if( $("#frmDetail #tmpltTypeCd").val() == "DCB001" ){		
		maxSize = 90;
	}else{
		maxSize = 2000;
	}
	
	$("#maxByte").text( maxSize +"Byte");
	
	var nowSize = Utilities.byteCheck( $("#tmpltCtnts") );
	
	$("#nowByte").text( nowSize );
	
	if( nowSize > maxSize ){
		alert("더이상 입력이 불가능합니다.");
		$("#tmpltCtnts").val( $("#tmpltCtnts").val().substr(0, maxSize/2) );
		return false;
	}
	
	
}

</script>



<script type="text/javascript">

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "tmpltCtnts2",
	sSkinURI: "/static/smarteditor2/SmartEditor2Skin.html?v=1",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : false,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		fOnBeforeUnload : function(){
			//alert("완료!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);

		//oEditors.getById["tmpltCtnts"].exec("RESIZE_EDITING_AREA", [0, 500]); 
		//oEditors.getById["tmpltCtnts"].exec("MSG_EDITING_AREA_RESIZE_STARTED", []); 
		//oEditors.getById["tmpltCtnts"].exec("RESIZE_EDITING_AREA", [0, 400]); //타입은 px단위의 Number입니다. 
		//oEditors.getById["tmpltCtnts"].exec("MSG_EDITING_AREA_RESIZE_ENDED", [500, 500]); 
		//log(111);
		//에디터를 둘러싼 iframe 사이즈 변경 
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["tmpltCtnts2"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["tmpltCtnts2"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["tmpltCtnts2"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '궁서';
	var nFontSize = 24;
	oEditors.getById["tmpltCtnts2"].setDefaultFont(sDefaultFont, nFontSize);
}




</script>
