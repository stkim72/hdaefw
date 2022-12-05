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
			<h3 class="mTitle1">고객그룹 목록</h3>
			<div class="gRt posT-5">
				<a href="#" data-auth-type="u" style="display:none"  class="mBtn1 lPrimary" data-click="groupBasInfoAddPop">등록</a>
				<a href="#" data-auth-type="d" style="display:none"  data-click="groupBasInfoDel" class="mBtn1 lWhite">삭제</a>
			</div>
		</div>
		<!-- //title -->
		
		<!-- 고객그룹 검색영역 -->
        <div class="mSort2 mini pl0"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
        	<form role="form" id="frmSearch">
            <ul class="mr60"> <!-- class="mr60" => margin-right="60"-->
                <li class="w75per">
                    <div class="tit w50">일자구분</div>
                    <div class="txt">
                        <code:commCode name="searchUseDateType" codeCd="S090" className="select w100" prefixLabel="전체" />
                        <input class="it w65" type="text" data-type="dateRangeStart" data-range-end="searchUseEndDay" id="searchUseStaDay" name="searchUseStaDay" data-button="Y" disabled />
                        <span class="bar">~</span>
						<input class="it w65" type="text" id="searchUseEndDay" name="searchUseEndDay" data-button="Y" disabled />
                    </div>
                </li>
                <li class="w25per">
                    <div class="tit w50">공개여부</div>
                    <div class="txt">
                        <code:commCode name="ottpYn" codeCd="S050" prefixLabel="전체" />
                    </div>
                </li>
                <li class="w40per">
                    <div class="tit w50">사용여부</div>
                    <div class="txt">
                        <code:commCode name="useYn" codeCd="S050" prefixLabel="전체" className="select w100" />
                    </div>
                </li>
                <li class="w60per">
                    <div class="tit">그룹명</div>
                    <div class="txt">
                        <input type="text" class="it" title="그룹명" name="custGrpNm">
                    </div>
                </li>
            </ul>
            </form>
            <div class="button posRt">
                <a href="#" class="mBtn1" data-click="groupBasListGet">검색</a>
            </div>
        </div>
        <!-- //고객그룹 검색영역 -->
        
        <!-- //고객그룹 그리드영역 -->
		<div id="divGroupInfoGrid" style="height:85%" 
			data-post="Y" 
			data-grid-id="grdGroupInfo" 
			data-pagenation="N" 
			data-get-url="" 
			data-load-focus="N"
			data-block-ui="Y"
			data-type="grid" 
			data-grid-callback="onGridLoad" 
			data-tpl-url="<c:url value='/static/gridTemplate/cst/cmmCustGrpBas.xml'/>">
		</div>
		<!-- //고객그룹 그리드영역 -->
	</div>
    
</div>
<!-- //left -->
<!-- right -->
<div class="gRight"><!--
	<div class="mSort2 medium">
		<ul>
			<li class="wAuto">
				<div class="tit">고객그룹 목록</div>
				<div class="txt">
					<input type="text" class="it" title="고객그룹 목록">
				</div>
			</li>
		</ul>
		<div class="button posRt">
			<a href="#" class="mBtn1 r5 lWhite2"><span class="iMms">문자</span></a>
			<a href="#" class="mBtn1 r5 lWhite2"><span class="iAlert">알림톡</span></a>
			<a href="#" class="mBtn1 r5 lWhite2"><span class="iEmail">이메일</span></a>
		</div>
	</div>-->
    <!-- //sort -->
    
    <!-- box -->
    <div class="mBox1">
        <div class="gTitle1 line">
            <h3 class="mTitle1">기본정보</h3>
            <div class="gRt">
                <a href="#" class="mBtn1 lGray" data-auth-type="u" style="display:none"  data-click="groupBasInfoUpd">수정</a>
            </div>
        </div>
        <!-- board -->
        <div class="mBoard2">
        	<form role="form" id="frmDetail">
            <table>
                <caption>기본정보</caption>
                <colgroup>
                    <col width="8%">
                    <col width="13%">
                    <col width="8%">
                    <col width="20%">
                    <col width="8%">
                    <col width="10%">
                    <col width="7%">
                    <col width="*">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row" class="left"><span class="iMust">그룹ID</span></th>
                        <td>
                            <input type="text" class="it" title="그룹ID" name="custGrpNo" value="" disabled>
                        </td>
                        <th scope="row" class="left"><span class="iMust">고객그룹명</span></th>
                        <td colspan="3">
                            <input type="text" class="it" title="고객그룹명" name="custGrpNm">
                        </td>
                        <th scope="row" class="left">등록자</th>
                        <td>
                            <input type="text" class="it" name="regrInfo" value="" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="left"><span class="iMust">그룹유형코드</span></th>
                        <td>
                            <code:commCode name="custGrpTypeCd" codeCd="GR020" prefixLabel="그룹유형코드" />
                        </td>
                        <th scope="row" class="left"><span class="iMust">사용기간</span></th>
                        <td>
                            <div class="mDate1">
                            	<input class="it" type="text" data-type="dateRangeStart" data-range-end="useEndDay" id="useStaDay" name="useStaDay" data-button="Y" value="" /> ~ 
								<input class="it" type="text" id="useEndDay" name="useEndDay" data-button="Y" value=""/>
                            </div>
                        </td>
                        <th scope="row" class="left">등록일</th>
                        <td>
                            <input type="text" class="it" name="regDt" value="" disabled>
                        </td>
                        <th scope="row" class="left" rowspan="2">그룹설명</th>
                        <td rowspan="2">
                            <textarea class="textarea" rows="2" title="그룹설명" name="custGrpCtnts"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="left"><span class="iMust">공개여부</span></th>
                        <td class="left">
                            <code:commCode name="ottpYn" codeCd="S050" />
                        </td>
                        <th scope="row" class="left"><span class="iMust">사용여부</span></th>
                        <td class="left" colspan="3">
                            <code:commCode name="useYn" codeCd="S050" className="select w106" />
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
			<li class="active"><a id="targetExtTabBtn" href="#targetExtTab">대상고객 추출방법</a></li>
			<li><a id="targetRelTabBtn" href="#targetRelTab">대상고객 선정</a></li>
			<li><a id="targetCustTabBtn" href="#targetCustTab">대상고객</a></li>
			<li><a id="sendHistoryTabBtn" href="#sendHistoryTab">발송이력</a></li>
		</ul>
	</div>
	
	<div id="targetExtTab" class="mBox1 p10 tabCont ">
		<iframe data-tab-type="iframe" id="targetExtIFrm" scrolling="yes" src="<c:url value='${urlPrefix}/custGroup/pageTargetExtInfo'/>${urlSuffix}" 
				style="width: 100%; min-height: 300px; border: 0px; height: 628px;"></iframe>
	</div>
	<div id="targetRelTab" class="mBox1 p10 tabCont hidden">
		<iframe data-tab-type="iframe" id="targetRelIFrm" scrolling="yes" src="<c:url value='${urlPrefix}/custGroup/pageTargetRelInfo'/>${urlSuffix}" 
				style="width: 100%; min-height: 300px; border: 0px; height: 628px;"></iframe>
	</div>
	<div id="targetCustTab" class="mBox1 p10 tabCont hidden">
		<iframe data-tab-type="iframe" id="targetCustIFrm" scrolling="yes" src="<c:url value='${urlPrefix}/custGroup/pageTargetCustInfo'/>${urlSuffix}" 
				style="width: 100%; min-height: 300px; border: 0px; height: 628px;"></iframe>
	</div>
	<div id="sendHistoryTab" class="mBox1 p10 tabCont hidden">
		<iframe data-tab-type="iframe" id="targetCustSendIFrm" scrolling="yes" src="<c:url value='${urlPrefix}/custGroup/pageTargetCustSendInfo'/>${urlSuffix}" 
				style="width: 100%; min-height: 300px; border: 0px; height: 628px;"></iframe>
	</div>
</div>
<!-- //right -->

<script>
	var currRowKey = 0;	//변경이 있을 경우에도 기존 선택된 로우정보를 유지할 수 있도록 변수지정
	var currPageNum = 1;
	
	$("document").ready(function(){
		frameOnload();

		$('#frmSearch [name="searchUseDateType"]').change(function(){
			var selVal = $(this).val();
			if(selVal == ""){
				$('#frmSearch [name="searchUseStaDay"]').val("");
				$('#frmSearch [name="searchUseEndDay"]').val("");
				$('#frmSearch [name="searchUseStaDay"]').attr("disabled",true);
				$('#frmSearch [name="searchUseEndDay"]').attr("disabled",true);
			}else{
				$('#frmSearch [name="searchUseStaDay"]').removeAttr("disabled");
				$('#frmSearch [name="searchUseEndDay"]').removeAttr("disabled");
			}
		});
		
	});

	//모든 아이프레임 내용의 로딩을 끝낸후 데이터 호출(호출된 데이터를 아이프레임 DOM으로 보내기 위함)
	function frameOnload(){
		var loaded = 0;
		$('#targetExtIFrm, #targetRelIFrm, #targetCustIFrm, #targetCustSendIFrm').bind('load',function () {
			//console.log("load > "+ (++loaded));
			++loaded;
			if(loaded >= 4){
				groupBasListGet();
			}
		});
	}

	function groupBasListInit(){
		grdGroupInfo.movePage(currPageNum);
	}

	function groupBasListGet(){
		currRowKey = 0;
		var url = "<c:url value='${urlPrefix}/custGroup/getGroupBasList${urlSuffix}'/>";
		var param = Utilities.formToMap("frmSearch");
//console.log("=======> 고객그룹 기본페이지 초기화");
		grdGroupInfo.loadUrl(url,param);
	}

	function grdGroupInfo_dataLoaded(grid,jsonList,data){
//console.log("=========dataLoaded currRowKey > "+ currRowKey);
		if(jsonList.length > 0){	//검색된 자료가 있다면 제일최상위 로우를 선택한다.
			currPageNum = grdGroupInfo.getCurrentPage();
//console.log("=========focusAt> "+ currRowKey + " / data : "+ jsonList.length);
			if(currRowKey >= jsonList.length){
				currRowKey = 0;
			}
			grdGroupInfo.focusAt(currRowKey, 1);	//data-load-focus로 인해 안해도 된다.
			groupBasInfoView(grdGroupInfo.getJsonRow(currRowKey).custGrpNo);
		}else{	//검색된 자료가 없다면 기존 출력됐던 정보들을 초기화 한다.
			currRowKey = 0;
			currPageNum = -1;
			groupBasInfoSetting();
		}
	}

	function grdGroupInfo_rowChanged(grdList, oldRow, newRow, rowData) {
//console.log("=========grdGroupInfo_rowChanged > "+ newRow);
		if (newRow > -1) {
			currRowKey = newRow;
			groupBasInfoView(grdGroupInfo.getJsonRow(currRowKey).custGrpNo);
		}
	}

	function grdGroupInfo_cellClick(gridView, itemIndex, column, index, field){return;
//console.log("=========grdGroupInfo_cellClick>"+ grdGroupInfo.getJsonRow(itemIndex).custGrpNo);
		currRowKey = itemIndex;

		groupBasInfoView(grdGroupInfo.getJsonRow(itemIndex).custGrpNo);
	}
	
	function groupBasInfoSetting(data){
		if(data != null){
			Utilities.mapToForm(data, "frmDetail");
			subInfoSetting(data.custGrpNo);
		}else{
			Utilities.resetForm("frmDetail");
			subInfoSetting("");
		}
	}

	function subInfoSetting(custGrpNo){
		var targetExtIFrmObj = $("#targetExtIFrm")[0].contentWindow; 
		var targetRelIFrmObj = $("#targetRelIFrm")[0].contentWindow; 
		var targetCustIFrmObj = $("#targetCustIFrm")[0].contentWindow; 
		var targetCustSendIFrmObj = $("#targetCustSendIFrm")[0].contentWindow; 
		
		targetExtIFrmObj.initPage(custGrpNo);
		targetRelIFrmObj.initPage(custGrpNo);
		targetCustIFrmObj.initPage(custGrpNo);
		targetCustSendIFrmObj.initPage(custGrpNo);
	}

	function groupBasInfoView(custGrpNo){
		var param = {
			custGrpNo : custGrpNo
		};
		var url = "<c:url value='${urlPrefix}/custGroup/getGroupBasInfo'/>${urlSuffix}";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "고객그룹정보 읽기에 실패했습니다.")) {
				groupBasInfoSetting(data);
			}
		});
	}

	function groupBasInfoAddPop(){
		var url = "<c:url value='${urlPrefix}/custGroup/popGroupBasInfoReg${urlSuffix}'/>";
		Utilities.openModal(url,800,320);
	}

	function groupBasInfoUpd(){
		var param = Utilities.formToMap("frmDetail");
		var numRegExp = /^[0-9]+$/;		//숫자만
		var tarRegExp = /[<>'\"]/gi;	//태그만(/[<>\\'\"]/gi)

		if(Utilities.isEmpty(param.custGrpNo)){
			alert("고객그룹을 선택해주세요.");return;
		}
		if(Utilities.isEmpty(param.custGrpNm)){
			alert("그룹명을 입력해주세요.");return;
		}else{
			if (tarRegExp.test(param.custGrpNm)) {alert("특수문자는 입력할 수 없습니다.");return;}
		}
		if(Utilities.isEmpty(param.custGrpTypeCd)){
			alert("고객그룹유형을 입력해주세요.");return;
		}
		if(Utilities.isEmpty(param.useStaDay)){
			alert("사용기간 시작일을 입력해주세요.");return;
		}else{
			if (!numRegExp.test(param.useStaDay)) {alert("숫자만 입력 가능합니다.");return;}
		}
		if(Utilities.isEmpty(param.useEndDay)){
			alert("사용기간 종료일을 입력해주세요.");return;
		}else{
			if (!numRegExp.test(param.useEndDay)) {alert("숫자만 입력 가능합니다.");return;}
		}
		if(param.useStaDay > param.useEndDay){
			alert("사용기간의 시작일이 종료일보다 큽니다.");return;
		}

		if (!confirm("고객그룹 정보를 수정하시겠습니까?")) return;
		
		var url = "<c:url value='${urlPrefix}/custGroup/updGroupBasInfo${urlSuffix}'/>";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "고객그룹정보 수정에 실패했습니다.")) {
				alert("고객그룹정보 수정에 성공했습니다.");
				grdGroupInfo.reload();
			}
		});
	}
	
	function groupBasInfoDel() {
		var saveJson = grdGroupInfo.getCheckedJson();
		if (saveJson.length == 0) {
			alert("삭제할 데이터를 선택해주세요.");
			return;
		}
		
		if (saveJson.length) {
			if (!confirm("데이터를 삭제하면 복구할 수 없습니다.\n계속하시겠습니까?"))
				return;
			var url = "<c:url value='${urlPrefix}/custGroup/delGroupBasInfoList${urlSuffix}'/>";
			Utilities.getAjax(url, saveJson, true, function(data, jqXHR) {
				if (Utilities.processResult(data, jqXHR, "고객그룹정보 삭제에 실패했습니다.")) {
					alert("고객그룹정보 삭제에 성공했습니다.");
					grdGroupInfo.removeCheckRow();	//ROW추가만한 데이터의 삭제를 위해
					window.location.reload();
				}
			});
		} else {
			alert("선택된 데이터가 없습니다.");
		}
	}

	//iframe 자식페이지에서 부모페이지의 프레임 탭을 활성화하기 위한 함수
	function tabCall(tabID){
		var tabObj = $(tabID);
		tabObj.click();
	}




	


	
	function testCall(){
		var firstData = grdGroupInfo.getJsonRow(0);
		//console.log("testCall : "+ JSON.stringify(firstData));
		//testWait(0.5);
		//grdGroupInfo.focusAt(1, 1);
		//$("#targetRelTabBtn").click();
		var targetExtIFrmObj = $("#targetExtIFrm")[0].contentWindow; 

		targetExtIFrmObj.initPage(firstData.custGrpNo);
	}

	/* 
	function groupBasInfoGridSave(){
		grdGroupInfo.addRow();

		var saveJson = grdGroupInfo.getSaveJson();
console.log("===\n"+JSON.stringify(saveJson));
		if (saveJson.length == 0) {
			alert("저장할 데이터가 존재하지 않습니다.");
			return;
		}

		var url = "<c:url value='${urlPrefix}/saveGroupBasInfoList${urlSuffix}'/>";
		Utilities.getAjax(url, saveJson, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "고객그룹 저장에 실패했습니다.")) {
				alert("고객그룹 저장에 성공했습니다.");
				grdStore.reload();
			}
		});
	}
	*/
</script>