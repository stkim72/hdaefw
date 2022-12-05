<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%>


<div class="title">
	<h1 data-txt-title=""></h1>
	<a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
</div>
<div class="cont">
	<div class="gTitle1 line">
            <h3 class="mTitle1" data-txt-title=""></h3>
            <div class="gRt">
             	<a href="#" class="mBtn1 " id="btnSave" style="display:none" data-click="save">저장</a>
            </div>
    </div>
	<div class="mBox1">
		
		<form id="frmMain">
			<div class="mBoard2">
				<table>
					<colgroup>
						<col width="10%">
						<col width="90%">
					</colgroup>
					<tbody id="sortBody">
						<tr>
							<td colspan="2">
							<textarea id="textValue" style='width:100%;height:${empty height? "500" : height }px'>${text }</textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>

	</div>
</div>
<script>

function save(){
    if(Utilities.getOpener().changeText)
        Utilities.getOpener().changeText($("#textValue").val());
    Utilities.closeModal();
}
$(document).ready(function(){
    var param = Utilities.getOpener().textDialog.text;
    var title = Utilities.getOpener().textDialog.title;
    var readonly = Utilities.getOpener().textDialog.readonly;
    if(!param)
        param  = "";
    $("#textValue").val(param);
    if(!title)
        title = "text";
    $("[data-txt-title]").html(title);
    if(readonly){
        $("#textValue").prop("readonly" , true);
        $("#btnSave").hide();
    }else
    	$("#btnSave").show();

});
</script>