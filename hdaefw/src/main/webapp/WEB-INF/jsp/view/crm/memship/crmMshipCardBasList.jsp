<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 



<style>

.ui-widget-content .ui-state-active:hover {
	border: 1px solid #003eff;
	background: #007fff;
	font-weight: normal;
	color: #ffffff;
}

.ui-menu-item b {
	color: red;
}

.tui-datetime-input{
	width:110px;
}

.select{
	width:110px;
}
</style>


<script>

$(document).ready(function() {
	
	/* tab */

	$(".jsTab2 li > a").on("click",function(){
		$(this).parent().parent().children().removeClass("active");
		$(this).parent().addClass("active");
		$(this).parent().parent().parent().parent().children(".tabCont").addClass("hidden");
		$( $(this).attr("href") ).removeClass("hidden");
		return false;
	});
	/* //tab */
 
});

</script>

<div id="wrapIframe">

	
    <div class="mGrid1 type3"> <!-- class="type3" => left:610px -->
        <!-- left -->
        <div class="gLeft">

            <!-- 고객정보 -->
            <div class="" style="margin-top:15px">
            
               <form role="form" id="frmSearch" name="frmSearch">
            	<input type="hidden" name="currentPageNo" id="currentPageNo" value="1" />
			
			
			
			
                <!-- title -->
                <div class="gTitle1">
                    <h3 class="mTitle1">카드마스터 목록</h3>
                    <div class="gRt posT-5">
                        <a href="#" class="mBtn1 lWhite"   data-auth-type="c" style="display:none" data-click="cpyCard" id="btnCopy" >복사</a>
                        <a href="#" class="mBtn1 lPrimary" data-auth-type="c" style="display:none" data-click="newCard">신규등록</a>
                    </div>
                </div>
                <!-- //title -->
                <!-- sort -->
                <div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
                
                
          
			
			
                    <ul class="mr60"> <!-- class="mr60" => margin-right="60"-->
                        <li class="w45per">
                            <div class="tit">카드유형</div>
                            <div class="txt">
                                <code:commCode  className="select data-check" id="cardTypeCd" name="cardTypeCd" codeCd="CD020" prefixLabel="전체" prefixValue=""/>
                            </div>
                        </li>
                        <li class="w55per">
                            <div class="tit w75">등록일시</div>
                            <div class="txt">
                                <div class="mDate1">
                                
                                <input type="text" style="width:80px"  data-type="dateRangeStart" class="it " data-check  data-range-end="endRegDt"  title="등록시작일"  name="strRegDt" id="strRegDt" value="">
                                  
                                <span class="bar">~</span>
                                   
                                <input type="text" style="width:80px"  class="it  data-check"  title="등록종료일"  name="endRegDt" id="endRegDt" value="">
                                   
                                   
                                </div>
                            </div>
                        </li>
                        <li class="w45per">
                            <div class="tit">상태</div>
                            <div class="txt">
                                <code:commCode  className="select data-check" id="statusCd" name="statusCd" codeCd="S010" prefixLabel="전체" prefixValue=""/>
                            </div>
                        </li>
                        <li class="w55per">
                            <div class="tit w75">카드마스터명</div>
                            <div class="txt">
                                <input type="text" class="it" title="카드마스터명" name="cardBasNm" id="cardBasNm" value="" >
                            </div>
                        </li>
                    </ul>
                    <div class="button posRt">
                        <a href="#" class="mBtn1"  data-click="search">검색</a>
                    </div>
                    
                    
                </div>
                <!-- //sort -->
                
                
                
                
                <!-- list -->
                 <div id="divGrid" style="height:720px"
				  data-post="Y"
				  data-grid-id="grdList"
				  data-pagenation="Y"
				  data-scroll-x="Y"
				  data-get-url="<c:url value='/crmMshipCardBasList/getList'/>"
				  data-type="grid" 
				  data-tpl-url="<c:url value='/static/gridTemplate/memship/crmMshipCardBas.xml'/>"
				  >
				</div>
                <!-- //list -->
                
                
                    </form>
				
				
                <button class="btnClose">고객정보 닫기</button>
                <button class="btnWide">고객정보 크게보기</button> 
            </div>
            <!-- //고객정보 -->
            
        </div>
        <!-- //left -->
        <!-- right -->
        <div class="gRight">
            <!-- sort -->
            
            
          <form id="frmDetail" name="frmDetail" method="post">
            
			<input type="hidden" id="stat" name="stat" value="U"/>
            
            
            
            
            <div class="mSort2 medium"> <!-- class="medium" => 상하좌우 여백 좁은 사이즈-->
                <ul>
                    <li class="wAuto">
                        <div class="tit">카드 마스터 코드</div>
                        <div class="txt">
                            <input type="text" class="it w175" name="mshipCardBasNo" id="mshipCardBasNo" title="카드 마스터 코드" placeholder="자동생성" value="" readonly>
                        </div>
                    </li>
                </ul>
                <div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
                  <!--   <a href="#" class="mBtn1 lGray">정책 API 반영</a> -->
                    <a href="#" class="mBtn1 lGray" data-auth-type="c" style="display:none" data-click="crdCard">카드발급</a>
                </div>
            </div>
            <!-- //sort -->
            
            <!-- box -->
            <div class="mBox12" style="margin-top:15px">
                <div class="gTitle1 line">
                    <h3 class="mTitle1">발급정책</h3>
                    <div class="gRt">
                        <span data-auth-type="u" style="display:none" ><a href="#" class="mBtn1 lGray"  data-click="saveCard" id="btnEdit" style="display:none">수정</a></span>
                        <span data-auth-type="c" style="display:none" ><a href="#" class="mBtn1 lPrimary" data-click="saveCard"  id="btnReg" style="">등록</a></span>
                    </div>
                </div>
                <!-- board -->
                <div class="mBoard2">
                    <table>
                        <caption>발급정책</caption>
                        <colgroup>
                            <col width="9%">
                            <col width="20%">
                            <col width="9%">
                            <col width="20%">
                            <col width="9%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                        
                         <tr>
                                <th scope="row" class="left">카드명</th>
                                <td class="left">
                                    <input type="text" class="it data-check" name="cardBasNm" id="cardBasNm" title="카드명" value="">
                                </td>
                                <th scope="row" class="left">카드내용</th>
                                <td class="left" colspan="4">
                                    <input type="text" class="it data-check" name="cardBasCtnts" id="cardBasCtnts" title="카드내용" value="">
                                </td>
                            
                            </tr>
                            
                            
                        
                            <tr>
                                <th scope="row" class="left">카드유형</th>
                                <td class="left" colspan="3">
                                    
                                    <code:commCode  className="select data-check" id="cardTypeCd" name="cardTypeCd" codeCd="CD020" prefixLabel="맴버십등급" prefixValue="" change="chkGrade"/>
                                    <code:commCode  className="select data-check" id="mshpGradeCd" name="mshpGradeCd" codeCd="MB020" prefixLabel="회원등급" prefixValue="" others="disabled" />
                                    <select class="select w150 data-check"  name="cprtCmpNo" id="cprtCmpNo" disabled>
                                    	<option value="">제휴사 선택</option>
                                    </select>
                                    
                                    
                                </td>
                               
                                <th scope="row" class="left">사용여부</th>
                                <td class="left"  >
                                    <code:commCode  className="select data-check" id="statusCd" name="statusCd" codeCd="S010" prefixLabel="전체" prefixValue="" selectedValue="${cpinfo.statusCd}" />
                                        
                                </td>
                              
                            </tr>
                            
                            <tr>
                                <th scope="row" class="left">카드 사용시점</th>
                                <td class="left" colspan="5">
                                
                                    <code:commCode  className="select data-check" id="usePerdCd" name="usePerdCd" codeCd="MB210" prefixLabel="전체" prefixValue="" others=" onchange='chkUseCard()' "/>
                                    
                                    
                                    <input type="text" class="it data-check w40" name="cardUsePerd" id="cardUsePerd" title="카드내용" value="">
                                    
                                    일
                                </td>
                                
                                
                            </tr>
                            <tr>
                                <th scope="row" class="left">유효기간</th>
                                <td class="left">
                                    발급일로부터 
                                    
                                    <input type="text" class="it data-check w40" title="년" id="cardValidPerd"  name="cardValidPerd" data-type="number"   value="">
                                    년
                                </td>
                                <th scope="row" class="left">발급 횟수</th>
                                <td class="left">
                                   
									<code:commCode  className="select data-check" id="issueCntCd" name="issueCntCd" codeCd="MB110" prefixLabel="전체" prefixValue="" others=" onchange='chkIssue(this)' " />

                                     <input type="text" class="it data-check w40 comma" title="년" id="issueCnt"  name="issueCnt"   data-type="number2" value="" >
                                    회
                                </td>
                                <th scope="row" class="left">등록일</th>
                                <td class="left" colspan="2">
                                    <input type="text" class="it  w120" title="등록일"  name="regDt" id="regDt"  value="" readonly>
                                    <input type="text" class="it  w90" title="이름"  name="regrId"  id="regrId"  value="" readonly>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
               
            </div>
            <!-- //box -->
            
            
            </form>

            <!-- tab -->
            <div class="mTab1 jsTab1"  style="margin-top:15px">
                <ul>
                    <li class="active"><a href="#jsTabCont1_1">발행카드</a></li>
                
                </ul>
            </div>
           

            <!-- box:발행카드 -->
            <div id="jsTabCont1_1" class=" p10 tabCont ">
            
            
           
            
              <form name="frmCardHst" id="frmCardHst" onsubmit="searchCardHst();return false;">
         	
            	<input type="hidden" name="mshipCardBasNo" id="mshipCardBasNo" value="${cpinfo.cardBasNo}">
            	
			      
                <!-- sort -->
                <div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
                
                 
                    <ul>
                        <li class="wAuto ml20">
                            <div class="tit">카드유형</div>
                            <div class="txt">
                               <code:commCode  className="select data-check" id="cardTypeCd" name="cardTypeCd" codeCd="CD020" prefixLabel="전체" prefixValue=""/>
                            </div>
                        </li>
                        <li class="wAuto ml35">
                            <%-- <div class="tit">멤버십</div>
                            <div class="txt">
                                <code:commCode  className="select data-check" id="mshpGradeCd" name="mshpGradeCd" codeCd="MB020" prefixLabel="전체" prefixValue="" selectedValue="${cpinfo.mshpGradeCd}" />
                            </div> --%>
                            <span class="button">
                                <a href="#" class="mBtn1" data-click="searchCardHst">검색</a>
                            </span>
                        </li>
                    </ul>
                    <!-- <div class="button posRt"> 우측 정렬 : class="posRt"
                        <a href="#" class="mBtn1 lWhite">관리</a>
                    </div> -->
            
                </div>
                <!-- //sort -->
                
              

		                    <div id="divCardHst" style="height:540px"
							  data-post="Y"
							  data-grid-id="grdCardHstList"
							  data-pagenation="Y"
							  data-get-url="<c:url value='/crmMshipCardBas/grdCardHstList'/>"
							  data-type="grid" 
							  data-tpl-url="<c:url value='/static/gridTemplate/memship/crmCardPblsHst.xml'/>">
							</div>
							
							
				 </form>
							
            </div>
            <!-- //box:발행카드 -->
           


        </div>
        <!-- //right -->
    </div>
	
</div>




<script>
var _current_code_cd = null;

/* 공통코드 엑셀 다운로드 */
function excelDownload() {
	grdList.exportExcel("공통코드 리스트.xlsx");
}

/* 공통코드 엑셀 업로드 */
function excelUpload() {
	grdList.importExcel();
}

/* 공통코드 그리드 load */
function grdList_load(gridView, gridId) {
	search();
}


function grdChlList_load(gridView, gridId) {
	log("grdChlList_load");
	//searchChlRel();
}



/* 하부코드 그리드 load */
function grdDetail_load(gridView, gridId) {
	//console.log("grdDetail_load");
}


function chkEle(ele, val){
	
}


/* 공통코드 Row클릭 시 */
function grdList_rowChanged(grdList, oldRow, newRow, rowData) {

	Utilities.mapToForm(rowData,"frmDetail");



	chkEleVal("#frmDetail #mycomMallFreeDlvYn", "Y", rowData.mycomMallFreeDlvYn);
	

	$("#frmDetail #stat").val("u");
	$("#frmDetail #btnReg").hide();
	$("#frmDetail #btnEdit").show();

	//searchGods( rowData.mshipCardBasNo );
	//searchPrvCoupon( rowData.mshipCardBasNo );
	
	$("#frmCardHst #mshipCardBasNo").val( rowData.mshipCardBasNo );


	// 탭 데이터 호출
	searchCardHst();
	
	
	// 회원등급에 따른 콤보박스 제어
	if( rowData.cardTypeCd == "001" ){ // 임직원
		$("#frmDetail #mshpGradeCd").attr("disabled", true);
		$("#frmDetail #cprtCmpNo").attr("disabled", true);
		

		$("#frmDetail #mshpGradeCd").val("");
		$("#frmDetail #cprtCmpNo").val("");		
	}
	
	if( rowData.cardTypeCd == "002" ){ // 제휴사
		$("#frmDetail #mshpGradeCd").attr("disabled", true);
		$("#frmDetail #cprtCmpNo").attr("disabled", false);			

		$("#frmDetail #mshpGradeCd").val("");			
		
	}
	
	if( rowData.cardTypeCd == "003" ){ // 회원
		$("#frmDetail #mshpGradeCd").attr("disabled", false);
		$("#frmDetail #cprtCmpNo").attr("disabled", true);	
		
		$("#frmDetail #cprtCmpNo").val("");		
	}
	
	
	if( rowData.issueCntCd == "001" ){ // 무제한
		$("#frmDetail #issueCnt").attr("disabled", true);
		$("#frmDetail #issueCnt").val("");		
	}else{
		$("#frmDetail #issueCnt").attr("disabled", false);
	}
	
	
	chkUseCard();
}


function onGridLoad(gridView, gridId) {
	
}

/* 그리드 컬럼 클릭 */
function onGridCellClick(gridView, rowIndex, columnName, colIndex,
		fieldIndex) {

}

/* 그리드 컬럼 더블 클릭 */
function onGridCellDblClick(gridView, rowIndex, columnName, colIndex,
		fieldIndex) {

}

function onGridRowChanged(gridView, oldRow, newRow) {

}

/* 검색조건 검색 */
function search() {

	//$("#frmDetail #btnReg").text("등록").hide();
	$("#frmDetail #btnEdit").hide();
	$("form#frmSearch").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmSearch");
	
	param.recordCountPerPage = 20;
	grdList.loadUrl(url, param);
}


/* 카드 마스터 추가 */
function newCard(){
	Utilities.mapToForm(null,"frmDetail");
	
	$("#frmDetail")[0].reset();
	$("#frmDetail #stat").val("c");
	$("#frmDetail #btnReg").show();
	$("#frmDetail #btnEdit").hide();

	$("#frmCardHst")[0].reset();
	$("#frmCardHst #mshipCardBasNo").val("m");
	 searchCardHst() ;
	 
}



/* 복사 */
function cpyCard(){
	
	var saveJson = grdList.getCheckedJson();
	if (saveJson.length == 0) {
		alert("복사할 카드마스터를 선택해주세요.");
		return;
	}
	
	if( saveJson.length > 1){
		alert("복사할 카드마스터를 한개만 선택해 주세요.");
		return;
	}
	
	Utilities.mapToForm( grdList.getCheckedJson()[0] ,"frmDetail");
	
	$("#frmDetail #stat").val("c");
	$("#frmDetail #mshipCardBasNo").val("");


	$("#frmDetail #btnReg").show();
	$("#frmDetail #btnEdit").hide();
	
	/* if( $("#frmDetail #mshipCardBasNo").val() == "" ){
		$("#frmDetail #mshipCardBasNo").focus();
		alert("정책코드는 자동으로 생성됩니다.");
	} */
	
	if (saveJson.length) {
		
		if (!confirm("카드마스터코드는 자동으로 생성됩니다. \n\n선택된 정책을 복사하시겠습니까?"))
			return;
		
		var cpyData = Utilities.formToMap("frmDetail");
		var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
		Utilities.getAjax(url, cpyData, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "카드마스터 복사가 실패했습니다.")) {
				alert("카드마스터 복사가 완료되었습니다.");
					search();
					$("#frmDetail")[0].reset();
			}
		});
	} else {
		alert("선택된 데이터가 없습니다.");
	}
}




/* 카드 마스터 등록 추가 */
function saveCard(){
	
	var valid = validateForm("#frmDetail"); //  class='data-check' 인 경우만 체크
	
	if(valid) {
		
		var saveJson = Utilities.formToMap("frmDetail");

		
		var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
		Utilities.getAjax(url,saveJson,true,function(data,jqXHR){
	        if(Utilities.processResult(data,jqXHR,"카드 마스터 저장에 실패했습니다."))
	        {
	            alert("카드 마스터 저장이 완료되었습니다.");
	            grdList.reload();
	            $("#frmDetail")[0].reset();
	        }
	    });
	
	}else{
		
		alert("필수 항목들을 기입해 주세요.");
		return false;
	}
}


/* 카드 발급 팝업 */
function crdCard(){
	
	
	if( $("#frmCardHst #mshipCardBasNo").val() == "" ){
		alert("발급할 카드 마스터를 선택해 주세요.");
		return false;
	}else{	
	 	var url = "<c:url value='${urlPrefix}/crdCard${urlSuffix}'/>?mshipCardBasNo="+ $("#frmCardHst #mshipCardBasNo").val();
	 	Utilities.openModal(url, 900, 550);
	}
	
}

/* 적용매장 검색 */
function searchStoreRel() {
	$("form#frmStore").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getListStoreRel${urlSuffix}'/>";
	var param = Utilities.formToMap("frmStore");
	param.recordCountPerPage = 20;
	grdShopList.loadUrl(url, param);
	//grdDetail.clear();
} 



/* 적용상품 검색 */
function searchGodsRel() {
	$("form#frmGods").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getGodsRelList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmGods");
	param.recordCountPerPage = 20;
	grdGodsList.loadUrl(url, param);
	//grdDetail.clear();
} 



/* 적용채널 검색 */
function searchChlRel() {
	$("form#frmChl").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getChlRelList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmChl");
	param.recordCountPerPage = 20;
	grdChlList.loadUrl(url, param);
	//grdDetail.clear();
} 

/* 적용채널 검색 */
function searchCardHst() {
	$("form#frmCardHst").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getCardHstList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmCardHst");
	param.recordCountPerPage = 20;
	grdCardHstList.loadUrl(url, param);
	//grdDetail.clear();
} 


function saveStorePop(){
	var url = "<c:url value='${urlPrefix}/popStore${urlSuffix}'/>?mshipCardBasNo="+ $("#frmDetail #mshipCardBasNo").val();
	Utilities.openModal(url, "1000", "800");
}


function saveGodsPop(){
	var url = "<c:url value='${urlPrefix}/popGods${urlSuffix}'/>?mshipCardBasNo="+ $("#frmDetail #mshipCardBasNo").val();
	Utilities.openModal(url, "1000", "800");
}


function saveChlPop(){
	var url = "<c:url value='${urlPrefix}/popChl${urlSuffix}'/>?mshipCardBasNo="+ $("#frmDetail #mshipCardBasNo").val();
	Utilities.openModal(url, "1000", "800");
}





//제품 검색후 값 지정
function searchGodsBase(label, val){
	$("#prsnttnGodsCd").val(val);
	$("#godsNm").val(label);
}


$(document).ready(function(){
	
	// 제휴사 데이터 바인딩
	var url = "<c:url value='${urlPrefix}/getPartnerList${urlSuffix}'/>";
	Utilities.getAjax(url, null, true, function(data, jqXHR) {
		if (Utilities.processResult(data, jqXHR, "제휴사 데이터을 읽어오질 못했습니다.")) {
		
			$.each( data , function(i){
				$("#cprtCmpNo").append("<option value='"+ this.cprtCmpNo +"'>"+  this.cprtCmpNm +"</option>\n");
			});
			
		}
	});
	
});

function chkGrade(obj){
	//log( $(obj).val() );
	//cardTypeCd  mshipGradeApplyCtnts cprtCmpNo
	
	if( $(obj).val() == "" ){
		$("#frmDetail #mshpGradeCd").attr("disabled", true);
		$("#frmDetail #cprtCmpNo").attr("disabled", true);
		
		$("#frmDetail #mshpGradeCd").val("");
		$("#frmDetail #cprtCmpNo").val("");		
	}
	
	if( $(obj).val() == "001" ){
		$("#frmDetail #mshpGradeCd").attr("disabled", true);
		$("#frmDetail #cprtCmpNo").attr("disabled", true);	
		
		$("#frmDetail #mshpGradeCd").val("");
		$("#frmDetail #cprtCmpNo").val("");			
	}
	
	if( $(obj).val() == "002" ){

		$("#frmDetail #mshpGradeCd").attr("disabled", true);
		$("#frmDetail #cprtCmpNo").attr("disabled", false);	
		
		$("#frmDetail #mshpGradeCd").val("");
	}
	
	if( $(obj).val() == "003" ){

		$("#frmDetail #mshpGradeCd").attr("disabled", false);
		$("#frmDetail #cprtCmpNo").attr("disabled", true);	
		

		$("#frmDetail #cprtCmpNo").val("");	
	}
	
}


function chkIssue(obj){
	
	if( $(obj).val()  == "001" ){
		$("#issueCnt").attr("disabled", true);
	}else{

		$("#issueCnt").attr("disabled", false);
	}

}

function chkUseCard(){
	log( $("#usePerdCd").val() );
	if( $("#usePerdCd").val()  == "001" ){
		$("#cardUsePerd").val("");
		$("#cardUsePerd").attr("disabled", true);
	}else{

		$("#cardUsePerd").attr("disabled", false);
	}

}



</script>

