<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%>

<div class="title">
	<h1>순서변경</h1>
	<a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
</div>
<div class="cont">
	<div class="gTitle1 line">
            <h3 class="mTitle1">순서변경</h3>
            <div class="gRt">
             	<a href="#" class="mBtn1 primary" id="btnSave" data-click="saveSeq">저장</a>
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
					</tbody>
				</table>
			</div>
		</form>

	</div>
</div>

<script>
	function saveSeq() {
		var list = $("#sortBody").find("tr");
		var arr = [];
		for (var i = 0; i < list.length; i++) {
			arr.push($(list[i]).data());
		}
		if (Utilities.getOpener().changeSeq)
			Utilities.getOpener().changeSeq(arr);
		Utilities.closeModal();
	}
	$(document).ready(
			function() {
				var param = Utilities.getOpener().sortList;
				var bd = $("#sortBody");
				bd.sortable({
					helper : function(event, ui) {
						ui.children().each(function() {
							$(this).width($(this).width());
						});
						return ui;
					},
				});
				bd.disableSelection();
				for (var i = 0; i < param.list.length; i++) {
					var item = param.list[i];
					var tr = $("<tr><td>" + (i + 1) + "</td><td>"
							+ item[param.textKey] + "</td></tr>");
					tr.data(item);
					bd.append(tr);
				}
			});
</script>