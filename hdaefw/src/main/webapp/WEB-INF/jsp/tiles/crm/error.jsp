<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 
 <!DOCTYPE html>
<html lang="ko">
<head>

	<title>CERAGEM</title>
	<tiles:insertTemplate template="header.jsp" />
</head>

<body>

    <!-- module -->
    <div class="mVm1 mError1">
        <div class="cont">
            <strong class="tit">${ empty title ? "Error Page" : title }</strong>
            <p class="txt">${ empty txt ? "요청하신 페이지를 찾을 수 없습니다." : txt }</p>
        </div>
    </div>
    <!-- //module -->
<script>
	function goBack() {

		if (parent != window) {
			if (document.referrer == parent.document.referrer
					|| document.referrer == parent.location.href) {
				Utilities.closeModal();
				return;
			}
			history.back();

		} else {
			history.back();
		}

	}
</script>
</body>
</html>