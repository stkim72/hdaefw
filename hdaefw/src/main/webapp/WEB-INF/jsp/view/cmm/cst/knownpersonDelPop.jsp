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
        <h1>지인 삭제</h1>
        <a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
    </div>
    <!-- //header -->
	
    <!-- cont -->
    <div class="cont">
            <!-- <div class="txt">
				선택한 내역을 삭제하시겠습니까?\n(마지막 확인 질문입니다.)
			</div> -->
			<h3 class="mTitle">선택한 내역을 삭제하시겠습니까?</h3>
			<h3 class="mTitle">(마지막 확인 질문입니다.)</h3>
       		<div class="button" style="text-align:center; margin:15px 0px 0px 0px;">
                <a href="#" class="mBtn1" data-click="btnOk">예</a>
                  
                <a href="#" class="mBtn1" data-click="btnNo">아니오</a>
            </div>
    </div>
    <!-- //cont -->
	</form>
</div>

<script>

function btnOk(){
	var callbackName = "deleteKnownperson";
    var win = Utilities.getOpener();
    try{
        if(win[callbackName])
            win[callbackName]("Y");    
    }catch(e){}
    Utilities.closeModal();
}

function btnNo(){
 	var callbackName = "deleteKnownperson";
    var win = Utilities.getOpener();
    try{
        if(win[callbackName])
            win[callbackName]("N");    
    }catch(e){} 
	Utilities.closeModal();
}

</script>