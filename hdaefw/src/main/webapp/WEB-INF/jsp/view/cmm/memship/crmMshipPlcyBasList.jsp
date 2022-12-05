<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 



<style>

.ui-widget-content .ui-state-active:hover {
	border: 1px solid #003eff;
	background: #007fff;
	font-weight: normal;
	color: #ffffff;
}

.ui-menu-item b {
	color: red;
}

.tui-datetime-input{
	width:110px;
}

.select{
	width:110px;
}
</style>



<script type="text/javascript" src="/static/js/validate.js?reqrend=${reqrend}"></script>

<c:set var="addMode" value="${addMode=true}" />

<script>
$(document).ready(function() {
	
	/* tab */
	$(".jsTab1 li > a").on("click",function(){
		$(this).parent().parent().children().removeClass("active");
		$(this).parent().addClass("active");
		return false;
	});
	$(".jsTab2 li > a").on("click",function(){
		$(this).parent().parent().children().removeClass("active");
		$(this).parent().addClass("active");
		$(this).parent().parent().parent().parent().children(".tabCont").addClass("hidden");
		$( $(this).attr("href") ).removeClass("hidden");
		return false;
	});
	/* //tab */
 
});

</script>

<style>

.tui-datetime-input {width:90px}
.select {width:90px}

</style>

<div id="wrapIframe">
	
    <div class="mGrid1 type3"> <!-- class="type3" => left:610px -->
        <!-- left -->
        <div class="gLeft">

            <!-- 고객정보 -->
            <div class=""  style="height:794px;margin-top:15px">
                <!-- title -->
                <div class="gTitle1">
                    <h3 class="mTitle1">고객등급별 정책 목록</h3>
                    <div class="gRt posT-5">
                        <a href="#" data-auth-type="c" style="display:none" class="mBtn1 lWhite"   data-click="cpyMem" id="btnCopy" >복사</a>
                        <a href="#" data-auth-type="c" style="display:none" class="mBtn1 lPrimary" data-click="newMem">신규등록</a>
                    </div>
                </div>
                <!-- //title -->
   
			
                <div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
                
                             <!-- sort -->
                
            <form role="form" id="frmSearch" name="frmSearch">
            
					<input type="hidden" name="currentPageNo" id="currentPageNo" value="1" />
			
                    <ul>
                        <li class="wAuto">
                            <!-- <div class="tit">회원등급</div> -->
                            <div class="txt">
                               
                               
                                <code:commCode  className="select data-check" id="mshipGradeCd" name="mshipGradeCd" codeCd="MB010" prefixLabel="맴버십등급" prefixValue="" change="chkGrade2"/>
                                    <code:commCode  className="select data-check" id="mshpGradeCd" name="mshpGradeCd" codeCd="MB020" prefixLabel="회원등급" prefixValue="" others="disabled" />
                                    <select class="select w150 data-check cprtCmpNo"  name="cprtCmpNo" id="cprtCmpNo" disabled>
                                    	<option value="">제휴사 선택</option>
                                    </select>
                                    
                                    
                            </div>
                        </li>
                        <li class="wAuto">
                          <!--   <div class="tit">사용여부</div> -->
                            <div class="txt">
                                <code:commCode  className="select data-check" id="statusCd" name="statusCd" codeCd="S010" prefixLabel="사용여부" prefixValue=""/>
                            </div>
                        </li>
                        <li class="wAuto">
                           
                            <div class="txt">
                                <input type="text" class="it w90"  data-type="dateRangeStart" data-range-end="sapplyStdEndYmd"   title="적용기준일" name="sapplyStdStaYmd" id="sapplyStdStaYmd"  placeholder="시작적용기준일"  value=""/>
                                  
                            </div>
                            
                            <span class="bar"> ~ </span>
                             <div class="txt">
                                 <input type="text" class="it w90"   data-enter="search" title="적용기준일" name="sapplyStdEndYmd" id="sapplyStdEndYmd" placeholder="종료적용기준일" value=""/>
                            </div>
                            
                            
                            
                            <span class="button">
                                <a href="#" class="mBtn1"  data-click="search">검색</a>
                            </span>
                        </li>
                    </ul>
                </form>
                
                </div>
                
                <!-- //sort -->
                <!-- list -->
               <!--  <div class="mBoard1 mCustomScrollbar h711"> --> <!-- class="h711" : height="711px"-->
                    
                <div id="divGrid" style="height:730px"
				  data-post="Y"
				  data-grid-id="grdList"
				  data-pagenation="Y"
				  data-get-url="<c:url value='/memberPolicy/getList'/>"
				  data-type="grid" 
				  data-tpl-url="<c:url value='/static/gridTemplate/memship/cmmMshipPlcyBas.xml'/>"
				  >
				</div>

                <!-- //list -->
				<!-- paging -->
				
				<!-- //paging -->
                <button class="btnClose">고객정보 닫기</button>
                <button class="btnWide">고객정보 크게보기</button> 
            </div>
            <!-- //고객정보 -->
            
        </div>
        <!-- //left -->
        <!-- right -->
        <div class="gRight">

            <!-- sort -->
            
            <div class="mSort2 medium"> <!-- class="medium" => 상하좌우 여백 좁은 사이즈-->
            
            <form id="frmApi" name="frmApi" method="post">
                <ul>
                    <li class="wAuto">
                        <div class="tit">정책코드</div>
                        <div class="txt">
                            <input type="text" class="it" style="width:160px" title="정책코드" id="mshipPlcyBasNo" class="mshipPlcyBasNo"  name="mshipPlcyBasNo"  readonly disabled value="" placeholder="자동생성">
                        </div>
                    </li>
                    
                  <!--   <li class="wAuto">
                        <div class="tit">적용등급</div>
                       
                    </li>
                    
                    <li class="wAuto">
                        <div class="tit" id="mshpGradeCdNm" style="width:50px"></div>
                      
                    </li>
                    
                    <li class="wAuto">
                        <div class="tit" id="mshipGradeCdNm" style="width:50px"></div>
                       
                    </li>
                    
                    <li class="wAuto">
                        <div class="tit" id="cprtCmpNoNm" style="width:80px"></div>
                       
                    </li>
                    
                    <li class="wAuto">
                        <div class="tit" id="statusCdNm" style="width:60px"></div>
                     
                    </li>
                    -->
                </ul>
                <div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
                 <!--    <a href="#" class="mBtn1 lGray">정책 API 반영</a> -->
                </div>
                
                </form>
            </div>
            <!-- //sort -->
            
            <!-- box -->
            <div class="" style="margin-top:15px">
            
            <form id="frmDetail" name="frmDetail" method="post">
            
				<input type="hidden" id="stat" name="stat" value="${addMode ? 'c' : 'u'}"/>
				<input type="hidden" id="regChlCd" name="regChlCd" value="CRM"/>
            

                <div class="gTitle1 line">
                    <h3 class="mTitle1">기본정보</h3>
                    <div class="gRt">
                    
                        <span data-auth-type="u" style="display:none" ><a href="#" class="mBtn1 lGray"  data-click="newMemship" id="btnEdit" style="display:none">수정</a></span>
                        <span data-auth-type="c" style="display:none" ><a href="#" class="mBtn1 lPrimary" data-click="newMemship"  id="btnReg" style="">등록</a></span>
                        
                    </div>
                </div>
                <!-- board -->
                <div class="mBoard2">
                    <table>
                        <caption>기본정보</caption>
                        <colgroup>
                            <col width="9%">
                            <col width="16%">
                            <col width="9%">
                            <col width="13%">
                            <col width="9%">
                            <col width="13%">
                            <col width="9%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                        
                         <tr>
                                <th scope="row" class="left">정책코드</th>
                                <td>
                                    <input type="text" class="it " title="정책코드" name="mshipPlcyBasNo" id="mshipPlcyBasNo" class="mshipPlcyBasNo"  maxlength="10"   readonly disabled  placeholder="자동생성"  value="">
                                </td>
                                
                                 <th scope="row" class="left">정책명</th>
                                <td colspan="3">
                                    <input type="text" class="it data-check" title="정책명" name="mshipPlcyNm" id="mshipPlcyNm"  value="">
                                </td>
                                
                                
                                <th scope="row" class="left">사용여부</th>
                                <td>
                                    <code:commCode  className="select data-check" id="statusCd" name="statusCd" codeCd="S010" prefixLabel="사용여부" prefixValue="" />
                                </td>
                            
                            </tr>
                            
                            <tr>
                                <th scope="row" class="left">회원등급</th>
                                <td colspan="4"  class="left">
                                   
                                    <code:commCode  className="select data-check" id="mshipGradeCd" name="mshipGradeCd" codeCd="MB010" prefixLabel="맴버십등급" prefixValue="" change="chkGrade"/>
                                    <code:commCode  className="select data-check" id="mshpGradeCd" name="mshpGradeCd" codeCd="MB020" prefixLabel="회원등급" prefixValue="" others="disabled" />
                                    <select class="select w150 data-check cprtCmpNo"  name="cprtCmpNo" id="cprtCmpNo" disabled>
                                    	<option value="">제휴사 선택</option>
                                    </select>
                                </td>
                                <th scope="row" class="left">적용기간</th>
                                <td colspan="2">
                                    <div class="mDate11">
                                        <input type="text" class="it data-check" style="width:80px" title="기간 시작일"  data-type="dateRangeStart" data-range-end="applyStdEndYmd"  data-button="Y"  name="applyStdStaYmd" id="applyStdStaYmd" value="">
                                    
                                     	<span class="bar">~</span>
								                        
										<input type="text" class="it data-check" style="width:80px" title="기간 마지막일" name="applyStdEndYmd" id="applyStdEndYmd" data-button="Y"  value="">
                                    </div>
                                </td>
                            </tr>
                        
                            <tr>
                                
                                <th scope="row" class="left">정책내용</th>
                                <td colspan="7" >
                                    <input type="text" class="it data-check" title="정책내용" name="mshipPlcyCtnts" id="mshipPlcyCtnts"  value="">
                                </td>
                                
                            
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
                
                <div class="gTitle1 line mt13">
                    <h3 class="mTitle1">등급 산정 정책</h3>
                </div>
                <!-- board -->
                <div class="mBoard2">
                    <table>
                        <caption>등급 산정 정책</caption>
                        
                        <colgroup>
                            <col width="8%">
                            <col width="20%">
                            <col width="8%">
                            <col width="20%">
                            <col width="5%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" class="left">산정기간</th>
                                <td class="">
                                  
                                      직전 <input type="text" style="width:60px"  class="it  data-check"  data-type="number" maxlength="4" title="산정기간"  placeholder="산정기간"  name="extrcStdMonth" id="extrcStdMonth" value=""> 개월
	                                
                                </td>
                                
                                <th scope="row" class="">승급점수</th>
                                <td class="left" colspan="2">
                                
                                    <input type="text" class="it  data-check w100 comma" title="승급점수시작" data-type="number2" name="advncmtStaScore" id="advncmtStaScore"  value=""> 점 
                                   ~
                                    <input type="text" class="it  data-check w100 comma" title="승급점수종료" data-type="number2" name="advncmtEndScore" id="advncmtEndScore"   value=""> 점    
                                    
                                </td>
                                
                                <th scope="row" class="">자동유지기간</th>
                                <td class="left" colspan="2">                                
                                    <input type="text" class="it wAuto data-check w150" title="산정보존월" data-type="number" maxlength="4" name="extrcKeepMonth" id="extrcKeepMonth" value=""> 개월                                    
                                </td>
                            </tr> 
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
                
                
                
                <div class="gTitle1 line mt13">
                    <h3 class="mTitle1">등급 유지 정책</h3>
                </div>
                <!-- board -->
                <div class="mBoard2">
                    <table>
                        <caption>등급 유지 정책</caption>
                        
                        <colgroup>
                            <col width="8%">
                            <col width="20%">
                            <col width="8%">
                            <col width="20%">
                            <col width="5%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" class="left">산정기간</th>
                                <td class="">
                                  
                                      직전 <input type="text" style="width:60px"  class="it  data-check"  data-type="number" maxlength="4" title="산정기간"  placeholder="산정기간"  name="extrcStd2Month" id="extrcStd2Month" value=""> 개월
	                                
                                </td>
                                
                                <th scope="row" class="">등급유지점수</th>
                                <td class="left" colspan="4">
                                
                                    <input type="text" class="it  data-check w100 comma" title="등급유지점수" data-type="number2" name="gradeKeepScore" id="gradeKeepScore"  value=""> 점 이상
                                  <!--  ~
                                    <input type="text" class="it  data-check w100 comma" title="등급유지점수" data-type="number2" name="gradeKeep2Score" id="gradeKeep2Score" value=""> 점    
                                     -->
                                </td>
                                
                                <!-- <th scope="row" class="">등급유지기간</th>
                                <td class="left" colspan="2">                                
                                    <input type="text" class="it wAuto data-check w150" title="등급유지기간"  data-type="number" maxlength="4"  name="gradeKeepMonth" id="gradeKeepMonth"  value=""> 개월                                    
                                </td> -->
                            </tr> 
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
                
                
                
                
                
                
                <div class="gTitle1 line mt13">
                    <h3 class="mTitle1">승급점수 기본 정책</h3>
                </div>
                <!-- board -->
                <div class="mBoard2">
                    <table>
                        <caption>승급점수 기본 정책</caption>
                        
                        <colgroup>
                            <col width="12%">
                            <col width="20%">
                            <col width="15%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" class="left">구매보상 승급점수</th>
                                <td class="left">
                                  
                                      <input type="text" style="width:160px"  class="it  data-check"  maxlength="8" data-type="number" title="구매보상 승급점수"  placeholder="구매보상 승급점수"  name="buyRewardAdvncmtRate" id="buyRewardAdvncmtRate" value=""> %
	                                
                                </td>
                                
                                <th scope="row" class="">구매 추천보상 승급점수</th>
                                <td class="left" >
                                	<input type="text" style="width:160px"  class="it  data-check"   maxlength="8"  data-type="number"  title="구매 추천보상 승급점수"  placeholder="구매 추천보상 승급점수"  name="buyRcmdRewardAdvncmtRate" id="buyRcmdRewardAdvncmtRate" value=""> %
                               
                                </td>
                                
                             
                            </tr> 
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                <div class="gTitle1 line mt13">
                    <h3 class="mTitle1">포인트 기본 정책</h3>
                </div>
                <!-- board -->
                <div class="mBoard2">
                    <table>
                        <caption>포인트 적립 정책</caption>
                        <colgroup>
                            <col width="10%">
                            <col width="15%">
                            <col width="8%">
                            <col width="20%">
                            <col width="8%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" class="left">구매적립포인트</th>
                                <td class="left">
                                    <input type="text" class="it center w120 data-check " title="구매적립포인트"  maxlength="8"  data-type="number" name="buyAccumPointRate" id="buyAccumPointRate" value=""> %
                                </td>
                                
                               <%--  <th scope="row" class="left">가입 포인트</th>
                                <td class="left">
                                    <input type="text" class="it right wAuto data-check w70 comma" title="가입 포인트"   maxlength="12"  data-type="number2" name="sbscPointScore" id="sbscPointScore" value=""> Point
                                	<code:commCode  className="select data-check" id="sbscPointApplyStdCd" name="sbscPointApplyStdCd" codeCd="MB070" prefixLabel="전체" prefixValue=""/>
                                </td> --%>
                          
                                <th scope="row" class="left">적립한도</th>
                                <td class="left" colspan=4>
                                    <input type="text" class="it right w70 data-check comma" title="적립한도"  maxlength="12"  data-type="number2" name="accumLmtPointScore" id="accumLmtPointScore" value=""> Point/1일
                                </td>
                          
                            </tr>
                            
                            
                             <tr>
                                <th scope="row" class="left">구매추천포인트</th>
                                <td class="left">
                                    <input type="text" class="it center w120 data-check" title="구매추천포인트" data-type="number"  maxlength="8"  name="buyRcmdPointRate" id="buyRcmdPointRate" value=""> %
                                </td>
                                <th scope="row" class="left">승급 포인트</th>
                                <td class="left">
                                    <input type="text" class="it right wAuto data-check w70 comma" title="승급 포인트"   maxlength="12"  data-digits="3" data-type="number2" name="buyAdvncmtPointScore" id="buyAdvncmtPointScore" value=""> Point
                                	<%-- <code:commCode  className="select data-check" id="advncmtPointApplyStdCd" name="advncmtPointApplyStdCd" codeCd="MB070" prefixLabel="전체" prefixValue=""/> --%>
                                	<input type="hidden"  id="advncmtPointApplyStdCd" name="advncmtPointApplyStdCd"  value="001">
                                </td>
                             
                                <th scope="row" class="left">사용한도</th>
                                <td class="left">
                                    <input type="text" class="it right w70 data-check comma" title="사용한도" maxlength="12"  data-type="number2" name="useLmtPointScore" id="useLmtPointScore" value=""> Point/1일
                                </td>
                          
                            </tr>
                            
                            
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
                
                <div class="gTitle1 line mt13">
                    <h3 class="mTitle1">포인트 소멸 정책</h3>
                </div>
                <!-- board -->
                <div class="mBoard2">
                    <table>
                        <caption>음료 혜택 정책</caption>
                        <colgroup>
                            <col width="18%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                               
                               <!--  <th scope="row" class="left">소멸알림</th>
                                <td class="left">
                                
                                  <label class="mCheckbox1">
                                        <input type="checkbox" class="it right wAuto " title="소멸알림"  name="pointExtncAlertYn" id="pointExtncAlertYn" value="Y">  
                                        <span class="label">소멸</span>
                                    </label>
                                    
                                    
                                    <input type="text" class="it right wAuto " title="소멸알림일수"    maxlength="4"   data-type="number" name="pointExtncAlertPerd" id="pointExtncAlertPerd" value=""> 일 전 알림
                                </td> -->
                                <th scope="row" class="left">선물(양도)포인트 유효기간</th>
                                <td class="left">
                                    <input type="text" class="it right wAuto data-check" title="유효기간"   maxlength="4"   data-type="number" name="giftPointValidPerd" id="giftPointValidPerd" value=""> 년
                                </td> 
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
                
                
                
                  <div class="gTitle1 line mt13">
                    <h3 class="mTitle1">무료서비스</h3>
                </div>
                <!-- board -->
                <div class="mBoard2">
                    <table>
                        <caption>무료서비스</caption>
                        <colgroup>
                            <col width="11%">
                            <col width="*">
                            <col width="11%">
                            <col width="24%">
                            <col width="11%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                               
                                <th scope="row" class="left">자사몰 무료배송</th>
                                <td class="left">
                                  
                                    
                                    <label class="mCheckbox1">
                                          <input type="checkbox" class="it right wAuto " title="자사몰 무료배송"  name="mycomMallFreeDlvYn" id="mycomMallFreeDlvYn" value="Y">  
                                        <span class="label">가능</span>
                                    </label>
		                                            
		                                            
                                </td>
                                <th scope="row" class="left">무상연장서비스</th>
                                <td class="left">
                                    <input type="text" class="it right wAuto data-check" title="무상연장서비스"   maxlength="4"   data-type="number" name="freeSvcExtnsnMonsCnt" id="freeSvcExtnsnMonsCnt" value=""> 개월(승급시 1회: 모든 구매 제품)
                                </td> 
                                
                                 <th scope="row" class="left">세라케어 & 체크</th>
                                <td class="left">
                                    <input type="text" class="it right wAuto data-check" title="무상연장서비스"   maxlength="4"   data-type="number" name="ceracCoupnPrvMonsCnt" id="ceracCoupnPrvMonsCnt" value=""> 개월
                                </td> 
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
                
                
                
                </form>
                
            </div>
            <!-- //box -->

            <!-- tab -->
            <div class="mTab1 jsTab2"  style="margin-top:15px">
                <ul>
                    <li class="active"><a href="#jsTabCont1_1">포인트제외제품</a></li>
                    <li><a href="#jsTabCont1_6">포인트적립제외매장</a></li>
                    <li><a href="#jsTabCont1_2">등급별쿠폰</a></li>
                    <li><a href="#jsTabCont1_3">이벤트쿠폰</a></li>
                    <li><a href="#jsTabCont1_4">이벤트포인트</a></li>
                    <li><a href="#jsTabCont1_5">이벤트승급점수</a></li>                    
                </ul>
            </div>
            
            
            <!-- box:제품할인정책 -->
            <div id="jsTabCont1_1" class=" p10 tabCont">
            
            	<form name="frmGods" id="frmGods" >
            	
            	<input type="hidden" name="mshipPlcyBasNo" id="mshipPlcyBasNo" class="mshipPlcyBasNo"  value="">
            	<input type="hidden" name="godsClassCd" id="godsClassCd" value="">
            	
                <!-- sort -->
                <div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
                    <ul>
                        <%-- <li class="wAuto ml20">
                            <div class="tit">구분</div>
                            <div class="txt">
                                <code:commCode  className="select data-check" id="applyDivCd" name="applyDivCd" codeCd="MB160" prefixLabel="전체" prefixValue=""/>
                            </div>
                        </li> --%>
                        <li class="wAuto ml35">
                            <div class="tit">제품군</div>
                            <div class="txt">
                               <%--   <code:commCode  className="select data-check" id="godsTypeCd" name="godsTypeCd" codeCd="GD040" prefixLabel="전체" prefixValue=""/>
                                  --%>
                                 
                                 <select class="select wAuto data-check" title="시간"  name="godsTypeCd" id="godsTypeCd">
                                   <option value="">선택</option>
                                   
                                     											
						          <c:forEach items="${godsList}" var="m" varStatus="status">					
						          	
						          	<option value="<c:out value="${m.comnCd}" />" ><c:out value="${m.comnCdNm}" /></option>
						          </c:forEach>
						          
                                 </select>
                                 
                                 
                            </div>
                            <span class="button">
                                <a href="#" class="mBtn1" data-click="searchGods">검색</a>
                            </span>
                        </li>
                    </ul>
                    <div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
                        <a href="#" data-auth-type="c" style="display:none" class="mBtn1 lWhite" data-click="newGodsDetail">추가</a>
                        
                        <a href="#" data-auth-type="d" style="display:none"class="mBtn1 lWhite" data-click="delGods">삭제</a>
                        
                        <a href="#" data-auth-type="c" data-grid-id="grdGods" data-disp-name="" data-click="saveGodsList" id="btnSaveGodsDetail" class="mBtn1 m lWhite" style="cursor: pointer;display:none">저장</a>
                    </div>
                </div>
                
                </form>
                <!-- //sort -->
                
                
            
                <!-- board -->
                <div class="mBoard1 mCustomScrollbar " style="height:226px">
                
                <form name="frmGodsList" id="frmGodsList" >
                
                
                    <table>
                        <caption>포인트제외제품</caption>
                        <colgroup>
                            <col width="5%">
                            <col width="5%">
                            <col width="15%">
                            <col width="*">
                            <col width="20%">
                            <col width="15%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col" ><input type='checkbox' name='cAll' id='cAll' value='Y' onclick="chkAll(this, '.godsRelBasNo')"></th>
                                <th scope="col">NO</th>
                                <th scope="col">제품군</th>
                                <th scope="col">제품명</th>
                                <th scope="col">등록자</th>
                                <th scope="col">등록일</th>
                            </tr>
                        </thead>
                        <tbody id="divGods">
                        </tbody>
                    </table>
                    
                    </form>
                </div>
       
            <!-- //box:제품할인정책 -->
				
				
            </div>
            
            
            
            <!-- //box:제품할인정책 -->
            <!-- box:쿠폰제공정책 -->
            <div id="jsTabCont1_2" class=" p10 tabCont hidden">
            
       
       
           	<form name="frmCoupn" id="frmCoupn" onsubmit="return false;">
            	
            	<input type="hidden" name="mshipPlcyBasNo" id="mshipPlcyBasNo" class="mshipPlcyBasNo"  value="">
            	<input type="hidden" name="topComnCd" id="topComnCd" value="GD040">
            	<input type="hidden" name="prntsComnCd" id="prntsComnCd" value="GD040">
            	<input type="hidden" name="comnCdLvlNo" id="comnCdLvlNo" value="2">
            	
            	
            	
                <!-- sort -->
                <div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
                
                     
        
            	
            	
            	
                  <%--  <ul>
                        <li class="wAuto ml20">
                            <div class="tit">쿠폰리스트</div>
                            <div class="txt">
                                 <code:commCode  className="select data-check" id="coupnKndCd" name="coupnKndCd" codeCd="MB080" prefixLabel="전체" prefixValue=""/>
                            </div>
                        </li>
                        <li class="wAuto ml35">
                            <div class="tit">쿠폰마스터명</div>
                            <div class="txt">
                                <input type="text" class="it" title="쿠폰마스터명" placeholder="쿠폰마스터 검색" value=""  name="coupnBasNmSearch"  id="coupnBasNmSearch">
                            </div>
                            <span class="button">
                                <a href="#" class="mBtn1"  data-click="searchPrvCoupon" >검색</a>
                            </span>
                        </li>
                    </ul> --%>
                       
                    <div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
                    
                     
                        <a href="#" class="mBtn1 lWhite" data-click="newCoupnRel">추가</a>
                        
                        <a href="#" class="mBtn1 lWhite" data-click="delCoupnRel">삭제</a>
                        
                        <a href="#" data-grid-id="grdCoupnRel" data-disp-name="" data-click="saveCoupon"class="mBtn1 m lWhite" style="cursor: pointer;">저장</a>
                    </div>
                </div>
                
                
                </form>
                
                <!-- //sort -->
                <!-- board -->
                
                
                            <form name="frmCoupnDetail" id="frmCoupnDetail" onsubmit="return false;">
            	
            	<input type="hidden" name="mshipPlcyBasNo" id="mshipPlcyBasNo" class="mshipPlcyBasNo"  value="">
            	<input type="hidden" name="topComnCd" id="topComnCd" value="GD040">
            	<input type="hidden" name="prntsComnCd" id="prntsComnCd" value="GD040">
            	<input type="hidden" name="comnCdLvlNo" id="comnCdLvlNo" value="2">
            	<input type="hidden" name="applyMshpGradeCtnts" id="applyMshpGradeCtnts" value="">
            	<input type="hidden" name="mshipGradeCd" id="mshipGradeCd" value="">            	
            	<input type="hidden" name="cprtCmpNo" id="cprtCmpNo" value="">
            	
                 
                 
         
                <div class="mBoard1 mCustomScrollbar h267">
                
              <table>
                        <caption>쿠폰제공정책</caption>
                        <thead>
                            <tr>
                                <th scope="col">No</th>
                                <th scope="col">선택</th>
                                <th scope="col">쿠폰리스트</th>
                                <th scope="col">쿠폰마스터명</th>
                                <th scope="col">제공매수</th>
                                <th scope="col">주기</th>
                                <th scope="col">발행기간</th>
                                <th scope="col">쿠폰사용기간</th>
                                <th scope="col">쿠폰종류</th>
                                <th scope="col">등록자</th>
                                <th scope="col">등록일</th>
                            </tr>
                        </thead>
                        <tbody id="divCoupon">
                     
                            
                        </tbody>
                    </table>
                    
                    
				
				
                </div>
                
                
				</form>
                <!-- //board -->

            </div>
            <!-- //box:쿠폰제공정책 -->



  			 <div id="jsTabCont1_3" class=" p10 tabCont hidden">
            
            
            	<form name="frmEvent" id="frmEvent" onsubmit="return false;">
            	
            	<input type="hidden" name="mshipPlcyBasNo" id="mshipPlcyBasNo" class="mshipPlcyBasNo"  class="mshipPlcyBasNo"  value="">
            	<input type="hidden" name="comnCdLvlNo" id="comnCdLvlNo" value="2">
            	
            	
                <!-- sort -->
                <div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
                    <%-- <ul>
                        <li class="wAuto ml20">
                            <div class="tit">쿠폰리스트</div>
                            <div class="txt">
                                 <code:commCode  className="select data-check" id="coupnKndCd" name="coupnKndCd" codeCd="MB080" prefixLabel="전체" prefixValue=""/>
                            </div>
                        </li>
                        <li class="wAuto ml35">
                            <div class="tit">쿠폰마스터명</div>
                            <div class="txt">
                                <input type="text" class="it" title="쿠폰마스터명" placeholder="쿠폰마스터 검색" value=""  name="coupnBasNmSearch"  id="coupnBasNmSearch">
                            </div>
                            <span class="button">
                                <a href="#" class="mBtn1"  data-click="searchPrvCoupon" >검색</a>
                            </span>
                        </li>
                    </ul>  --%>
                       
                    <div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
                    
                     
                       <!--  <a href="#" class="mBtn1 lWhite" data-click="searchEventList">검색</a> -->
                        
                        <a href="#" class="mBtn1 lWhite" data-click="delEvent">삭제</a>
                        
                        <a href="#" data-grid-id="grdCoupnRel" data-disp-name="" data-click="saveEvent" class="mBtn1 m lWhite" style="cursor: pointer;">저장</a>
                    </div>
                </div>
                
                </form>
                <!-- //sort -->
                <!-- board -->
                
                <form name="frmEventDetail" id="frmEventDetail" onsubmit="return false;">
            	
            	<input type="hidden" name="mshipPlcyBasNo" id="mshipPlcyBasNo" class="mshipPlcyBasNo"   class="mshipPlcyBasNo" value="">
            	<input type="hidden" name="topComnCd" id="topComnCd" value="GD040">
            	<input type="hidden" name="prntsComnCd" id="prntsComnCd" value="GD040">
            	<input type="hidden" name="comnCdLvlNo" id="comnCdLvlNo" value="2">
            	<input type="hidden" name="applyMshpGradeCtnts" id="applyMshpGradeCtnts" value="">
            	<input type="hidden" name="mshipGradeCd" id="mshipGradeCd" value="">         	
            	<input type="hidden" name="cprtCmpNo" id="cprtCmpNo" value="">
            	
                <div class="mBoard1 mCustomScrollbar h267">
                    <table>
                        <caption>쿠폰제공정책</caption>
                        <thead>
                            <tr>
                                <th scope="col">선택</th>
                                <th scope="col">No</th>
                                <th scope="col">이벤트명</th>
                                <th scope="col">쿠폰리스트</th>
                                <th scope="col">쿠폰마스터명</th>
                                <th scope="col">총 지급 횟수</th>
                                <th scope="col">지급 횟수(월제한)</th>
                                <th scope="col">지급 횟수(일제한)</th>
                                <th scope="col">등록자</th>
                                <th scope="col">등록일</th>
                            </tr>
                        </thead>
                        <tbody id="divEvent">
                        
                        		 

							
                            
                        </tbody>
                    </table>
                </div>
                <!-- //board -->

				</form>
            </div>
            <!-- //box:쿠폰제공정책 -->
            
            
            
            
            
             <div id="jsTabCont1_4" class=" p10 tabCont hidden">
            
            
            	<form name="frmPoint" id="frmPoint" onsubmit="return false;">
            	
            	<input type="hidden" name="mshipPlcyBasNo" id="mshipPlcyBasNo" class="mshipPlcyBasNo"  class="mshipPlcyBasNo"  value="">
            	<input type="hidden" name="comnCdLvlNo" id="comnCdLvlNo" value="2">
            	
            	
                <!-- sort -->
                <div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
                    <%-- <ul>
                        <li class="wAuto ml20">
                            <div class="tit">쿠폰리스트</div>
                            <div class="txt">
                                 <code:commCode  className="select data-check" id="coupnKndCd" name="coupnKndCd" codeCd="MB080" prefixLabel="전체" prefixValue=""/>
                            </div>
                        </li>
                        <li class="wAuto ml35">
                            <div class="tit">쿠폰마스터명</div>
                            <div class="txt">
                                <input type="text" class="it" title="쿠폰마스터명" placeholder="쿠폰마스터 검색" value=""  name="coupnBasNmSearch"  id="coupnBasNmSearch">
                            </div>
                            <span class="button">
                                <a href="#" class="mBtn1"  data-click="searchPrvCoupon" >검색</a>
                            </span>
                        </li>
                    </ul>  --%>
                       
                    <div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
                    
                     <!-- 
                        <a href="#" class="mBtn1 lWhite" data-click="searchPointList">검색</a> -->
                        
                        <a href="#" class="mBtn1 lWhite" data-click="delPoint">삭제</a>
                        
                        <a href="#" data-grid-id="grdCoupnRel" data-disp-name="" data-click="savePoint" class="mBtn1 m lWhite" style="cursor: pointer;">저장</a>
                    </div>
                </div>
                
                </form>
                <!-- //sort -->
                <!-- board -->
                
                <form name="frmPointDetail" id="frmPointDetail" onsubmit="return false;">
            	
            	<input type="hidden" name="mshipPlcyBasNo" id="mshipPlcyBasNo" class="mshipPlcyBasNo"   class="mshipPlcyBasNo" value="">
            	<input type="hidden" name="topComnCd" id="topComnCd" value="GD040">
            	<input type="hidden" name="prntsComnCd" id="prntsComnCd" value="GD040">
            	<input type="hidden" name="comnCdLvlNo" id="comnCdLvlNo" value="2">
            	
                <div class="mBoard1 mCustomScrollbar h267">
                    <table>
                        <caption>쿠폰제공정책</caption>
                        <thead>
                            <tr>
                                <th scope="col">선택</th>
                                <th scope="col">No</th>
                                <th scope="col">이벤트명</th>
                                <th scope="col">적립포인트</th>
                                <th scope="col">총 지급 횟수</th>
                                <th scope="col">지급 횟수(월제한)</th>
                                <th scope="col">지급 횟수(일제한)</th>
                                <!-- <th scope="col">선물가능</th> -->
                                <th scope="col">등록자</th>
                                <th scope="col">등록일</th>
                            </tr>
                        </thead>
                        <tbody id="divPoint">
                        
                        		 

                        </tbody>
                    </table>
                </div>
                <!-- //board -->

				</form>
            </div>
            <!-- //box:쿠폰제공정책 -->
            
            
            
            
            
            
             <div id="jsTabCont1_5" class=" p10 tabCont hidden">
            
            	
                <!-- sort -->
                <div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
                
                
            
            	<form name="frmAdvn" id="frmAdvn" onsubmit="return false;">
            	
            	<input type="hidden" name="mshipPlcyBasNo" id="mshipPlcyBasNo" class="mshipPlcyBasNo"  class="mshipPlcyBasNo"  value="">
            	<input type="hidden" name="comnCdLvlNo" id="comnCdLvlNo" value="2">
            	
            	
            	
                    <%-- <ul>
                        <li class="wAuto ml20">
                            <div class="tit">쿠폰리스트</div>
                            <div class="txt">
                                 <code:commCode  className="select data-check" id="coupnKndCd" name="coupnKndCd" codeCd="MB080" prefixLabel="전체" prefixValue=""/>
                            </div>
                        </li>
                        <li class="wAuto ml35">
                            <div class="tit">쿠폰마스터명</div>
                            <div class="txt">
                                <input type="text" class="it" title="쿠폰마스터명" placeholder="쿠폰마스터 검색" value=""  name="coupnBasNmSearch"  id="coupnBasNmSearch">
                            </div>
                            <span class="button">
                                <a href="#" class="mBtn1"  data-click="searchPrvCoupon" >검색</a>
                            </span>
                        </li>
                    </ul>  --%>
                       
                    <div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
                    
                     <!-- 
                        <a href="#" class="mBtn1 lWhite" data-click="searchAdvnList">검색</a> -->
                        
                        <a href="#" class="mBtn1 lWhite" data-click="delAdvn">삭제</a>
                        
                        <a href="#" data-grid-id="grdCoupnRel" data-disp-name="" data-click="saveAdvn" class="mBtn1 m lWhite" style="cursor: pointer;">저장</a>
                    </div>
                    
                    
                </form>
                
                
                </div>
                
                <!-- //sort -->
                <!-- board -->
                
            	
                <div class="mBoard1 mCustomScrollbar h267">
                
                
                <form name="frmAdvnDetail" id="frmAdvnDetail" onsubmit="return false;">
            	
            	<input type="hidden" name="mshipPlcyBasNo" id="mshipPlcyBasNo" class="mshipPlcyBasNo"   class="mshipPlcyBasNo" value="">
            	<input type="hidden" name="topComnCd" id="topComnCd" value="GD040">
            	<input type="hidden" name="prntsComnCd" id="prntsComnCd" value="GD040">
            	<input type="hidden" name="comnCdLvlNo" id="comnCdLvlNo" value="2">
            	
                    <table>
                        <caption>쿠폰제공정책</caption>
                        <thead>
                            <tr>
                                <th scope="col">선택</th>
                                <th scope="col">No</th>
                                <th scope="col">승급명</th>
                                <th scope="col">지급 승급점수</th>
                                <th scope="col">총 지급 횟수</th>
                                <th scope="col">지급 횟수(월제한)</th>
                                <th scope="col">지급 횟수(일제한)</th>
                                <th scope="col">등록자</th>
                                <th scope="col">등록일</th>
                            </tr>
                        </thead>
                        <tbody id="divAdvn">
                        
                        		 

							
                            
                        </tbody>
                    </table>
				</form>
                </div>
                <!-- //board -->

            </div>
            <!-- //box:쿠폰제공정책 -->
            
            
            
             <div id="jsTabCont1_6" class=" p10 tabCont hidden">
                    
                    
                             	 <!-- box -->
			             <form name="frmStore" id="frmStore" onsubmit="searchStoreRel();return false;">
            	
			            	<input type="hidden" name="mshipPlcyBasNo" id="mshipPlcyBasNo" class="mshipPlcyBasNo"  value="">
			            
			            
			                <!-- sort -->
			                <div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
			                
			       
			                    <ul>
			                        <li class="wAuto ml20">
			                            <div class="tit">지역</div>
			                            <div class="txt">
			                                <code:commCode  className="select" id="distrctCd" name="distrctCd" codeCd="CU100" prefixLabel="선택" prefixValue=""/>
			                            </div>
			                        </li>
			                        <!-- <li class="wAuto ml20">
			                            <div class="tit">매장코드</div>
			                            <div class="txt">
			                                <input type="text"  className="it" id="storNo" name="storNo" codeCd="MB160" />
			                            </div>
			                        </li> -->
			                        <li class="wAuto ml35">
			                            <div class="tit">매장명</div>
			                            <div class="txt">
			                                 <input type="text" class="it" name="storNm" id="storNm" value=""/>
			                            </div>
			                            <span class="button">
			                                <button type="submit" class="mBtn1 btnSubmit"  data-file-info="button" data-click="searchStoreRel" >검색</a>
			                            </span>
			                        </li>
			                    </ul>
			                    <div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
			                        <a href="#" data-grid-id="grdShopList" data-disp-name="" data-click="saveStorePop" id="btnSaveStore" class="mBtn1 m lWhite" style="cursor: pointer;">관리</a>
			                    </div>
			                    
			                    
			                </div>
			                
			                <!-- //sort -->
			                
			                 <div id="divShop" style="height:200px;margin-top:1px"
								  data-post="Y"
								  data-grid-id="grdShopList"
								  data-pagenation="Y"
								  data-get-url="<c:url value='/cmmMshipApplyStorRel/getList'/>"
								  data-type="grid" 
								  data-tpl-url="<c:url value='/static/gridTemplate/memship/cmmMshipApplyStorRel.xml'/>"
							  >
							</div>
			            
			              <!-- //box -->
			              
			                </form>
			              
                    </div>
                    

        </div>
        <!-- //right -->
    </div>
	
</div>


<script>
var _current_code_cd = null;

/* 공통코드 엑셀 다운로드 */
function excelDownload() {
	grdList.exportExcel("공통코드 리스트.xlsx");
}

/* 공통코드 엑셀 업로드 */
function excelUpload() {
	grdList.importExcel();
}

/* 공통코드 그리드 load */
function grdList_load(gridView, gridId) {
	search();
	getGodsDiv();
}

/* 하부코드 그리드 load */
function grdDetail_load(gridView, gridId) {
	//console.log("grdDetail_load");
}

/* 공통코드 Row클릭 시 */
function grdList_rowChanged(grdList, oldRow, newRow, rowData) {


	mapToForm(rowData,"frmDetail");
	$("#frmDetail #mycomMallFreeDlvYn").val("Y");
	if( rowData.mycomMallFreeDlvYn == "Y" ){
		$("#frmDetail #mycomMallFreeDlvYn").prop("checked", true);
	}else{
		$("#frmDetail #mycomMallFreeDlvYn").prop("checked", false);	
	}
	
	$("#frmDetail #pointExtncAlertYn").val("Y");
	if( rowData.pointExtncAlertYn == "Y" ){
		$("#frmDetail #pointExtncAlertYn").prop("checked", true);
	}else{
		$("#frmDetail #pointExtncAlertYn").prop("checked", false);	
	}
	

	/* $("#mshpGradeCdNm").text( "" );
	$("#mshipGradeCdNm").text( "" );
	$("#cprtCmpNoNm").text( "" );
	$("#statusCdNm").text( "" );

	$("#mshpGradeCdNm").text( rowData.mshpGradeCdNm );
	$("#mshipGradeCdNm").text( rowData.mshipGradeCdNm );
	$("#cprtCmpNoNm").text( rowData.cprtCmpNoNm );
	$("#statusCdNm").text( rowData.statusCdNm ); */
	
	// 회원등급에 따른 콤보박스 제어
	if( rowData.mshipGradeCd == "001" ){ // 임직원
		$("#frmDetail #mshpGradeCd").attr("disabled", true);
		$("#frmDetail #cprtCmpNo").attr("disabled", true);
		

		$("#frmDetail #mshpGradeCd").val("");
		$("#frmDetail #cprtCmpNo").val("");		
	}
	
	if( rowData.mshipGradeCd == "002" ){ // 제휴사
		$("#frmDetail #mshpGradeCd").attr("disabled", true);
		$("#frmDetail #cprtCmpNo").attr("disabled", false);			

		$("#frmDetail #mshpGradeCd").val("");			
		
	}
	
	if( rowData.mshipGradeCd == "003" ){ // 회원
		$("#frmDetail #mshpGradeCd").attr("disabled", false);
		$("#frmDetail #cprtCmpNo").attr("disabled", true);	
		
		$("#frmDetail #cprtCmpNo").val("");		
	}
	
	
	$("#frmDetail #stat").val("u");
	$("#frmDetail #btnReg").hide();
	$("#frmDetail #btnEdit").show();

	searchGods( rowData.mshipPlcyBasNo );
	searchPrvCoupon( rowData.mshipPlcyBasNo );
	
	$("#frmApi #mshipPlcyBasNo").val( rowData.mshipPlcyBasNo );
	$("#frmCoupn #mshipPlcyBasNo").val( rowData.mshipPlcyBasNo );
	$("#frmCoupnDetail #mshipPlcyBasNo").val( rowData.mshipPlcyBasNo );

	$("#frmCoupnDetail #applyMshpGradeCtnts").val( rowData.mshpGradeCd );
	$("#frmCoupnDetail #mshipGradeCd").val( rowData.mshipGradeCd ); 
	$("#frmCoupnDetail #cprtCmpNo").val( rowData.cprtCmpNo );        
	
	$("#frmEventDetail #applyMshpGradeCtnts").val( rowData.mshpGradeCd );
	$("#frmEventDetail #mshipGradeCd").val( rowData.mshipGradeCd );
	$("#frmEventDetail #cprtCmpNo").val( rowData.cprtCmpNo );  
	
	
	$(".mshipPlcyBasNo").val( rowData.mshipPlcyBasNo );
	searchEventList();
	searchPointList();
	searchAdvnList();
	searchStoreRel();
	
	//searchCoupon( rowData.mshipPlcyBasNo );
}


function onGridLoad(gridView, gridId) {
	
}

/* 그리드 컬럼 클릭 */
function onGridCellClick(gridView, rowIndex, columnName, colIndex,
		fieldIndex) {

}

/* 그리드 컬럼 더블 클릭 */
function onGridCellDblClick(gridView, rowIndex, columnName, colIndex,
		fieldIndex) {

}

function onGridRowChanged(gridView, oldRow, newRow) {

}


function saveStorePop(){
	var url = "<c:url value='${urlPrefix}/popStore${urlSuffix}'/>?mshipPlcyBasNo="+ $("#frmStore #mshipPlcyBasNo").val();
	Utilities.openModal(url, "1200", "800");
}

/* 검색조건 검색 */
function search() {

	//$("#frmDetail #btnReg").text("등록").hide();
	$("#frmDetail #btnEdit").hide();
	$("form#frmSearch").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmSearch");
	
	param.recordCountPerPage = 100000;
	grdList.loadUrl(url, param);
	
	
}




/* 멤버십 정책 추가 */
function newMem(){
	Utilities.mapToForm(null,"frmDetail");
	
	$("#frmApi")[0].reset();
	$("#frmDetail")[0].reset();
	$("#frmDetail #stat").val("c");
	$("#frmDetail #btnReg").show();
	$("#frmDetail #btnEdit").hide();
}



/* 복사 */
function cpyMem(){
	
	var saveJson = grdList.getCheckedJson();
	if (saveJson.length == 0) {
		alert("복사할 정책을 선택해주세요.");
		return;
	}
	
	if( saveJson.length > 1){
		alert("복사할 정책 한개만 선택해 주세요.");
		return;
	}
	
	Utilities.mapToForm( grdList.getCheckedJson()[0] ,"frmDetail");
	
	$("#frmDetail #stat").val("c");
	$("#frmDetail #mshipPlcyBasNo").val("");


	$("#frmDetail #btnReg").show();
	$("#frmDetail #btnEdit").hide();
	
	/* if( $("#frmDetail #mshipPlcyBasNo").val() == "" ){
		$("#frmDetail #mshipPlcyBasNo").focus();
		alert("정책코드는 자동으로 생성됩니다.");
	} */
	
	if (saveJson.length) {
		
		if (!confirm("정책코드는 자동으로 생성됩니다. \n\n선택된 정책을 복사하시겠습니까?"))
			return;
		
		var cpyData = Utilities.formToMap("frmDetail");
		var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
		Utilities.getAjax(url, cpyData, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "정책 복사가 실패했습니다.")) {
				alert("정책 복사가 완료되었습니다.");
					search();
					$("#frmDetail")[0].reset();
			}
		});
	} else {
		alert("선택된 데이터가 없습니다.");
	}
}




/* 멤버십 정책 추가 */
function newMemship(){
	
	var gridData = grdList.getJsonRows();
	
	
	for(var i=0 ; i < gridData.length; i++ ){
		
		//log( gridData[i].mshipPlcyBasNo +" // "+ $("#frmDetail #mshipPlcyBasNo").val() );
		
		// 동일한 정책이라면
		if( gridData[i].mshipPlcyBasNo == $("#frmDetail #mshipPlcyBasNo").val() ){
			
			if( gridData[i].mshpGradeCd != $("#frmDetail #mshpGradeCd").val() ){			
				
				alert("회원등급을 수정할 수 없습니다.");
				$("#frmDetail #mshpGradeCd").focus(); 
				return false;
			
			}			
		
		}else{
			
			if( $("#frmDetail #mshipGradeCd").val() == "001" && gridData[i].mshipGradeCd == "001"){
				
				alert("이미 동일한 멤버십등급 정책이 있습니다.");
				$("#frmDetail #mshipGradeCd").focus(); 
				return false;
			
			}else{
			
				if( gridData[i].mshpGradeCd == $("#frmDetail #mshpGradeCd").val() ){			
					alert("이미 동일한 회원등급 정책이 있습니다.");
					$("#frmDetail  #mshipPlcyNm").focus(); 
					return false;
				}
				
	
				if( gridData[i].cprtCmpNo == $("#frmDetail #cprtCmpNo").val() ){			
					alert("이미 동일한 제휴사 정책이 있습니다.");
					$("#frmDetail  #mshipPlcyNm").focus(); 
					return false;
				}
				
			}
			
		}
			
		
	}
	
	

	// 일반등급만 필수 체크 
	if( $("#frmDetail  #mshipGradeCd").val() != '003' ){
		
		
		if( $("#frmDetail  #mshipPlcyNm").val() == ''){
			alert('정책명을 기입해 주세요');
			$("#frmDetail  #mshipPlcyNm").focus(); 
			return false;
		}
		
		if( $("#frmDetail  #mshipPlcyNm").val() == ''){
			alert('정책명을 기입해 주세요');
			$("#frmDetail  #mshipPlcyNm").focus(); 
			return false;
		}
		
		valid = true;
		
	}else{
		var valid = validateForm("#frmDetail"); //  class='data-check' 인 경우만 체크
	}
	
	
	var saveJson = Utilities.formToMap("frmDetail");
	
	
		
	if(valid) {
	
		var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
		Utilities.getAjax(url,saveJson,true,function(data,jqXHR){
	        if(Utilities.processResult(data,jqXHR,"정책 저장에 실패했습니다."))
	        {
	            alert("정책 저장이 완료되었습니다.");
	            grdList.reload();
	            $("#frmDetail")[0].reset();
	        }
	    });
	
	}else{
		
		alert("필수 항목들을 기입해 주세요.");
		return false;
	}
}




/* 제품 검색 */
//var arrGods = null;		 // 제품
var arrGodsTypeCd = null; // 제품군
function getGodsDiv(){	
	
	/* if( arrGods == null){
		var saveJson = Utilities.formToMap("frmGods");
		var url = "<c:url value='${urlPrefix}/getGodsBaseList${urlSuffix}'/>";
		Utilities.getAjax(url, saveJson, true, function(data,jqXHR){
	        if(Utilities.processResult(data, jqXHR,"제품 조회를 실패했습니다."))
	        {
	        	arrGods = data;       		
	        }  
		});
	} */
	
	if( arrGodsTypeCd == null){
		var param = Utilities.formToMap("frmGods");
		
		var url = "<c:url value='${urlPrefix}/getGodsDivList${urlSuffix}'/>";
		Utilities.getAjax(url, param, true, function(data,jqXHR){
	        if(Utilities.processResult(data, jqXHR,"제품군 조회를 실패했습니다."))
	        {
	        	arrGodsTypeCd = data;       		
	        }  
		});
	}
}


function getGods(classCd, godsNo){	
	
	$("#frmGods #godsClassCd").val( classCd );
	var saveJson = Utilities.formToMap("frmGods");
	saveJson.recordCountPerPage = 100000;
	
	
	var url = "<c:url value='${urlPrefix}/getGodsBaseList${urlSuffix}'/>";
	Utilities.getAjax(url, saveJson, true, function(data,jqXHR){
        if(Utilities.processResult(data, jqXHR,"제품 조회를 실패했습니다."))
        {
        	var html = "";
        	$.each( data, function(j) {					
				
				   html += "  <option value='"+ this.godsNo +"' "+  (( this.godsNo == godsNo ) ? 'selected' : '' ) +">"+ this.godsNm +"</option>\n";
					
			});
        	
        	$("#godsNo_"+ godsNo ).find("#godsNo").append( html );
        	$("#godsNo_"+ godsNo ).find("#godsNo").append( html );
         		
        }  
	});


}



$(document).ready(function(){
	
	// 제휴사 데이터 바인딩
	var url = "<c:url value='${urlPrefix}/getPartnerList${urlSuffix}'/>";
	Utilities.getAjax(url, null, true, function(data, jqXHR) {
		if (Utilities.processResult(data, jqXHR, "제휴사 데이터을 읽어오질 못했습니다.")) {
		
			$.each( data , function(i){
				$(".cprtCmpNo").append("<option value='"+ this.cprtCmpNo +"'>"+  this.cprtCmpNm +"</option>\n");
			});
			
		}
	});
	
});



function nvlChk(obj){
	
	if( typeof(obj) == "undefined" ||   typeof(obj) == "object" ){
		return "";
	}else{
		return obj;
	}
}


//배열에 있는 제품 제품 구분에 맞게 콤보박스 변경
function getGodsCommbo(obj, rowIndex){

	$("#godsRow_"+ rowIndex +" select[name='godsNo'] option").not("[value='']").remove();
	getGods( $(obj).val() , rowIndex );
	

	
}








function searchGods( no ) {
	
	if(  typeof(no) == "string" ){
		$("#frmGods #mshipPlcyBasNo").val(no);
	}
	
	if( $("#frmGods #mshipPlcyBasNo").val() == "" ){
		alert("정책 목록을 선택해 주세요.");
		return false;
	}
	
	
	
	var html = "";
	var url = "<c:url value='${urlPrefix}/getListGods${urlSuffix}'/>";
	
	var param = Utilities.formToMap("frmGods");
	var loadData = 0;
	
	Utilities.getAjax(url, param, true, function(data,jqXHR){
        if(Utilities.processResult(data, jqXHR,"제품할인정책 조회가 실패했습니다."))
        {
        	loadData = data.length;
        	
        	var k=0;
       		$.each(data, function(i){
				html += "<tr id='godsRow_"+ (i+1) +"'>";
				
				html += "<td><input type='checkbox'  class='godsRelBasNo'   name='godsRelBasNo' id='godsRelBasNo' value='"+ nvlChk( this.godsRelBasNo ) +"'></td>" ;
				
				html += "<td>"+ (i+1) ;
				html += "<input type='hidden' class='it' id='stat' name='stat' value='u' style='width:15px'   title='고유키'>&nbsp;";
				html += "<input type='hidden' class='data-check'  id='mshipPlcyBasNo' name='mshipPlcyBasNo' value='"+ this.mshipPlcyBasNo +"' style='width:15px;display:none'   title='정책번호'>&nbsp;";
				
				html += "</td>";
				
				/* html += " <td>";
				html += "<input type='hidden' class='it' id='stat' name='stat' value='u' style='width:15px'   title='고유키'>&nbsp;";

				html += "<input type='hidden' class='it ' id='godsRelBasNo' name='godsRelBasNo' value='"+ nvlChk( this.godsRelBasNo ) +"'  title='제품할인 고유번호'>";
				html += "<input type='hidden' class='data-check'  id='mshipPlcyBasNo' name='mshipPlcyBasNo' value='"+ this.mshipPlcyBasNo +"' style='width:15px;display:none'   title='정책번호'>&nbsp;";
				html += "     <select class='select wAuto data-check' name='applyDivCd' id='applyDivCd' title='구분'>";
				html += "        <option value=''>선택</option>";
				html += "        <option value='001' "+  ((this.applyDivCd == '001') ? 'selected' : '' ) +">자사</option>";
				html += "        <option value='002' "+  ((this.applyDivCd == '002') ? 'selected' : '' ) +">타사</option>";
				html += "   </select>";
				html += "</td>"; */
				
		
				
				html += " <td>";
				html += "     <select class='select wAuto data-check' name='godsTypeCd' id='godsTypeCd' title='제품군' onChange=\"getGodsCommbo(this, '"+ this.godsNo +"')\">";
				html += "        <option value=''>선택</option>";
		
				
				var godsTypeCd = this.godsTypeCd;
				$.each(arrGodsTypeCd, function(j) {
					html += "        <option value='"+ arrGodsTypeCd[j].comnCd +"' "+  (( arrGodsTypeCd[j].comnCd == godsTypeCd ) ? 'selected' : '' ) +">"+ arrGodsTypeCd[j].comnCdNm +"</option>";
				});
				
				
				
				
				html += "   </select>";
				html += "</td>";
				
				html += " <td   id='godsNo_"+ this.godsNo +"'>";
				html += "     <select class='select wAuto data-check' name='godsNo' id='godsNo' title='제품명' >";
				html += "        <option value=''>선택</option>";
				
				
				getGods( this.godsTypeCd , this.godsNo );
				
				 
				html += "   </select>";
				
				
				html += "</td>";
				html += "<td>"+ this.regrId +"</td>";
				html += "<td>"+ this.regDt +"</td>";
				html += "</tr>";
				
				
       		});
       		
       		
       		
	       	$("#divGods").html( html );
	       			
        }

	});
	

	
}



/* 제품할인정책 추가 */

function newGodsDetail(){
	
	if( $("#frmGods #mshipPlcyBasNo").val() == "" ){
		alert("정책 목록을 선택해 주세요.");
		return false;
	}
	
	var html = "<tr id='godsRow_"+ ($("#divGods tr").length+1) +"'>";

	html += "<td>-</td>" ;
	
	html += "<td>"+ ($("#divGods tr").length+1)
	html += "<input type='hidden' class='it' id='stat' name='stat' value='c' style='width:15px'   title='상태'>&nbsp;";
	html += "<input type='hidden' class='it ' id='godsRelBasNo' name='godsRelBasNo' value=''  title='제품할인 고유번호'>";
	html += "<input type='hidden' class='it data-check'  id='mshipPlcyBasNo' name='mshipPlcyBasNo' style='width:15px;display:none'  title='정책번호' value='"+ ($("#frmGods #mshipPlcyBasNo").val()) +"'>&nbsp;";
	
	html += "</td>";
	
/* 	html += " <td>";
	html += "<input type='hidden' class='it' id='stat' name='stat' value='c' style='width:15px'   title='상태'>&nbsp;";
	html += "<input type='hidden' class='it ' id='godsRelBasNo' name='godsRelBasNo' value=''  title='제품할인 고유번호'>";
	
	html += "<input type='hidden' class='it data-check'  id='mshipPlcyBasNo' name='mshipPlcyBasNo' style='width:15px;display:none'  title='정책번호' value='"+ ($("#frmGods #mshipPlcyBasNo").val()) +"'>&nbsp;";
	html += "     <select class='select wAuto data-check' name='applyDivCd' id='applyDivCd' title='구분'>";
	html += "        <option value=''>선택</option>";
	html += "        <option value='001' >자사</option>";
	html += "        <option value='002' >타사</option>";
	html += "   </select>";
	html += "</td>"; */
	

	
	html += " <td>";
	html += "     <select class='select wAuto data-check' name='godsTypeCd' id='godsTypeCd' title='제품군'  onChange='getGodsCommbo(this, "+  ($("#divGods tr").length+1) +")'>";
	html += "        <option value=''>선택</option>";
	
	$.each(arrGodsTypeCd, function(j) {
		html += "        <option value='"+ arrGodsTypeCd[j].comnCd +"' >"+ arrGodsTypeCd[j].comnCdNm +"</option>";
	});
	
	
	html += "   </select>";
	html += "</td>";	
	html += " <td id='godsNo_"+ ($("#divGods tr").length+1) +"'>";
	html += "     <select class='select wAuto data-check ' name='godsNo' id='godsNo' title='제품명'>";
	html += "        <option value=''>선택</option>"; 
	
	
	/* 
	$.each(arrGods, function(j) {
		html += "        <option value='"+ arrGods[j].godsNo +"' >"+ arrGods[j].godsNm +"dd</option>";
	});	
	 */
	
	
	html += "   </select>";
	
	
	html += "</td>";
	html += "<td>-</td>";
	html += "<td>-</td>";
	html += "</tr>";
	
	$("#divGods").prepend( html );
	
}






/* 저장 */
function saveGodsList() {
	
	if( chkDataFld("#frmGodsList") ){
		
		
		   var arr = new Array(); //Object를 배열로 저장할 Array
	       var obj = new Object(); //key, value형태로 저장할 Object
	       
	       $.each( $("#divGods tr"), function(i){
		       obj = new Object();
		       obj.godsRelBasNo = $(this).find("#godsRelBasNo").val();
		       obj.mshipPlcyBasNo = $(this).find("#mshipPlcyBasNo").val();
		       obj.applyDivCd = $(this).find("#applyDivCd").val();
		       obj.godsTypeCd = $(this).find("#godsTypeCd").val();
		       obj.godsNo = $(this).find("#godsNo").val();
		       obj.dcRate = $(this).find("#dcRate").val();
		       obj.stat = $(this).find("#stat").val();
		       arr.push(obj);
	       });

		if( arr.length == 0 ){
			alert("저장할 정책이 없습니다.");
			return false;
		}
		
		var url = "<c:url value='${urlPrefix}/saveGodsList${urlSuffix}'/>";
		Utilities.getAjax(url, arr, true, function(data,jqXHR){
	        if(Utilities.processResult(data, jqXHR,"포인트 제외 제품 정책이 저장이 실패했습니다."))
	        {
	        	alert("포인트 제외 제품 정책이 저장되었습니다.");
	        	searchGods();
	        }  
		});
	}
}


/* 하부코드 수정 Validate*/
function saveValidate(gridView){
	var cuGridData = gridView.getSaveJson();
	for(var i=0; i<cuGridData.length; i++){
	    if(Utilities.isEmpty(cuGridData[i].applyDivCd)){
	    	alert("적용구분코드를 선택하세요.");
	    	return false;
	    }
	    if(Utilities.isEmpty(cuGridData[i].godsTypeCd)){
            alert("제품구분을 선택하세요.");
            return false;
        }
	    if(Utilities.isEmpty(cuGridData[i].dcRate)){
            alert("할인율을 입력하세요.");
            return false;
        }
	}
	return true;
}

// 쿠폰 검색
function searchCoupon( no ){
	
	
	if(  typeof(no) == "string" ){
		$("#frmCoupnDetail #mshipPlcyBasNo").val(no);
	}
	
	if( $("#frmCoupnDetail #mshipPlcyBasNo").val() == "" ){
		alert("정책 목록을 선택해 주세요.");
		return false;
	}
	
	if( $("#frmCoupnDetail #coupnBasNm").val() == "" ){
		alert("쿠폰명을 기입해 주세요.");
		return false;
	}
	
	

}




// json 
var jsonData = null;
var jsonCoupnInfo = null;

//쿠폰 마스터 가져오기
function getCoupn( ele , rowIndex , selectedVal, type){
	
	var obj = $(ele).parent().parent();
	$(obj).find("#mshipCoupnBasNo option").not("[value='']").remove();
	var sel="  ";
	var url = "<c:url value='${urlPrefix}/getCoupnBaseList${urlSuffix}'/>";
	var qry = "";
	if( type == "1"){
		 qry = "&mshipGradeCd=&applyMshpGradeCtnts="+ $("#frmCoupnDetail #applyMshpGradeCtnts").val() +"&cprtCmpNo="+ $("#frmCoupnDetail #cprtCmpNo").val();
	}
	
	callAjax(url, "POST", "coupnTypeCd="+  $(ele).val() + qry ,  function(data){
		jsonCoupnInfo = data;
		$.each(data, function(i){
			sel="  ";
			if( typeof(selectedVal) != "undefined" ){
				if( this.mshipCoupnBasNo == selectedVal ) sel=" selected ";
			}
			$(obj).find("#mshipCoupnBasNo").append("<option value='"+ this.mshipCoupnBasNo +"'  "+ sel +">"+ this.coupnBasNm +"</option>");
 	});    	
	});
}


// 쿠폰 마스터 가져오기
function getEvtCommbo(ele, rowIndex, selectedVal){

	var obj = $(ele).parent().parent();
	$(obj).find("#mshipCoupnBasNo option").not("[value='']").remove();
	
	var sel="  ";
	var url = "<c:url value='${urlPrefix}/getCoupnBaseList${urlSuffix}'/>";
	callAjax(url, "POST", "coupnTypeCd="+  $(ele).val() ,  function(data){
		jsonCoupnInfo = data;
		$.each(data, function(i){
			sel="  ";
			if( typeof(selectedVal) != "undefined" ){
				if( this.mshipCoupnBasNo == selectedVal ) sel=" selected ";
			}
			
			$(obj).find("#mshipCoupnBasNo").append("<option value='"+ this.mshipCoupnBasNo +"'  "+ sel +">"+ this.coupnBasNm +"</option>");
 	});    	
	});
	
}




// 쿠폰 상세 정보 노출
function getCoupnInfo( ele , rowIndex  ){

	var index = $("#cpnRow_"+ rowIndex +" #mshipCoupnBasNo option").index($("#cpnRow_"+ rowIndex +" #mshipCoupnBasNo  option:selected"));
	var json = jsonCoupnInfo[index-1];
	
	
	$("#cpnRow_"+ rowIndex +" #txtFromToDay").text( "" );
	$("#cpnRow_"+ rowIndex +" #txtUseDay").text( "" );
	$("#cpnRow_"+ rowIndex +" #txtCpnKindNm").text( "" );
	
	$("#cpnRow_"+ rowIndex +" #txtFromToDay").text( nvlChk( json.fromPblsStdDay ) +" ~ "+ nvlChk( json.toPblsStdDay ) );
	$("#cpnRow_"+ rowIndex +" #txtUseDay").text( "발급후 "+  nvlChk( json.coupnUsePossDay ) +" 일" );
	$("#cpnRow_"+ rowIndex +" #txtCpnKindNm").text( nvlChk( json.coupnKndCdNm ) );
}





// 쿠폰추가
function newCoupnRel(t){
	
	var mshipPlcyBasNo = $("#frmCoupnDetail #mshipPlcyBasNo").val();
	if( mshipPlcyBasNo  == "" ){
		alert("정책 목록을 선택해 주세요.");
		return false;
	}
	
	$('#frmCoupn #coupnBasNmSearch').val("");
	
	var json = null;	
	if(t == 0) {
		json = JSON.parse( jsonData ); // 검색된 값일 경우
	}else{
		json = new Object();
	}
	
	var i = ($("#divCoupon tr").length+1);
	
	
	var html = "<tr id='cpnRow_"+ i +"'>";
		html += "<td><input type='hidden'  class='godsRelBasNo'   name='gradeCoupnBasNo' id='gradeCoupnBasNo' value=''>"
		html += "<td>"+  i +"</td>";
		html += "<input type='hidden'  name='mshipPlcyBasNo' id='mshipPlcyBasNo' value='"+ mshipPlcyBasNo +"'>" 
		html += "<input type='hidden'  name='stat' id='stat' value='C'>" 
		html += "</td>" ;	
		
		
			
		html += " <td>";
		html += '   <code:commCode  className="select data-check" id="coupnTypeCd" name="coupnTypeCd" codeCd="MB080" prefixLabel="리스트" prefixValue="" others=" title=\"쿠폰리스트\" onchange=\"getCoupn(this, '+ i +', null, 1)\" "/>';
		
		html += "</td>";	
		html += " <td>";
		html += "     <select class='select wAuto data-check ' name='mshipCoupnBasNo' id='mshipCoupnBasNo' title='쿠폰마스터' onchange=\"getCoupnInfo(this, "+ i +")\">";
		html += "        <option value=''>선택</option>"; 
		html += "   </select>";
		html += "</td>";
		

		html += "<td><input type='text' class='it w50 data-check' id='prvQnty' name='prvQnty' value='' data-type='number' maxlength=3 title='제공매수'></td>";
		html += '<td> <code:commCode  className="select data-check" id="cycleCd" name="cycleCd" codeCd="CM050" prefixLabel="주기" prefixValue=""  others=" title=\"주기\" "/></td>';
		html += "<td id='txtFromToDay'>-</td>";
		html += "<td id='txtUseDay'>-</td>";
		html += "<td id='txtCpnKindNm'>-</td>";
		html += "<td>-</td>";
		html += "<td>-</td>";
		html += "</tr>";
		
		$("#divCoupon").prepend( html );
	
}


/* 제외매장 검색 */
function searchStoreRel() {
	$("form#frmStore").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getListStoreRel${urlSuffix}'/>";
	var param = Utilities.formToMap("frmStore");
	param.recordCountPerPage = 100000;
	grdShopList.loadUrl(url, param);
	//grdDetail.clear();
} 


//  저장된 쿠폰제공 리스트 호출
function searchPrvCoupon( no ) {
	
	if(  typeof(no) == "string" ){
		$("#frmCoupn #mshipPlcyBasNo").val(no);
	}
	
	if( $("#frmCoupn #mshipPlcyBasNo").val() == "" ){
		alert("정책 목록을 선택해 주세요.");
		return false;
	}
	
	
	var html = "";
	var url = "<c:url value='${urlPrefix}/getListApplyCoupnList${urlSuffix}'/>";
	
	var param = Utilities.formToMap("frmCoupn");

	
	Utilities.getAjax(url, param, true, function(data,jqXHR){
        if(Utilities.processResult(data, jqXHR,"등급별 쿠폰 정책 조회가 실패했습니다."))
        {

        	var html = "";
       		$.each(data, function(i){
       			
       			json = this;
       			
       			
				html += "<tr id='cpnRow_"+ i +"'>";
				html += "<td>"+ (i+1) +"</td>" ;
				
				html += "<td><input type='checkbox'  class='godsRelBasNo'   name='gradeCoupnBasNo' id='gradeCoupnBasNo' value='"+ nvlChk( this.gradeCoupnBasNo ) +"'></td>" ;
				html += "<td>"
	       		html += "<input type='hidden' class='it data-check' id='stat' name='stat' value='U' style='width:15px;display:none'   title='상태키'>";
       			html += "<input type='hidden' class='it data-check' id='mshipPlcyBasNo' name='mshipPlcyBasNo' style='width:15px;display:none' value='"+ nvlChk( this.mshipPlcyBasNo ) +"' >";
       		
       			html += '   <code:commCode  className="select data-check" id="coupnTypeCd" name="coupnTypeCd" codeCd="MB080" prefixLabel="리스트" selectedValue="'+ nvlChk( this.coupnTypeCd ) +'" others=" title=\"쿠폰리스트\" onchange=\"getCoupn(this, '+ i +', null, 1)\" "/>';
       		//	html +=  json.coupnTypeCdNm +"/"+  json.coupnTypeCd  +"/"+  json.mshipCoupnBasNo		       			
       			html += "</td>";
       			html += " <td>";
       			html += "     <select class='select wAuto data-check ' name='mshipCoupnBasNo' id='mshipCoupnBasNo' title='쿠폰마스터'>";
       			html += "        <option value=''>선택</option>"; 
       			html += "   </select>";
       			html += "</td>";	
       			html += " <td>";
       			html += "  <input type='text' class='it w50 data-check' id='prvQnty' name='prvQnty' value='"+ nvlChk( json.prvQnty ) +"' data-type='number' maxlength=3 title='제공매수'>"; 
       			html += "</td>";
       			
       			html += " <td>";
       			html += '<code:commCode  className="select data-check" id="cycleCd" name="cycleCd" codeCd="CM050" prefixLabel="주기" prefixValue="'+ nvlChk( json.prvQnty ) +'"  selectedValue="'+ nvlChk( json.prvQnty ) +'"  others=" title=\"주기\" "/>'
       			html += "</td>";
       			
       			
       			html += " <td>";
       			
       		
       			html += "    "+ (  nvlChk( json.fromPblsStdDay ) +" ~ "+ nvlChk( json.toPblsStdDay ) );
       		
       			
       			
       			html += "</td>";
       			
       			
       			html += " <td>";
       			if(json.useStdDayCondCd == "Y" ){
       				html += "   발급후 "+  nvlChk( json.coupnUsePossDay ) +" 일";
       			}else{
           			html += "   "+ (  nvlChk( json.fromUseStdDay ) +" ~ "+ nvlChk( json.toUseStdDay ) );
       			}
       			html += "</td>";
       			
       			html += " <td>";
       			html += "    "+ nvlChk( json.coupnKndCdNm );
       			html += "</td>";
       			html += " <td>";
       			html += "    "+  nvlChk( json.regrId ) ;
       			html += "</td>";
       			html += " <td>";
       			html += "    "+ nvlChk( json.regDt );
       			html += "</td>";
       			html += "</tr>";
       		
       		});
       		
       		$("#divCoupon").html( html );
       		
       		
	       		// commbo box value 지정
	       		$.each(data, function(j){
	       			
	       			
	       			$("#cpnRow_"+ j +" #coupnTypeCd").val(  this.coupnTypeCd );
	       			$("#cpnRow_"+ j +" #cycleCd").val(  this.cycleCd );
	       			
	       			getCoupn("#cpnRow_"+ j +" #coupnTypeCd",  j , this.mshipCoupnBasNo );
	       			
	       			
	       		});
       		
        }

	});
	

	
}


// 쿠폰제공정책 저장
function saveCoupon(){
	
	
	 if( chkDataFld("#frmCoupnDetail") ){
		 
		var arr = new Array(); //Object를 배열로 저장할 Array
	    var obj = new Object(); //key, value형태로 저장할 Object
	       
       $.each( $("#divCoupon tr"), function(i){
	       obj = new Object();
	       obj.mshipCoupnBasNo = $(this).find("#mshipCoupnBasNo").val();
	       obj.gradeCoupnBasNo = $(this).find("#gradeCoupnBasNo").val();
	       obj.mshipPlcyBasNo = $(this).find("#mshipPlcyBasNo").val();
	       obj.coupnTypeCd = $(this).find("#coupnTypeCd").val();
	       obj.prvQnty = $(this).find("#prvQnty").val();
	       obj.cycleCd = $(this).find("#cycleCd").val();
	       obj.stat = $(this).find("#stat").val();
	       arr.push(obj);
       });
	    
	    
	    
       if( arr.length == 0 ){
			alert("저장할 정책이 없습니다.");
			return false;
		}
		
		
		var url = "<c:url value='${urlPrefix}/saveCouponList${urlSuffix}'/>";
		Utilities.getAjax(url, arr, true, function(data,jqXHR){
	        if(Utilities.processResult(data, jqXHR,"등급별 쿠폰 정책 저장이 실패하였습니다."))
	        {
	        	alert("등급별 쿠폰 정책이 저장되었습니다.");
	        	searchPrvCoupon();
	        	$('#frmCoupn #coupnBasNmSearch').val("");
	        }  
		});
	}
	
}






/*
 * 

$(function() {
    

    var url = "<c:url value='${urlPrefix}/getCoupnBaseList${urlSuffix}'/>";    
    $('#frmCoupn #coupnBasNmSearch').autocomplete({
    	
    	delay: 200,
    	minLength: 2,
        source : function(request, response) {
            $.ajax({
            	type : 'post',
                url: url ,
                url: url +"?coupnBasNm="+ $('#frmCoupn #coupnBasNmSearch').val() ,
                success : function(data) {
                	
                    // 서버에서 json 데이터 response 후 목록 추가
                    response(
                        $.map(data, function(item) {
                            return {
                                value : item.coupnBasNm , 
                                label : item.coupnBasNm ,
                                test : item
                            }
                        })
                    );
                }
            });
        },
        select: function (e, ui) {
         
        	jsonData = JSON.stringify(ui.item.test);
        	addCoupon(0);
        	$("#coupnBasNmSearch").val("");
        	
        }
    }).autocomplete('instance')._renderItem = function(ul, item) { // UI 변경
    
    	//jsonData = JSON.stringify(item.test);
    	return $("<li>")
        .append("<div class='autocomplete-item'><div class='autocomplete-img-container'></div><div> " + item.label + "</div></div>")
        .appendTo(ul);
    	
    }
    
});

*/
 

	function chkGrade(obj){
		
		if( $(obj).val() == "" ){
			$("#frmDetail #mshpGradeCd").attr("disabled", true);
			$("#frmDetail #cprtCmpNo").attr("disabled", true);
			
			$("#frmDetail #mshpGradeCd").val("");
			$("#frmDetail #cprtCmpNo").val("");		
		}
		
		if( $(obj).val() == "001" ){
			$("#frmDetail #mshpGradeCd").attr("disabled", true);
			$("#frmDetail #cprtCmpNo").attr("disabled", true);	
			
			$("#frmDetail #mshpGradeCd").val("");
			$("#frmDetail #cprtCmpNo").val("");			
		}
		
		if( $(obj).val() == "002" ){

			$("#frmDetail #mshpGradeCd").attr("disabled", true);
			$("#frmDetail #cprtCmpNo").attr("disabled", false);	
			
			$("#frmDetail #mshpGradeCd").val("");
		}
		
		if( $(obj).val() == "003" ){

			$("#frmDetail #mshpGradeCd").attr("disabled", false);
			$("#frmDetail #cprtCmpNo").attr("disabled", true);	
			

			$("#frmDetail #cprtCmpNo").val("");	
		}
		
	}
	
	

function chkGrade2(obj){
	//log( $(obj).val() );
	
	
	if( $(obj).val() == "" ){
		$("#frmSearch #mshpGradeCd").attr("disabled", true);
		$("#frmSearch #cprtCmpNo").attr("disabled", true);
		
		$("#frmSearch #mshpGradeCd").val("");
		$("#frmSearch #cprtCmpNo").val("");		
	}
	
	if( $(obj).val() == "001" ){
		$("#frmSearch #mshpGradeCd").attr("disabled", true);
		$("#frmSearch #cprtCmpNo").attr("disabled", true);	
		
		$("#frmSearch #mshpGradeCd").val("");
		$("#frmSearch #cprtCmpNo").val("");			
	}
	
	if( $(obj).val() == "002" ){

		$("#frmSearch #mshpGradeCd").attr("disabled", true);
		$("#frmSearch #cprtCmpNo").attr("disabled", false);	
		
		$("#frmSearch #mshpGradeCd").val("");
	}
	
	if( $(obj).val() == "003" ){

		$("#frmSearch #mshpGradeCd").attr("disabled", false);
		$("#frmSearch #cprtCmpNo").attr("disabled", true);	
		

		$("#frmSearch #cprtCmpNo").val("");	
	}
	
}

	
	
	function delGods(){
		
		if(  $("input:checkbox[name=godsRelBasNo]:checked").length  == 0){
			alert("삭제할 제품을 선택해 주세요.");
			return false;
		}
		
		var arr = new Array(); //Object를 배열로 저장할 Array
	    var obj = new Object(); //key, value형태로 저장할 Object
	    var type = "";  
	    
       $.each( $("#divGods tr").find('#godsRelBasNo') , function(i){
    	   
    	   type = $(this).attr("type");  
    	   
    	   if( type == null ) type = $(this).prop("tagName");
		   if( typeof(type) == "undefined") return;
   	   
    	   if( type.toUpperCase() == "CHECKBOX"  ){
    		   if( $(this).is(":checked")){
			       obj = new Object();
			       obj.godsRelBasNo = $(this).val();
			       arr.push(obj);
    		   }
    	   }    	  
       });
       
       if( arr.length == 0 ){
			alert("삭제할 정책이 없습니다.");
			return false;
		}
		
		var url = "<c:url value='${urlPrefix}/deleteGodsRelList${urlSuffix}'/>";
		Utilities.getAjax(url, arr, true, function(data,jqXHR){
	        if(Utilities.processResult(data, jqXHR,"제품삭제에 실패했습니다."))
	        {
	        	alert("제품이 삭제되었습니다.");
	        	searchGods();
	        }  
		});
	
	}
	
	
	function delCoupnRel(){
		if(  $("input:checkbox[name=gradeCoupnBasNo]:checked").length  == 0){
			alert("삭제할 등급별쿠폰 정책 선택해 주세요.");
			return false;
		}
		
		var arr = new Array(); //Object를 배열로 저장할 Array
	    var obj = new Object(); //key, value형태로 저장할 Object
	    var type = "";  
	    
       $.each( $("#divCoupon tr").find('#gradeCoupnBasNo') , function(i){
    	   
    	   type = $(this).attr("type");  
    	   
    	   if( type == null ) type = $(this).prop("tagName");
		   if( typeof(type) == "undefined") return;
   	   
    	   if( type.toUpperCase() == "CHECKBOX"  ){
    		   if( $(this).is(":checked")){
			       obj = new Object();
			       obj.gradeCoupnBasNo = $(this).val();
			       arr.push(obj);
    		   }
    	   }    	  
       });
       
       if( arr.length == 0 ){
			alert("삭제할 정책이 없습니다.");
			return false;
		}
		
		var url = "<c:url value='${urlPrefix}/deleteCoupunRelList${urlSuffix}'/>";
		Utilities.getAjax(url, arr, true, function(data,jqXHR){
	        if(Utilities.processResult(data, jqXHR,"등급별쿠폰 정책 삭제를 실패하였습니다."))
	        {
	        	alert("등급별쿠폰 정책이 삭제되었습니다.");
	        	searchPrvCoupon();
	        }  
		});
	
	}
	
	
	
	function searchEventList(){
		
		

		if(  typeof(no) == "string" ){
			$("#frmCoupn #mshipPlcyBasNo").val(no);
		}
		
		if( $("#frmCoupn #mshipPlcyBasNo").val() == "" ){
			alert("정책 목록을 선택해 주세요.");
			return false;
		}
		
		
		var html = "";
		var url = "<c:url value='${urlPrefix}/getEventList${urlSuffix}'/>";
		
		var param = Utilities.formToMap("frmEvent");

		
		Utilities.getAjax(url, param, true, function(data,jqXHR){
	        if(Utilities.processResult(data, jqXHR,"이벤트쿠폰 정책 조회가 실패했습니다."))
	        {

	        	var html = "";
	       		$.each(data, function(i){
	       			
		
	       			html += '<tr id="evtRow_'+ i +'">';
					html += '<td>';
					html += '<input type="hidden" name="eventComnCd" id="eventComnCd"  class="it"  value="'+ nvlChk( this.eventComnCd ) +'" >'; 
					html += '<input type="checkbox" name="coupnEventBasNo" id="coupnEventBasNo"  class=""  value="'+ nvlChk( this.coupnEventBasNo ) +'" >'; 
					html += "<input type='hidden' class='it data-check' id='stat' name='stat' value='"+ ( ( this.coupnEventBasNo == null) ? 'C' : 'U' ) +"' style='width:15px;display:none'   title='상태키'>";
					html += '</td>';	 
					html += '<td>'+ (i+1) + '</td>'; 
					html += '<td>'+ nvlChk( this.comnCdNm ) + '</td>';  
					html += '<td>';
					html += '<code:commCode  className="select data-check" id="coupnTypeCd" name="coupnTypeCd" codeCd="MB080" prefixLabel="전체" prefixValue=""  selectedValue="'+ nvlChk( this.eventComnCd ) +'"   others=" title=\"쿠폰리스트\" onchange=\"getCoupn(this, '+ i +', null, 1)\""/>';
					html += '</td>';
					
					
					html += '<td>';
					html += '<select class="select data-check" id="mshipCoupnBasNo" name="mshipCoupnBasNo">';
					html += '<option value="">선택</option>';
					html += '</select>';
					
					html += '</td>';  
					html += '<td>';
					html += '<input type="text" name="totAppntCnt" id="totAppntCnt"  data-type="number"  class="it data-check"   onfocusout="chkPayCnt(this)" size="4" maxlength="4" class="it" style="width:30px" value="'+ nvlChk( this.totAppntCnt ) +'">';
					html += '</td>'; 
					
					html += '<td>';
					html += '<input type="text" name="monthAppntCnt" id="monthAppntCnt"  data-type="number" class="it data-check" onfocusout="chkPayCnt(this)" size="4" maxlength="4" class="it" style="width:30px" value="'+ nvlChk( this.monthAppntCnt ) +'">';
					html += '</td>'; 
					
					
					html += '<td>';
					html += '<input type="text" name="dayAppntCnt" id="dayAppntCnt"  data-type="number"  class="it data-check"   onfocusout="chkPayCnt(this)" size="4" maxlength="4" class="it" style="width:30px" value="'+ nvlChk( this.dayAppntCnt ) +'" >';
					html += '</td>';
			
					html += '<td>'+ nvlChk( this.regrId ) +'</td>';
					html += '<td>'+ nvlChk( this.regDt ) +'</td>';
					html += '</tr>';
					
	       		});
	       		
	       		$("#divEvent").html( html );
	       		
	       	// commbo box value 지정
	       		$.each(data, function(j){
	       			
	       			if( this.coupnEventBasNo != null){
		       			$("#evtRow_"+ j +" #coupnTypeCd").val(  this.coupnTypeCd );
		       			$("#evtRow_"+ j +" #mshipCoupnBasNo").val(  this.mshipCoupnBasNo );
		       			getCoupn("#evtRow_"+ j +" #coupnTypeCd",  j , this.mshipCoupnBasNo );
	       			}
	       			
	       			
	       		});
	       	
	       	
	    	}
	     });
	}
	
	
	
	
	


	// 이벤트 쿠폰 저장
	function saveEvent(){
		
		
		
		if( $("#frmEventDetail #mshipPlcyBasNo").val() == "" ){
			alert("정책 목록을 선택해 주세요.");
			return false;
		}
		
		
		//var valid = validateForm("#frmEventDetail"); //  class='data-check' 인 경우만 체크
		//if(valid){
			 
			var arr = new Array(); //Object를 배열로 저장할 Array
		    var obj = new Object(); //key, value형태로 저장할 Object
		       
	       $.each( $("#divEvent tr"), function(i){
	    	   
	    	   if( $(this).find("#coupnTypeCd").val() != ""){
	    		
			       obj = new Object();
			       obj.mshipCoupnBasNo =$(this).find("#mshipCoupnBasNo").val();
			       obj.coupnEventBasNo = $(this).find("#coupnEventBasNo").val();
			       obj.mshipPlcyBasNo = $("#frmEventDetail #mshipPlcyBasNo").val();
			       obj.eventComnCd = $(this).find("#eventComnCd").val();
			       obj.coupnTypeCd = $(this).find("#coupnTypeCd").val();
			       obj.totAppntCnt = $(this).find("#totAppntCnt").val();
			       obj.monthAppntCnt = $(this).find("#monthAppntCnt").val();
			       obj.dayAppntCnt = $(this).find("#dayAppntCnt").val();
			       obj.stat = $(this).find("#stat").val();
			       arr.push(obj);
	    	   }
	       });
		    
		    
		    
	       if( arr.length == 0 ){
				alert("저장할 정책이 없습니다.");
				return false;
			}
			
			
			var url = "<c:url value='${urlPrefix}/saveEventList${urlSuffix}'/>";
			Utilities.getAjax(url, arr, true, function(data,jqXHR){
		        if(Utilities.processResult(data, jqXHR,"이벤트 쿠폰 정책 저장이 실패하였습니다."))
		        {
		        	alert("이벤트 쿠폰 정책이 저장되었습니다.");
		        	searchEventList();
		        }  
			});
		
	}
	
	// 이벤트 삭제
	function delEvent(){

		if(  $("input:checkbox[name=coupnEventBasNo]:checked").length  == 0){
			alert("삭제할 이벤트쿠폰을 선택해 주세요.");
			return false;
		}
		
		var arr = new Array(); //Object를 배열로 저장할 Array
	    var obj = new Object(); //key, value형태로 저장할 Object
	    var type = "";  
	    
       $.each( $("#divEvent tr").find('#coupnEventBasNo') , function(i){
    	   
    	   type = $(this).attr("type");  
    	   
    	   if( type == null ) type = $(this).prop("tagName");
		   if( typeof(type) == "undefined") return;
   	   
    	   if( type.toUpperCase() == "CHECKBOX"  ){
    		   if( $(this).is(":checked")){
			       obj = new Object();
			       obj.coupnEventBasNo = $(this).val();
			       arr.push(obj);
    		   }
    	   }    	  
       });
       
       if( arr.length == 0 ){
			alert("삭제할 정책이 없습니다.");
			return false;
		}
		
		var url = "<c:url value='${urlPrefix}/deleteEventList${urlSuffix}'/>";
		Utilities.getAjax(url, arr, true, function(data,jqXHR){
	        if(Utilities.processResult(data, jqXHR,"이벤트쿠폰 삭제에 실패했습니다."))
	        {
	        	alert("이벤트쿠폰이 삭제되었습니다.");
	        	searchEventList();
	        }  
		});
	
	}


	


	

	function searchPointList(){
	
		

		if(  typeof(no) == "string" ){
			$("#frmCoupn #mshipPlcyBasNo").val(no);
		}
		
		if( $("#frmCoupn #mshipPlcyBasNo").val() == "" ){
			alert("정책 목록을 선택해 주세요.");
			return false;
		}
		
		
		var html = "";
		var url = "<c:url value='${urlPrefix}/getPointList${urlSuffix}'/>";
		
		var param = Utilities.formToMap("frmPoint");

		
		Utilities.getAjax(url, param, true, function(data,jqXHR){
	        if(Utilities.processResult(data, jqXHR,"포인트 정책 조회를 실패했습니다."))
	        {

	        	var html = "";
	       		$.each(data, function(i){
	       			
		
	       			html += '<tr id="evtRow_'+ i +'">';
					html += '<td>';
					html += '<input type="hidden" name="eventComnCd" id="eventComnCd"  class="it"  value="'+ nvlChk( this.eventComnCd ) +'" >'; 
					html += '<input type="checkbox" name="eventPointBasNo" id="eventPointBasNo"  class=""  value="'+ nvlChk( this.eventPointBasNo ) +'" >'; 
					html += "<input type='hidden' class='it data-check' id='stat' name='stat' value='"+ ( ( this.eventPointBasNo == null) ? 'C' : 'U' ) +"' style='width:15px;display:none'   title='상태키'>";
					html += '</td>';	 
					html += '<td>'+ (i+1) + '</td>'; 
					html += '<td>'+ nvlChk( this.comnCdNm ) + '</td>';  
					
					
					
					html += '<td>';
					html += '<input type="text" name="accumPointScore" id="accumPointScore"  data-type="number"  class="it data-check"  size="4" maxlength="12" style="width:100px;text-align:right;padding-right:10px" value="'+ nvlChk( this.accumPointScore ) +'">';
					html += '</td>'; 
					
					html += '<td>';
					html += '<input type="text" name="totAppntCnt" id="totAppntCnt"  data-type="number"   onfocusout="chkPayCnt(this)" class="it data-check"  size="4" maxlength="4"  style="width:30px" value="'+ nvlChk( this.totAppntCnt ) +'">';
					html += '</td>'; 
					
					html += '<td>';
					html += '<input type="text" name="monthAppntCnt" id="monthAppntCnt"  data-type="number"  onfocusout="chkPayCnt(this)" class="it data-check"  size="4" maxlength="4"style="width:30px" value="'+ nvlChk( this.monthAppntCnt ) +'">';
					html += '</td>';
					
					
					
					html += '<td>';
					html += '<input type="text" name="dayAppntCnt" id="dayAppntCnt"  data-type="number"   onfocusout="chkPayCnt(this)" class="it data-check"  size="4" maxlength="4" style="width:30px" value="'+ nvlChk( this.dayAppntCnt ) +'">';
					html += '</td>';
					
				
					
					//html += '<td>';
					
					if( this.giftPossYn == 'Y'){
						//html += '<input type="checkbox" name="giftPossYn" id="giftPossYn"  data-type="number" class=" "  size="4" maxlength="4"  value="Y" checked>';
					}else{
						//html += '<input type="checkbox" name="giftPossYn" id="giftPossYn"  data-type="number" class=" "  size="4" maxlength="4" value="Y">';	
					}
					//html += '</td>';
					

					
					
					html += '<td>'+ nvlChk( this.regrId ) +'</td>';
					html += '<td>'+ nvlChk( this.regDt ) +'</td>';
					html += '</tr>';
					
	       		});
	       		
	       		$("#divPoint").html( html );
	       		
	       
	       	
	       	
	    	}
	     });
	}
	
	
	
	
	


	// 이벤트 쿠폰 저장
	function savePoint(){
		
		
		
		if( $("#frmPointDetail #mshipPlcyBasNo").val() == "" ){
			alert("정책 목록을 선택해 주세요.");
			return false;
		}
		
		
		//var valid = validateForm("#frmPointDetail"); //  class='data-check' 인 경우만 체크
		//if(valid){
			 
			var arr = new Array(); //Object를 배열로 저장할 Array
		    var obj = new Object(); //key, value형태로 저장할 Object
		       
	       $.each( $("#divPoint tr"), function(i){
	    	   
	    	   if( $(this).find("#accumPointScore").val() != ""){
			       obj = new Object();
			       obj.mshipCoupnBasNo =$(this).find("#mshipCoupnBasNo").val();
			       obj.eventPointBasNo = $(this).find("#eventPointBasNo").val();
			       obj.mshipPlcyBasNo = $("#frmPointDetail #mshipPlcyBasNo").val();
			       obj.eventComnCd = $(this).find("#eventComnCd").val();
			       obj.accumPointScore = $(this).find("#accumPointScore").val();
			       obj.giftPossYn = $(this).find("#giftPossYn").is(":checked") ? 'Y' : 'N';
			       obj.totAppntCnt = $(this).find("#totAppntCnt").val();
			       obj.dayAppntCnt = $(this).find("#dayAppntCnt").val();
			       obj.monthAppntCnt = $(this).find("#monthAppntCnt").val();
			       obj.stat = $(this).find("#stat").val();
			       arr.push(obj);
	    	   }
	       });
		    
		    
		    
	       if( arr.length == 0 ){
				alert("저장할 정책이 없습니다.");
				return false;
			}
			
			
			var url = "<c:url value='${urlPrefix}/savePointList${urlSuffix}'/>";
			Utilities.getAjax(url, arr, true, function(data,jqXHR){
		        if(Utilities.processResult(data, jqXHR,"포인트 정책 저장이 실패하였습니다."))
		        {
		        	alert("포인트 정책이 저장되었습니다.");
		        	searchPointList();
		        }  
			});
		
	}
	
	// 이벤트 삭제
	function delPoint(){

		if(  $("input:checkbox[name=eventPointBasNo]:checked").length  == 0){
			alert("삭제할 포인트를 선택해 주세요.");
			return false;
		}
		
		var arr = new Array(); //Object를 배열로 저장할 Array
	    var obj = new Object(); //key, value형태로 저장할 Object
	    var type = "";  
	    
       $.each( $("#divPoint tr").find('#eventPointBasNo') , function(i){
    	   
    	   type = $(this).attr("type");  
    	   
    	   if( type == null ) type = $(this).prop("tagName");
		   if( typeof(type) == "undefined") return;
   	   
    	   if( type.toUpperCase() == "CHECKBOX"  ){
    		   if( $(this).is(":checked")){
			       obj = new Object();
			       obj.eventPointBasNo = $(this).val();
			       arr.push(obj);
    		   }
    	   }    	  
       });
       
       if( arr.length == 0 ){
			alert("삭제할 정책이 없습니다.");
			return false;
		}
		
		var url = "<c:url value='${urlPrefix}/deletePointList${urlSuffix}'/>";
		Utilities.getAjax(url, arr, true, function(data,jqXHR){
	        if(Utilities.processResult(data, jqXHR,"포인트 삭제에 실패했습니다."))
	        {
	        	alert("포인트 삭제되었습니다.");
	        	searchPointList();
	        }  
		});
	
	}
	
	
	

	

	function searchAdvnList(){
	
		

		if(  typeof(no) == "string" ){
			$("#frmCoupn #mshipPlcyBasNo").val(no);
		}
		
		if( $("#frmCoupn #mshipPlcyBasNo").val() == "" ){
			alert("정책 목록을 선택해 주세요.");
			return false;
		}
		
		
		var html = "";
		var url = "<c:url value='${urlPrefix}/getAdvnList${urlSuffix}'/>";
		
		var param = Utilities.formToMap("frmAdvn");

		
		Utilities.getAjax(url, param, true, function(data,jqXHR){
	        if(Utilities.processResult(data, jqXHR,"승급점수 정책 조회를 실패했습니다."))
	        {

	        	var html = "";
	       		$.each(data, function(i){
	       			
		
	       			html += '<tr id="evtRow_'+ i +'">';
					html += '<td>';
					html += '<input type="hidden" name="advncmtComnCd" id="advncmtComnCd"  class="it"  value="'+ nvlChk( this.advncmtComnCd ) +'" >'; 
					html += '<input type="checkbox" name="advncmtScoreBasNo" id="advncmtScoreBasNo"  class=""  value="'+ nvlChk( this.advncmtScoreBasNo ) +'" >'; 
					html += "<input type='hidden' class='it data-check' id='stat' name='stat' value='"+ ( ( this.advncmtScoreBasNo == null) ? 'C' : 'U' ) +"' style='width:15px;display:none'   title='상태키'>";
					html += '</td>';	 
					html += '<td>'+ (i+1) + '</td>'; 
					html += '<td>'+ nvlChk( this.comnCdNm ) + '</td>';  
					
					
					
					html += '<td>';
					html += '<input type="text" name="advncmtPointScore" id="advncmtPointScore"  data-type="number"  class="it data-check"  size="4" maxlength="12" style="width:100px;text-align:right;padding-right:10px" value="'+ nvlChk( this.advncmtPointScore ) +'">';
					html += '</td>'; 
					
					html += '<td>';
					html += '<input type="text" name="totAppntCnt" id="totAppntCnt"  data-type="number"   onfocusout="chkPayCnt(this)" class="it data-check"  size="4" maxlength="4"  style="width:30px" value="'+ nvlChk( this.totAppntCnt ) +'">';
					html += '</td>'; 
					
					html += '<td>';
					html += '<input type="text" name="monthAppntCnt" id="monthAppntCnt"  data-type="number"  onfocusout="chkPayCnt(this)" class="it data-check"  size="4" maxlength="4"style="width:30px" value="'+ nvlChk( this.monthAppntCnt ) +'">';
					html += '</td>';
					
					
					html += '<td>';
					html += '<input type="text" name="dayAppntCnt" id="dayAppntCnt"  data-type="number"   onfocusout="chkPayCnt(this)" class="it data-check"  size="4" maxlength="4" style="width:30px" value="'+ nvlChk( this.dayAppntCnt ) +'">';
					html += '</td>';
					
			
					
				

					
					
					html += '<td>'+ nvlChk( this.regrId ) +'</td>';
					html += '<td>'+ nvlChk( this.regDt ) +'</td>';
					html += '</tr>';
					
	       		});
	       		
	       		$("#divAdvn").html( html );
	       		
	       
	       	
	       	
	    	}
	     });
	}
	
	
	
	
	


	// 이벤트 쿠폰 저장
	function saveAdvn(){
		
		
		
		if( $("#frmAdvnDetail #mshipPlcyBasNo").val() == "" ){
			alert("정책 목록을 선택해 주세요.");
			return false;
		}
		
		
		//var valid = validateForm("#frmAdvnDetail"); //  class='data-check' 인 경우만 체크
		//if(valid){
			 
			var arr = new Array(); //Object를 배열로 저장할 Array
		    var obj = new Object(); //key, value형태로 저장할 Object
		       
	       $.each( $("#divAdvn tr"), function(i){
	    	   
	    	   if( $(this).find("#advncmtPointScore").val() != ""){
			       obj = new Object();
			       obj.advncmtScoreBasNo = $(this).find("#advncmtScoreBasNo").val();
			       obj.mshipPlcyBasNo = $("#frmAdvnDetail #mshipPlcyBasNo").val();
			       obj.advncmtComnCd = $(this).find("#advncmtComnCd").val();
			       obj.advncmtPointScore = $(this).find("#advncmtPointScore").val();
			       obj.totAppntCnt = $(this).find("#totAppntCnt").val();
			       obj.dayAppntCnt = $(this).find("#dayAppntCnt").val();
			       obj.monthAppntCnt = $(this).find("#monthAppntCnt").val();
			       obj.stat = $(this).find("#stat").val();
			       arr.push(obj);
	    	   }
	       });
		    
		    
		    
	       if( arr.length == 0 ){
				alert("저장할 정책이 없습니다.");
				return false;
			}
			
			
			var url = "<c:url value='${urlPrefix}/saveAdvnList${urlSuffix}'/>";
			Utilities.getAjax(url, arr, true, function(data,jqXHR){
		        if(Utilities.processResult(data, jqXHR,"승급점수 정책 저장이 실패하였습니다."))
		        {
		        	alert("승급점수 정책이 저장되었습니다.");
		        	searchAdvnList();
		        }  
			});
		
	}
	
	// 이벤트 삭제
	function delAdvn(){

		if(  $("input:checkbox[name=advncmtScoreBasNo]:checked").length  == 0){
			alert("삭제할 승급점수를 선택해 주세요.");
			return false;
		}
		
		var arr = new Array(); //Object를 배열로 저장할 Array
	    var obj = new Object(); //key, value형태로 저장할 Object
	    var type = "";  
	    
       $.each( $("#divAdvn tr").find('#advncmtScoreBasNo') , function(i){
    	   
    	   type = $(this).attr("type");  
    	   
    	   if( type == null ) type = $(this).prop("tagName");
		   if( typeof(type) == "undefined") return;
   	   
    	   if( type.toUpperCase() == "CHECKBOX"  ){
    		   if( $(this).is(":checked")){
			       obj = new Object();
			       obj.advncmtScoreBasNo = $(this).val();
			       arr.push(obj);
    		   }
    	   }    	  
       });
       
       if( arr.length == 0 ){
			alert("삭제할 정책이 없습니다.");
			return false;
		}
		
		var url = "<c:url value='${urlPrefix}/deleteAdvnList${urlSuffix}'/>";
		Utilities.getAjax(url, arr, true, function(data,jqXHR){
	        if(Utilities.processResult(data, jqXHR,"승급점수 삭제에 실패했습니다."))
	        {
	        	alert("승급점수 삭제되었습니다.");
	        	searchAdvnList();
	        }  
		});
	
	}
	
	
	// 년, 월, 일 지급제한 체크 
	function chkPayCnt( obj ){
		
		var objTag = $(obj).attr("id");
		var yVal = $(obj).parent().parent().find("#totAppntCnt");
		var mVal = $(obj).parent().parent().find("#monthAppntCnt");
		var dVal = $(obj).parent().parent().find("#dayAppntCnt");
	
		// 총 지급횟수 
		if( objTag == "totAppntCnt" ){
			
	
			if( Number( yVal.val() ) <  Number( mVal.val() ) ){
				alert("총 지급횟수는 월 지급 횟수보다 작을 수 없습니다.");
				$(yVal).val(0);	
				$(mVal).val(0);	
				$(dVal).val(0);	
				return false;			
			}
			
			if( Number( yVal.val() ) <  Number( dVal.val() ) ){
				alert("총 지급횟수는 일 지급 횟수보다 작을 수 없습니다.");
				$(yVal).val(0);	
				$(mVal).val(0);	
				$(dVal).val(0);	
				return false;		
			}
			
		}
		
		// 월 지급횟수 
		if( objTag == "monthAppntCnt" ){
			
	
			if( Number( yVal.val() ) <  Number( mVal.val() ) ){
				alert("월제한 지급횟수는 총 지급 횟수를 초과할 수 없습니다.");
				$(yVal).val(0);	
				$(mVal).val(0);	
				$(dVal).val(0);	
				return false;			
			}
			
			if( Number( mVal.val() ) < Number( dVal.val() ) ){
				alert("월제한 지급횟수는 일 지급 횟수보다 작을 수 없습니다.");
				$(yVal).val(0);	
				$(mVal).val(0);	
				$(dVal).val(0);	
				return false;		
			}
			
		}
		
		// 일 지급횟수 
		if( objTag == "dayAppntCnt" ){
			
	
			if( Number( yVal.val() ) <  Number( dVal.val() ) ){
				alert("일제한 지급횟수는 총 지급 횟수를 초과할 수 없습니다.");
				$(yVal).val(0);	
				$(mVal).val(0);	
				$(dVal).val(0);		
				return false;			
			}
			
			if( Number( mVal.val() ) < Number( dVal.val() ) ){
				alert("일제한 지급횟수는 월 지급 횟수보다 작을 수 없습니다.");
				$(yVal).val(0);	
				$(mVal).val(0);	
				$(dVal).val(0);	
				return false;		
			}
			
			
		}
		
		
		
		
	}
		
		
</script>