<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="mPopup1">
    <form id="frmMain">
    
    
    <input type="hidden" name="mshipStmpBasNo" id="mshipStmpBasNo" value="${stmpIssue.mshipStmpBasNo}">
    <input type="hidden" name="mshipGradeCd" id="mshipGradeCd" value="${stmpIssue.mshipGradeCd}">
    
    
    
    
    <!-- header -->
    <div class="title">
        <h1>스탬프 발급</h1>
        <a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
    </div>
    <!-- //header -->

    <!-- cont -->
    <div class="cont" id="testDiv">
        
        <!-- grid -->
        <div class="mGrid2">
                
                <!-- board -->
                <div class="mBoard2"> 
                	
                    <table>
                        <caption>스탬프발급</caption>
                        <colgroup>
                            <col width="15%">
                            <col width="25%">
                            <col width="15%">
                            <col width="10%">
                            <col width="5%">
                            <col width="15%">
                            <col width="15%">
                        </colgroup>
                        <tbody>
                        <tr>
                                <th class="left" scope="row">스탬프마스터</th>
                                <td>
                                    <input type="text" class="it" id="stmpBasNm" name="stmpBasNm" value="${stmpIssue.stmpBasNm}" readonly />
                                </td>
                                <th class="left" scope="row">발급일</th>
                                <td colspan=2>
                                    <input type="text" class="it" id="pblsDt" name="pblsDt" value="${stmpIssue.pblsDt}" readonly/>
                                </td>
                                <th class="left" scope="row">발급자</th>
                                <td>
                                    <input type="text" class="it" id="issuer" name="issuer" readonly/>
                                </td>
                            </tr>
                            
                            <tr>
                                <th class="left" scope="row">최대판수</th>
                                <td>
                                    <input type="text" class="it" id="stmpMaxCnt" name="stmpMaxCnt" value="${stmpIssue.stmpMaxCnt}" readonly/>
                                </td>
                                 <th class="left" scope="row">현재완성 판수</th>
                                <td colspan=2>
                                    <input type="text" class="it" id="stmpAccumCnt" name="stmpAccumCnt" value="" readonly/>
                                </td>
                               
                                <th class="left" scope="row">1판당 스탬프수</th>
                                <td>
                                    <input type="text" class="it" id="stmpQnty" name="stmpQnty" value="${stmpIssue.stmpQnty}" readonly/>
                                </td>
                               
                            </tr>
                            
                            <tr>
                            	<th class="left" scope="row">현재 스탬프수</th>
                                <td>
                                    <input type="text" class="it" id="stmpAccumQnty" name="stmpAccumQnty" readonly/>
                                </td>
                                <th class="left" scope="row">발행 스탬프수</th>
                                <td colspan="2">
                                    <input type="text" class="it" id="issueAccumCnt" name="issueAccumCnt"/>
                                </td>
                                <th class="left" scope="row" colspan="2">실제 발급받을 수량</th>
                            </tr>
                            
                            <tr>
                                <th class="left" scope="row">회원명</th>
                                <td>
                                    <input type="text" class="it" id="custNm" name="custNm" value="" onclick="searchUser()" placeholder="선택하세요" readonly/>
                                </td>
                                 <th class="left" scope="row">휴대전화번호</th>
                                <td colspan=4>
                                    <input type="text" class="it" id="mphonNo" name="mphonNo" value="" readonly/>
                                </td>
                               
                            </tr>
                            <tr>
                                <th class="left" scope="row">통합고객번호</th>
                                <td>
                                    <input type="text" class="it" id="itgCustNo" name="itgCustNo" value="" readonly/>
                                </td>
                                
                                <th class="left" scope="row">회원등급</th>
                                <td colspan=4>
                                    <input type="text" class="it" id="mshipGradeCdNm" name="mshipGradeCdNm" value="" readonly/>
                                </td>
                            </tr>
                            <tr>
                                
                                 <th class="left" scope="row">매장코드</th>
                                <td>
                                    <input type="text" class="it" id="storNo" name="storNo" value="${stmpIssue.storNo}"/>
                                </td>
                                
                                 <th class="left" scope="row">전표번호</th>
                                <td colspan=4>
                                    <input type="text" class="it" id="chitNo" name="chitNo" value="${stmpIssue.chitNo}"/>
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
	<a href="#;" class="mBtn1" id="btnStmp">스탬프발급</a>
	<a href="#" data-btn-type="closeModal" class="mBtn1">창닫기</a>
</div>

<!-- 팝업 -->
<!-- layer -->
<div id="jsLayer1" class="mLayer1" style="display: none;">
    <div class="title">
        <h2>통합회원 조회</h2>
        <a href="javascript:closePop()" class="close jsBtnClose1">팝업 닫기</a>
    </div>
    <!-- sort -->
    <form role="form" id="frmSearch" name="frmSearch" onsubmit="search()">
    
    <input type="hidden" id="stat" name="stat" value="${addMode}"/>
	<input type="hidden" id="mshipStmpBasNo" name="mshipStmpBasNo" value="${mshipStmpBasNo}"/>
		
    <div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
        <ul>
            <li class="wAuto ml20">
                <div class="tit">통합회원 명</div>
                <div class="txt">
                    <input type="text" class="it w90 data-check" title="통합회원 명"  name="custNm" id="custNm" value="">
                </div>
            </li>
            <li class="wAuto ml35">
                <div class="tit">통합회원 코드</div>
                <div class="txt">
                    <input type="text" class="it w90 " title="통합회원 코드" name="itgCustNo" id="itgCustNo" value="">
                    <span class="button">
                        <button type="submit" class="mBtn1" data-click="search">검색</button>
                    </span>
                </div>
            </li>
        </ul>
        <!-- <div class="button posRt"> 우측 정렬 : class="posRt"
            <a href="#" class="mBtn1 lPrimary">확인</a>
        </div> -->
        <div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
            <a href="#" class="mBtn1 lPrimary" id="btnSndStmp"  data-click="sndStmp">선택</a>
        </div>
    </div>
    </form>
    <!-- //sort -->
    	<div id="divGrid"  style="height:500px"
			  data-post="Y"
			  data-grid-id="grdList"
			  data-pagenation="Y"
			  data-get-url="<c:url value='/example/getList'/>"
			  data-type="grid" 
			  data-tpl-url="<c:url value='/static/gridTemplate/memship/crmSmtpPopupUser.xml'/>"
			  >
			</div>
			
    
</div>
<!-- //layer -->


<script>

/* 화면 로드 */
window.onload = function(){
	
	var today = moment();
    var dt = today.format("YYYY-MM-DD");
	
    $("#issuer").val('${LOGIN_USER.userNm}');
    
    if($("#pblsDt").val() == ""){
    	$("#pblsDt").val(dt);
    	
    	$("#storNo").val("1001");
    	//$("#chitNo").val("1001");
    	$("#storNo").attr("readonly", true);
        $("#chitNo").attr("readonly", true);
    }else{
    	// $("#btnStmp").hide();
    	
        $("#occurPointScore").attr("readonly", true);
        $("#storNo").attr("readonly", true);
        $("#chitNo").attr("readonly", true);
        $("#saleAmt").attr("readonly", true);
    }
}

/* 스탬프 발급 버튼 클릭 */
$("#btnStmp").click(function(){
	
	
	if( $('#mshipStmpBasNo').val() == '' ){
        alert("발급할 스탬프 마스터를 선택해 주세요.");
        $("#stmpBasNm").focus();
        return false;
    }
	
	if( $('#itgCustNo').val() == '' ){
        alert("회원을 선택해 주세요.");
        return false;
    }
	
	if( $('#issueAccumCnt').val() == '' ){
        alert("발행 수량을 입력해 주세요.");
        return false;
    }
	
	var bConfirm = confirm("스탬프를 발급하시겠습니까?");
	if(!bConfirm){
		return;
	}
	
	var today = moment();
	var dt = today.format("YYYYMMDDhhmmss");
	
	$("#pblsDt").val(dt);
	
	var param = Utilities.formToMap("frmMain");
	
	/* if(!validate(param))
		return; */
	
	var url = "<c:url value='${urlPrefix}/sub/stmpPopup/saveStmpIssue${urlSuffix}'/>";
	Utilities.getAjax(url,param,true,function(data,jqXHR){
		if(Utilities.processResult(data,jqXHR,"스탬프 발급에 실패했습니다."))
		{
			alert("스탬프 발급에 성공했습니다.");
			Utilities.closeModal();
		}
	});
});

/* 필수 값 체크 */
function validate(param){

	if(!param.pblsDivCd){
        alert("이벤트명은 필수입니다.");
        $("#pblsDivCd").focus();
        return false;
    }
    
	return true;
}


function searchUser() {
	//$('.mLayer1').show();
	var url = "<c:url value='${urlPrefix}/popUser${urlSuffix}'/>?mshipStmpBasNo="+$.trim($('#mshipStmpBasNo').val());
 	Utilities.openModal(url, 900, 650); 
	
}

function closeStmpPop() {
	$('.mLayer1').hide();
}

function bindStmp(data){

	if(data != null){
		$("#custNm").val( data.custNm );
		$("#itgCustNo").val( data.itgCustNo );
		$("#mphonNo").val( data.mphonNoMasking );
		$("#mshipGradeCdNm").val( data.mshipGradeCdNm );
		$("#stmpAccumCnt").val( data.accumCnt );
		$("#stmpAccumQnty").val( data.stmpAccumQnty );
	}	
	
}

</script>