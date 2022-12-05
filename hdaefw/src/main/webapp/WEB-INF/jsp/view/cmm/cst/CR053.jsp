<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="title">
	<h1>고객그룹</h1>
	<a href="#" data-btn-type="closeModal"  class="close">팝업 닫기</a>
</div>

<div class="cont">
    <div class="gTitle1 line">
        <h3 class="mTitle1">입력정보</h3>
        <div class="gRt">
            <a href="#" class="mBtn1 lPrimary" data-click="groupBasInfoAdd">등록</a>
        </div>
    </div>
    <!-- board -->
    <div class="mBoard2">
    	<form role="form" id="frmInput">
        <table>
            <caption>기본정보</caption>
            <colgroup>
                <col width="10%">
                <col width="12%">
                <col width="10%">
                <col width="20%">
                <col width="5%">
                <col width="*%">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row" class="left"><span class="iMust">고객그룹명</span></th>
                    <td colspan="5">
                        <input type="text" class="it" title="고객그룹명" value="" name="custGrpNm">
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="left"><span class="iMust">그룹유형코드</span></th>
                    <td>
                        <code:commCode name="custGrpTypeCd" codeCd="GR020" prefixLabel="그룹유형코드" />
                    </td>
                    <th scope="row" class="left"><span class="iMust">사용기간</span></th>
                    <td class="left" colspan="3">
                    	<input class="it w70" type="text" data-type="dateRangeStart" data-range-end="useEndDay" id="useStaDay" name="useStaDay" data-button="Y" value="" />
	                	<span class="bar">~</span>
						<input class="it w70" type="text" id="useEndDay" name="useEndDay" data-button="Y" value=""/>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="left"><span class="iMust">공개여부</span></th>
                    <td class="left">
                        <code:commCode name="ottpYn" codeCd="S050" className="select w106" />
                    </td>
                    <th scope="row" class="left"><span class="iMust">사용여부</span></th>
                    <td colspan="3" class="left">
                        <code:commCode name="useYn" codeCd="S050" className="select w106" />
                    </td>
                </tr>
                <tr>
                	<th scope="row" class="left" rowspan="3">그룹설명</th>
                    <td colspan="5">
                        <textarea class="textarea" rows="4" title="그룹설명" name="custGrpCtnts"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
        </form>
    </div>
</div>

<script>
	$("document").ready(function(){
	});

	function groupBasInfoAdd(){
		var param = Utilities.formToMap("frmInput");
		var numRegExp = /^[0-9]+$/;		//숫자만
		var tarRegExp = /[<>'\"]/gi;	//태그만(/[<>\\'\"]/gi)
		
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
		
		Utilities.blockUI();
		var url = "<c:url value='${urlPrefix}/custGroup/addGroupBasInfo${urlSuffix}'/>";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "고객그룹정보 등록에 실패했습니다.")) {
				Utilities.unblockUI();
				alert("고객그룹정보 등록에 성공했습니다.");
				Utilities.getOpener().location.reload();	//오프너를 모달팝업 닫기전에 사용해야한다.
				Utilities.closeModal();
			}
		});
		
	}
</script>