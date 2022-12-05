<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="mPopup1">
    <form id="frmMain">
    <!-- header -->
    <div class="title">
        <h1>증감 내역 수정</h1>
        <a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
    </div>
    <!-- //header -->
	
    <!-- cont -->
    <div class="cont">
        <div>
            <div class="txt">
				<input type="text" class="it" id=occurPointScore name="occurPointScore"/>
			</div>
        </div>
        <div>
       		<div class="button" style="text-align:center; margin:15px 0px 0px 0px;">
                <a href="#" class="mBtn1" data-click="confirm">확인</a>
            </div>
        </div>
    </div>
    <!-- //cont -->
	</form>
</div>

<script>

function confirm(){
	if($("#occurPointScore").val() == ""){
		alert("포인트를 입력하지 않았습니다.");
		return;
	}
	
	var callbackName = "updateOccurPointScore";
    var win = Utilities.getOpener();
    try{
        if(win[callbackName])
            win[callbackName]($("#occurPointScore").val());    
    }catch(e){}
    Utilities.closeModal();
}

</script>