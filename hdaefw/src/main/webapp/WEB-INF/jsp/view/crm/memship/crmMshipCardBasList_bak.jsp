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


<script>

$(document).ready(function() {
	
	/* tab */

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

<div id="wrapIframe">
	
    <div class="mGrid1 type3"> <!-- class="type3" => left:610px -->
        <!-- left -->
        <div class="gLeft">

            <!-- 고객정보 -->
            <div class="mBox1">
                <!-- title -->
                <div class="gTitle1">
                    <h3 class="mTitle1">카드마스터 목록</h3>
                    <div class="gRt posT-5">
                        <a href="#" class="mBtn1 lWhite"   data-click="cpyCard" id="btnCopy" >복사</a>
                        <a href="#" class="mBtn1 lPrimary" data-click="newCard">신규등록</a>
                    </div>
                </div>
                <!-- //title -->
                <!-- sort -->
                <div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
                
                
             <form role="form" id="frmSearch" name="frmSearch">
            	<input type="hidden" name="currentPageNo" id="currentPageNo" value="1" />
			
			
			
			
                    <ul class="mr60"> <!-- class="mr60" => margin-right="60"-->
                        <li class="w45per">
                            <div class="tit">카드유형</div>
                            <div class="txt">
                                <code:commCode  className="select data-check" id="cardTypeCd" name="cardTypeCd" codeCd="CD020" prefixLabel="전체" prefixValue=""/>
                            </div>
                        </li>
                        <li class="w55per">
                            <div class="tit w75">등록일시</div>
                            <div class="txt">
                                <div class="mDate1">
                                
                                <input type="text" style="width:80px"  data-type="dateRangeStart" class="it " data-check  data-range-end="endRegDt"  title="등록시작일"  name="strRegDt" id="strRegDt" value="">
                                  
                                <span class="bar">~</span>
                                   
                                <input type="text" style="width:80px"  class="it  data-check"  title="등록종료일"  name="endRegDt" id="endRegDt" value="">
                                   
                                   
                                </div>
                            </div>
                        </li>
                        <li class="w45per">
                            <div class="tit">상태</div>
                            <div class="txt">
                                <code:commCode  className="select data-check" id="statusCd" name="statusCd" codeCd="S010" prefixLabel="전체" prefixValue=""/>
                            </div>
                        </li>
                        <li class="w55per">
                            <div class="tit w75">카드마스터명</div>
                            <div class="txt">
                                <input type="text" class="it" title="카드마스터명" name="cardBasNm" id="cardBasNm" value="" >
                            </div>
                        </li>
                    </ul>
                    <div class="button posRt">
                        <a href="#" class="mBtn1"  data-click="search">검색</a>
                    </div>
                    
                    </form>
                    
                </div>
                <!-- //sort -->
                
                
                
                
                <!-- list -->
                 <div id="divGrid" style="height:720px"
				  data-post="Y"
				  data-grid-id="grdList"
				  data-pagenation="Y"
				  data-get-url="<c:url value='/crmMshipCardBasList/getList'/>"
				  data-type="grid" 
				  data-tpl-url="<c:url value='/static/gridTemplate/memship/crmMshipCardBas.xml'/>"
				  >
				</div>
                <!-- //list -->
                
                
				
				
                <button class="btnClose">고객정보 닫기</button>
                <button class="btnWide">고객정보 크게보기</button> 
            </div>
            <!-- //고객정보 -->
            
        </div>
        <!-- //left -->
        <!-- right -->
        <div class="gRight">
            <!-- sort -->
            
            
          <form id="frmDetail" name="frmDetail" method="post">
            
			<input type="hidden" id="stat" name="stat" value="U"/>
            
            
            
            
            <div class="mSort2 medium"> <!-- class="medium" => 상하좌우 여백 좁은 사이즈-->
                <ul>
                    <li class="wAuto">
                        <div class="tit">카드 마스터 코드</div>
                        <div class="txt">
                            <input type="text" class="it w175" name="mshipCardBasNo" id="mshipCardBasNo" title="카드 마스터 코드" placeholder="자동생성" value="" readonly>
                        </div>
                    </li>
                </ul>
                <div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
                    <a href="#" class="mBtn1 lGray">정책 API 반영</a>
                    <a href="#" class="mBtn1 lGray" data-click="crdCard">카드발급</a>
                </div>
            </div>
            <!-- //sort -->
            
            <!-- box -->
            <div class="mBox1">
                <div class="gTitle1 line">
                    <h3 class="mTitle1">발급정책</h3>
                    <div class="gRt">
                        <a href="#" class="mBtn1 lGray"  data-click="saveCard" id="btnEdit" style="display:none">수정</a>
                        <a href="#" class="mBtn1 lPrimary" data-click="saveCard"  id="btnReg" style="">등록</a>
                    </div>
                </div>
                <!-- board -->
                <div class="mBoard2">
                    <table>
                        <caption>발급정책</caption>
                        <colgroup>
                            <col width="9%">
                            <col width="20%">
                            <col width="9%">
                            <col width="20%">
                            <col width="9%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                        
                         <tr>
                                <th scope="row" class="left">카드명</th>
                                <td class="left">
                                    <input type="text" class="it data-check" name="cardBasNm" id="cardBasNm" title="카드명" value="">
                                </td>
                                <th scope="row" class="left">카드내용</th>
                                <td class="left" colspan="4">
                                    <input type="text" class="it data-check" name="cardBasCtnts" id="cardBasCtnts" title="카드내용" value="">
                                </td>
                            
                            </tr>
                            
                            
                        
                            <tr>
                                <th scope="row" class="left">카드유형</th>
                                <td class="left">
                                    <code:commCode  className="select data-check" id="cardTypeCd" name="cardTypeCd" codeCd="CD020" prefixLabel="전체" prefixValue=""/>
                                </td>
                                <th scope="row" class="left">발급대상</th>
                                <td class="left"  colspan="2">
                                    <code:commCode  className="select data-check" id="mshipGradeApplyCtnts" name="mshipGradeApplyCtnts" codeCd="MB010" prefixLabel="전체" prefixValue="" selectedValue="${cpinfo.mshipGradeApplyCtnts}" />
                                        
                                </td>
                                
                                <th scope="row" class="left">사용여부</th>
                                <td class="left"  >
                                    <code:commCode  className="select data-check" id="statusCd" name="statusCd" codeCd="S010" prefixLabel="전체" prefixValue="" selectedValue="${cpinfo.statusCd}" />
                                        
                                </td>
                              
                            </tr>
                            
                            <tr>
                                <th scope="row" class="left">카드 사용기간</th>
                                <td class="left">
                                
                                    <code:commCode  className="select data-check" id="usePerdCd" name="usePerdCd" codeCd="MB070" prefixLabel="전체" prefixValue=""/>
                                    
                                    
                                    <input type="text" class="it data-check w40" name="cardUsePerd" id="cardUsePerd" title="카드내용" value="">
                                    
                                    일
                                </td>
                                
                                <th scope="row" class="left">적용회원등급</th>
                                <td class="left" colspan="5">
                                     
                                        <c:set var="start" value="1" />
                                        <c:forEach items="${memknd}" var="m"  varStatus="status">
                                           
                                            <c:set var="colNm" value="mshp${start}GradeUseYn" />
                                            
                                            
                                            <label class="mCheckbox1">
                                                <input type="checkbox" title="${m.comnCdNm}"  name="${colNm}"  id="${colNm}"  value="Y"   >
                                                <span class="label">${m.comnCdNm}</span>
                                            </label>
                                            
                                            <c:set var="start" value="${start+1}" />
                                            
                                       </c:forEach>     
                                            
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="left">유효기간</th>
                                <td class="left">
                                    
                                    <code:commCode  className="select data-check" id="validPerdCd" name="validPerdCd" codeCd="MB210" prefixLabel="전체" prefixValue=""/>
                                    
                                    <input type="text" class="it data-check w40" title="년" id="cardValidPerd"  name="cardValidPerd" data-type="number"   value="">
                                    년
                                </td>
                                <th scope="row" class="left">발급 횟수</th>
                                <td class="left">
                                   
									<code:commCode  className="select data-check" id="issueCntCd" name="issueCntCd" codeCd="MB110" prefixLabel="전체" prefixValue=""/>

                                     <input type="text" class="it data-check w40" title="년" id="issueCnt"  name="issueCnt"   data-type="number" value="">
                                    회
                                </td>
                                <th scope="row" class="left">등록일</th>
                                <td class="left" colspan="2">
                                    <input type="text" class="it  w120" title="등록일"  name="regDt" id="regDt"  value="" readonly>
                                    <input type="text" class="it  w90" title="이름"  name="regrId"  id="regrId"  value="" readonly>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
                
                <div class="gTitle1 line mt13">
                    <h3 class="mTitle1">포인트 적립 정책</h3>
                </div>
                <!-- board -->
                <div class="mBoard2">
                    <table>
                        <caption>포인트 적립 정책</caption>
                        <colgroup>
                            <col width="8%">
                            <col width="*">
                            <col width="8%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" class="left">적립포인트</th>
                                <td class="left">
                                    <input type="text" class="it data-check center w40" title="적립포인트" id="pointAccumRate"  name="pointAccumRate"   data-type="number" value=""> %
                                </td>
                                <th scope="row" class="left">가입 포인트</th>
                                <td class="left">
                                    <input type="text" class="it data-check right wAuto" title="가입 포인트"  id="sbscPointScore"  name="sbscPointScore"   data-type="number" value=""> Point
                                    
                                    <code:commCode  className="select data-check" id="sbscPointApplyStdCd" name="sbscPointApplyStdCd" codeCd="MB070" prefixLabel="전체" prefixValue=""/>
                                </td>
                                <th scope="row" class="left">승급 포인트</th>
                                <td class="left" >
                                    <input type="text" class="it data-check right w50" title="승급 포인트"  id="advncmtPointScore"  name="advncmtPointScore"   data-type="number" value=""> Point
                                    
                                    <code:commCode  className="select data-check" id="advncmtPointApplyStdCd" name="advncmtPointApplyStdCd" codeCd="MB070" prefixLabel="전체" prefixValue=""/>
                                    
                                </td>
                             <!--    <th scope="row" class="left">적립한도</th>
                                <td class="left">
                                    <input type="text" class="it data-check right w50" title="적립한도" value="4,000" id="issueCnt"  name="issueCnt"   data-type="number" value=""> Point/1일
                                </td>
                                <th scope="row" class="left">사용한도</th>
                                <td class="left">
                                    <input type="text" class="it data-check right w50" title="사용한도" value="4,000" id="issueCnt"  name="issueCnt"   data-type="number" value=""> Point/1일
                                </td> -->
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
                
                <div class="gTitle1 line mt13">
                    <h3 class="mTitle1">음료 혜택 정책</h3>
                </div>
                <!-- board -->
                <div class="mBoard2">
                    <table>
                        <caption>음료 혜택 정책</caption>
                        <colgroup>
                            <col width="8%">
                            <col width="11%">
                            <col width="8%">
                            <col width="11%">
                            <col width="8%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" class="left">상시할인</th>
                                <td class="left">
                                    <input type="text" class="it data-check center wAuto" title="상시할인"  id="drnkDcRate"  name="drnkDcRate"   data-type="number" value=""> %
                                </td>
                                <th scope="row" class="left">제공횟수/1일</th>
                                <td class="left">
                                    <input type="text" class="it data-check right wAuto" title="제공횟수/1일"  id="dayDrnkPrvCnt"  name="dayDrnkPrvCnt"   data-type="number" value=""> 회
                                </td>
                                <th scope="row" class="left">적용잔수</th>
                                <td class="left">
                                    <input type="text" class="it data-check right wAuto" title="적용잔수"  id="drnkPrvCnt"  name="drnkPrvCnt"   data-type="number" value=""> 잔
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
                
                <div class="gTitle1 line mt13">
                    <h3 class="mTitle1">무료 서비스</h3>
                </div>
                <!-- board -->
                <div class="mBoard2">
                    <table>
                        <caption>무료 서비스</caption>
                        <colgroup>
                            <col width="11%">
                            <col width="5%">
                            <col width="11%">
                            <col width="20%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" class="left">자사몰 무료배송</th>
                                <td>
                                
                                   <label class="mCheckbox1 notext">
                                        <input type="checkbox" title="자사몰 무료배송"  name="mycomMallFreeDlvYn" id="mycomMallFreeDlvYn" value="Y">
                                        <span class="label">자사몰 무료배송</span>
                                    </label>
                                    
                                </td>
                                <th scope="row" class="left">무상서비스 연장</th>
                                <td class="left">
                                    <input type="text" class="it data-check right w35" title="무상서비스 연장" id="freeSvcExtnsnMonsCnt"  name="freeSvcExtnsnMonsCnt"   data-type="number" value=""> 개월
                                    ( 승급시 1회 : 모든 구매 상품)
                                </td>
                                <th scope="row" class="left">음료 무료 스탬프</th>
                                <td class="left">
                                    <input type="text" class="it data-check right w35" title="음료 무료 스탬프" id="drnkFreeApplyStmpCnt"  name="drnkFreeApplyStmpCnt"   data-type="number" value=""> 장
                                </td>
                             </tr>
                             <tr>   
                                
                                <th scope="row" class="left">세라케어쿠폰</th>
                                <td class="left" colspan="2">
                                    <input type="text" class="it data-check right w35" title="세라케어쿠폰제공개월수" id="ceracCoupnPrvMonsCnt"  name="ceracCoupnPrvMonsCnt"   data-type="number" value=""> 개월
                                    ( 3개월 단위 1회 제공 )
                                </td>
                                
                                <th scope="row" class="left">세라체크쿠폰 </th>
                                <td class="left" colspan="2">
                                    <input type="text" class="it data-check right w35" title="세라체크쿠폰제공개월수" id="crckCoupnPrvMonsCnt"  name="crckCoupnPrvMonsCnt"   data-type="number" value=""> 개월
                                    ( 3개월 단위 1회 제공 )
                                </td>
                             </tr>   
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
            </div>
            <!-- //box -->
            
            
            </form>

            <!-- tab -->
            <div class="mTab1 jsTab2">
                <ul>
                    <li class="active"><a href="#jsTabCont1_1">적용매장 정책</a></li>
                    <li><a href="#jsTabCont1_2">적용상품 정책</a></li>
                    <li><a href="#jsTabCont1_3">적용채널 정책</a></li>
                    <li><a href="#jsTabCont1_4">발행카드</a></li>
                    <li><a href="#jsTabCont1_5">인증정보</a></li>
                </ul>
            </div>
            <!-- box:적용매장정책 -->
            <div id="jsTabCont1_1" class="mBox1 p10 tabCont ">
                 <!-- box -->
			             <form name="frmStore" id="frmStore" onsubmit="searchStoreRel();return false;">
            	
			            	<input type="hidden" name="mshipCardBasNo" id="mshipCardBasNo" value="${cpinfo.mshipCardBasNo}">
			            
			            
			                <!-- sort -->
			                <div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
			                    <ul>
			                        <li class="wAuto ml20">
			                            <div class="tit">지역</div>
			                            <div class="txt">
			                                <code:commCode  className="select" id="distrctCd" name="distrctCd" codeCd="CU100" prefixLabel="전체" prefixValue=""/>
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
			                
			                </form>
			                <!-- //sort -->
			                
			                 <div id="divShop" style="height:540px"
								  data-post="Y"
								  data-grid-id="grdShopList"
								  data-pagenation="Y"
								  data-get-url="<c:url value='/crmMshipApplyStorRel/getList'/>"
								  data-type="grid" 
								  data-tpl-url="<c:url value='/static/gridTemplate/memship/crmMshipApplyStorRel.xml'/>"
							  >
							</div>
			            
			              <!-- //box -->
            </div>
            <!-- //box:적용매장정책 -->
            <!-- box:적용상품정책 -->
            <div id="jsTabCont1_2" class="mBox1 p10 tabCont hidden">
                <!-- box -->
			             <form name="frmGods" id="frmGods" onsubmit="searchGodsRel();return false;">
            	
			            	<input type="hidden" name="mshipCardBasNo" id="mshipCardBasNo" value="${cpinfo.mshipCardBasNo}">
			            
			            
			                <!-- sort -->
			                <div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
			                    <ul>
			                        <li class="wAuto ml20">
			                            <div class="tit">제품이군</div>
			                            <div class="txt">
			                                <code:commCode  className="select" id="godsTypeCd" name="godsTypeCd" codeCd="GD040" prefixLabel="전체" prefixValue=""/>
			                            </div>
			                        </li>
			                    
			                        <li class="wAuto ml35">
			                            <div class="tit">제품명</div>
			                            <div class="txt">
			                                 <input type="text" class="it" name="godsNm" id="godsNm" value=""/>
			                            </div>
			                            <span class="button">
			                                <button type="submit" class="mBtn1 btnSubmit"  data-file-info="button" data-click="searchGodsRel" >검색</a>
			                            </span>
			                        </li>
			                    </ul>
			                    <div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
			                        <a href="#" data-grid-id="grdGods" data-disp-name="" data-click="saveGodsPop" id="btnSaveGodsDetail" class="mBtn1 m lWhite" style="cursor: pointer;">관리</a>
			                    </div>
			                </div>
			                
			                </form>
			                <!-- //sort -->
			                
			                 <div id="divGods" style="height:540px"
								  data-post="Y"
								  data-grid-id="grdGodsList"
								  data-pagenation="Y"
								  data-get-url="<c:url value='/crmMshipCoupnBas/getGodsRelList'/>"
								  data-type="grid" 
								  data-tpl-url="<c:url value='/static/gridTemplate/memship/crmMshipApplyGodsRel.xml'/>"
							  >
							</div>
			            
			              <!-- //box -->
            </div>
            <!-- //box:적용상품정책 -->
            <!-- box:적용채널정책 -->
            <div id="jsTabCont1_3" class="mBox1 p10 tabCont hidden">
                 <!-- box -->
			             <form name="frmChl" id="frmChl" onsubmit="searchChlRel();return false;">
            	
			            	<input type="hidden" name="mshipCardBasNo" id="mshipCardBasNo" value="${cpinfo.mshipCardBasNo}">
			            
			            
			                <!-- sort -->
			                <div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
			                    <ul>
			                       
			                        <li class="wAuto ml35">
			                            <div class="tit">채널</div>
			                            <div class="txt">
			                                  <code:commCode  className="select" id="applyChlCd" name="applyChlCd" codeCd="ST040" prefixLabel="전체" prefixValue=""/>
			                            </div>
			                             <div class="tit">채널명</div>
			                            <div class="txt">
			                                 <input type="text" class="it" name="applyChlNm" id="applyChlNm" value=""/>
			                            </div>
			                            <span class="button">
			                                <button type="submit" class="mBtn1 btnSubmit"  data-file-info="button" data-click="searchChlRel" >검색</a>
			                            </span>
			                        </li>
			                    </ul>
			                    <div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
			                        <a href="#" data-grid-id="grdChlList" data-disp-name="" data-click="saveChlPop" id="btnSaveChl" class="mBtn1 m lWhite" style="cursor: pointer;">관리</a>
			                    </div>
			                </div>
			                
			                </form>
			                <!-- //sort -->
			                
			                    <div id="divChl" style="height:540px"
								  data-post="Y"
								  data-grid-id="grdChlList"
								  data-pagenation="Y"
								  data-get-url="<c:url value='/crmMshipApplyStorRel/getChlRelList'/>"
								  data-type="grid" 
								  data-tpl-url="<c:url value='/static/gridTemplate/memship/crmMshipApplyChlRel.xml'/>"
							  >
							</div>
			            
			              <!-- //box -->
            </div>
            <!-- //box:적용채널정책 -->
            <!-- box:발행카드 -->
            <div id="jsTabCont1_4" class="mBox1 p10 tabCont hidden">
            
            
             <form name="frmCardHst" id="frmCardHst" onsubmit="searchCardHst();return false;">
         	
            	<input type="hidden" name="mshipCardBasNo" id="mshipCardBasNo" value="${cpinfo.cardBasNo}">
			            	
                <!-- sort -->
                <div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
                    <ul>
                        <li class="wAuto ml20">
                            <div class="tit">카드유형</div>
                            <div class="txt">
                               <code:commCode  className="select data-check" id="cardTypeCd" name="cardTypeCd" codeCd="CD020" prefixLabel="전체" prefixValue=""/>
                            </div>
                        </li>
                        <li class="wAuto ml35">
                            <div class="tit">멤버십</div>
                            <div class="txt">
                                <code:commCode  className="select data-check" id="mshipGradeCd" name="mshipGradeCd" codeCd="MB010" prefixLabel="전체" prefixValue="" selectedValue="${cpinfo.mshipGradeCd}" />
                            </div>
                            <span class="button">
                                <a href="#" class="mBtn1" data-click="searchCardHst">검색</a>
                            </span>
                        </li>
                    </ul>
                    <!-- <div class="button posRt"> 우측 정렬 : class="posRt"
                        <a href="#" class="mBtn1 lWhite">관리</a>
                    </div> -->
                </div>
                <!-- //sort -->
                
                </form>
              

		                    <div id="divCardHst" style="height:540px"
							  data-post="Y"
							  data-grid-id="grdCardHstList"
							  data-pagenation="Y"
							  data-get-url="<c:url value='/crmMshipCardBas/grdCardHstList'/>"
							  data-type="grid" 
							  data-tpl-url="<c:url value='/static/gridTemplate/memship/crmCardPblsHst.xml'/>">
							</div>
							
            </div>
            <!-- //box:발행카드 -->
            <!-- box:인증정보 -->
            <div id="jsTabCont1_5" class="mBox1 p10 tabCont hidden">
                <!-- sort -->
                <div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
                    <div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
                        <a href="#" class="mBtn1 lWhite">발급</a>
                        <a href="#" class="mBtn1 lWhite">취소</a>
                        <a href="#" class="mBtn1 lGray">엑셀 다운로드</a>
                    </div>
                </div>
                <!-- //sort -->
                <!-- board -->
                <div class="mBoard1 mCustomScrollbar h280">
                    <table>
                        <caption>인증정보</caption>
                        <colgroup>
                            <col span="2" width="5%">
                            <col span="8" width="*">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col">NO</th>
                                <th scope="col">
                                    <label class="mCheckbox1 notext">
                                        <input type="checkbox" name="" title="선택">
                                        <span class="label">전체선택</span>
                                    </label>
                                </th>
                                <th scope="col">인증번호</th>
                                <th scope="col">발급카드번호</th>
                                <th scope="col">회원등급</th>
                                <th scope="col">회원번호</th>
                                <th scope="col">이름</th>
                                <th scope="col">휴대폰</th>
                                <th scope="col">사용</th>
                                <th scope="col">최근사용 일자</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>
                                    <label class="mCheckbox1 notext">
                                        <input type="checkbox" name="" title="선택">
                                        <span class="label">선택</span>
                                    </label>
                                </td>
                                <td>XXXX-XXXX-EEEE-AAAA</td>
                                <td>XXXX-XXXX-EEEE-AAAA</td>
                                <td>VIP</td>
                                <td>40001614</td>
                                <td>김XX</td>
                                <td>010XXXXTTTT</td>
                                <td><span class="txtRed">발급/미사용</span></td>
                                <td>2022-01-01</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
				<!-- paging -->
				<div class="mPag1 mb0">
					<div class="mCount1">총 <strong>5</strong>건</div>
					<span title="처음 리스트" class="first">처음으로</span>
					<span title="이전 리스트" href="###" class="prev">이전</span>
					<!-- able 버튼
						<a title="처음 리스트" href="###" class="first">처음으로</a>
						<a title="이전 리스트" href="###" class="prev">이전</a>
					-->
					<a title="현재페이지" href="###" class="active">1</a>
					<a title="2 페이지" href="###">2</a>
					<a title="3 페이지" href="###">3</a>
					<a title="4 페이지" href="###">4</a>
					<a title="5 페이지" href="###">5</a>
					<a title="6 페이지" href="###">6</a>
					<a title="다음 리스트" href="###" class="next">다음</a>
					<a title="마지막 리스트" href="###" class="last">마지막으로</a>
					<!-- disabled 버튼
						<span title="다음 리스트" class="next">다음</span>
						<span title="마지막 리스트" class="last">마지막으로</span>
					-->
					<select class="select" title="갯수선택">
						<option>10</option>
						<option>20</option>
						<option>30</option>
					</select>
				</div>
				<!-- //paging -->
            </div>
            <!-- //box:인증정보 -->

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
}


function grdChlList_load(gridView, gridId) {
	log("grdChlList_load");
	//searchChlRel();
}



/* 하부코드 그리드 load */
function grdDetail_load(gridView, gridId) {
	//console.log("grdDetail_load");
}


function chkEle(ele, val){
	
}


/* 공통코드 Row클릭 시 */
function grdList_rowChanged(grdList, oldRow, newRow, rowData) {

	Utilities.mapToForm(rowData,"frmDetail");



	chkEleVal("#frmDetail #mycomMallFreeDlvYn", "Y", rowData.mycomMallFreeDlvYn);
	

	$("#frmDetail #stat").val("u");
	$("#frmDetail #btnReg").hide();
	$("#frmDetail #btnEdit").show();

	//searchGods( rowData.mshipCardBasNo );
	//searchPrvCoupon( rowData.mshipCardBasNo );
	
	//$("#frmApi #mshipCardBasNo").val( rowData.mshipCardBasNo );
	$("#frmStore #mshipCardBasNo").val( rowData.mshipCardBasNo );
	$("#frmGods #mshipCardBasNo").val( rowData.mshipCardBasNo );
	$("#frmChl #mshipCardBasNo").val( rowData.mshipCardBasNo );
	$("#frmCardHst #mshipCardBasNo").val( rowData.mshipCardBasNo );
	

	// 탭 데이터 호출
	searchStoreRel();
	searchGodsRel();
	searchChlRel();
	searchCardHst();
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


/* 카드 마스터 추가 */
function newCard(){
	Utilities.mapToForm(null,"frmDetail");
	
	$("#frmDetail")[0].reset();
	$("#frmDetail #stat").val("c");
	$("#frmDetail #btnReg").show();
	$("#frmDetail #btnEdit").hide();
}



/* 복사 */
function cpyCard(){
	
	var saveJson = grdList.getCheckedJson();
	if (saveJson.length == 0) {
		alert("복사할 카드마스터를 선택해주세요.");
		return;
	}
	
	if( saveJson.length > 1){
		alert("복사할 카드마스터를 한개만 선택해 주세요.");
		return;
	}
	
	Utilities.mapToForm( grdList.getCheckedJson()[0] ,"frmDetail");
	
	$("#frmDetail #stat").val("c");
	$("#frmDetail #mshipCardBasNo").val("");


	$("#frmDetail #btnReg").show();
	$("#frmDetail #btnEdit").hide();
	
	/* if( $("#frmDetail #mshipCardBasNo").val() == "" ){
		$("#frmDetail #mshipCardBasNo").focus();
		alert("정책코드는 자동으로 생성됩니다.");
	} */
	
	if (saveJson.length) {
		
		if (!confirm("카드마스터코드는 자동으로 생성됩니다. \n\n선택된 정책을 복사하시겠습니까?"))
			return;
		
		var cpyData = Utilities.formToMap("frmDetail");
		var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
		Utilities.getAjax(url, cpyData, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "카드마스터 복사가 실패했습니다.")) {
				alert("카드마스터 복사가 완료되었습니다.");
					search();
					$("#frmDetail")[0].reset();
			}
		});
	} else {
		alert("선택된 데이터가 없습니다.");
	}
}




/* 카드 마스터 등록 추가 */
function saveCard(){
	var saveJson = Utilities.formToMap("frmDetail");

	var valid = validateForm("#frmDetail"); //  class='data-check' 인 경우만 체크
	
	if(valid) {
		
		var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
		Utilities.getAjax(url,saveJson,true,function(data,jqXHR){
	        if(Utilities.processResult(data,jqXHR,"카드 마스터 저장에 실패했습니다."))
	        {
	            alert("카드 마스터 저장이 완료되었습니다.");
	            grdList.reload();
	            $("#frmDetail")[0].reset();
	        }
	    });
	
	}else{
		
		alert("필수 항목들을 기입해 주세요.");
		return false;
	}
}


/* 카드 발급 팝업 */
function crdCard(){
	
	if( $("#frmCardHst #cardBasNo").val() == "" ){
		alert("발급할 카드 마스터를 선택해 주세요.");
		return false;
	}else{	
	 	var url = "<c:url value='${urlPrefix}/crdCard${urlSuffix}'/>?cardBasNo="+ $("#frmCardHst #cardBasNo").val();
	 	Utilities.openModal(url, 900, 650);
	}
	
}

/* 적용매장 검색 */
function searchStoreRel() {
	$("form#frmStore").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getListStoreRel${urlSuffix}'/>";
	var param = Utilities.formToMap("frmStore");
	param.recordCountPerPage = 100000;
	grdShopList.loadUrl(url, param);
	//grdDetail.clear();
} 



/* 적용상품 검색 */
function searchGodsRel() {
	$("form#frmGods").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getGodsRelList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmGods");
	param.recordCountPerPage = 100000;
	grdGodsList.loadUrl(url, param);
	//grdDetail.clear();
} 



/* 적용채널 검색 */
function searchChlRel() {
	$("form#frmChl").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getChlRelList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmChl");
	param.recordCountPerPage = 100000;
	grdChlList.loadUrl(url, param);
	//grdDetail.clear();
} 

/* 적용채널 검색 */
function searchCardHst() {
	$("form#frmCardHst").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getCardHstList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmCardHst");
	param.recordCountPerPage = 100000;
	grdCardHstList.loadUrl(url, param);
	//grdDetail.clear();
} 


function saveStorePop(){
	var url = "<c:url value='${urlPrefix}/popStore${urlSuffix}'/>?mshipCardBasNo="+ $("#frmDetail #mshipCardBasNo").val();
	Utilities.openModal(url, "1000", "800");
}


function saveGodsPop(){
	var url = "<c:url value='${urlPrefix}/popGods${urlSuffix}'/>?mshipCardBasNo="+ $("#frmDetail #mshipCardBasNo").val();
	Utilities.openModal(url, "1000", "800");
}


function saveChlPop(){
	var url = "<c:url value='${urlPrefix}/popChl${urlSuffix}'/>?mshipCardBasNo="+ $("#frmDetail #mshipCardBasNo").val();
	Utilities.openModal(url, "1000", "800");
}




//자동검색
$(function() {
	
	//if( "${cpinfo.mshipCoupnBasNo}" != ""){
	//	$("#btnDel").show();
	//}
 
 var url = "<c:url value='${urlPrefix}/getGodsBaseList${urlSuffix}'/>";
 $('#godsNm').autocomplete({
 	delay: 200,
 	minLength: 2,
     source : function(request, response) {
         $.ajax({
         	type : 'get',
             url: url +"?godsNm="+ $('#godsNm').val() ,
             success : function(data) {
                 // 서버에서 json 데이터 response 후 목록 추가
                 response(
                     $.map(data, function(item) {
                         return {
                             value : item.godsNm , 
                             label : item.godsNm ,
                             test : item.godsNo
                         }
                     })
                 );
             }
         });
     }
 }).autocomplete('instance')._renderItem = function(ul, item) { // UI 변경
 	
 	return $("<li>")
     .append("<div class='autocomplete-item'><div class='autocomplete-img-container'></div><div onclick=\"searchGodsBase('"+ item.label +"', '"+ item.test +"')\"> " + item.label + "</div></div>")
       .appendTo(ul);
 	
 };
 
});


//제품 검색후 값 지정
function searchGodsBase(label, val){
	$("#prsnttnGodsCd").val(val);
	$("#godsNm").val(label);
}




</script>

