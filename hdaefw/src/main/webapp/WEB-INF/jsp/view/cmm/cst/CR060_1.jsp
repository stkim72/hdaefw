<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="title">
	<h1>고객그룹 수정</h1>
	<a href="#" data-btn-type="closeModal"  class="close">팝업 닫기</a>
</div>

<div class="cont">
    <!-- box -->
    <div class="mBox1">
        <div class="gTitle1 line">
            <h3 class="mTitle1">기본정보</h3>
            <div class="gRt">
                <a href="#" class="mBtn1 lGray" data-click="groupBasInfoUpd">수정</a>
            </div>
        </div>
        <!-- board -->
        <div class="mBoard2">
        	<form role="form" id="frmDetail">
            <table>
                <caption>기본정보</caption>
                <colgroup>
                    <col width="8%">
                    <col width="12%">
                    <col width="8%">
                    <col width="20%">
                    <col width="8%">
                    <col width="9%">
                    <col width="7%">
                    <col width="*">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row" class="left">그룹ID</th>
                        <td>
                            <input type="text" class="it" title="그룹ID" name="custGrpNo" value="" readonly>
                        </td>
                        <th scope="row" class="left">고객그룹명</th>
                        <td colspan="3">
                            <input type="text" class="it" title="고객그룹명" name="custGrpNm">
                        </td>
                        <th scope="row" class="left" rowspan="3">그룹설명</th>
                        <td rowspan="3">
                            <textarea class="textarea" rows="4" title="그룹설명" name="custGrpCtnts"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="left">그룹유형코드</th>
                        <td>
                            <code:commCode name="custGrpTypeCd" codeCd="GR020" />
                        </td>
                        <th scope="row" class="left">사용기간</th>
                        <td>
                            <div class="mDate1">
                            	<input class="it" type="text" data-type="dateRangeStart" data-range-end="useEndDay" id="useStaDay" name="useStaDay" data-button="Y" value="" /> ~ 
								<input class="it" type="text" id="useEndDay" name="useEndDay" data-button="Y" value=""/>
                            </div>
                        </td>
                        <th scope="row" class="left">등록일</th>
                        <td>
                            <input type="text" class="it" name="regDt" value="" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="left">공개여부</th>
                        <td>
                            <code:commCode name="ottpYn" codeCd="S050" />
                        </td>
                        <th scope="row" class="left">사용여부</th>
                        <td colspan="3" class="left">
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
		발송이력
	</div>
</div>
<!-- //right -->

<script>
	var currRowKey = 0;	//변경이 있을 경우에도 기존 선택된 로우정보를 유지할 수 있도록 변수지정
	var currCustGrpNo = '<c:out value="${custGrpNo}"/>';
	
	$("document").ready(function(){
		frameOnload();
	});

	//모든 아이프레임 내용의 로딩을 끝낸후 데이터 호출(호출된 데이터를 아이프레임 DOM으로 보내기 위함)
	function frameOnload(){
		var loaded = 0;
		$('#targetExtIFrm, #targetRelIFrm, #targetCustIFrm').bind('load',function () {
			//console.log("load > "+ (++loaded));
			++loaded;
			if(loaded >= 3){
				groupBasListGet();
			}
		});
	}

	function groupBasListGet(){
		if(currCustGrpNo != null){
			groupBasInfoView(currCustGrpNo);
		}else{	//검색된 자료가 없다면 기존 출력됐던 정보들을 초기화 한다.
			currRowKey = 0;
			groupBasInfoSetting();
		}
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

		targetExtIFrmObj.initPage(custGrpNo);
		targetRelIFrmObj.initPage(custGrpNo);
		targetCustIFrmObj.initPage(custGrpNo);
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

	function groupBasInfoUpd(){
		var param = Utilities.formToMap("frmDetail");
		if(param.custGrpNo == ""){
			alert("고객그룹을 선택해주세요.");
			return false;
		}
		
		var url = "<c:url value='${urlPrefix}/custGroup/updGroupBasInfo${urlSuffix}'/>";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "고객그룹정보 수정에 실패했습니다.")) {
				alert("고객그룹정보 수정에 성공했습니다.");
				groupBasListGet();
			}
		});
	}

	//iframe 자식페이지에서 부모페이지의 프레임 탭을 활성화하기 위한 함수
	function tabCall(tabID){
		var tabObj = $(tabID);
		tabObj.click();
	}

</script>