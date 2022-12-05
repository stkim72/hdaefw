<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<!-- left -->
<div class="gLeft" data-has-size="Y">
	<div class="mBox1">
		<!-- title -->
        <div class="gTitle1">
            <h3 class="mTitle1">매장 목록</h3>
            <div class="gRt posT-5">
				<a href="#" class="mBtn1 lWhite" data-click="storeListDownload">엑셀 다운로드</a>
			</div>
        </div>
        <!-- //title -->
        
        <!-- 매장 검색영역 -->
        <div class="mSort2 mini pl0"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
        	<form role="form" id="frmStoreSearch">
            <ul class="mr60"> <!-- class="mr60" => margin-right="60"-->
                <li class="w50per">
                    <div class="tit w65">지역</div>
                    <div class="txt">
                        <code:commCode name="distrctCd" codeCd="CU100" className="select" prefixLabel="전체" />
                    </div>
                </li>
                <li class="w25per">
                    <div class="tit w65">매장구분</div>
                    <div class="txt">
                        <code:commCode name="storDivCd" codeCd="ST010" className="select w70" prefixLabel="전체" />
                    </div>
                </li>
                <li class="w25per">
                    <div class="tit w65">매장상태</div>
                    <div class="txt">
                        <code:commCode name="storStatusCd" codeCd="ST020" className="select w65" prefixLabel="전체" />
                    </div>
                </li>
                <li class="w50per">
                    <div class="tit w65">매장채널</div>
                    <div class="txt">
                        <code:commCode name="storChlCd" codeCd="ST040" className="select" prefixLabel="전체" />
                    </div>
                </li>
                <li class="w50per">
                    <div class="tit w65">매장명</div>
                    <div class="txt">
                        <input type="text" class="it" name="storNm" title="매장명">
                    </div>
                </li>
            </ul>
            </form>
            <div class="button posRt">
                <a href="#" class="mBtn1" data-click="storeBasListGet">검색</a>
            </div>
        </div>
        <!-- //매장 검색영역 -->
        
        <!-- //매장 그리드영역 -->
		<div id="divStoreInfoGrid" style="height:85%" 
			data-post="Y" 
			data-grid-id="grdStoreInfo" 
			data-pagenation="Y" 
			data-get-url="" 
			data-load-focus="N"
			data-block-ui="Y"
			data-type="grid" 
			data-grid-callback="onGridLoad" 
			data-tpl-url="<c:url value='/static/gridTemplate/mem/cmmStoreBas.xml'/>">
		</div>
		<!-- //매장 그리드영역 -->
	</div>
    
</div>
<!-- //left -->
<!-- right -->
<div class="gRight"><!--
	<div class="mSort2 medium">
		<ul>
			<li class="wAuto">
				<div class="tit">매장 코드</div>
				<div class="txt">
					<input type="text" class="it" title="매장 코드">
				</div>
			</li>
		</ul>
		<div class="button posRt">
			<a href="#" class="mBtn1 lGray">매장회원이관</a>
		</div>
	</div>-->
    <!-- //sort -->
    
    <!-- box -->
    <div class="mBox1">
        <div class="gTitle1 line">
            <h3 class="mTitle1">기본정보</h3>
            <div class="gRt">
                
            </div>
        </div>
        <!-- board -->
        <div class="mBoard2">
        	<form role="form" id="frmDetail">
            <table>
                <caption>기본정보</caption>
                <colgroup>
                    <col width="7%">
                    <col width="6%">
                    <col width="4%">
                    <col width="4%">
                    <col width="6%">
                    <col width="14%">
                    <col width="15%">
                    <col width="7%">
                    <col width="*%">
                    <col width="*">
                    <col width="8%">
                    <col width="7%">
                    <col width="5%">
                    <col width="5%">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row" class="left">매장코드</th>
                        <td colspan="3">
                            <input type="text" class="it" title="매장코드" value="" name="storNo" disabled>
                        </td>
                        <th scope="row" class="left">매장명</th>
                        <td colspan="2">
                            <input type="text" class="it" title="매장명" value="" name="storNm" disabled>
                        </td>
                        <th scope="row" class="left">등록일</th>
                        <td colspan="2" class="left">
                            <input type="text" class="it date" title="기간 시작일" value="" name="regDt" disabled>
                        </td>
                        <th scope="row" class="left">POS매장코드</th>
                        <td class="left" colspan="3">
                            <input type="text" class="it" title="POS매장코드" value="" name="posStorNo" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="left">매장상태</th>
                        <td colspan="3">
                        	<code:commCode name="storStatusCd" codeCd="ST020" prefixLabel="매장상태" others="disabled" />
                        </td>
                        <th scope="row" class="left">일반전화</th>
                        <td colspan="2">
                            <input type="text" class="it" title="일반전화" value="" name="telNo" disabled>
                        </td>
                        <th scope="row" class="left">지역</th>
                        <td colspan="2">
                            <code:commCode name="distrctCd" codeCd="CU100" prefixLabel="지역" others="disabled" />
                        </td>
                        <th scope="row" class="left">영업시간</th>
                        <td colspan="3">
                            <input type="text" class="it" title="영업시간" value="" name="useHour" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="left">기본주소</th>
                        <td colspan="6">
                            <div class="mFlex2">
                                <div class="mFind1">
                                    <input type="text" class="it" title="우편번호" value="" name="zipCd" disabled>
                                    <a href="#" class="iFind">검색</a>
                                </div>
                                <input type="text" class="it" title="기본주소" value="" name="addr1Ctnts" disabled>
                            </div>
                        </td>
                        <th scope="row" class="left">위도</th>
                        <td colspan="2">
                            <input type="text" class="it" title="위도" value="" name="lati" disabled>
                        </td>
                        <th scope="row" class="left">매장구분</th>
                        <td colspan="3">
                            <code:commCode name="storDivCd" codeCd="ST010" prefixLabel="매장구분" others="disabled" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="left">상세주소</th>
                        <td colspan="6">
                            <div class="mFlex2">
                                <input type="text" class="it" title="상세주소" name="addr2Ctnts" disabled>
                            </div>
                        </td>
                        <th scope="row" class="left">경도</th>
                        <td colspan="2">
                        	<input type="text" class="it" title="경도" value="" name="longi" disabled>
                        </td>
                        <th scope="row" class="left">매장채널</th>
                        <td colspan="3">
                            <code:commCode name="storChlCd" codeCd="ST040" prefixLabel="매장채널" others="disabled" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="left">매장메모</th>
                        <td colspan="13">
                            <textarea class="textarea " title="매장메모" rows="2" name="memoCtnts" disabled></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
            </form>
        </div>
        <!-- //board -->
    </div>
    <!-- //box -->

    <!-- tab -->
	<div class="mTab1 jsTab2">
		<ul>
			<!-- <li class="active"><a id="staffInfoTabBtn" href="#staffInfoTab">관리자/직원정보</a></li> -->
			<li class="active"><a id="memberInfoTabBtn" href="#memberInfoTab">회원목록</a></li>
		</ul>
	</div>
	<!--
	<div id="staffInfoTab" class="mBox1 p10 tabCont ">
		관리자/직원정보
		<%-- <iframe data-tab-type="iframe" id="targetExtIFrm" scrolling="yes" src="<c:url value='${urlPrefix}/inputTargetExtInfo'/>${urlSuffix}" 
				style="width: 100%; min-height: 300px; border: 0px; height: 580px;"></iframe> --%>
	</div>-->
	<div id="memberInfoTab" class="mBox1 p10 tabCont">
		<form role="form" id="frmMemberSearch">
		<div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
            <ul>
            	<li class="wAuto ml20">
                    <div class="tit">통합고객번호</div>
                    <div class="txt">
                        <input type="text" class="it w150" title="통합고객번호" name="itgCustNo">
                    </div>
                </li>
                <li class="wAuto ml20">
                    <div class="tit">고객명</div>
                    <div class="txt">
                        <input type="text" class="it w90" title="고객명" name="custNm">
                    </div>
                </li>
                <li class="wAuto ml35">
                    <div class="tit">성별</div>
                    <div class="txt">
                        <code:commCode name="gndrCd" codeCd="S040" className="select" prefixLabel="성별" />
                    </div>
                </li>
                <li class="wAuto ml20">
                    <div class="tit">연령</div>
                    <div class="txt">
                        <code:commCode name="ageStt" codeCd="S100" className="select wAuto" prefixLabel="연령대" />
		                 ~
		                <code:commCode name="ageEnd" codeCd="S100" className="select wAuto" prefixLabel="연령대" />
                    </div>
                </li>
                <li class="wAuto ml20">
                    <div class="tit">휴대전화번호</div>
                    <div class="txt">
                        <input type="text" class="it w90" title="휴대전화번호" name="mphonNo">
                    </div>
                    <span class="button">
                        <a href="#" class="mBtn1" data-click="storeCustListGet">검색</a>
                    </span>
                </li>
            </ul>
            <!-- add20220422 -->
            <div class="gRt">
                <a href="#" class="mBtn1 lPrimary" data-click="storeAllCustMovePop">전체회원 이관</a>
                <a href="#" class="mBtn1 lWhite" data-click="storeCustMovePop">선택회원 이관</a>
            </div>
            <!-- //add20220422 -->
        </div>
		</form>
		<div id="divStoreCustGrid" style="height:500px" 
			data-post="Y" 
			data-grid-id="grdStoreCust" 
			data-pagenation="Y" 
			data-get-url="" 
			data-block-ui="Y"
			data-type="grid" 
			data-grid-callback="onGridLoad" 
			data-tpl-url="<c:url value='/static/gridTemplate/mem/cmmStoreCust.xml'/>">
		</div>
		<%-- <iframe data-tab-type="iframe" id="targetRelIFrm" scrolling="yes" src="<c:url value='${urlPrefix}/inputTargetRelInfo'/>${urlSuffix}" 
				style="width: 100%; min-height: 300px; border: 0px; height: 580px;"></iframe> --%>
	</div>
</div>
<!-- //right -->

<script>
	var currRowKey = 0;//변경이 있을 경우에도 기존 선택된 로우정보를 유지할 수 있도록 변수지정
	var currPageNum = 1;
	var gridLoaded = 0;	//페이지내 모든 그리드 로딩 후 실행을 위해 변수지정
	
	$("document").ready(function(){
	});

	//모든 그리드 실행완료 후 데이터 로딩
	function onGridLoad(gridView, gridId) {
		++gridLoaded;
		if(gridLoaded >= 2){
			storeBasListGet();
		}
	}

	function storeBasListInit(){
		grdStoreInfo.movePage(currPageNum);
	}

	function storeBasListGet(){
		currRowKey = 0;
		var url = "<c:url value='${urlPrefix}/getStoreBasList${urlSuffix}'/>";
		var param = Utilities.formToMap("frmStoreSearch");
//console.log("=======> 매장 기본페이지 초기화");
		grdStoreInfo.loadUrl(url,param);
	}

	function grdStoreInfo_dataLoaded(grid,jsonList,data){
//console.log("=========dataLoaded > "+ grdStoreInfo.getCurrentPage());
		if(jsonList.length > 0){
			currPageNum = grdStoreInfo.getCurrentPage();
			//currRowKey = 0;
			if(currRowKey >= jsonList.length){
				currRowKey = 0;
			}
			grdStoreInfo.focusAt(currRowKey, 1);
			storeBasInfoView(grdStoreInfo.getJsonRow(currRowKey).storNo);
		}else{	//검색된 자료가 없다면 기존 출력됐던 정보들을 초기화 한다.
			currRowKey = -1;
			currPageNum = -1;
			storeBasInfoSetting();
		}
	}

	function storeBasInfoView(storNo){
		var param = {
				storNo : storNo
		};
		var url = "<c:url value='${urlPrefix}/getStoreBasInfo'/>${urlSuffix}";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "매장정보 읽기에 실패했습니다.")) {
				storeBasInfoSetting(data);
			}
		});
	}

	function storeBasInfoSetting(data){
		if(data != null){
			Utilities.mapToForm(data, "frmDetail");
			storeCustListGet();
		}else{
			Utilities.resetForm("frmDetail");
			storeCustListGet();
		}
	}

	function grdStoreInfo_rowChanged(gridView, oldRow, newRow,rowData){
//console.log("=========grdStoreInfo_rowChanged> "+ oldRow);	
		if (newRow > -1) {
			currRowKey = newRow;
			storeBasInfoView(grdStoreInfo.getJsonRow(currRowKey).storNo);
		}
	}

	function grdStoreInfo_cellClick(gridView, itemIndex, column, index, field){return;
		currRowKey = itemIndex;
//console.log("=========grdStoreInfo_cellClick> "+ (itemIndex+1));		
		storeBasInfoView(grdStoreInfo.getJsonRow(itemIndex).storNo);
	}

	function storeCustListGet(){
		grdStoreCust.clear();
		if(currRowKey < 0) return false;
		var currStorNo = grdStoreInfo.getJsonRow(currRowKey).storNo;
//console.log("=======> 현재 매장번호 : "+ currStorNo);		
		
		var url = "<c:url value='${urlPrefix}/getStoreCustPagingList${urlSuffix}'/>";
		var param = Utilities.formToMap("frmMemberSearch");
		param.storNo = currStorNo;
		
		grdStoreCust.loadUrl(url,param);
	}

	function storeAllCustMovePop(){
		if(currRowKey < 0){
			alert("매장을 선택해주세요.");
			return false;
		}
		
		var custList = grdStoreCust.getData();
		if (custList.length == 0) {
			alert("이관할 회원이 존재하지 않습니다.");
			return;
		}

		var url = "<c:url value='${urlPrefix}/popStoreCustMove${urlSuffix}'/>?isAll=Y";
		Utilities.openModal(url,1300,800);
	}

	function storeCustMovePop(){
		if(currRowKey < 0){
			alert("매장을 선택해주세요.");
			return false;
		}

		var custList = grdStoreCust.getCheckedJson();
		if(custList < 1){
			alert("이관할 회원을 선택해주세요.");
			return false;
		}
		
		var url = "<c:url value='${urlPrefix}/popStoreCustMove${urlSuffix}'/>?isAll=N";
		Utilities.openModal(url,1300,800);
	}

	function currStoreCustInfoGet(){
		var currStorNo = $('#frmDetail [name="storNo"]').val();
		var currStorNm = $('#frmDetail [name="storNm"]').val();
		var currStoreCustList = grdStoreCust.getCheckedJson();

		var param = {
			result : true,
			currStorNo : currStorNo,
			currStorNm : currStorNm,
			data : {
				contents : currStoreCustList
			}
		}

		return param;
	}

	function storeListDownload(){
		var saveJson = grdStoreInfo.getData();
		if (saveJson.length == 0) {
			alert("저장할 데이터가 존재하지 않습니다.");
			return;
		}
		
		if (!confirm("매장목록 엑셀파일을 다운로드 하시겠습니까?")) return;
		grdStoreInfo.exportExcel("매장목록 엑셀파일.xlsx", true);
	}

	function birthdayAge(grid,row,col,json,value){
		return Utilities.getBirthdayAge(value);
	}
</script>