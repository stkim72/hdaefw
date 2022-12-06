<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<style>
/* 셀렉박스 스타일 */
.tui-datetime-input {width:90px}
.select {width:90px}

</style>
        <!-- left -->
        <div class="gLeft">
			<form role="form" id="frmSearch" name="frmSearch">
            <!-- 고객정보 -->
            <div class="mBox1">
                <!-- title -->
                <div class="gTitle1">
                    <h3 class="mTitle1">스탬프마스터 목록</h3>
                    <div class="gRt">
                        <a href="#" class="mBtn1 lWhite" data-auth-type="c" style="display:none" data-click="cpyStmp">복사</a>
                		<a href="#" class="mBtn1 lPrimary" data-auth-type="c" style="display:none" data-click="resetStmp">신규등록</a>	<!-- 우측데이터 클리어 > 등고 활성화 -->
                    </div>
                </div>
                <!-- //title -->
                <!-- sort -->
                <div class="mSort2 mini pl0"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
                    <ul class="mr60"> <!-- class="mr60" => margin-right="60"-->
                        <li class="w50per">
                            <div class="tit w90">스탬프 마스터명</div>
                            <div class="txt">
                                <input type="text" class="it data-check" title="스탬프 마스터명" name="stmpBasNm" id="stmpBasNm">
                            </div>
                        </li>
                        <li class="w50per">
                            <div class="tit w75">발행기간</div>
                            <div class="txt">
                                <div class="mDate1">
                                    <input type="text" class="it  w100 data-check" title="기간 시작일"  data-type="dateRangeStart" data-range-end="searchToUsePossDt"  data-button="Y"  name="searchFromUsePossDt" id="searchFromUsePossDt" value="">
                                    <span class="bar">~</span>
                                    <input type="text" class="it  w100 data-check" title="기간 마지막일" name="searchToUsePossDt" id="searchToUsePossDt" data-button="Y"  value="">
                                </div>
                            </div>
                        </li>
                        <li class="w50per">
                            <div class="tit w90">스탬프 유형</div>
                            <div class="txt">
                                <select class="select data-check w100" title="스탬프 유형" name="stmpTypeCd" id="stmpTypeCd">
                                    <option value="">전체</option>
                                    <option value="0">결제 시 적립</option>
                                    <option value="1">이벤트시 적립</option>
                                </select>
                            </div>
                        </li>
                        <li class="w50per">
                            <div class="tit">스탬프수</div>
                            <div class="txt">
                                <input type="text" class="it right w35 data-check" title="1판당 스탬프 수" value="" name="stmpQnty" id="stmpQnty">
                            </div>
                            <div class="tit">사용여부</div>
                            <div class="txt w120">
								<code:commCode  className="select" id="useYn" name="useYn" codeCd="S010" prefixLabel="선택" prefixValue=""/>
							</div>
                        </li>
                        <!-- 
                        <li class="w50per">
                            <div class="tit w142">스탬프 개별 유효기간</div>
                            <div class="txt">
                                <select class="select data-check" title="스탬프 개별 유효기간" name="searchValidPerd" id="searchValidPerd">
                                    <option value="Y">있음</option>
                                    <option value="N">없음</option>
                                </select>
                            </div>
                        </li> -->
                    </ul>
                    <div class="button posRt">
                        <a href="#" class="mBtn1" data-click="search">검색</a>
                    </div>
                </div>
            
                <!-- //sort -->
                <!-- list -->
               <!-- <div class="mBoard1 mCustomScrollbar hSortRow3"> --> <!-- class="hSortRow2" : 검색2줄 -->
               <!-- style="height:85%" style="height:650px" -->
                	<div id="divGrid"  style="height:650px"
					  data-post="Y"
					  data-grid-id="grdList"
					  data-pagenation="Y"
					  data-get-url="<c:url value='/example/getList'/>"
					  data-type="grid" 
					  data-block-ui="Y"
					  data-tpl-url="<c:url value='/static/gridTemplate/memship/cmmMshipStampBas.xml'/>"
					  >
					</div>
                <button class="btnClose">고객정보 닫기</button>
                <button class="btnWide">고객정보 크게보기</button> 
            </div>
            <!-- //고객정보 -->
        </form>
        </div>
        <!-- //left -->
        <!-- right -->
        <div class="gRight" id="gRight">
        <form id="frmDetail" name="frmDetail" method="post">
        	<input type="hidden" id="stat" name="stat" value="${addMode}"/>
        	<input type="hidden" id="mshipTypeCds" name="mshipTypeCds" value=""/>
            <!-- sort -->
            <div class="mSort2 medium"> <!-- class="medium" => 상하좌우 여백 좁은 사이즈-->
                <ul>
                    <li class="wAuto">
                        <div class="tit">스탬프 마스터 코드</div>
                        <div class="txt">
                            <input type="text" class="it w150" title="스탬프 마스터 코드" name="mshipStmpBasNo" id="mshipStmpBasNo" required="true" disabled="" placeholder="자동생성" value="" >
                            
                        </div>
                    </li>
                </ul>
                <div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
                   <!--  <a href="#" class="mBtn1 lGray">정책 API 반영</a> -->
                    <a href="#;" class="mBtn1 lWhite" data-auth-type="c" style="display:none"data-click="popupTopStamp">스탬프 발급</a>
                </div>
            </div>
            <!-- //sort -->

            <!-- box -->
            <div class="mBox1">
                <div class="gTitle1 line">
                    <h3 class="mTitle1">기본정보</h3>
                    <div class="gRt">
                    	<!-- 수정: 이력이 있을시 불가 , 삭제: 이력 있을시 불가 , 신규 등록 도 이력 없으면 수정 삭제 가능 -->
                        <span data-auth-type="d" style="display:none"><a href="javascript:deleteStmp()" class="mBtn1 lGray"  id="deleteStmp">삭제</a></span>
                        <span data-auth-type="u" style="display:none"><a href="javascript:editStmp()" class="mBtn1 lWhite"  id="editStmp">수정</a></span>
                        <span data-auth-type="c" style="display:none"><a href="javascript:insertStmp()" class="mBtn1 lPrimary" id="insertStmp">등록</a></span>
                    </div>
                </div>
                <!-- board -->
                <div class="mBoard2">
                    <table>
                        <caption>기본정보</caption>
                        <colgroup>
                            <col width="12%">
                            <col width="*">
                            <col width="8%">
                            <col width="12%">
                            <col width="8%">
                            <col width="8%">
                            <col width="12%">
                            <col width="8%">
                            <col width="11%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" class="left">스탬프 마스터명</th>
                                <td>
                                    <input type="text" class="it" title="스탬프 마스터명" name="stmpBasNm" id="stmpBasNm">
                                </td>
                                <th scope="row" class="left">스탬프 유형</th>
                                <td colspan="2">
                                    <select class="select data-check w100" title="스탬프 유형" name="stmpTypeCd" id="stmpTypeCd">
                                        <option value="0">결제 시 적립</option>
                                        <option value="1">이벤트시 적립</option>
                                    </select>
                                    <code:commCode  className="select w100" id="stmpEventCd" name="stmpEventCd" codeCd="EV200" prefixLabel="스탬프 이벤트코드" prefixValue="" />
                                </td>
                                <th scope="row" class="left">스탬프 발행기간</th>
                                <td class="left" colspan="3">
                                    <!-- <input type="text" class="it date w70" title="스탬프 발행기간 시작일" value="2022-01-01"> -->
                                    <input type="text" class="it w120 data-check" title="기간 시작일"  data-type="dateRangeStart" data-range-end="toUsePossDt"  data-button="Y"  name="fromUsePossDt" id="fromUsePossDt" value="">
                                    <span class="bar">~</span>
                                    <!-- <input type="text" class="it date w70" title="스탬프 발행기간 마지막일" value="2022-01-03"> -->
                                    <input type="text" class="it  w120 data-check" title="기간 마지막일" name="toUsePossDt" id="toUsePossDt" data-button="Y"  value="">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="left">스탬프 1판 당 유효기간</th>
                                <td class="left">
                                    <label class="mCheckbox1">
                                        <input type="checkbox" title="없음" checked="checked" name="chkValidPerd" data-value="N">
                                        <span class="label">없음</span>
                                    </label>
                                    <label class="mCheckbox1">
                                        <input type="checkbox" title="있음" name="chkValidPerd" data-value="Y">
                                        <span class="label">있음</span>
                                    </label>
                                    <input type="hidden" id="validYn" name="validYn" >
                                    <input type="text" class="it w75" title="일" id="validPerd" name="validPerd" value="" > 일
                                </td>
                                <th scope="row" class="left">1판당 스탬프 수</th>
                                <td class="left">
                                    <input type="text" class="it w75" title="1판당 스탬프 수" id="stmpQnty" name="stmpQnty" value=""> 개
                                </td>
                                <th scope="row" class="left">최대 판 수</th>
                                <td class="left" colspan="2">
                                    <label class="mCheckbox1">
                                        <input type="checkbox" title="무제한" checked="checked" name="chkStmpMax" data-value="Y">
                                        <span class="label">무제한</span>
                                    </label>
                                    <label class="mCheckbox1">
                                        <input type="checkbox" title="최대" name="chkStmpMax" data-value="N">
                                        <span class="label">최대</span>
                                    </label>
                                    <input type="hidden" name = "stmpMaxYn" id="stmpMaxYn">
                                    <input type="text" class="it w75" title="판" id="stmpMaxCnt" name="stmpMaxCnt" value="" > 판
                                </td>
                                <th scope="row" class="left">사용여부</th>
                                <td>
                                    <select class="select" title="기업유형" id="useYn" name="useYn">
                                        <option value="Y">사용</option>
                                        <option value="N">사용안함</option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
                
                <div class="gTitle1 line mt13">
                    <h3 class="mTitle1">발급정책</h3>
                </div>
                <!-- board -->
                <div class="mBoard2">
                    <table>
                        <caption>발급정책</caption>
                        <colgroup>
                            <col width="8%">
                            <col width="10%">
                            <col width="8%">
                            <col width="10%">
                            <col width="10%">
                            <col width="8%">
                            <col width="8%">
                            <col width="5%">
                            <col width="10%">
                            <col width="10%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" class="left">적립채널</th>
                                <td class="left" colspan="4">
                                <%-- <c:forEach var="item" items="${chlList}" varStatus="vs">
                                	<label class="mCheckbox1">
                                        <input type="checkbox" title="${item.comnCdNm}" name="accumChl" data-value="${item.comnCd }">
                                        <span class="label">${item.comnCdNm}</span>
                                    </label>
                                </c:forEach> --%>
                                	<span id="accumChl"></span>
                                </td>
                                <th scope="row" class="left">쿠폰 할인 시 적립</th>
                                <td >
                                    <select class="select data-check" title="쿠폰 할인 시 적립 여부" id="coupnAccumDcYn" name="coupnAccumDcYn">
                                        <option value="Y">예</option>
                                        <option value="N">아니오</option>
                                    </select>
                                </td>
                                <th scope="row" class="left">등록 정보</th>
                                <td class="left" colspan="2">
                                    <div class="mFlex2">
                                        <span class="bar5" id="regDt"></span> | <span class="bar5" id="regId"></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                               <th scope="row" class="left">적용회원등급</th>
                                <td class="left" colspan="4">
                                	<%-- <code:commCode  className="select data-check" id="mshipGradeCd" name="mshipGradeCd" codeCd="MB010" prefixLabel="맴버십등급" prefixValue="" change="chkGrade"/>
                                    <code:commCode  className="select data-check" id="mshpGradeCd" name="mshpGradeCd" codeCd="MB020" prefixLabel="회원등급" prefixValue="" others="disabled" />
                                    <select class="select w150 data-check"  name="cprtCmpNo" id="cprtCmpNo" disabled>
                                    	<option value="">제휴사 선택</option>
                                    </select> --%>
                                    <span id="applyMshpGradeCtnts"></span>
                                    <label class="mCheckbox1">
										<input type="checkbox" title="임직원" id="mshipTypeCd" name="mshipTypeCd">
										<span class="label">임직원</span>
									</label>
									<select class="select w130 mshipGrp" name="cprtCmpNo" id="cprtCmpNo">
                                    	<option value="">제휴사 선택</option>
                                    </select>
                                </td>
                                <th scope="row" class="left">조건 금액</th>
                                <td class="br0" >
                                    <div class="mFlex2">
                                        <label class="mCheckbox1 notext">
                                            <input type="checkbox" title="선택" id="chkCondYn" name="chkCondYn" checked="checked">
                                            <span class="label">선택</span>
                                        </label>
                                        <input type="hidden" name="condYn" id="condYn">
                                        <span class="flex">
                                            <input type="text" class="it data-check w80" title="조건 금액 설정" id="condAmt" name="condAmt"><!-- 원 이상 결제시 적립. -->
                                        </span>
                                    </div>
                                </td>
                                <th scope="row" class="left">적립 수량</th>
                                <td class="left" colspan="2">
                                    <div class="mFlex2">
                                        <span class="flex">
                                            <!-- <input type="text" class="it data-check w80" title="적립 수량 설정" id="condCnt" name="condCnt" value="1"> -->
                                            <select class="it data-check w50" id="condCnt" name="condCnt">
											<c:forEach var="i" begin="1" end="10">    <%-- <p><c:out value="${i}" /></p> --%>
												<option value="${i}"><c:out value="${i}" /></option>
											</c:forEach>
											</select>
                                        </span>
                                    </div>
                                </td>
                               <!--  <td class="left bl0"></td> -->
                                <!-- <td class="left bl0"></td> -->
                                <!-- <th scope="row" class="left">등록자</th>
                                <td class="left" colspan="2">
                                    <div class="mFlex2">
                                        <span class="bar5" id="regId"></span>
                                    </div>
                                </td> -->
                                <!-- <td class="left bl0">이상 결제 시 적립</td>
                                <th scope="row" class="left">1회 적립 최대횟수</th>
                                <td >
                                    <div class="mFlex2">
                                        <input type="text" class="it data-check" title="1회 적립 최대횟수" id="accumCnt" name="accumCnt"> 
                                        <span class="bar5">번</span>
                                    </div>
                                </td> -->
                            </tr>
                           
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
                
                <div class="gTitle1 line mt13">
                    <h3 class="mTitle1">혜택정책</h3>
                </div>
                <!-- board -->
                <div class="mBoard2">
                    <table border="1" >
                        <caption>혜택정책</caption>
                        <colgroup>
                            <%-- <col width="8%">
                            <col width="20%">
                            <col width="8%">
                            <col width="10%">
                            <col width="10%">
                            <col width="8%">
                            <col width="20%">
                            <col width="*"> --%>
                            <col width="8%">
                            <col width="16%">
                            <col width="8%">
                            <col width="20%">
                            <col width="8%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                        	<tr>
                                <th scope="row" class="left">혜택 유형</th>
                                <td>
                                    <code:commCode className="select w200" name="bnfitCd" id="bnfitCd" codeCd="PM120" change="changeDisable"/>
                                </td>
                                <th scope="row" class="left">적용포인트</th>
                                <td class="left">
                                    <input type="text" class="it right w80 comma" data-type="number2" id="pointScore" name="pointScore" title="적용포인트"> Point
                                </td>
                                <th scope="row" class="left">적용쿠폰</th>
                                <td class="left" >
                                	<div class="mFlex2">
                                        <span class="flex">
                                            <input type="hidden" class="it" title="쿠폰" id="coupnNo" name="coupnNo">
                                            <input type="text" class="it" title="쿠폰" id="coupnNm" disabled="disabled">
                                        </span>
                                        <a href="javascript:searchCoupn()" class="mBtn1 m lWhite" id="searchCpn" >검색</a>
                                    </div>
                                </td>
                            </tr>
                            <!-- <tr>
                                <th scope="row" class="left">혜택 지급 기준</th>
                                <td class="left">
                                    <label class="mCheckbox1">
                                        <input type="checkbox" name="bnfitCdView" title="쿠폰" data-value="0" checked="checked">
                                        <span class="label">쿠폰</span>
                                    </label>
                                    <label class="mCheckbox1">
                                        <input type="checkbox" name="bnfitCdView" title="포인트" data-value="1">
                                        <span class="label">포인트</span>
                                    </label>
                                    <input type="hidden" name="bnfitCd" id = "bnfitCd">
                                </td>
                                <th scope="row" class="left">포인트 설정</th>
                                <td>
                                    <div class="mFlex2">
                                        <span class="flex">
                                            <input type="text" class="it" title="포인트" id="pointScore" name="pointScore">
                                        </span>
                                    </div>
                                </td>
                                <td>
                                    포인트 적립
                                </td>
                                <th scope="row" class="left">혜택 쿠폰 선택</th>
                                <td>
                                    <div class="mFlex2">
                                        <span class="flex">
                                            <input type="hidden" class="it" title="쿠폰" id="coupnNo" name="coupnNo">
                                            <input type="text" class="it" title="쿠폰" id="coupnNm">
                                        </span>
                                        <a href="javascript:searchCoupn()" class="mBtn1 m lWhite" id="searchCpn" >검색</a>
                                    </div>
                                </td>
                            </tr> -->
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
                    <li class="active"><a href="#jsTabCont1_1">적용매장</a></li>
                    <li><a href="#jsTabCont1_2">적용상품</a></li>
                    <li><a href="#jsTabCont1_4">발행스탬프</a></li>
                </ul>
            </div>
            
            <!-- box:적용매장 -->
            <div id="jsTabCont1_1" class="mBox1 p10 tabCont">
                <!-- sort -->
				<form name="frmStore" id="frmStore" onsubmit="searchStoreRel();return false;"> 
				<input type="hidden" name="mshipStmpBasNo" id="mshipStmpBasNo" value="">
				             
                <div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
                    <ul>
                        <li class="wAuto ml20">
                            <div class="tit">지역</div>
                            <div class="txt">
                                <code:commCode  className="select" id="distrctCd" name="distrctCd" codeCd="MB200" prefixLabel="전체" prefixValue=""/>
                            </div>
                        </li>
                        <!-- <li class="wAuto ml35">
                            <div class="tit">매장코드</div>
                            <div class="txt">
                                <input type="text" class="it w90" title="매장코드">
                            </div>
                        </li> -->
                        <li class="wAuto ml35">
                            <div class="tit">매장명</div>
                            <div class="txt">
                                <input type="text" class="it w90" name="storNm" id="storNm" title="매장명">
                            </div>
                            <span class="button">
                                <!-- <a href="#" class="mBtn1">검색</a> -->
                                <button type="submit" class="mBtn1 btnSubmit"  data-file-info="button" data-click="searchStoreRel" >검색</a>
                            </span>
                        </li>
                    </ul>
                    <div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
                       <!--  <a href="#" class="mBtn1 lPrimary">관리</a> -->
                        <a href="#" data-grid-id="grdShopList" data-disp-name="" data-auth-type="c" data-click="saveStorePop" id="btnSaveStore" class="mBtn1 m lWhite" style="cursor: pointer;display:none">관리</a>
                    </div>
                </div>
                </form>
                <!-- //sort -->
                
                <div id="divShop" style="height:385px"
								  data-post="Y"
								  data-grid-id="grdShopList"
								  data-pagenation="Y"
								  data-get-url="<c:url value='/cmmMshipApplyStorRel/getList'/>"
								  data-type="grid"
								  data-block-ui="Y" 
								  data-tpl-url="<c:url value='/static/gridTemplate/memship/cmmMshipSmtpStorRel.xml'/>"
							  >
							</div>
                
            </div>
            <!-- //box:적용매장 -->
			<!-- box:적용상품 -->
            <div id="jsTabCont1_2" class="mBox1 p10 tabCont hidden">
            	<form name="frmGods" id="frmGods" onsubmit="searchGodsRel();return false;">
            	<input type="hidden" name="mshipStmpBasNo" id="mshipStmpBasNo" value="">
                <!-- sort -->
                	<div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
	                    <ul>
	                        <li class="wAuto ml20">
	                            <div class="tit">제품군</div>
	                            <div class="txt">
	                                <select class="select ml20" id="godsTypeCd" name="godsTypeCd">
									   <option value="">선택해주세요.</option>
									     <c:forEach var="item" items="${godsLclss}">
									     	<option value="${item.godsLclssCd}">${item.godsLclssCdNm}</option>
									    </c:forEach>
									 </select>
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
                
                <div id="divGods" style="height:385px"
								  data-post="Y"
								  data-grid-id="grdGodsList"
								  data-pagenation="Y"
								  data-get-url="<c:url value='/cmmMshipCoupnBas/getGodsRelList'/>"
								  data-type="grid" 
								  data-block-ui="Y"
								  data-tpl-url="<c:url value='/static/gridTemplate/memship/cmmMshipApplyGodsRel.xml'/>"
							  >
							</div>
				
            </div>
            <!-- //box:적용메뉴 -->
            <!-- box:발행스탬프 -->
            <div id="jsTabCont1_4" class="mBox1 p10 tabCont hidden">
                <!-- sort -->
                <form name="frmStmp" id="frmStmp" onsubmit="searchStmpList();return false;"> 
                <input type="hidden" name="mshipStmpBasNo" id="mshipStmpBasNo" value="">
                <div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
                    <ul>
                        <li class="w25per">
                            <div class="tit w75">통합고객번호</div>
                            <div class="txt">
                               <input type="text" class="it w200" name="stmpItgCustNo" id="stmpItgCustNo" title="통합고객번호"> 
                            </div>
                        </li>
                        <li class="w20per">
	                        <div class="tit w75">회원명</div>
	                        <div class="txt">
	                            <input type="text" class="it w100" title="회원명" name="custNm" id="custNm"   value="">
	                        </div>
	                    </li>
                        <li class="w45per">
                            <div class="tit w80">적립기간</div>
                            <div class="txt">
                                <input type="text" class="it date w65" title="적립 시작일" value="" data-type="dateRangeStart" data-button="Y" name="fromAccumDt" id="fromAccumDt" data-range-end="toAccumDt">
                                <span class="bar">~</span>
                                <input type="text" class="it date w65" title="적립 완료일" value="" data-button="Y" name="toAccumDt" id="toAccumDt">
                                
                                <span class="button">
                                    <button type="submit" class="mBtn1 btnSubmit" data-file-info="button" data-click="searchStmpList" style="cursor: pointer;">검색</button>
                                </span>
                            </div>
                        </li>
                    </ul>
                </div>
                </form>
                <!-- //sort -->
				<div id="divShop" style="height:385px"
					  data-post="Y"
					  data-grid-id="grdStmpList"
					  data-pagenation="Y"
					  data-get-url="<c:url value='/cmmMshipApplyStorRel/getList'/>"
					  data-type="grid" 
					  data-block-ui="Y"
					  data-tpl-url="<c:url value='/static/gridTemplate/memship/cmmMshipSmtpListRel.xml'/>"
				  >
				</div>
            </div>
            <!-- //box:발행스탬프 -->
        </div>
        <!-- //right -->
        
        <!-- //팝업 -->
		<!-- layer -->
		<div id="jsLayer1" class="mLayer1" style="display: none;">
		    <div class="title">
		        <h2>쿠폰조회</h2>
		        <a href="javascript:closePop()" class="close jsBtnClose1">팝업 닫기</a>
		    </div>
		    <!-- sort -->
		    <div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
		        <ul>
		            <li class="wAuto ml20">
		                <div class="tit">쿠폰이름</div>
		                <div class="txt">
		                    <input type="text" class="it w90" title="쿠폰이름" value="" id="cpnNm">
		                </div>
		            </li>
		            <li class="wAuto ml35">
		                <div class="tit">쿠폰번호</div>
		                <div class="txt">
		                    <input type="text" class="it w90" title="쿠폰번호" value="" id="cpnCode">
		                    <span class="button">
		                        <a href="javascript:searchCoupon()" class="mBtn1">검색</a>
		                    </span>
		                </div>
		            </li>
		            
		            <div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
			            <a href="#" class="mBtn1 lPrimary" id="btnSndCard"  data-click="selectCpn">선택</a>
			        </div>
		        </ul>
		        <!-- <div class="button posRt"> 우측 정렬 : class="posRt"
		            <a href="#" class="mBtn1 lPrimary">확인</a>
		        </div> -->
		    </div>
		    <!-- //sort -->
		    <div id="divGrid"  style="height:60%"
					  data-post="Y"
					  data-grid-id="grdListCpn"
					  data-pagenation="Y"
					  data-get-url="<c:url value='/example/getList'/>"
					  data-type="grid" 
					  data-tpl-url="<c:url value='/static/gridTemplate/memship/cmmMshipStampCpnBas.xml'/>"
					  >
					</div>
					
		    
		</div>
		<!-- //layer -->
<script>
var _current_code_cd = null;


/* 공통코드 그리드 load */
function grdList_load(gridView, gridId) {
	search();
}

function grdListCpn_load(gridView, gridId) {
}

/* 하부코드 그리드 load */
function grdDetail_load(gridView, gridId) {
	// console.log("grdDetail_load");
}

/* 공통코드 Row클릭 시 */
function grdList_rowChanged(grdList, oldRow, newRow, rowData) {
	
	$('#deleteStmp').show();
	$('#editStmp').show();
	$('#insertStmp').hide();
	
	$('#stat').val('U');

	$("#frmDetail #mshipStmpBasNo").val( rowData.mshipStmpBasNo );
	$("#frmStore #mshipStmpBasNo").val( rowData.mshipStmpBasNo );
	$("#frmGods #mshipStmpBasNo").val( rowData.mshipStmpBasNo );
	$("#frmStmp #mshipStmpBasNo").val( rowData.mshipStmpBasNo );
	
	$("#frmDetail #stmpBasNm").val( rowData.stmpBasNm);
	$("#frmDetail #stmpTypeCd").val( rowData.stmpTypeCd ).trigger('change');
	$("#frmDetail #stmpEventCd").val( rowData.stmpEventCd );
	$("#frmDetail #fromUsePossDt").val($.datepicker.formatDate('yy-mm-dd', new Date(rowData.fromUsePossDt)));
	$("#frmDetail #toUsePossDt").val($.datepicker.formatDate('yy-mm-dd', new Date(rowData.toUsePossDt)));
	$("#frmDetail #stmpQnty").val( rowData.stmpQnty );
	$("#frmDetail #useYn").val( rowData.useYn ).trigger('change');						// 사용여부
	$("#frmDetail #condCnt").val( rowData.condCnt ).trigger('change');
											// 적립채널
	$("#frmDetail #coupnAccumDcYn").val( rowData.coupnAccumDcYn ).trigger('change');	// 쿠폰할인 여부
	$("#frmDetail #accumCnt").val( rowData.accumCnt );									// 1회최대적립회수
	
	rowData.condYn == 'Y' ? $("#chkCondYn").prop("checked", false) :  $("#chkCondYn").prop("checked", true);
	$("#frmDetail #condAmt").attr("disabled", false);
	if (rowData.condYn == 'Y') {
		$("#frmDetail #condAmt").attr("disabled", true);
	}
	
	$("#frmDetail #condAmt").val( addComma(rowData.condAmt) );									// 조건금액설정

	// chkValidPerd , chkStmpMax , chkCondYn condAmt
	$("#frmDetail #ordrYn").val( rowData.ordrYn );
	$("#frmDetail #ordrAmt").val( rowData.ordrAmt );
	
	$("#frmDetail #validYn").val( rowData.validYn );
	$('input[type="checkbox"][name="chkValidPerd"]').prop("checked", false);
	if (rowData.validYn == 'Y') {
		$('input[type="checkbox"][name="chkValidPerd"]:eq(1)').prop("checked", true);
		$('#frmDetail #validPerd').attr("disabled", false);
	} else {
		$('input[type="checkbox"][name="chkValidPerd"]:eq(0)').prop("checked", true);
		$('#frmDetail #validPerd').attr("disabled", true);
	}
	
	$("#frmDetail #validPerd").val( rowData.validPerd );
	
	$("#frmDetail #stmpMaxYn").val( rowData.stmpMaxYn );
	$('input[type="checkbox"][name="chkStmpMax"]').prop("checked", false);
	if (rowData.stmpMaxYn == 'Y') {
		$('input[type="checkbox"][name="chkStmpMax"]:eq(0)').prop("checked", true);
		$('#frmDetail #stmpMaxCnt').attr("disabled", true);
	} else {
		$('input[type="checkbox"][name="chkStmpMax"]:eq(1)').prop("checked", true);
		$('#frmDetail #stmpMaxCnt').attr("disabled", false);
	}
	
	$("#frmDetail #stmpMaxCnt").val( rowData.stmpMaxCnt );
	$("#frmDetail #condYn").val( rowData.condYn );
	
	$("#frmDetail #cprtCmpNo").val(rowData.cprtCmpNo);
	
	// bnfitCdView
	// $("input[name=bnfitCdView]").prop("checked", false);
	$('#frmDetail #coupnNm').attr("disabled", false);
	$('#frmDetail #pointScore').attr("disabled", false);
	$('#frmDetail #searchCpn').attr("disabled", false);
	
	$("#frmDetail #bnfitCd").val( rowData.bnfitCd ).trigger('change');
	if (rowData.bnfitCd == '002') {
		$('#pointScore').val(null);
		$('#pointScore').attr("disabled", true);
		$('#coupnNo').val(rowData.coupnNo);
		$('#coupnNm').val(rowData.coupnNm);
	} else if (rowData.bnfitCd == '001') {
		$('#coupnNm').val('');
		$('#coupnNo').val(null);
		$('#coupnNm').attr("disabled", true);
		$('#pointScore').val(addComma(rowData.pointScore));
	}
	
	/* $("input[name=bnfitCdView]").each(function(index,item){
		var dataValue = $(this).data('value');
		if (rowData.bnfitCd == dataValue) {
			$(this).prop("checked", true);
			if (rowData.bnfitCd == '0') {
				$('#pointScore').val('');
				$('#pointScore').attr("disabled", true);
				$('#coupnNo').val(rowData.coupnNo);
				$('#coupnNm').val(rowData.coupnNm);
			} else if (rowData.bnfitCd == '1') {
				$('#coupnNm').val('');
				$('#coupnNo').val('');
				$('#coupnNm').attr("disabled", true);
				$('#pointScore').val(addComma(rowData.pointScore));
			}
		}
	}); */
	
	$("#frmDetail #regDt").text(rowData.regDt.substring(0,16));
	$("#frmDetail #regId").text(rowData.regrNm);
	
	$('#frmDetail #mshipTypeCd').prop("checked",false);
	var mshipType = rowData.mshipTypeCds.split(",");
	for(var i = 0;i<mshipType.length;i++){
		if (mshipType[i] == '001') {
			$('#frmDetail #mshipTypeCd').prop("checked",true);
		} 
	}
	
	searchStoreRel();
	searchGodsRel();
	searchStmpList();

}

function searchGods () {
	searchGodsRel();
}

/* function grdListCpn_rowChanged(grdList, oldRow, newRow, rowData) {
	$('#coupnNm').val(rowData.coupnBasNm );
	$('#coupnNo').val(rowData.mshipCoupnBasNo);
	$('.mLayer1').hide();
} */

function onGridLoad(gridView, gridId) {

}

/* 그리드 컬럼 클릭 */
function onGridCellClick(gridView, rowIndex, columnName, colIndex, fieldIndex) {
	// console.log("onGridCellClick");
	$(".tui-grid-cell-current-row").find("input:radio[name='rdo_grdListCpn']").prop('checked', true);
}

function grdList_cellClick(gridView, itemIndex, column, index, field){
	/*
	우선순위 문제로 searchGodsRel 함수에서 ajax > ajax 가 안됨 첫번재 ajax가 실행 완료 시 두번재 ajax 가 실행됨
	*/
	// console.log("grdList_cellClick");
	var objJson = gridView.getCurrentJson();
	
	dataSetting(objJson);
}

/* 그리드 데이터를 우측 필드에 세팅 */
function dataSetting(objJson){
	applyMShipGradeSetting(objJson);
	$("#applyMshpGradeCtnts").val(objJson.applyMshpGradeCtnts);
	
	
	//console.log(mshipType);
	accumChlSetting(objJson);
	$("#accumChl").val(objJson.accumChl);
}

//////////////////////////////////////////////////////

var arrGods = null;		 // 제품
var arrGodsTypeCd = null; // 제품군
/* var arrComnCd = null; // 제품군
function getGods(no){	
	
	var param = {"topComnCd":no,"comnCdLvlNo":"2"};
	var url = "<c:url value='${urlPrefix}/getComnCdList${urlSuffix}'/>";
	Utilities.getAjax(url, param, true, function(data,jqXHR){
        if(Utilities.processResult(data, jqXHR,"그룹 조회 실패했습니다."))
        {
        	arrComnCd = data;       		
        }  
	});
} */

/* var arrComnStep2 = null; // 분류2
function getComnStep2(no){	
	var param = {"topComnCd":no,"comnCdLvlNo":"2"};
	var url = "<c:url value='${urlPrefix}/getComnCdList${urlSuffix}'/>";
	Utilities.getAjax(url, param, true, function(data,jqXHR){
		arrComnStep2 = data;
	}); 
} */

/* var arrComnStep3 = null; // 분류3
function getComnStep3(no){	
	var param = {"topComnCd":no,"comnCdLvlNo":"2"};
	var url = "<c:url value='${urlPrefix}/getComnCdList${urlSuffix}'/>";
	Utilities.getAjax(url, param, true, function(data,jqXHR){
		arrComnStep3 = data;
	}); 
} */

function search() {
	$("form#frmSearch").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmSearch");
	param.fromUsePossDt = param.searchFromUsePossDt
	param.toUsePossDt = param.searchToUsePossDt
	param.recordCountPerPage = 20;
	grdList.loadUrl(url, param);
}

function cpyStmp(){
	var saveJson = grdList.getCheckedJson(); //getCheckedJson

	if (saveJson == null) {
		alert("복사할 스탬프를 선택해주세요.");
		return;
	}

	/* saveJson[0].stat = "c";
	saveJson[0].mshipCoupnBasNo = null;
	saveJson[0]._attributes = null; */
	
	if (saveJson != null) {
		
		if (!confirm("스탬프마스터 코드는 자동으로 생성됩니다. \n\n선택된 스탬프를 복사하시겠습니까?"))
			return;
		
		var url = "<c:url value='${urlPrefix}/copy${urlSuffix}'/>";
		Utilities.getAjax(url, saveJson, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "스탬프 복사가 실패했습니다.")) {
				alert("스탬프 복사가 완료되었습니다.");
					search();
					//$("#frmDetail")[0].reset();
			}
		});
	} else {
		alert("선택된 데이터가 없습니다.");
	}
	
}

function resetStmp () {
	
	$("#frmDetail")[0].reset();
	$("#frmStmp")[0].reset();
	$("#frmGods")[0].reset();
	$("#frmStore")[0].reset();
	
	$('#deleteStmp').hide();
	$('#editStmp').hide();
	$('#insertStmp').show();
	
	$('#frmDetail #stat').val('C');
	$('#frmDetail #validPerd').attr('disabled',true);
	$('#frmDetail #stmpMaxCnt').attr('disabled',true);
	$('#frmDetail #condAmt').attr('disabled',false);
	
	$('#frmDetail #validYn').val('N');
	$('#frmDetail #stmpMaxYn').val('Y');
	$('#frmDetail #condYn').val('N');
	//$('#frmDetail #bnfitCd').val('0');
	$('#frmDetail #coupnNo').val('');
	
	$('#frmDetail #regDt').text('');
	$('#frmDetail #regId').text('');
	
	$("#frmStore #mshipStmpBasNo").val('');
	$("#frmGods #mshipStmpBasNo").val('');
	$("#frmStmp #mshipStmpBasNo").val('');
	grdShopList.clear();
	grdStmpList.clear();
	
}

function searchCoupn() {
	
	if($("#bnfitCd").val() == "001"){
		alert("혜택 유형이 포인트로 설정되어 있습니다.");
		return;
	}
	searchCoupon();
	$('.mLayer1').show();
}

function closePop() {
	$('.mLayer1').hide();
}

/* 쿠폰조회 팝업에서 선택 버튼 클릭 시 */
function selectCpn(){
	var data = grdListCpn.getCurrentJson();
	$('#coupnNm').val(data.coupnBasNm);
	$('#coupnNo').val(data.mshipCoupnBasNo);
	$('.mLayer1').hide();
}

function searchCoupon () {
	
	var searchJson = new Object();
	searchJson.coupnBasNm = $('#cpnNm').val();
	searchJson.mshipCoupnBasNo = $('#cpnCode').val();
	searchJson.useYn = "Y";
	var url = "<c:url value='${urlPrefix}/searchCpn${urlSuffix}'/>";
	searchJson.recordCountPerPage = 20;
	grdListCpn.loadUrl(url, searchJson);
}

/* 적용매장 검색 */
function searchStoreRel() {
	if( $("#frmStore #mshipStmpBasNo").val() != "" ){
		$("form#frmStore").find("#currentPageNo").val(1);
	 	var url = "<c:url value='${urlPrefix}/getListStoreRel${urlSuffix}'/>";
		var param = Utilities.formToMap("frmStore");
		param.recordCountPerPage = 20;
		grdShopList.loadUrl(url, param);
	}
	//grdDetail.clear();
}

/*지급이력*/
function searchStmpList() {
	
	if( $("#frmStmp #mshipStmpBasNo").val() != "" ){
		$("form#frmStmp").find("#currentPageNo").val(1);
	 	var url = "<c:url value='${urlPrefix}/getListStmpRel${urlSuffix}'/>";
		var param = Utilities.formToMap("frmStmp");
	
		param.recordCountPerPage = 20;
		grdStmpList.loadUrl(url, param);
	}
	
	//grdDetail.clear();
} 



/* 적용상품 검색 */
function searchGodsRel() {
	if ($("#frmGods #mshipStmpBasNo").val() != '') {
		$("form#frmGods").find("#currentPageNo").val(1);
	 	var url = "<c:url value='${urlPrefix}/getGodsRelList${urlSuffix}'/>";
		var param = Utilities.formToMap("frmGods");
		param.recordCountPerPage = 20;
		grdGodsList.loadUrl(url, param);
	}
	//grdDetail.clear();
}

function saveStorePop(){
	var code = $('#frmDetail #mshipStmpBasNo').val(); 
	if (code == '') {
		alert('스탬프 마스터 코드를 확인하세요.');
		return false;
	}
	var url = "<c:url value='${urlPrefix}/popStore${urlSuffix}'/>?mshipStmpBasNo="+code;
	Utilities.openModal(url, "1200", "800");
}


function saveGodsPop(){
	
	if( $("#frmGods #mshipStmpBasNo").val() == "" ){
		alert('스탬프 마스터 코드를 확인하세요.');
		return false;
	}
	var code = $('#mshipStmpBasNo').val();
	var url = "<c:url value='${urlPrefix}/popGods${urlSuffix}'/>?mshipStmpBasNo="+code;
	Utilities.openModal(url, "1000", "800");
}

function deleteStmp(){
	
	if( $.trim( $("#mshipStmpBasNo").val() ) == "" ){
		//alert("스탬프 고유 번호가 없습니다3.");
		return false;
	}else{
		
		var param = {
				mshipStmpBasNo : $.trim( $("#frmDetail #mshipStmpBasNo").val() )
			};

		var url = "<c:url value='${urlPrefix}/checkIssue${urlSuffix}'/>";
		Utilities.getAjax(url,param,true,function(data,jqXHR){
			
	        if (data.hstCount == 0) {
	        	if( confirm("해당 스탬프 마스터를 삭제하시겠습니까? 삭제 후 복구는 불가능 합니다.")){
	        		
	    			var url = "<c:url value='${urlPrefix}/delete${urlSuffix}'/>";
	    			Utilities.getAjax(url,param,true,function(data,jqXHR){
	    		        if(Utilities.processResult(data,jqXHR,"스탬프마스터 삭제에 실패했습니다."))
	    		        {
	    		            alert("스탬프마스터가 삭제되었습니다.");
	    		            Utilities.closeModal();
	    		            search();
	    		        }
	    		    });
	    		}
	        } else {
	        	alert('스탬프 내역이 존재 함으로 삭제 불가능 합니다.');
	        }
	    });
		
		
		return false;
	}
	
}

function editStmp(){
	
	if( $.trim( $("#mshipStmpBasNo").val() ) == "" ){
		//alert("스탬프 고유 번호가 없습니다4.");
		return false;
	}else{
		
		var param = {
				mshipStmpBasNo : $.trim( $("#frmDetail #mshipStmpBasNo").val() )
			};

		var url = "<c:url value='${urlPrefix}/checkIssue${urlSuffix}'/>";
		Utilities.getAjax(url,param,true,function(data,jqXHR){

	        if (data.hstCount == 0) {
	        	if( confirm("해당 스탬프 마스터를 수정하시겠습니까?")){
	    		    var saveJson = Utilities.formToMap("frmDetail");
	    			var valid = validateForm("#frmDetail"); //  class='data-check' 인 경우만 체크
	    			
	    			/* var chlArr = new Array ();
	    			$("input[name=accumChl]").each(function(index,item){
	    				var dataValue = $(this).data('value');
	    				if ($(this).is(':checked')) {
	    					chlArr.push(""+dataValue+"");
	    				}
	    			});
	    			
	    			if (chlArr.length == 0) {
	    				alert('적립채널을 선택해 주세요.');
	    				return;
	    			}
	    			
	    			saveJson.accumChl = chlArr; */
	    			
	    			var fromUsePossDt = Number(saveJson.fromUsePossDt.replaceAll("-",""));
	    			var toUsePossDt = Number(saveJson.toUsePossDt.replaceAll("-",""));
	    			if (fromUsePossDt > toUsePossDt) {
	    				alert('스탬프 발행기간 종료일이 시작일보다 빠를수 없습니다.');
	    				$('#frmDetail #toUsePossDt').val('');
	    				return;
	    			}
	    			
	    			// 종료일이 현재보다 과거
	    			var now = new Date();
	    			var toDay = Number(now.getFullYear()+""+("0" + (now.getMonth() + 1)).slice(-2)+""+("0"+now.getDate()).slice(-2));
	    			if (toUsePossDt < toDay) {
	    				alert('스탬프 발행기간 종료일은 현재시간 보다 과거일수 없습니다.');
	    				return;
	    			}
	    			
	    			saveJson.stat = 'U';
	    			// 금액 콤마 제거
	    			saveJson.condAmt = saveJson.condAmt.replace(/[^\d]+/g, "");
	    			saveJson.pointScore = saveJson.pointScore.replace(/[^\d]+/g, "");
	    			
	    			var mshipTypeCd_arr = new Array();
	    			if ($("#frmDetail #mshipTypeCd").is(":checked")) { // 임직원
	    				// saveJson.mshipTypeCd = '001';
	    				mshipTypeCd_arr.push("001");
	    			}
	    			if ($("#frmDetail #cprtCmpNo").val() != '') {	// 제휴
	    				mshipTypeCd_arr.push("002");
	    			}
	    			if ($("input:checkbox[name=applyMshpGradeCtnts]:checked").length) {	// 회원
	    				mshipTypeCd_arr.push("003");
	    			}
	    			if (mshipTypeCd_arr.length == 0) {
	    				alert('회원등급을 선택해 주세요.');
	    				return;
	    			}
	    			
	    			saveJson.mshipTypeCds = mshipTypeCd_arr;
					// return;
	    			if(valid) {
	    				Utilities.blockUI();
	    				var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
	    				Utilities.getAjax(url,saveJson,true,function(data,jqXHR){
	    					Utilities.unblockUI();
	    			        if(Utilities.processResult(data,jqXHR,"스탬프 수정 에 실패했습니다."))
	    			        {
	    			            alert("스탬프 수정이 완료되었습니다.");
	    			            search();
	    			        }
	    			    });
	    			
	    			}else{
	    				
	    				alert("필수 항목들을 기입해 주세요.");
	    				return false;
	    			}
	    		    
	    		}
	        } else {
	        	// alert('스탬프 내역이 존재 함으로 수정 불가능 합니다.');
	        	if( confirm("내역이 존재하는 스탬프는 [사용여부/발행기간] 만 수정가능합니다\n 수정하시겠습니까?")){
	        		
	        		var saveJson = Utilities.formToMap("frmDetail");
	        		var valid = validateForm("#frmDetail");
	        		
	    			var param = {
	    					mshipStmpBasNo : $.trim( $("#frmDetail #mshipStmpBasNo").val() ),
	    					stat : 'U',
	    					useYn : saveJson.useYn,
	    					fromUsePossDt : saveJson.fromUsePossDt,
	    					toUsePossDt : saveJson.toUsePossDt
	    				};
	    			
	    			//console.log(param);
	    			//return;
	    			if(valid) {
		        		Utilities.blockUI();
	    				var url = "<c:url value='${urlPrefix}/updateStmpInfo${urlSuffix}'/>";
	    				Utilities.getAjax(url,param,true,function(data,jqXHR){
	    					Utilities.unblockUI();
	    			        if(Utilities.processResult(data,jqXHR,"스탬프 수정 에 실패했습니다."))
	    			        {
	    			            alert("스탬프 수정이 완료되었습니다.");
	    			            search();
	    			        }
	    			    });
	    			}
	        	}
	        }
	    });
		
		return false;
	}
	
}

function keyUp (obj) {
	$(obj).val(addComma($(obj).val().replace(/[^0-9]/g,"")));
}

function changeGods (obj) {
	
	var trId = $(obj).closest('tr').attr('id');
	var code = $(obj).val();
	$('#'+trId+' #'+$(obj).attr('id')+'View').val(code);
}

function changeGodsCd (obj,id,val) {
	
	var trId = $(obj).closest('tr').attr('id');
	var code = $(obj).val();
	$('#'+trId+' #'+$(obj).attr('id')+'View').val(code);
//	var param = {"godsGrpId":$('#'+trId+' #godsGrpId').val(),"godsTypeCd":$('#'+trId+' #gridGodsTypeCd').val(),"godsDtlTypeCd":code};
	var param = {"godsClassCd":code};
	
	var getId = $(id).attr('id');
	$('#'+trId+' #'+getId).children('option:not(:first)').remove();
	
	var url = "<c:url value='${urlPrefix}/getGodsList${urlSuffix}'/>";
	Utilities.getAjax(url, param, true, function(data,jqXHR){
        $.each( data, function( key, value ){ 
        	$('#'+trId+' #'+getId).append("<option value='"+ value.godsNo +"' >"+ value.godsNm +"</option>");
        	if (value.godsNo == val) {
	        	$('#'+trId+' #'+getId).val(value.godsNo).prop("selected", true);
        	}
		});
		
	});
}

function changeComnCd (obj,id,val,pre) {

	var trId = $(obj).closest('tr').attr('id');
	var code = $(obj).val();
	var data = $(id).data('value');
	
	if (code == null) {
		code = pre+"";
	}
	
	var param = {"comnCd":code,"topComnCd":data};

	$('#'+trId+' #'+$(obj).attr('id')+'View').val(code);
	
	var getId = $(id).attr('id');
	$('#'+trId+' #'+getId).children('option:not(:first)').remove();
	
	var url = "<c:url value='${urlPrefix}/getComnCdList${urlSuffix}'/>";
	Utilities.getAjax(url, param, true, function(data,jqXHR){
        $.each( data, function( key, value ){ 
        	$('#'+trId+' #'+getId).append("<option value='"+ value.comnCd +"' >"+ value.comnCdNm +"</option>");
        	if (value.comnCd == val) {
	        	$('#'+trId+' #'+getId).val(value.comnCd).prop("selected", true);
        	}
		});
		
	});
}

function editGodsDetail () {
	//console.log('editGodsDetail');
}

function insertStmp () {
	var saveJson = Utilities.formToMap("frmDetail");
	var valid = validateForm("#frmDetail"); //  class='data-check' 인 경우만 체크
	
	var fromUsePossDt = Number(saveJson.fromUsePossDt.replaceAll("-",""));
	var toUsePossDt = Number(saveJson.toUsePossDt.replaceAll("-",""));
	if (fromUsePossDt > toUsePossDt) {
		alert('스탬프 발행기간 종료일이 시작일보다 빠를수 없습니다.');
		$('#frmDetail #toUsePossDt').val('');
		return;
	}
	
	// 종료일이 현재보다 과거
	var now = new Date();
	var toDay = Number(now.getFullYear()+""+("0" + (now.getMonth() + 1)).slice(-2)+""+("0"+now.getDate()).slice(-2));
	if (toUsePossDt < toDay) {
		alert('스탬프 발행기간 종료일은 현재시간 보다 과거일수 없습니다.');
		return;
	}
	
	// 금액 콤마 제거
	saveJson.condAmt = saveJson.condAmt.replace(/[^\d]+/g, "");
	saveJson.pointScore = saveJson.pointScore.replace(/[^\d]+/g, "");
	
	var mshipTypeCd_arr = new Array();
	if ($("#frmDetail #mshipTypeCd").is(":checked")) { // 임직원
		// saveJson.mshipTypeCd = '001';
		mshipTypeCd_arr.push("001");
	}
	if ($("#frmDetail #cprtCmpNo").val() != '') {	// 제휴
		mshipTypeCd_arr.push("002");
	}
	if ($("input:checkbox[name=applyMshpGradeCtnts]:checked").length) {	// 회원
		mshipTypeCd_arr.push("003");
	}
	
	if (mshipTypeCd_arr.length == 0) {
		alert('회원등급을 선택해 주세요.');
		return;
	}
	
	saveJson.mshipTypeCds = mshipTypeCd_arr;
	
	if (saveJson.bnfitCd == '002' && saveJson.coupnNo == '') {
		alert('쿠폰을 선택해 주세요.');
		return;
	}
	
	if (saveJson.bnfitCd == '001' && saveJson.pointScore == '') {
		alert('포인트를 입력해 주세요.');
		return;
	}
	
	console.log(saveJson);  // applyMshpGradeCtnts
	// return;
	if(valid) {
		Utilities.blockUI();
		var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
		Utilities.getAjax(url,saveJson,true,function(data,jqXHR){
			Utilities.unblockUI();
	        if(Utilities.processResult(data,jqXHR,"스탬프 등록 에 실패했습니다."))
	        {
	            alert("스탬프 등록이 완료되었습니다.");
	            search();
	            //console.log( Utilities.getTopWindow() );
	            location.reload();
	        }
	    });
	
	}else{
		
		alert("필수 항목들을 기입해 주세요.");
		return false;
	}
}

function addComma (strNum) {
	return strNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
}

function goPage (obj) {
	searchGodsRel(obj);
}

function changeSelect (obj) {
	console.log( $(obj));
}

function initData() {
	$('#frmDetail #validPerd').attr("disabled", true);
	$('#frmDetail #stmpMaxCnt').attr("disabled", true);
	$('#frmDetail #pointScore').attr("disabled", false);
	$('#frmDetail #stmpEventCd').attr("disabled", true);
	
	$('#deleteStmp').hide();
	$('#editStmp').hide();
	$('#insertStmp').show();
	
	Utilities.setChkboxData("applyMshpGradeCtnts", "MB020", "mCheckbox1", "");
	Utilities.setChkboxData("accumChl", "ST040", "mCheckbox1", "");
	
	// 제휴사 데이터 바인딩
	var url = "<c:url value='${urlPrefix}/getPartnerList${urlSuffix}'/>";
	Utilities.getAjax(url, null, true, function(data, jqXHR) {
		if (Utilities.processResult(data, jqXHR, "제휴사 데이터을 읽어오질 못했습니다.")) {
			$.each( data , function(i){
				$("#cprtCmpNo").append("<option value='"+ this.cprtCmpNo +"'>"+  this.cprtCmpNm +"</option>\n");
			});
		}
	});
	
	$('#frmDetail #stat').val('C');
	$('#frmDetail #stmpTypeCd').val('0');
	$('#frmDetail #validYn').val('N');
	$('#frmDetail #stmpMaxYn').val('Y');
	$('#frmDetail #condYn').val('N');
	$('#frmDetail #condAmt').val('0');
	//$('#frmDetail #bnfitCd').val('0');
}

function applyMShipGradeSetting(data){
	if(data != null){
		Utilities.mapToForm(data, "frmMain");
		Utilities.setChkboxData("applyMshpGradeCtnts", "MB020", "mCheckbox1", data.applyMshpGradeCtnts);
	}else{
		Utilities.mapToForm(data, "frmMain");
		Utilities.setChkboxData("applyMshpGradeCtnts", "MB020", "mCheckbox1", "");
	}
}

function accumChlSetting(data){
	if(data != null){
		Utilities.mapToForm(data, "frmMain");
		Utilities.setChkboxData("accumChl", "ST040", "mCheckbox1", data.accumChlTxn);
	}else{
		Utilities.mapToForm(data, "frmMain");
		Utilities.setChkboxData("accumChl", "ST040", "mCheckbox1", "");
	}
}

//스탬프
function popupTopStamp(){
	
	if( $("#frmDetail #mshipStmpBasNo").val() == "" ){
		//alert("스탬프 고유 번호가 없습니다6.");
		return false;
	}
	
	var url = "<c:url value='${urlPrefix}/stmpPopupManual${urlSuffix}'/>?mshipStmpBasNo="+$("#frmDetail #mshipStmpBasNo").val();
	Utilities.openModal(url,800,350);	
}

/* 프로모션 혜택 유형 선택 시 비활성화 처리 */
function changeDisable(){
	
	// 001 - 포인트, 002 - 쿠폰
	if($("#bnfitCd").val() == "001"){
		$("#coupnNo").val(null);
		$("#coupnNm").val("");
		$("#coupnNm").attr("disabled", true);
		$("#pointScore").attr("disabled", false);
	}else if($("#bnfitCd").val() == "002"){
		$("#pointScore").val(null);
		$("#pointScore").attr("disabled", true);
		$("#coupnNm").attr("disabled", false);
		$("#coupnNm").attr("readonly", true);
	}
}

$(document).ready(function() {
	
	/*데이터 초기화*/
	initData();
	
	/* tab */
	$(".jsTab2 li > a").on("click",function(){
		$(this).parent().parent().children().removeClass("active");
		$(this).parent().addClass("active");
		$(this).parent().parent().parent().parent().children(".tabCont").addClass("hidden");
		$( $(this).attr("href") ).removeClass("hidden");
		return false;
	});
	/* //tab */
 
	$("input[name=chkValidPerd]").on('click',function(){
		
		if ($(this).prop('checked')) {
            $('input[type="checkbox"][name="chkValidPerd"]').prop('checked', false);
            $(this).prop('checked', true);
        }
		
		$('#validPerd').attr("disabled", true);
		$('#frmDetail #validPerd').val(0);
		if ($('input[type="checkbox"][name="chkValidPerd"]:eq(1)').is(":checked")) {
			$('#validPerd').attr("disabled", false);
		}
		$('#validYn').val($(this).data('value'));
	});
	
	$("input[name=chkStmpMax]").on('click',function(){
		
		if ($(this).prop('checked')) {
            $('input[type="checkbox"][name="chkStmpMax"]').prop('checked', false);
            $(this).prop('checked', true);
        }
		
		$('#stmpMaxCnt').attr("disabled", true);
		$('#stmpMaxCnt').val("0");
		
		if ($('input[type="checkbox"][name="chkStmpMax"]:eq(1)').is(":checked")) {
			$('#stmpMaxCnt').attr("disabled", false);
		}
		
		$('#stmpMaxYn').val($(this).data('value'));
	});
	
	/* $("input[name=bnfitCdView]").on('click',function(){
		
		if ($(this).prop('checked')) {
            $('input[type="checkbox"][name="bnfitCdView"]').prop('checked', false);
            $(this).prop('checked', true);
        }
		
		if ($(this).data('value') == '0'){
			$('#pointScore').val('');
			$('#pointScore').attr("disabled", true);
			$('#coupnNm').attr("disabled", false);
		} else if ($(this).data('value') == '1') {
			$('#coupnNm').val('');
			$('#coupnNo').val('');
			$('#coupnNm').attr("disabled", true);
			$('#pointScore').attr("disabled", false);
		}
		// bnfitCd
		$('#bnfitCd').val($(this).data('value'));
	}); */

	$("#frmDetail #chkCondYn").on('click',function(){
		if ($(this).is(":checked")) {
			$("#condAmt").attr("disabled", false);
			$("#condYn").val("N");
		} else {
			$("#condAmt").attr("disabled", true);
			$("#condAmt").val("0");
			$("#condYn").val("Y");
		}
	});
	
	$("#frmDetail #stmpTypeCd").on('change',function (){
		$('#stmpEventCd').attr("disabled", true);
		$('#stmpEventCd').val(null);
		if ($(this).val() == '1') {
			$('#stmpEventCd').attr("disabled", false);
		}
	});
	
	$('#frmDetail #condAmt').on("keyup", function() {
        $(this).val(addComma($(this).val().replace(/[^0-9]/g,"")));
    });
	
	$('#frmDetail #condCnt').on("keyup", function() {
		$(this).val(addComma($(this).val().replace(/[^0-9]/g,"")));
    });
	
	$('#frmDetail #pointScore').on("keyup", function() {
        $(this).val(addComma($(this).val().replace(/[^0-9]/g,"")));
    });
	
	$('#frmDetail #orderAmt').on("keyup", function() {
        $(this).val(addComma($(this).val().replace(/[^0-9]/g,"")));
    });

	/* $("#frmGods #godsTypeCd1").on('change',function (){
		
	});
	
	$("#frmGods #godsTypeCd2").on('change',function (){
		
	});
	
	$("#frmGods #godsTypeCd3").on('change',function (){
		
	}); */
});

</script>
