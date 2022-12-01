<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<form role="form" id="frmMain">
<div id="wrapIframe">
	
    <div class="mGrid1 type3"> <!-- class="type3" => left:610px -->
    	
    	
        <!-- left -->
        <div class="gLeft">
			
            <!-- 고객정보 -->
            <div class="mBox1">
                <!-- title -->
                <div class="gTitle1">
                    <h3 class="mTitle1">제휴사 목록(법인)</h3>
                    <div class="gRt">
                        <a href="#" class="mBtn1 lPrimary" data-click="clearRegScreen">제휴사 등록</a>
                    </div>
                </div>
                <!-- //title -->
                <!-- sort -->
                <div class="mSort2">
                    <ul>
                        
                        <li class="w33per">
                            <div class="tit w65">제휴구분</div>
                            <div class="txt">
								<code:commCode id="searchCprtDivCd" name="searchCprtDivCd" codeCd="CO010" prefixLabel="전체" prefixValue=""/>
							</div>
                        </li>
                        <li class="w33per">
                            <div class="tit w65">제휴상태</div>
                            <div class="txt">
								<code:commCode id="searchCprtStatusCd" name="searchCprtStatusCd" codeCd="CO020" prefixLabel="전체" prefixValue=""/>
							</div>
                        </li>
                        <li class="w100per">
                            <div class="tit w65">제휴사명</div>
                            <div class="txt">
                            	<div class="mFlex2">
	                                <span class="flex">
	                                    <input type="text" class="it" title="제휴사명" id="searchCprtCmpNm" name="searchCprtCmpNm">
	                                </span>
	                                <button class="mBtn1" data-click="search" style="margin-right: 10px">
										검색
									</button>
	                            </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <!-- //sort -->
                <!-- list -->
                <div id="divGrid"  style="height:${rightBoxHeight4}" 
                				   data-grid-id="grdList" 
                                   data-pagenation="Y" 
                                   data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
                                   data-type="grid" 
                                   data-grid-callback="onGridLoad" 
                                   data-tpl-url="<c:url value='/static/gridTemplate/mem/MB063.xml'/>">
				</div>
				<!-- //paging -->
                <button class="btnClose">고객정보 닫기</button>
                <button class="btnWide">고객정보 크게보기</button> 
            </div>
            <!-- //고객정보 -->
            
        </div>
        <!-- //left -->
        
        
        <!-- right -->
        <div class="gRight">
            
            <!-- box -->
            <div class="mBox1">
                <div class="gTitle1 line">
                    <h3 class="mTitle1">기본정보(법인)</h3>
                    <div class="gRt">
                        <a href="#" class="mBtn1 lGray" id="btnUpdate">수정</a>
                        <a href="#" class="mBtn1 lGray" id="btnDelete">삭제</a>
                        <a href="#" class="mBtn1 lPrimary" id="btnInsert">등록</a>
                    </div>
                </div>
                <!-- board -->
                <div class="mBoard2">
                    <table>
                        <caption>기본정보(법인)</caption>
                        <colgroup>
                            <col width="6%">
                            <col width="14%">
                            <col width="6%">
                            <col width="10%">
                            <col width="8%">
                            <col width="12%">
                            <col width="8%">
                            <col width="9%">
                            <col width="8%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" class="left">제휴사코드</th>
                                <td>
                                    <input type="text" class="it" id="cprtCmpNo" name="cprtCmpNo" title="제휴사코드" placeholder="자동 채번" disabled="disabled">
                                </td>
                                <th scope="row" class="left">제휴사명</th>
                                <td colspan="3">
                                    <input type="text" class="it" id="cprtCmpNm" name="cprtCmpNm" title="제휴사명"/>
                                </td>
                                <th scope="row" class="left">제휴사등록일</th>
                                <td>
                                    <input type="text" class="it" id="cprtCmpRegYmd" name="cprtCmpRegYmd" title="제휴사등록일" data-type="date" data-enter="search" data-button="Y"/>
                                </td>
                                <th scope="row" class="left" rowspan="3">제휴사메모</th>
                                <td rowspan="3">
                                    <textarea class="textarea" id="cprtCmpMemoCtnts" name="cprtCmpMemoCtnts" title="제휴사메모" rows="4"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="left">제휴상태</th>
                                <td>
                                    <code:commCode name="cprtStatusCd" id="cprtStatusCd" codeCd="CO020"/>
                                </td>
                                <th scope="row" class="left">제휴구분</th>
                                <td>
                                    <code:commCode name="cprtDivCd" id="cprtDivCd" codeCd="CO010"/>
                                </td>
                                <th scope="row" class="left">사업자번호</th>
                                <td>
                                    <input type="text" class="it" id="bizNo" name="bizNo" title="사업자번호"/>
                                </td>
                                <th scope="row" class="left">기업유형</th>
                                <td>
                                    <code:commCode name="cprtCmpTypeCd" id="cprtCmpTypeCd" codeCd="CU110"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="left">전화번호</th>
                                <td>
                                    <input type="text" class="it" id="telNo" name="telNo" title="제휴사명" oninput="this.value=this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');"/>
                                </td>
                                <th scope="row" class="left">주소</th>
                                <td colspan="5">
                                    <div class="mFlex2">
                                        <div class="mFind1">
                                            <input type="text" class="it" id="zipCd" name="zipCd" title="우편번호" disabled="disabled"/>
                                            <a href="#" class="iFind" data-click="popupZip">검색</a>
                                        </div>
                                        <input type="text" class="it" id="addr1Ctnts" name="addr1Ctnts" title="주소" disabled="disabled"/>
                                        <input type="text" class="it" id="addr2Ctnts" name="addr2Ctnts" title="상세주소"/>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
                
                <div class="gTitle1 line">
                    <h3 class="mTitle1">제휴사직원정보</h3>
                </div>
                <!-- board -->
                <div class="mBoard2">
                    <table>
                        <caption>제휴사직원정보</caption>
                        <colgroup>
                            <col width="8%">
                            <col width="10%">
                            <col width="8%">
                            <col width="10%">
                            <col width="8%">
                            <col width="12%">
                            <col width="8%">
                            <col width="9%">
                            <col width="8%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" class="left">이름</th>
                                <td>
                                    <input type="text" class="it" id="execvdempNm" name="execvdempNm" title="이름"/>
                                </td>
                                <th scope="row" class="left">생년월일</th>
                                <td>
                                    <input type="text" class="it" id="birthday" name="birthday" title="생년월일" oninput="this.value=this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');"/>
                                </td>
                                <th scope="row" class="left">성별</th>
                                <td>
                                    <code:commCode name="gndrCd" id="gndrCd" codeCd="CU170"/>
                                </td>
                                <th scope="row" class="left">부서</th>
                                <td>
                                    <input type="text" class="it" id="deptNm" name="deptNm" title="부서"/>
                                </td>
                                <th scope="row" class="left">직책</th>
                                <td>
                                    <input type="text" class="it" id="rspofNm" name="rspofNm" title="직책"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="left">일반전화</th>
                                <td>
                                    <input type="text" class="it" id="picTelNo" name="picTelNo" title="일반전화" oninput="this.value=this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');"/>
                                </td>
                                <%-- <th scope="row" class="left">휴대전화</th>
                                <td>
                                    <input type="text" class="it" title="휴대전화" value="010-5555-5555">
                                </td> --%>
                                <th scope="row" class="left">이메일</th>
                                <!-- <td colspan="5"> -->
                                <td colspan="3">
                                    <div class="mFlex2">
                                        <input type="text" class="it" id="emailAddr" name="emailAddr" title="이메일"/>
                                        <select class="select w190" title="이메일회사 선택">
                                            <option>직접입력</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
            </div>
            <!-- //box -->
			
             <!-- tab -->
			<div class="mTab1 jsTab">
				<ul>
					<li class="active"><a id="tabExecvdempListBtn" href="#tabExecvdempList">임직원 목록</a></li>
					<li ><a id="tabExecvdempUploadBtn" href="#tabExecvdempUpload">임직원정보 일괄등록</a></li>
				</ul>
			</div>
			
			<div id="tabExecvdempList" class="mBox1 p10 tabCont ">
				<iframe data-tab-type="iframe" id="execvdempListIFrm" scrolling="no" src="<c:url value='${urlPrefix}/partnerHomeExecvdempList'/>${urlSuffix}" 
						style="width: 100%; min-height: 300px; border: 0px; height: 510px;"></iframe>
			</div>
			<div id="tabExecvdempUpload" class="mBox1 p10 tabCont hidden">
				<iframe data-tab-type="iframe" id="execvdempUploadIFrm" scrolling="no" src="<c:url value='${urlPrefix}/partnerHomeExecvdempUpload'/>${urlSuffix}" 
						style="width: 100%; min-height: 300px; border: 0px; height: 510px;"></iframe>
			</div>
            <!-- //box:입직원정보 일괄등록 -->

        </div>
        <!-- //right -->
        
    </div>
	
</div>

</form>

<script>

/* 화면 로드 */
window.onload = function(){
	var today = moment();
    var dt = today.format("YYYYMMDD");
	$("#cprtCmpRegYmd").val(dt.substr(0,4) + "-" + dt.substr(4,2) + "-" + dt.substr(6,2));
	$("#btnInsert").hide();
	$("#btnUpdate").hide();
	$("#btnDelete").hide();
}

/* 제휴사 목록 조회 */
function search(){
    var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmMain");
    grdList.loadUrl(url,param);
}

/* 그리드 로드 */
function grdList_load(gridView,gridId){
    search();
}

/* 제휴사등록 버튼 클릭 */
function clearRegScreen(){
	var today = moment();
    var dt = today.format("YYYYMMDD");
    
    $("#btnInsert").show();
    $("#btnUpdate").hide();
    $("#btnDelete").hide();
    
    /* 콤보박스는 0번째 index 값으로 초기화 */
	$("#cprtCmpNo").val("");
	$("#cprtCmpNm").val("");
	$("#cprtCmpRegYmd").val(dt); 	// 제휴사등록일 오늘날짜로 초기화
	$("#cprtCmpMemoCtnts").val("");
	$("#cprtStatusCd").val("002"); 	// 제휴상태 '제휴해제'로 초기화
	$("#cprtDivCd").val("001"); 	// 제휴구분 '카드제휴'로 초기화
	$("#bizNo").val("");
	$("#cprtCmpTypeCd").val("001"); // 기업유형 '개인'으로 초기화
	$("#telNo").val("");
	$("#zipCd").val("");
	$("#addr1Ctnts").val("");
	$("#addr2Ctnts").val("");
	$("#execvdempNm").val("");
	$("#birthday").val("");
	$("#gndrCd").val("1");			// 성별 '남'으로 초기화
	$("#deptNm").val("");
	$("#rspofNm").val("");
	$("#picTelNo").val("");
	$("#emailAddr").val("");
}

/* 등록 버튼 클릭 */
$("#btnInsert").click(function(){
	
	var bConfirm = confirm("등록하시겠습니까?");
	if(!bConfirm){
		return;
	}
	
	dayMinusChange();
	telNoMinusChange();
	var param = Utilities.formToMap("frmMain");
	
	param.stat="C";
	
	var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
	Utilities.getAjax(url,param,true,function(data,jqXHR){
		if(Utilities.processResult(data,jqXHR,"등록에 실패했습니다."))
		{
			alert("등록에 성공했습니다.");
			search();
			dayPlusChange();
			telNoPlusChange();
		}
	});
});

/* 수정 버튼 클릭 */
$("#btnUpdate").click(function(){
	
	var bConfirm = confirm("수정하시겠습니까?");
	if(!bConfirm){
		return;
	}
	
	dayMinusChange();
	telNoMinusChange();
	var param = Utilities.formToMap("frmMain");
	
	param.stat="U";
	
	var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
	Utilities.getAjax(url,param,true,function(data,jqXHR){
		if(Utilities.processResult(data,jqXHR,"수정에 실패했습니다."))
		{
			alert("수정에 성공했습니다.");
			search();
			dayPlusChange();
			telNoPlusChange();
		}
	});
});

/* 삭제 버튼 클릭 */
$("#btnDelete").click(function(){
	
	if($("#cprtCmpNo").val() == ""){
		alert("삭제할 제휴사를 선택해주세요.");
		return;
	}
	
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
			search();
			clearUploadGrid(); 
			clearTargetGrid(); 
			clearRegScreen();
		}
	});
});

/* 주소 팝업 종료 후처리 */
function onAddressSelect(data){
	$("#zipCd").val(data.zipNo);
	$("#addr1Ctnts").val(data.roadAddr);
}

/* 주소 팝업 호출 */
function popupZip(){
	Utilities.openZipPop("onAddressSelect");
}

/* 그리드 셀 클릭 */
function grdList_cellClick(gridView, itemIndex, column, index, field){
	
	$("#btnInsert").hide();
	$("#btnUpdate").show();
	$("#btnDelete").show();
	
	var objJson = gridView.getCurrentJson();
	
	$("#cprtCmpNo").val(objJson.cprtCmpNo);
	$("#cprtCmpNm").val(objJson.cprtCmpNm);
	$("#cprtCmpRegYmd").val(objJson.cprtCmpRegYmd);
	$("#cprtCmpMemoCtnts").val(objJson.cprtCmpMemoCtnts);
	$("#cprtStatusCd").val(objJson.cprtStatusCd);
	$("#cprtDivCd").val(objJson.cprtDivCd);
	$("#bizNo").val(objJson.bizNo);
	$("#cprtCmpTypeCd").val(objJson.cprtCmpTypeCd);
	$("#telNo").val(objJson.telNo);
	$("#zipCd").val(objJson.zipCd);
	$("#addr1Ctnts").val(objJson.addr1Ctnts);
	$("#addr2Ctnts").val(objJson.addr2Ctnts);
	$("#execvdempNm").val(objJson.execvdempNm);
	$("#birthday").val(objJson.birthday);
	$("#gndrCd").val(objJson.gndrCd);
	$("#deptNm").val(objJson.deptNm);
	$("#rspofNm").val(objJson.rspofNm);
	$("#picTelNo").val(objJson.picTelNo);
	$("#emailAddr").val(objJson.emailAddr);
	
	clearUploadGrid();
	searchTargetCust();
	dayPlusChange();
	telNoPlusChange();
}

/* 대상 고객 조회 */ 
function searchTargetCust(){
	var execvdempListIFrmObj = $("#execvdempListIFrm")[0].contentWindow;
	var execvdempUploadIFrmObj = $("#execvdempUploadIFrm")[0].contentWindow;
	execvdempListIFrmObj.searchTargetCust();
	execvdempUploadIFrmObj.searchTargetCust();
}

/* 업로드 고객 그리드 초기화 */ 
function clearUploadGrid(){
	var execvdempUploadIFrmObj = $("#execvdempUploadIFrm")[0].contentWindow;
	execvdempUploadIFrmObj.clearUploadGrid();
}

/* 대상고객 그리드 초기화 */ 
function clearTargetGrid(){
	var execvdempListIFrmObj = $("#execvdempListIFrm")[0].contentWindow;
	var execvdempUploadIFrmObj = $("#execvdempUploadIFrm")[0].contentWindow;
	execvdempListIFrmObj.clearTargetGrid();
	execvdempUploadIFrmObj.clearTargetGrid();
}

/* 기본정보, 제휴사직원정보 초기화 */
function clearInfo(){
	$("#cprtCmpNo").val("");
	$("#cprtCmpNm").val("");
	$("#cprtCmpRegYmd").val("");
	$("#cprtCmpMemoCtnts").val("");
	$("#cprtStatusCd").val("");
	$("#cprtDivCd").val("");
	$("#bizNo").val("");
	$("#cprtCmpTypeCd").val("");
	$("#telNo").val("");
	$("#zipCd").val("");
	$("#addr1Ctnts").val("");
	$("#addr2Ctnts").val("");
	$("#execvdempNm").val("");
	$("#birthday").val("");
	$("#gndrCd").val("");
	$("#deptNm").val("");
	$("#rspofNm").val("");
	$("#picTelNo").val("");
	$("#emailAddr").val("");
}

/* 탭 클릭 */
$("document").ready(function(){
	/* tab */
	$(".jsTab li > a").on("click",function(){
		$(this).parent().parent().children().removeClass("active");
		$(this).parent().addClass("active");
		$(this).parent().parent().parent().parent().children(".tabCont").addClass("hidden");
		$( $(this).attr("href") ).removeClass("hidden");
		return false;
	});
	/* tab */
});

/* 제휴사등록일 '-' 패턴 */
function dayPlusChange()
{
	if($("#birthday").val() != ""){
		var strBirthday = $("#birthday").val().replace(/-/g,"");
		var strBirthdayY = strBirthday.substr(0,4);
		var strBirthdayM = strBirthday.substr(4,2);
		var strBirthdayD = strBirthday.substr(6,2);
		strBirthday = strBirthdayY + "-" + strBirthdayM + "-" + strBirthdayD;
		$("#birthday").val(strBirthday);
	}
	
	if($("#cprtCmpRegYmd").val() != ""){
		var strDay = $("#cprtCmpRegYmd").val().replace(/-/g,"");
		var strDayY = strDay.substr(0,4);
		var strDayM = strDay.substr(4,2);
		var strDayD = strDay.substr(6,2);
		strDay = strDayY + "-" + strDayM + "-" + strDayD;
		$("#cprtCmpRegYmd").val(strDay);
	}
}

/* 제휴사등록일 '-' 패턴 */
function dayMinusChange()
{
	if($("#birthday").val() != ""){
		var strBirthday = $("#birthday").val().replace(/-/g,"");
		$("#birthday").val(strBirthday);
	}
	
	if($("#cprtCmpRegYmd").val() != ""){
		var strDay = $("#cprtCmpRegYmd").val().replace(/-/g,"");
		$("#cprtCmpRegYmd").val(strDay);
	}
}

/* 전화번호 '-' 패턴 */
function telNoPlusChange()
{
	if($("#telNo").val() != ""){
		var strTelNo = $("#telNo").val().replace(/-/g,"");
		var strFrontNo = strTelNo.substr(0,2);
		var strMiddleNo = strTelNo.substr(2,3);
		var strBackNo = strTelNo.substr(5,4);
		strTelNo = strFrontNo + "-" + strMiddleNo + "-" + strBackNo;
		$("#telNo").val(strTelNo);
	}
	
	if($("#picTelNo").val() != ""){
		var strPicTelNo = $("#picTelNo").val().replace(/-/g,"");
		var strFrontNo = strPicTelNo.substr(0,2);
		var strMiddleNo = strPicTelNo.substr(2,3);
		var strBackNo = strPicTelNo.substr(5,4);
		strPicTelNo = strFrontNo + "-" + strMiddleNo + "-" + strBackNo;
		$("#picTelNo").val(strPicTelNo);
	}
}

/* 전화번호 '-' 패턴 */
function telNoMinusChange()
{
	if($("#telNo").val() != ""){
		var strTelNo = $("#telNo").val().replace(/-/g,"");
		$("#telNo").val(strTelNo);
	}
	
	if($("#picTelNo").val() != ""){
		var strPicTelNo = $("#picTelNo").val().replace(/-/g,"");
		$("#picTelNo").val(strPicTelNo);
	}
}

</script>