<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="mPopup1">
    <form id="frmMain">
		<div class="title">
			<h1>회원조회</h1>
			<a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
		</div>
		<div class="cont">
    	<div class="mSort2 medium"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
	        <ul>
	            <li class="wAuto ml20">
	                <div class="tit">이름</div>
	                <div class="txt">
	                    <input type="text" name="custNm" id="custNm" class="it w90" title="이름" value="" >
	                </div>
	            </li>
	            <li class="wAuto ml35">
	                <div class="tit">휴대전화</div>
	                <div class="txt">
	                    <input type="text" name="mphonNo" id="mphonNo" class="it w120" title="휴대전화" value="">
	                </div>
	            </li>
	            <li class="wAuto ml35">
	                <div class="tit">통합고객번호</div>
	                <div class="txt">
	                    <input type="text" name="itgCustNo" id="itgCustNo" class="it w185" title="통합고객번호" value="">
	                </div>
	            </li>
	           
	        </ul>
	        <ul id="mshipId" hidden="true">
	            <li class="wAuto ml20" >
                    <div class="tit">멤버십ID</div>
                    <div class="txt">
                        <input type="text" name="mshipLoginId" id="mshipLoginId" class="it w185" title="멤버십" value="">
                    </div>
                </li>
	        </ul>
	        <div class="gRt">
	           <div class="mFlex2">
	               <a href="#" class="mBtn1" data-click="search">검색</a>
	           </div>
	        </div>
    	</div>
    	</div>
   	</form>
   <div class="mBox1 p24">	
   	<div  id="divGrid" style="height:${rightBoxHeight2}" data-grid-id="grdList" 
		data-pagenation="Y" 
		data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
		data-type="grid"
		data-block-ui="Y"
		data-grid-callback="onGridLoad" 
		data-tpl-url="<c:url value='/static/gridTemplate/cst/CR061.xml'/>">
	</div>
	</div>
</div>

<script>

window.onload = function(){
    
    if('${bkYn}' == "Y") 
    {
    	$("#mshipId").show();
    }
    else
    {
    	$("#mshipId").hide();
    }
}


var strCustNm = "";

function mykeyup()
{
	var str = $("#custNm").val();
	
	if(strCustNm == str )
	{
		return;
	}
	
	var check = /^[가-힣]+$/;
	
	if(check.test(str))
	{
		if(str.length >= 2)
		{
			search();
		}
	}
	
	strCustNm = str;
	
}

function search()
{
    var url = "<c:url value='${urlPrefix}/searchCust/getList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmMain");
    
    if(!validate(param))
	    return;
  
    grdList.loadUrl(url,param);
}

function onGridCellDblClick(gridView,itemIndex, column, json, value){
	parmaSend(json);
}

function parmaSend(json){
	
	var callbackName = "custNmSelect";
    var win = Utilities.getOpener();
    try{
        if(win[callbackName])
            win[callbackName](json);    
    }catch(e){}
    Utilities.closeModal();
}

/* 필수 값 체크 */
function validate(param){

    if(!param.custNm && !param.itgCustNo && !param.mphonNo && !param.mshipLoginId){
        alert("조회조건을 입력해주세요.");
        return false;
    }
    
    return true;
}


</script>