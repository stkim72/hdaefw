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

<body class="bgGray"> <!-- 회색배경 : class="bgGray" -->

    <!-- module -->
    <div class="mVm1 mIntro1">
        <div class="cont">
            <h1><img src="/static/crm/images/logo_intro.png" alt="Create Well Life CERAGEM 통함 CRM"></h1>
            <div class="list">
                <ul>
                    <li class="ico1">
                        <a href="/main">
                            <strong class="tit">통합고객</strong>
                            <span class="txt">Biz 전 과정 통찰 및 관리스템</span>
                        </a>
                    </li>
                    <li class="ico2">
                        <a href="/main">
                            <strong class="tit">멤버십</strong>
                            <span class="txt">Biz 전 과정 통찰 및 관리스템</span>
                        </a>
                    </li>
                    <li class="ico3">
                        <a href="/main">
                            <strong class="tit">캠페인</strong>
                            <span class="txt">AI를 통한 고객 응대 프로세스의 혁신</span>
                        </a>
                    </li>
                    <li class="ico4">
                        <a href="/main">
                            <strong class="tit">공통</strong>
                            <span class="txt">고객응대 관련 상담처리 어드바이저</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
 </body>
</html>