<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%>

<form role="form" id="frmSearch">
	<div class="mSort2 medium">
		<ul>
			<li class="wAuto">
				<div class="tit">등록일자</div>
				<div class="txt">
					<div class="mDate1">
						<input type="text" class="it date" title="시작일" data-type="dateRangeStart" data-range-end="endDt" id="strtDt" name="strtDt" data-enter="search" data-button="Y" value="">
						<span class="bar">~</span>
						<input type="text" class="it date" title="마지막일" id="endDt" name="endDt" data-enter="search" data-button="Y" value="">
					</div>
				</div>
			</li>
			<li class="wAuto">
				<div class="tit">관계</div>
				<div class="txt">
					<div class="mFlex2">
						<span class="flex">
                        	<code:commCode name="acqieRelCd" id="acqieRelCd" codeCd="CU330" prefixLabel="전체" prefixValue=""/>
                        </span>
                              
					</div>
				</div>
			</li>
		</ul>
		<div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
            <a href="#" data-click="search" class="mBtn1">검색</a>
            <a href="#" data-click="searchPop" class="mBtn1 primary">지인추가</a>
        </div>
	</div>
</form>

<div  id="divGrid" style="height:335px" data-grid-id="grdList" 
	data-pagenation="Y" 
	data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
	data-type="grid" 
	data-grid-callback="onGridLoad" 
	data-tpl-url="<c:url value='/static/gridTemplate/cst/CR027.xml'/>">
</div>




<script>

/* 목록 조회함수 */
function search()
{
    var url = "<c:url value='${urlPrefix}/getKnownpersonList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    //if(parent.document.all["itgCustNo"].value != "")
    if(parent.parenItgCustNo)	
    {
    	//param.itgCustNo = parent.document.all["itgCustNo"].value;
    	param.itgCustNo = parent.parenItgCustNo;
    	grdList.loadUrl(url,param);
    }
}

/* 그리드 로드 */
function grdList_load(gridView,gridId){
    search();
}

/* 그리드 관계수정 버튼 클릭 */
function grdList_btnSave_buttonClicked(gridView,row,col,json){
	
	var bConfirm = confirm("지인관계를 수정하시겠습니까?");
	if(!bConfirm){
		return;
	}
	
    var callbackName = "updateKnownperson";
    var url = "<c:url value='${urlPrefix}/knownpersonSavePop?callback=" + callbackName + "${urlSuffix}'/>";
	Utilities.openModal(url,200,180);
}

/* 그리드 관계삭제 버튼 클릭 */
function grdList_btnDel_buttonClicked(gridView,row,col,json){
	
	/* var bConfirm = confirm("지인관계를 삭제하시겠습니까?");
	if(!bConfirm){
		return;
	} */
	
	var callbackName = "deleteKnownperson";
	var url = "<c:url value='${urlPrefix}/knownpersonDelPop?callback=" + callbackName + "${urlSuffix}'/>";
	Utilities.openModal(url,300,200);
}

/* 회원목록 검색 팝업 로드 */
function searchPop(){
	
	var param = {};
	param.itgCustNo = parent.document.all["itgCustNo"].value;
	
	/* if(!validate(param))
		return;  */
	
	var url = "/util/searchCust";
    Utilities.openModal(url,1000,600);
}

/* 회원목록 검색 팝업 종료 후처리 */
function custNmSelect(data){
	
	var param = {};
	param.itgCustNo = parent.parenItgCustNo;
	param.acqieItgCustNo = data.itgCustNo;
	param.stat="C";
	
 	if(!validate(param))
		return; 
	
 	var url = "<c:url value='${urlPrefix}/saveKnownperson${urlSuffix}'/>";
 	Utilities.blockUI();
	Utilities.getAjax(url,param,true,function(data,jqXHR){
		Utilities.unblockUI();
		if(Utilities.processResult(data,jqXHR,"지인등록에 실패했습니다."))
		{
			alert("지인등록에 성공했습니다.");
			search();
		}
	});
	
}

/* 관계수정 콜백 */
function updateKnownperson(data)
{
	var { rowKey, columnName } = grdList.getFocusedCell();
	var param = {};
	
	param.acqieRelCd = data;
	param.acqieHstSeq = grdList.getValue(rowKey, "acqieHstSeq");
	
	
/*  	if(!validate(param))
		return;  */
	
  	var url = "<c:url value='${urlPrefix}/saveAcqieRelCd${urlSuffix}'/>";
	Utilities.getAjax(url,param,true,function(data,jqXHR){
		if(Utilities.processResult(data,jqXHR,"관계수정에 실패했습니다."))
		{
			alert("관계수정에 성공했습니다.");
			search();
		}
	});
}

/* 관계삭제 콜백 */
function deleteKnownperson(data)
{ 
	if(data == "Y")
	{
		var { rowKey, columnName } = grdList.getFocusedCell();
		var param = {};
		
		param.acqieHstSeq = grdList.getValue(rowKey, "acqieHstSeq");
		param.stat="D";
		
	 	var url = "<c:url value='${urlPrefix}/saveKnownperson${urlSuffix}'/>";
		Utilities.getAjax(url,param,true,function(data,jqXHR){
			if(Utilities.processResult(data,jqXHR,"지인삭제에 실패했습니다."))
			{
				alert("지인삭제에 성공했습니다.");
				search();
			}
		});
	} 
	
}

/* 필수 값 체크 */
function validate(param){
	
	if(!param.itgCustNo){
        alert("고객선택 후 등록해주세요.");
        return false;
    }
	else if (param.itgCustNo == param.acqieItgCustNo)
	{
		alert("본인은 등록할 수 없습니다.");
        return false;
	}
	
	var cuGridData = grdList.getJsonRows();
	
	for(var i=0; i<cuGridData.length; i++)
	{
		if(cuGridData[i].acqieItgCustNo == param.acqieItgCustNo)
		{
			alert("이미 등록되어 있는 지인입니다.");
			return false;
		}
		
	}
	return true;
}

//setToday(); 

</script>