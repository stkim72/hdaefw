<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<form role="form" id="frmMain">
<div id="wrapIframe">
	
    <div class="mGrid1 type3"> <!-- class="type3" => left:610px -->
        <!-- left -->
        <div class="gLeft">

            <!-- 고객정보 -->
            <div class="mBox1">
                <!-- title -->
                <div class="gTitle1">
                    <h3 class="mTitle1">프로모션 목록</h3>
                    <div class="gRt posT-5">
                        <a href="#" class="mBtn1 lWhite" data-auth-type="c" style="display:none" data-click="copyPromotion">복사</a>
                        <a href="#" class="mBtn1 lPrimary" data-auth-type="c" style="display:none" data-click="clearRegScreen">신규등록</a>
                    </div>
                </div>
                <!-- //title -->
                <!-- sort -->
                <div class="mSort2 mini pl0"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
                    <ul class="mr60"> <!-- class="mr60" => margin-right="60"-->
                        <li class="w45per">
                            <div class="tit w80">프로모션유형</div>
                            <div class="txt">
                                <code:commCode name="searchPromTypeCd" id="searchPromTypeCd" codeCd="PM100" prefixLabel="전체" prefixValue=""/>
                            </div>
                        </li>
                        <li class="w25per">
                            <div class="tit">상태</div>
                            <div class="txt">
                            	<code:commCode name="searchStatusCd" id="searchStatusCd" codeCd="PM110" prefixLabel="전체" prefixValue=""/>
                            </div>
                        </li>
                        <li class="w100per">
                            <div class="tit w80">프로모션명</div>
                            <div class="txt">
                                <input type="text" class="it" id="searchPromBasNm" name="searchPromBasNm" title="프로모션명">
                            </div>
                        </li>
                        <li class="w100per">
                            <div class="tit w80">시작일</div>
                            <div class="txt">
                                <div class="mDate1">
                                    <input class="it" type="text" data-type="dateRangeStart" data-range-end="searchPromEndYmd" id="searchPromStaYmd" name="searchPromStaYmd" data-enter="search" data-button="Y"/>
                                    <span class="bar">~</span>
                                    <input class="it" type="text" id="searchPromEndYmd" name="searchPromEndYmd" data-enter="search" data-button="Y"/>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <div class="button posRt posVm">
                        <!-- <a href="#" class="mBtn1">검색</a> -->
                        <button class="mBtn1" data-click="search">
                        	검색
                        </button>
                    </div>
                </div>
                <!-- //sort -->
                <!-- list -->
				<div id="divGrid"  style="height:650px" data-grid-id="grdList" 
				                                        data-pagenation="Y" 
				                                        data-get-url="<c:url value='/example/getList'/>" 
				                                        data-type="grid" 
				                                        data-grid-callback="onGridLoad" 
				                                        data-block-ui="Y"
				                                        data-tpl-url="<c:url value='/static/gridTemplate/mem/MB040.xml'/>"
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
        	<input type="hidden" id="mshipTypeCds" name="mshipTypeCds" value=""/>
            <!-- sort -->
            <div class="mSort2 medium"> <!-- class="medium" => 상하좌우 여백 좁은 사이즈-->
                <ul>
                    <li class="wAuto">
                        <div class="tit">프로모션 코드</div>
                        <div class="txt w160">
                            <input type="text" class="it" id="topmshipPromBasNo" name="topmshipPromBasNo" title="프로모션 코드" disabled="disabled">
                        </div>
                    </li>
                </ul>
            </div>
            <!-- //sort -->
            
            <!-- box -->
            <div class="mBox1">
                <div class="gTitle1 line">
                    <h3 class="mTitle1">기본정보</h3>
                    <div class="gRt">
                    	<a href="#" class="mBtn1 lPrimary" id="btnInsert">등록</a>
                        <a href="#" class="mBtn1 lGray" id="btnUpdate">수정</a>
                        <a href="#" class="mBtn1 lGray" id="btnDelete">삭제</a>
                    </div>
                </div>
                <!-- board -->
                <div class="mBoard2">
                    <table>
                        <caption>기본정보</caption>
                        <colgroup>
                            <col width="8%">
                            <col width="18%">
                            <col width="8%">
                            <col width="9%">
                            <col width="8%">
                            <col width="9%">
                            <col width="8%">
                            <col width="*">
                            <col width="8%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" class="left">프로모션 코드</th>
                                <td>
                                    <input type="text" class="it" id="mshipPromBasNo" name="mshipPromBasNo" title="프로모션 코드" placeholder="자동 채번" disabled="disabled">
                                </td>
                                <th scope="row" class="left">프로모션명</th>
                                <td colspan="5">
                                    <input type="text" class="it data-check" id="promBasNm" name="promBasNm" title="프로모션명">
                                </td>
                                <th scope="row" class="left">프로모션유형</th>
                                <td>
                                	<code:commCode className="select data-check" name="promTypeCd" id="promTypeCd" codeCd="PM100"  prefixLabel="전체" prefixValue=""/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="left">프로모션 기간</th> 
                                <td class="left">
                                    <div class="mDate1">
                                        <input class="it data-check" type="text" data-type="dateRangeStart" data-range-end="promEndYmd" id="promStaYmd" name="promStaYmd" data-enter="search" data-button="Y"/>
	                                    	<span class="bar">~</span>
	                                    <input class="it data-check" type="text" id="promEndYmd" name="promEndYmd" data-enter="search" data-button="Y"/>
                                    </div>
                                </td>
                                <th scope="row" class="left">프로모션 상태</th>
                                <td>
                                    <%-- <code:commCode name="statusCd" id="statusCd" codeCd="PM110" others="disabled"/> --%>
                                    <input type="hidden" name="statusCd" id="statusCd" value="">
                                    <input type="text" class="it" id="statusNm" name="statusNm" title="프로모션 상태" disabled="disabled">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
                
                <div class="gTitle1 line mt13">
                    <h3 class="mTitle1">프로모션 조건</h3>
                </div>
                <!-- board -->
                <div class="mBoard2">
                    <table>
                        <caption>프로모션 조건</caption>
                        <colgroup>
                            <col width="8%">
                            <col width="33%">
                            <col width="8%">
                            <col width="8%">
                            <col width="8%">
                            <col width="8%">
                            <col width="*">
                            <col width="8%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <%-- <th scope="row" class="left">총 주문금액</th>
                                <td class="left">
                                    <input type="text" class="it right w60 data-check comma" data-type="number2" id="fromApplySaleAmt" name="fromApplySaleAmt" title="총 주문금액">
                                    원
                                    <code:commCode className="select w80" name="fromApplySaleCondCd" id="fromApplySaleCondCd" codeCd="MB050"/>
                                    <span class="bar">~</span>
                                    <input type="text" class="it right w60 data-check comma" data-type="number2" id="toApplySaleAmt" name="toApplySaleAmt" title="총 주문금액">
                                    원
                                    <code:commCode className="select w80" name="toApplySaleCondCd" id="toApplySaleCondCd" codeCd="MB060"/>
                                </td> --%>
                                <th scope="row" class="left" colspan="1" rowspan="2">총 주문금액</th>
                                <td class="left" rowspan="2">
                                    <input type="text" class="it right w60 data-check comma" data-type="number2" id="fromApplySaleAmt" name="fromApplySaleAmt" title="총 주문금액">
                                    원
                                    <code:commCode className="select w80" name="fromApplySaleCondCd" id="fromApplySaleCondCd" codeCd="MB050"/>
                                    <span class="bar">~</span>
                                    <input type="text" class="it right w60 data-check comma" data-type="number2" id="toApplySaleAmt" name="toApplySaleAmt" title="총 주문금액">
                                    원
                                    <code:commCode className="select w80" name="toApplySaleCondCd" id="toApplySaleCondCd" codeCd="MB060"/>
                                </td>
                                <th scope="row" class="left" colspan="1" rowspan="2">적용회원등급</th>
                                <td colspan="6" class="left">
				                    <span id="applyMshpGradeCtnts"></span>
				                </td>
                            </tr>
                            <tr>
                                <%-- <th scope="row" class="left">실 결제금액</th>
                                <td class="left">
                                    <input type="text" class="it right w60 data-check comma" data-type="number2" id="fromApplyPayAmt" name="fromApplyPayAmt" title="실 결제금액">
                                    원
                                    <code:commCode className="select w80" name="fromApplyPayCondCd" id="fromApplyPayCondCd" codeCd="MB050"/>
                                    <span class="bar">~</span> 
                                    <input type="text" class="it right w60 data-check comma" data-type="number2" id="toApplyPayAmt" name="toApplyPayAmt" title="실 결제금액">
                                    원
                                    <code:commCode className="select w80" name="toApplyPayCondCd" id="toApplyPayCondCd" codeCd="MB060"/>
                                </td> --%>
                                <td colspan="6" class="left">
				                    <label class="mCheckbox1">
										<input type="checkbox" title="임직원" id="mshipTypeCd" name="mshipTypeCd">	<!-- applyMshipGradeCd1 -->
										<span class="label">임직원</span>
									</label>
									<select class="select w130 mshipGrp" name="cprtCmpNo" id="cprtCmpNo">
                                    	<option value="">제휴사 선택</option>
                                    </select>
				                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
                
                <div class="gTitle1 line mt13">
                    <h3 class="mTitle1">프로모션 혜택</h3>
                </div>
                <!-- board -->
                <div class="mBoard2">
                    <table>
                        <caption>프로모션 혜택</caption>
                        <colgroup>
                            <col width="8%">
                            <col width="16%">
                            <col width="8%">
                            <col width="*">
                            <col width="8%">
                            <col width="*">
                            <col width="8%">
                            <col width="13%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" class="left">혜택 유형</th>
                                <td>
                                    <code:commCode name="applyBnfitCd" id="applyBnfitCd" codeCd="PM120" change="changeDisable"/>
                                </td>
                                <th scope="row" class="left">적용포인트</th>
                                <td class="left">
                                    <input type="text" class="it right w80 comma" data-type="number2" id="applyPointScore" name="applyPointScore" title="적용포인트"> Point
                                </td>
                                <th scope="row" class="left">적용쿠폰</th>
                                <td class="left">
                                	<div class="mFlex2">
                                        <span class="flex">
                                            <input type="hidden" class="it" title="쿠폰" id="prvCoupnBasNo" name="prvCoupnBasNo">
                                            <input type="text" class="it" title="쿠폰" id="coupnNm" disabled="disabled">
                                        </span>
                                        <a href="javascript:searchCoupn()" class="mBtn1 m lWhite" id="searchCpn" >검색</a>
                                    </div>
                                </td>
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
			        <!-- <li><a href="#jsTabCont1_1">적용채널</a></li> -->
			        <li class="active"><a href="#jsTabCont1_2">적용매장</a></li>
			        <li><a href="#jsTabCont1_3">적용상품</a></li>
			        <li><a href="#jsTabCont1_4">BOS주문현황</a></li>
			        <li><a href="#jsTabCont1_7">POS주문현황</a></li>
			        <li><a href="#jsTabCont1_5">포인트현황</a></li>
			        <li><a href="#jsTabCont1_6">쿠폰현황</a></li>
			    </ul>
			</div>
			<!-- //tab -->
			<!-- 적용채널은 매장채널 사용 -->
			<div id="jsTabCont1_1" class="mBox1 p10 tabCont hidden">
			
				<!-- box -->
				<form name="frmChl" id="frmChl" onsubmit="searchChlRel();return false;">
				
					<input type="hidden" name="mshipPromBasNo" id="mshipPromBasNo" value="${cpinfo.mshipPromBasNo}">
					
					<!-- sort -->
					<div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
						<ul>
						    <li class="wAuto ml35">
						        <div class="tit">채널</div>
						        <div class="txt">
						              <code:commCode  className="select" id="applyChlCd" name="applyChlCd" codeCd="ST040" prefixLabel="선택" prefixValue=""/>
						        </div>
						    </li>
						    <li class="wAuto ml35">
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
							<span data-auth-type="c" style="display:none"  ><a href="#" data-grid-id="grdChlList" data-disp-name="" data-click="saveChlPop" id="btnSaveChl" class="mBtn1 m lWhite" style="cursor: pointer;">관리</a></span>
					    </div>
					</div>
				
				</form>
				<!-- //sort -->
			
				<div id="divChl" style="height:380px"
				data-post="Y"
				data-grid-id="grdChlList"
				data-pagenation="Y"
				data-get-url="<c:url value='/promotionList/getChlRelList'/>"
				data-type="grid" 
				data-tpl-url="<c:url value='/static/gridTemplate/mem/MB047.xml'/>"
				  >
				</div>
			 <!-- //box -->  
			</div>
			
			<div id="jsTabCont1_2" class="mBox1 p10 tabCont ">
                     
				<!-- box -->
				<form name="frmStore" id="frmStore" onsubmit="searchStoreRel();return false;">

					<input type="hidden" name="mshipPromBasNo" id="mshipPromBasNo" value="${cpinfo.mshipPromBasNo}">
	
					<!-- sort -->
					<div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
						<ul>
						    <li class="wAuto ml35">
						        <div class="tit">지역</div>
						        <div class="txt">
						            <code:commCode  className="select" id="distrctCd" name="distrctCd" codeCd="CU100" prefixLabel="선택" prefixValue=""/>
						    	</div>
							</li>
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
							<span data-auth-type="c" style="display:none"  ><a href="#" data-grid-id="grdShopList" data-disp-name="" data-click="saveStorePop" id="btnSaveStore" class="mBtn1 m lWhite" style="cursor: pointer;">관리</a></span>
						</div>
					</div>

				</form>
				<!-- //sort -->

				<div id="divShop" style="height:380px"
				data-post="Y"
				data-grid-id="grdShopList"
				data-pagenation="Y"
				data-get-url="<c:url value='/promotionList/getList'/>"
				data-type="grid" 
				data-tpl-url="<c:url value='/static/gridTemplate/mem/MB043.xml'/>"
				  >
				</div>
				<!-- //box -->
			</div>

			<div id="jsTabCont1_3" class="mBox1 p10 tabCont hidden">
				<!-- box -->
				<form name="frmGods" id="frmGods" onsubmit="searchGodsRel();return false;">
				
					<input type="hidden" name="mshipPromBasNo" id="mshipPromBasNo" value="${cpinfo.mshipPromBasNo}">
					
					<!-- sort -->
					<div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
						<ul>
						    <li class="wAuto ml35">
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
							<span data-auth-type="c" style="display:none"  ><a href="#" data-grid-id="grdGods" data-disp-name="" data-click="saveGodsPop" id="btnSaveGodsDetail" class="mBtn1 m lWhite" style="cursor: pointer;">관리</a></span>
					    </div>
					</div>
				
				</form>
				<!-- //sort -->

				<div id="divGods" style="height:380px"
				data-post="Y"
				data-grid-id="grdGodsList"
				data-pagenation="Y"
				data-get-url="<c:url value='/promotionList/getGodsRelList'/>"
				data-type="grid" 
				data-tpl-url="<c:url value='/static/gridTemplate/mem/MB045.xml'/>"
				  >
				</div>
        
            <!-- //box -->
			</div>

			<div id="jsTabCont1_4" class="mBox1 p10 tabCont hidden">
				<!-- box -->
				<form name="frmOrder" id="frmOrder" onsubmit="searchBosOrderRel();return false;">
				
					<%-- <input type="hidden" name="mshipPromBasNo" id="mshipPromBasNo" value="${cpinfo.mshipPromBasNo}"> --%>
					<%-- <input type="hidden" name="prvCoupnBasNo" id="prvCoupnBasNo" value="${cpinfo.prvCoupnBasNo}"> --%>
					
					<!-- sort -->
					<div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
						<ul>
						    <!-- <li class="wAuto ml35">
                                <div class="tit">거래일</div>
	                            <div class="txt">
	                                <div class="mDate1">
	                                    <input class="it" type="text" data-type="dateRangeStart" data-range-end="orderEndYmd" id="orderStaYmd" name="orderStaYmd" data-enter="search" data-button="Y"/>
	                                    <span class="bar">~</span>
	                                    <input class="it" type="text" id="orderEndYmd" name="orderEndYmd" data-enter="search" data-button="Y"/>
	                                </div>
	                            </div>
						    </li> -->
						
						    <li class="wAuto ml35">
						        <div class="tit">상품명</div>
						        <div class="txt">
						             <input type="text" class="it" name="godsNm" id="godsNm" value=""/>
						        </div>
						        <div class="tit">통합고객번호</div>
						        <div class="txt">
						             <input type="text" class="it" name="itgCustNo" id="itgCustNo" value=""/>
						        </div>
						        
						        <span class="button">
						            <button type="submit" class="mBtn1 btnSubmit"  data-file-info="button" data-click="searchBosOrderRel" >검색</a>
						        </span>
						    </li>
						</ul>
					</div>
				
				</form>
				<!-- //sort -->

				<div id="divOrder" style="height:380px"
					data-post="Y"
					data-grid-id="grdBosOrderList"
					data-pagenation="Y"
					data-scroll-x="Y" 
					data-get-url="<c:url value='/promotionList/getOrderList'/>"
					data-type="grid" 
					data-block-ui="Y"
					data-tpl-url="<c:url value='/static/gridTemplate/mem/MB049.xml'/>"
				  >
				</div>
        
            <!-- //box -->
			</div>
			
			<div id="jsTabCont1_7" class="mBox1 p10 tabCont hidden">
				<!-- box -->
				<form name="frmOrder2" id="frmOrder2" onsubmit="searchPosOrderRel();return false;">
					
					<!-- sort -->
					<div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
						<ul>
						
						    <li class="wAuto ml35">
						        <div class="tit">상품명</div>
						        <div class="txt">
						             <input type="text" class="it" name="godsNm" id="godsNm" value=""/>
						        </div>
						        <div class="tit">통합고객번호</div>
						        <div class="txt">
						             <input type="text" class="it" name="itgCustNo" id="itgCustNo" value=""/>
						        </div>
						        
						        <span class="button">
						            <button type="submit" class="mBtn1 btnSubmit"  data-file-info="button" data-click="searchPosOrderRel" >검색</a>
						        </span>
						    </li>
						</ul>
					</div>
				
				</form>
				<!-- //sort -->

				<div id="divOrder" style="height:380px"
					data-post="Y"
					data-grid-id="grdPosOrderList"
					data-pagenation="Y"
					data-scroll-x="Y" 
					data-get-url="<c:url value='/promotionList/getOrderList'/>"
					data-type="grid" 
					data-block-ui="Y"
					data-tpl-url="<c:url value='/static/gridTemplate/mem/MB049_1.xml'/>"
				  >
				</div>
        
            <!-- //box -->
			</div>
			
			<div id="jsTabCont1_5" class="mBox1 p10 tabCont hidden">
				<!-- box -->
				<form name="frmPoint" id="frmPoint" onsubmit="searchPointRel();return false;">
				
					<input type="hidden" name="mshipPromBasNo" id="mshipPromBasNo" value="${cpinfo.mshipPromBasNo}">
					
					<!-- sort -->
					<div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
						<ul>
						    <li class="wAuto ml35">
                                <div class="tit">기간</div>
	                            <div class="txt">
	                                <div class="mDate1">
	                                    <input class="it" type="text" data-type="dateRangeStart" data-range-end="pointEndYmd" id="pointStaYmd" name="pointStaYmd" data-enter="search" data-button="Y"/>
	                                    <span class="bar">~</span>
	                                    <input class="it" type="text" id="pointEndYmd" name="pointEndYmd" data-enter="search" data-button="Y"/>
	                                </div>
	                            </div>
						    </li>
						
						    <li class="wAuto ml35">
						        <div class="tit">사용구분</div>
						        <div class="txt">
						             <code:commCode name="useTypeCd" id="useTypeCd" codeCd="PO010" prefixLabel="전체" prefixValue=""/>
						        </div>
						        
						        <span class="button">
						            <button type="submit" class="mBtn1 btnSubmit"  data-file-info="button" data-click="searchPointRel" >검색</a>
						        </span>
						    </li>
						</ul>
					</div>
				
				</form>
				<!-- //sort -->

				<div id="divPoint" style="height:380px"
				data-post="Y"
				data-grid-id="grdPointList"
				data-pagenation="Y"
				data-scroll-x="Y"
				data-get-url="<c:url value='/promotionList/getPointList'/>"
				data-type="grid" 
				data-tpl-url="<c:url value='/static/gridTemplate/mem/MB050.xml'/>"
				  >
				</div>
        
            <!-- //box -->
			</div>
 			
 			<div id="jsTabCont1_6" class="mBox1 p10 tabCont hidden">
				<!-- box -->
				<form name="frmCoupn" id="frmCoupn" onsubmit="searchCoupnRel();return false;">
				
					<input type="hidden" name="mshipPromBasNo" id="mshipPromBasNo" value="${cpinfo.mshipPromBasNo}">
					
					<!-- sort -->
					<div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
						<ul>
						    <li class="wAuto ml35">
                                <div class="tit">기간</div>
	                            <div class="txt">
	                                <div class="mDate1">
	                                    <input class="it" type="text" data-type="dateRangeStart" data-range-end="coupnEndYmd" id="coupnStaYmd" name="coupnStaYmd" data-enter="search" data-button="Y"/>
	                                    <span class="bar">~</span>
	                                    <input class="it" type="text" id="coupnEndYmd" name="coupnEndYmd" data-enter="search" data-button="Y"/>
	                                </div>
	                            </div>
						    </li>
						
						    <li class="wAuto ml35">
						        <div class="tit">사용구분</div>
						        <div class="txt">
						             <code:commCode name="useDivCd" id="useDivCd" codeCd="PO010" prefixLabel="전체" prefixValue=""/>
						        </div>
						        
						        <span class="button">
						            <button type="submit" class="mBtn1 btnSubmit"  data-file-info="button" data-click="searchCoupnRel" >검색</a>
						        </span>
						    </li>
						</ul>
					</div>
				
				</form>
				<!-- //sort -->

				<div id="divCoupn" style="height:380px"
				data-post="Y"
				data-grid-id="grdCoupnList"
				data-pagenation="Y"
				data-get-url="<c:url value='/promotionList/grdCoupnList'/>"
				data-type="grid" 
				data-tpl-url="<c:url value='/static/gridTemplate/mem/MB052.xml'/>"
				  >
				</div>
        
            <!-- //box -->
			</div>
			
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
					  data-tpl-url="<c:url value='/static/gridTemplate/memship/crmMshipStampCpnBas.xml'/>"
					  >
					</div>
					
		    
		</div>
		<!-- //layer -->
</form>

<script>

/* 화면 로드 */
window.onload = function(){
	$("#btnInsert").hide();
	$("#btnUpdate").hide();
	$("#btnDelete").hide();
	
	Utilities.setChkboxData("applyMshpGradeCtnts", "MB020", "mCheckbox1", "");
	
	// 제휴사 데이터 바인딩
	var url = "<c:url value='${urlPrefix}/getPartnerList${urlSuffix}'/>";
	Utilities.getAjax(url, null, true, function(data, jqXHR) {
		if (Utilities.processResult(data, jqXHR, "제휴사 데이터을 읽어오질 못했습니다.")) {
		
			$.each( data , function(i){
				$("#cprtCmpNo").append("<option value='"+ this.cprtCmpNo +"' "+  (("${cpinfo.cprtCmpNo}" == this.cprtCmpNo) ? 'selected' : '' ) +">"+  this.cprtCmpNm +"</option>\n");
			});
			
		}
	});
}

/* 복사 버튼 클릭 */
function copyPromotion(){
	var saveJson = grdList.getCheckedJson();

	if (saveJson.length == 0) {
		alert("복사할 프로모션을 선택해주세요.");
		return;
	}
	
	if( saveJson.length > 1){
		alert("복사할 프로모션 1건만 선택해 주세요.");
		return;
	}
	
	if (saveJson.length) {
		if (!confirm("프로모션 코드는 자동으로 생성됩니다. \n\n선택된 프로모션을 복사하시겠습니까?"))
			return;
		
		var url = "<c:url value='${urlPrefix}/copy${urlSuffix}'/>";
		Utilities.getAjax(url, saveJson[0], true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "프로모션 복사에 실패했습니다.")) {
				alert("프로모션 복사가 완료되었습니다.");
				search();
			}
		});
	} else {
		alert("선택된 데이터가 없습니다.");
	}
	
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

/* 신규등록 버튼 클릭 */
function clearRegScreen(){
    $("#btnInsert").show();
    $("#btnUpdate").hide();
    $("#btnDelete").hide();
    
    /* 콤보박스는 0번째 index 값으로 초기화 */
    $("#topmshipPromBasNo").val("");
    $("#mshipPromBasNo").val("");
    $("#promBasNm").val("");
    $("#promTypeCd").val("");
    $("#promStaYmd").val("");
    $("#promEndYmd").val("");
    $("#statusCd").val("001");
    $("#fromApplySaleAmt").val("");
    //$("#fromApplySaleCondCd").val("");
    $("#toApplySaleAmt").val("");
    //$("#toApplySaleCondCd").val("");
    applyMShipGradeSetting(null);
    $("#applyMshpGradeCtnts").val("");
    $("#fromApplyPayAmt").val("");
    //$("#fromApplyPayCondCd").val("");
    $("#toApplyPayAmt").val("");
    //$("#toApplyPayCondCd").val("");
    $("#applyMshipGradeCd1").val("");
    $("#cprtCmpNo").val("");
    //$("#applyBnfitCd").val("");
    $("#applyPointScore").val("");
    $("#prvCoupnBasNo").val("");
    $("#coupnNm").val("");
    
    $("form#frmChl").find("#mshipPromBasNo").val("");
    $("form#frmStore").find("#mshipPromBasNo").val("");
    $("form#frmGods").find("#mshipPromBasNo").val("");
    //$("form#frmOrder").find("#prvCoupnBasNo").val("");
    $("form#frmPoint").find("#mshipPromBasNo").val("");
    $("form#frmCoupn").find("#mshipPromBasNo").val("");
    
    grdChlList.clear();
    grdShopList.clear();
    grdGodsList.clear();
    grdBosOrderList.clear();
    grdPointList.clear();
    grdCoupnList.clear();
}

/* 등록 버튼 클릭 */
$("#btnInsert").click(function(){
	
	var valid = validateForm("#frmMain"); //  class='data-check' 인 경우만 체크
	if(!valid) {
		alert("필수 항목들을 기입해 주세요.");
		return;
	}
	
	if($("#applyBnfitCd").val() == "001" && $("#applyPointScore").val() == ""){ // 포인트
		alert("적용포인트를 입력해주세요.");
		return;
	}else if($("#applyBnfitCd").val() == "002" && $("#coupnNm").val() == ""){ // 쿠폰
		alert("적용쿠폰을 선택해주세요.");
		return;
	}
	
	if(!checkDate()){
		return;
	}
	
	var bConfirm = confirm("등록하시겠습니까?");
	if(!bConfirm){
		return;
	}
	
	fnMinusComma();
	var param = Utilities.formToMap("frmMain");
	
	param.stat="C";
	
	var mshipTypeCd_arr = new Array();
	if ($("#frmMain #mshipTypeCd").is(":checked")) { // 임직원
		mshipTypeCd_arr.push("001");
	}
	if ($("#frmMain #cprtCmpNo").val() != '') {	// 제휴
		mshipTypeCd_arr.push("002");
	}
	if ($("input:checkbox[name=applyMshpGradeCtnts]:checked").length) {	// 회원
		mshipTypeCd_arr.push("003");
	}
	param.mshipTypeCds = mshipTypeCd_arr;
	console.log(param);
	// return ;
	var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
	Utilities.getAjax(url,param,true,function(data,jqXHR){
		if(Utilities.processResult(data,jqXHR,"등록에 실패했습니다."))
		{
			alert("등록에 성공했습니다.");
			search();
		}
	});
	
	fnAddComma();
});

/* 수정 버튼 클릭 */
$("#btnUpdate").click(function(){
	
	var valid = validateForm("#frmMain"); //  class='data-check' 인 경우만 체크
	if(!valid) {
		alert("필수 항목들을 기입해 주세요.");
		return;
	}
	
	if($("#applyBnfitCd").val() == "001" && $("#applyPointScore").val() == ""){ // 포인트
		alert("적용포인트를 입력해주세요.");
		return;
	}else if($("#applyBnfitCd").val() == "002" && $("#coupnNm").val() == ""){ // 쿠폰
		alert("적용쿠폰을 선택해주세요.");
		return;
	}
	
	if(!checkDate()){
		return;
	}
	
	var bConfirm = confirm("수정하시겠습니까?");
	if(!bConfirm){
		return;
	}
	
	fnMinusComma();
	var param = Utilities.formToMap("frmMain");
	
	param.stat="U";
	
	var mshipTypeCd_arr = new Array();
	if ($("#frmMain #mshipTypeCd").is(":checked")) { // 임직원
		mshipTypeCd_arr.push("001");
	}
	if ($("#frmMain #cprtCmpNo").val() != '') {	// 제휴
		mshipTypeCd_arr.push("002");
	}
	if ($("input:checkbox[name=applyMshpGradeCtnts]:checked").length) {	// 회원
		mshipTypeCd_arr.push("003");
	}
	param.mshipTypeCds = mshipTypeCd_arr;
	console.log(param);
	// return ;
	
	var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
	Utilities.getAjax(url,param,true,function(data,jqXHR){
		if(Utilities.processResult(data,jqXHR,"수정에 실패했습니다."))
		{
			alert("수정에 성공했습니다.");
			search();
		}
	});
	
	fnAddComma();
});

/* 삭제 버튼 클릭 */
$("#btnDelete").click(function(){
	
	if($("#mshipPromBasNo").val() == ""){
		alert("삭제할 프로모션을 선택해주세요.");
		return;
	}
	
	var bConfirm = confirm("삭제하시겠습니까?");
	if(!bConfirm){
		return;
	}
	
	fnMinusComma();
	var param = Utilities.formToMap("frmMain");
	
	param.stat="D";
	
	var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
	Utilities.getAjax(url,param,true,function(data,jqXHR){
		if(Utilities.processResult(data,jqXHR,"삭제에 실패했습니다."))
		{
			alert("삭제에 성공했습니다.");
			search();
		}
	});
	
	fnAddComma();
});

/* 프로모션 목록 조회 */
function search(){
    var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmMain");
    grdList.loadUrl(url,param);
}

/* 그리드 로드 */
function grdList_load(gridView,gridId){
    search();
}

/* 그리드 셀 클릭 */
function grdList_cellClick(gridView, itemIndex, column, index, field){
	grdBosOrderList.clear();
	grdPosOrderList.clear();
	var objJson = gridView.getCurrentJson();
	dataSetting(objJson);
}

/* 그리드 셀 체크 */
function grdList_checked(grid, rowKey, row, checked){
	grdBosOrderList.clear();
	grdPosOrderList.clear();
	var objJson = grid.getCurrentJson();
	dataSetting(objJson);
}

/* 그리드 데이터를 우측 필드에 세팅 */
function dataSetting(objJson){
 	$("#btnInsert").hide();
	$("#btnUpdate").show();
	$("#btnDelete").show();
	
	applyMShipGradeSetting(objJson);
	$("#coupnNm").val(objJson.coupnBasNm);
	
	fnAddComma();
	
	$("form#frmChl").find("#mshipPromBasNo").val($("#mshipPromBasNo").val());
	$("form#frmStore").find("#mshipPromBasNo").val($("#mshipPromBasNo").val());
	$("form#frmGods").find("#mshipPromBasNo").val($("#mshipPromBasNo").val());
	//$("form#frmOrder").find("#prvCoupnBasNo").val($("#prvCoupnBasNo").val());
	$("form#frmPoint").find("#mshipPromBasNo").val($("#mshipPromBasNo").val());
	$("form#frmCoupn").find("#mshipPromBasNo").val($("#mshipPromBasNo").val());
	searchStoreRel();
	searchGodsRel();
	// searchBosOrderRel();
	searchPointRel();
	searchCoupnRel();
	
	$("#topmshipPromBasNo").val(objJson.mshipPromBasNo);
	
	$('#mshipTypeCd').prop("checked",false);
	var mshipType = objJson.mshipTypeCds.split(",");
	for(var i = 0;i<mshipType.length;i++){
		if (mshipType[i] == '001') {
			$('#mshipTypeCd').prop("checked",true);
		} 
	}
}

/* 적용쿠폰 버튼 클릭 */
function searchCoupn() {
	
	/* var isCpn = false;
	$.each( $("input[name='bnfitCdView']"), function(i){
		if( $(this).is(":checked") && $(this).data('value')=='0'){
			isCpn = true;
		}
     });
	
	if (!isCpn) {
		alert('쿠폰체크 시에만 검색창이 노출 됩니다. ');
		return;
	} */

	if($("#applyBnfitCd").val() == "001"){
		alert("혜택 유형이 포인트로 설정되어 있습니다.");
		return;
	}
	searchCoupon();
	$('.mLayer1').show();
}

/* 적용쿠폰 팝업 닫기 클릭 */
function closePop() {
	$('.mLayer1').hide();
}

/* 적용쿠폰 팝업 검색 버튼 클릭 */
function searchCoupon () {
	
	var searchJson = new Object();
	searchJson.coupnBasNm = $('#cpnNm').val();
	searchJson.mshipCoupnBasNo = $('#cpnCode').val();
	searchJson.useYn = "Y";
	
	var url = "<c:url value='crmMshipStampBas/searchCpn${urlSuffix}'/>";
	searchJson.recordCountPerPage = 20;
	grdListCpn.loadUrl(url, searchJson);
}

/* function grdListCpn_rowChanged(grdList, oldRow, newRow, rowData) {
	$('#coupnNm').val(rowData.coupnBasNm);
	$('#prvCoupnBasNo').val(rowData.mshipCoupnBasNo);
	$('.mLayer1').hide();
} */

/* 쿠폰조회 팝업에서 선택 버튼 클릭 시 */
function selectCpn(){
	var data = grdListCpn.getCurrentJson();
	$('#coupnNm').val(data.coupnBasNm);
	$('#prvCoupnBasNo').val(data.mshipCoupnBasNo);
	$('.mLayer1').hide();
}

/* 쿠폰조회 그리드 셀 클릭 시 라디오 체크 */
function onGridCellClick(gridView, rowIndex, columnName, colIndex, fieldIndex) {
	$(".tui-grid-cell-current-row").find("input:radio[name='rdo_grdListCpn']").prop('checked', true);
}

/* 공통코드 그리드 load */
function grdChlList_load(gridView, gridId) {
	if( "${cpinfo.mshipPromBasNo}" != "") searchChlRel();  // 적용채널 검색
}

/* 공통코드 그리드 load */
function grdShopList_load(gridView, gridId) {	
	if( "${cpinfo.mshipPromBasNo}" != "") searchStoreRel(); // 적용매장 검색
}
/* 공통코드 그리드 load */
function grdGodsList_load(gridView, gridId) {
	if( "${cpinfo.mshipPromBasNo}" != "") searchGodsRel();  // 적용상품 검색
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

/* 주문현황 검색 */
function searchBosOrderRel() {
	
	var strMshipPromBasNo = $("form#frmMain").find("#mshipPromBasNo").val();
	if(strMshipPromBasNo == ""){
		alert('프로모션을 선택해주세요.');
		return;
	}
	
	var url = "<c:url value='${urlPrefix}/getBosOrderList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmMain");
    var ord = Utilities.formToMap("frmOrder");
    param.godsNm = ord.godsNm;
    param.itgCustNo = ord.itgCustNo;
    param.orderEndYmd = ord.orderEndYmd;
    param.orderStaYmd = ord.orderStaYmd;
    grdBosOrderList.loadUrl(url,param);
}

function searchPosOrderRel() {
	
	var strMshipPromBasNo = $("form#frmMain").find("#mshipPromBasNo").val();
	if(strMshipPromBasNo == ""){
		alert('프로모션을 선택해주세요.');
		return;
	}
	
	var url = "<c:url value='${urlPrefix}/getPosOrderList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmMain");
    var ord = Utilities.formToMap("frmOrder2");
    param.godsNm = ord.godsNm;
    param.itgCustNo = ord.itgCustNo;
    param.orderEndYmd = ord.orderEndYmd;
    param.orderStaYmd = ord.orderStaYmd;
    grdPosOrderList.loadUrl(url,param);
}
/* 포인트현황 검색 */
function searchPointRel() {
	var url = "<c:url value='${urlPrefix}/getPointList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmPoint");
    grdPointList.loadUrl(url,param);
}

/* 쿠폰현황 검색 */
function searchCoupnRel() {
	var url = "<c:url value='${urlPrefix}/getCoupnList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmCoupn");
    grdCoupnList.loadUrl(url,param);
}

/* 적용채널 관리 버튼 클릭 */
function saveChlPop(){
	var strMshipPromBasNo = $("form#frmChl").find("#mshipPromBasNo").val();
	if(strMshipPromBasNo == ""){
		alert('프로모션을 선택해주세요.');
		return;
	}
	
	var url = "<c:url value='${urlPrefix}/popChl${urlSuffix}'/>?mshipPromBasNo=" + strMshipPromBasNo;
	Utilities.openModal(url, "1000", "800");
}

/* 적용매장 관리 버튼 클릭 */
function saveStorePop(){
	var strMshipPromBasNo = $("form#frmStore").find("#mshipPromBasNo").val();
	if(strMshipPromBasNo == ""){
		alert('프로모션을 선택해주세요.');
		return;
	}
	
	var url = "<c:url value='${urlPrefix}/popStore${urlSuffix}'/>?mshipPromBasNo=" + strMshipPromBasNo;
	Utilities.openModal(url, "1200", "800");
}

/* 적용상품 관리 버튼 클릭 */3
function saveGodsPop(){
	var strMshipPromBasNo = $("form#frmGods").find("#mshipPromBasNo").val();
	if(strMshipPromBasNo == ""){
		alert('프로모션을 선택해주세요.');
		return;
	}
	
	var url = "<c:url value='${urlPrefix}/popGods${urlSuffix}'/>?mshipPromBasNo=" + strMshipPromBasNo;
	Utilities.openModal(url, "1000", "800");
}

/* 금액필드 comma 추가 */
function fnAddComma(){
	$("#fromApplySaleAmt").val(addComma($("#fromApplySaleAmt").val()));
	$("#toApplySaleAmt").val(addComma($("#toApplySaleAmt").val()));
	$("#fromApplyPayAmt").val(addComma($("#fromApplyPayAmt").val()));
	$("#toApplyPayAmt").val(addComma($("#toApplyPayAmt").val()));
	$("#applyPointScore").val(addComma($("#applyPointScore").val()));
}

/* 금액필드 comma 삭제 */
function fnMinusComma(){
	$("#fromApplySaleAmt").val(minusComma($("#fromApplySaleAmt").val()));
	$("#toApplySaleAmt").val(minusComma($("#toApplySaleAmt").val()));
	$("#fromApplyPayAmt").val(minusComma($("#fromApplyPayAmt").val()));
	$("#toApplyPayAmt").val(minusComma($("#toApplyPayAmt").val()));
	$("#applyPointScore").val(minusComma($("#applyPointScore").val()));
}

/* 그리드 키보드로 이동 시 조회 */
function grdList_rowChanged(grdList, oldRow, newRow, rowData) {
	dataSetting(rowData);
}

/* 프로모션 기간 체크 */
function checkDate(){
	
	if($("#promStaYmd").val() > $("#promEndYmd").val()){
		alert("프로모션 종료일이 시작일보다 빠른수 없습니다.");
		return false;
	}
	
	return true;
}

/* 프로모션 혜택 유형 선택 시 비활성화 처리 */
function changeDisable(){
	
	// 001 - 포인트, 002 - 쿠폰
	if($("#applyBnfitCd").val() == "001"){
		$("#prvCoupnBasNo").val("");
		$("#coupnNm").val("");
		$("#coupnNm").attr("disabled", true);
		$("#applyPointScore").attr("disabled", false);
	}else if($("#applyBnfitCd").val() == "002"){
		$("#applyPointScore").val("");
		$("#applyPointScore").attr("disabled", true);
		$("#coupnNm").attr("disabled", false);
		$("#coupnNm").attr("readonly", true);
	}
}

</script>