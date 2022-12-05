<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="mPopup1">
    
    <!-- header -->
    <div class="title">
        <h1>등급</h1>
        <a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
    </div>
    <!-- //header -->

    <!-- cont -->
    <div class="cont">
        <p class="mInfo2" data-info="nextGrade"><span class="check">${nextGradeName}까지 <strong class="txtRed">${nextOffset }</strong>만점 남았습니다.</span></p>
        <!-- graph -->
        <div class="mGraph1" >
            <div class="back"><img src="/static/cmm/images/img_graph1.png" alt="그래프 배경 : 고객등급(화이트, 브론즈, 실버, 골드, VIP), 고객여정(잠재고객, 가망고객, 체험고객, 구매고객, 충성고객)"></div>
            <!-- score 254 -->
            <div class="mScore1" style="left:${(myLevel-1  )*165 + 89}px" data-my-grade='info'>
                <div class="row level5" data-grade-cd="006">
                    <span class="ti" data-grade-title="006">${ myGradeCd eq "006" ? "현위치" : gradeNm006 }</span>
                    <span class="sc"><strong data-grade-point="006">${myGradeCd eq "006" ? myScore : grade006 }</strong>만점</span>
                </div>
                <div class="row level4" data-grade-cd="005">
                    <span class="ti" data-grade-title="005">${  myGradeCd eq "005" ? "현위치" : gradeNm005 }</span>
                    <span class="sc"><strong data-grade-point="005">${myGradeCd eq "005" ? myScore : grade005 }</strong>만점</span>
                </div>
                <div class="row level3" data-grade-cd="004">
                    <span class="ti" data-grade-title="004">${ myGradeCd eq "004" ? "현위치" :  gradeNm004 }</span>
                    <span class="sc"><strong data-grade-point="004">${myGradeCd eq "004" ? myScore : grade004 }</strong>만점</span>
                </div>
                <div class="row level2" data-grade-cd="003">
                    <span class="ti" data-grade-title="003">${ myGradeCd eq "003" ? "현위치" :  gradeNm003 }</span>
                    <span class="sc"><strong data-grade-point="003">${myGradeCd eq "003" ? myScore : grade003 }</strong>만점</span>
                </div>
                <div class="row level1" data-grade-cd="002">
                    <span class="ti" data-grade-title="002">${  myGradeCd eq "002" ? "현위치" : gradeNm002 }</span>
                    <span class="sc"><strong data-grade-point="002">${myGradeCd eq "002" ? myScore : grade002 }</strong>만점</span>
                </div>
            </div>
            <!-- //score -->
        </div>
        <!-- //graph -->
    </div>
    <!-- //cont -->
    
</div>
<script>
$(document).ready(()=>{
	const myGrade = ${myGrade};
// 	for(let i=2;i<7;i++){
//         if(myGrade != i && myGrade+1 != i)
//               $('[data-grade-cd=00'+i+']').css('visibility','hidden');
//     }
	for(let i=2;i<myGrade;i++){
		$('[data-grade-cd=00'+i+']').css('visibility','hidden');
	}
	
	if(${myGrade eq nextGrade}){
		$("[data-info]").hide();
	}
});
</script>