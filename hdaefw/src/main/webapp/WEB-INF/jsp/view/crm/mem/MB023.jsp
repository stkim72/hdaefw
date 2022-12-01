<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="mPopup1">
    <form id="frmSearch">
    <!-- header -->
    <div class="title">
        <h1>부정적립 포인트 상세정보(개인정보)</h1>
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
                        <caption>포인트발행</caption>
                        <colgroup>
                            <col width="10%">
                            <col width="15%">
                            <col width="10%">
                            <col width="15%">
                            <col width="10%">
                            <col width="15%">
                            <col width="10%">
                            <col width="10%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th class="left" scope="row">통합고객번호</th>
                                <td>
                                    <input type="text" class="it" id="itgCustNo" name="itgCustNo" value="${BlackCusPointIssue.itgCustNo}" readonly/>
                                </td>
                                <th class="left" scope="row">이름</th>
                                <td>
                                    <input type="text" class="it" id="custNm" name="custNm" value="${BlackCusPointIssue.custNm}" readonly/>
                                </td>
                                <th class="left" scope="row">생년월일</th>
                                <td>
                                    <input type="text" class="it" id="birthday" name="birthday" value="${BlackCusPointIssue.birthday}" readonly/>
                                </td>
                                <th class="left" scope="row">성별</th>
                                <td>
                                    <code:commCode name="gndrCd" id="gndrCd" codeCd="S040" selectedValue="${BlackCusPointIssue.gndrCd}" others="disabled "/>
                                </td>
                            </tr>
                            <tr>
                                <th class="left" scope="row">휴대전화번호</th>
                                <td>
                                    <input type="text" class="it" id="mphonNo" name="mphonNo" value="${BlackCusPointIssue.mphonNo}" readonly/>
                                </td>
                                <th class="left" scope="row">이메일</th>
                                <td>
                                    <input type="text" class="it" id="emailAddr" name="emailAddr" value="${BlackCusPointIssue.emailAddr}" readonly/>
                                </td>
                                <th class="left" scope="row">전화번호</th>
                                <td>
                                    <input type="text" class="it" id="corpTelNo" name="corpTelNo" value="${BlackCusPointIssue.corpTelNo}" readonly/>
                                </td>
                                <th class="left" scope="row">외국인</th>
                                <td>
                                    <code:commCode name="fornYn" id="fornYn" codeCd="CU120" selectedValue="${BlackCusPointIssue.fornYn}" others="disabled "/>
                                </td>
                            </tr>
                            <tr>
                                <th class="left" scope="row">고객상태</th>
                                <td>
                                    <code:commCode name="custStatusCd" id="custStatusCd" codeCd="CU020" selectedValue="${BlackCusPointIssue.custStatusCd}" others="disabled "/>
                                </td>
                                <th class="left" scope="row">고객유형</th>
                                <td>
                                    <code:commCode name="custTypeCd" id="custTypeCd" codeCd="CU030" selectedValue="${BlackCusPointIssue.custTypeCd}" others="disabled "/>
                                </td>
                                <th class="left" scope="row">상태변경</th>
                                <td>
                                    <input type="text" class="it" id="bllkRegDt" name="bllkRegDt" value="${BlackCusPointIssue.bllkRegDt}" readonly/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //board -->

        </div>
        <!-- //grid -->
    </div>
	<div class="mBox1 p24">	
		<div class="mSort2 medium"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
			<ul>
			    <li class="wAuto ml20">
			        <div class="tit">기간</div>
					<div class="txt">
						<div class="mDate1">
							<input class="it" type="text" data-type="dateRangeStart" data-range-end="pblsEndDt" id="pblsStaDt" name="pblsStaDt" data-enter="search" data-button="Y"/>
							<span class="bar">~</span>
							<input class="it" type="text" id="pblsEndDt" name="pblsEndDt" data-enter="search" data-button="Y"/>
						</div>
					</div>
			    </li>
			    <li class="wAuto ml35">
			        <div class="tit">사용구분</div>
					<div class="txt">
						<code:commCode id="useTypeCd" name="useTypeCd" codeCd="PO010" prefixLabel="전체" prefixValue=""/>
					</div>
			    </li>
			</ul>
			<div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
		       	<a href="#" data-click="search" class="mBtn1">검색</a>
		   	</div>
		</div>
	    	
	    <!-- list -->
	
		<div id="divGrid" style="height:${rightBoxHeight2}"  
					data-grid-id="grdList" 
		         	data-pagenation="Y"
		        	data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
					data-type="grid"
					data-scroll-x="Y"
					data-grid-callback="onGridLoad"
					data-tpl-url="<c:url value='/static/gridTemplate/mem/MB023.xml'/>">
		</div>
	</div>
    <!-- //list -->
    
    <!-- //cont -->
	</form>
</div>

<script>

/* 화면 로드 */
window.onload = function(){
	birthdayChange();
	mphonNoChange();
}

/* 포인트 발생 목록 조회 */
function search(){
	var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    grdList.loadUrl(url,param);
}

/* 그리드 로드 */
function grdList_load(gridView,gridId){
    search();
}

/* 생년월일 '-' 패턴 */
function birthdayChange()
{
	if($("#birthday").val() != ""){
		var strBirthday = $("#birthday").val().replace(/-/g,"");
		var strBirthdayY = strBirthday.substr(0,4);
		var strBirthdayM = strBirthday.substr(4,2);
		var strBirthdayD = strBirthday.substr(6,2);
		strBirthday = strBirthdayY + "-" + strBirthdayM + "-" + strBirthdayD;
		$("#birthday").val(strBirthday);
	}
}

/* 휴대전화 '-' 패턴 */
function mphonNoChange()
{
	if($("#mphonNo").val() != ""){	
		var strmphonNo = $("#mphonNo").val().replace(/-/g,"");
		var strFrontNo = strmphonNo.substr(0,3);
		var strMiddleNo = strmphonNo.substr(3,4);
		var strBackNo = strmphonNo.substr(7,4);
		strmphonNo = strFrontNo + "-" + strMiddleNo + "-" + strBackNo
		$("#mphonNo").val(strmphonNo);
	}
}

</script>