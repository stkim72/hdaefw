<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="mSort2 medium"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
	<ul>
		<li class="wAuto ml20">
			<div class="tit">추출방법</div>
			<div class="txt">
				<code:commCode name="extType" id="extType" codeCd="GR010" />
			</div>
		</li>
	</ul>
</div>

<!-- VQ -->
<div id="divVQ" class="mBox1 p10"> 
	<div class="mTab1 type2 jsTab2">
		<ul>
			<li class="active"><a href="#custMasterInput">고객마스터</a></li>
			<li><a href="#contactHisInput">접촉이력</a></li>
			<li><a href="#dealHisInput">거래이력</a></li>
		</ul>
	</div>
	
	<!-- 고객마스터 -->
	<div id="custMasterInput" class="scroll mCustomScrollbar tabCont">
		<div class="gTitle1 line">
		    <h3 class="mTitle1">기본정보</h3>
		</div>
		<!-- board -->
		<form role="form" id="custMasterCondInfoForm">
		<div class="mBoard2">
		    <table>
		        <caption>기본정보</caption>
		        <colgroup>
		            <col width="6%">
		            <col width="*">
		            <col width="6%">
		            <col width="*">
		            <col width="6%">
		            <col width="*">
		        </colgroup>
		        <tbody>
		            <tr>
		                <th scope="row">생년월일</th>
		                <td class="left">
		                    <input class="it w70" type="text" data-type="dateRangeStart" data-range-end="birthdayEnd" id="birthdaySta" name="birthdaySta" data-button="Y"/> ~ 
							<input class="it w70" type="text" id="birthdayEnd" name="birthdayEnd" data-button="Y"/>
		                    
		                </td>
		                <th scope="row">연령대</th>
		                <td class="left">
		                	<code:commCode name="ageStt" codeCd="S100" className="select wAuto" prefixLabel="연령대" />
		                    ~
		                    <code:commCode name="ageEnd" codeCd="S100" className="select wAuto" prefixLabel="연령대" />
		                    
		                </td>
		                <th scope="row">성별</th>
		                <td class="left">
		                    <code:commCode name="gndrCd" codeCd="S040" className="select wAuto" prefixLabel="성별" />
		                </td>
		            </tr>
		            <tr>
		                <th scope="row">고객상태</th>
		                <td class="left">
		                    <code:commCode name="custStatusCd" codeCd="CU020" className="select wAuto" multiple="true" />
		                </td>
		                <th scope="row">고객유형</th>
		                <td class="left">
		                    <code:commCode name="custTypeCd" codeCd="CU030" className="select wAuto" multiple="true" />
		                </td>
		                <th scope="row">고객구분</th>
		                <td class="left">
		                    <code:commCode name="custDivCd" codeCd="CU010" className="select wAuto" multiple="true" selectedValue="" />
		                </td>
		            </tr>
		        </tbody>
		    </table>
		</div>
		<!-- //board -->
		
		<div class="gTitle1 line">
		    <h3 class="mTitle1">선택정보</h3>
		</div>
		<!-- board -->
		<div class="mBoard2">
		    <table>
		        <caption>선택정보</caption>
		        <colgroup>
		            <col width="8%">
		            <col width="*">
		            <col width="8%">
		            <col width="20%">
		            <col width="8%">
		            <col width="*">
		        </colgroup>
		        <tbody>
		            <tr>
		                <th scope="row">지역</th>
		                <td class="left">
		                    <code:commCode name="distrctDivCd" codeCd="CU100" className="select wAuto" multiple="true" selectedValue="" />
		                </td>
		                <th scope="row">결혼여부</th>
		                <td class="left">
		                    <code:commCode name="marryYn" codeCd="S050" className="select wAuto" prefixLabel="결혼" selectedValue="" />
		                </td>
		                <th scope="row">가족관계</th>
		                <td class="left">
		                    <code:commCode name="famlyRelCd" codeCd="CU040" className="select wAuto" multiple="true" selectedValue="" />
		                </td>
		            </tr>
		            <tr>
		                <th scope="row">주거평수</th>
		                <td class="left">
		                    <code:commCode name="dwelNfpyCd" codeCd="CU050" className="select wAuto" multiple="true" selectedValue="" />
		                </td>
		                <th scope="row">가입일</th>
		                <td class="left">
		                    <input class="it w70" type="text" data-type="dateRangeStart" data-range-end="sbscDayEnd" id="sbscDaySta" name="sbscDaySta" data-button="Y"/> ~ 
							<input class="it w70" type="text" id="sbscDayEnd" name="sbscDayEnd" data-button="Y"/>
		                </td>
		                <th scope="row">관심분야</th>
		                <td colspan="3" class="left">
		                    <span id="intrstFildCd"></span>
		                </td>
		            </tr>
		            <tr>
		            	<th scope="row">가입매장</th>
		                <td class="left" colspan="5">
		                	<a href="#;" data-click="storeSearchPop" class="mBtn1 m lWhite" style="cursor: pointer;">매장검색</a>
		                	<a href="#;" data-click="storeAllRemove" class="mBtn1 m lGray" style="cursor: pointer;">전체삭제</a>
		                    <input type="text" id="storNo" name="storNo" data-type="storeSelect" data-max-cnt="10" readonly />
		                </td>
		            </tr>
		        </tbody>
		    </table>
		</div>
		<!-- //board -->
		
		<div class="gTitle1 line">
		    <h3 class="mTitle1">정보 활용동의</h3>
		</div>
		<!-- board -->
		<div class="mBoard2">
		    <table>
		        <caption>정보 활용동의</caption>
		        <colgroup>
		            <col width="10%">
		            <col width="*">
		            <col width="10%">
		            <col width="*">
		            <col width="10%">
		            <col width="*">
		            <col width="10%">
		            <col width="*">
		        </colgroup>
		        <tbody>
		            <tr>
		                <th scope="row">SMS 수신동의</th>
		                <td class="left">
		                    <code:commCode name="smsRcvAgreeYn" codeCd="S050" className="select w100" prefixLabel="여부" />
		                </td>
		                <th scope="row">이메일 수신동의</th>
		                <td class="left">
		                    <code:commCode name="emailRcvAgreeYn" codeCd="S050" className="select w100" prefixLabel="여부" />
		                </td>
		                <th scope="row">PUSH 수신동의</th>
		                <td class="left">
		                    <code:commCode name="pushRcvAgreeYn" codeCd="S050" className="select w100" prefixLabel="여부" />
		                </td>
		                <th scope="row">수신거부</th>
		                <td class="left">
		                    <code:commCode name="rcvRfslYn" codeCd="S050" className="select w100" prefixLabel="여부" />
		                </td>
		            </tr>
		        </tbody>
		    </table>
		</div>
		<!-- //board -->
		
		<div class="gTitle1 line">
		    <h3 class="mTitle1">멤버십 정보</h3>
		</div>
		<!-- board -->
		<div class="mBoard2">
		    <table>
		        <caption>멤버십 정보</caption>
		        <colgroup>
		            <col width="6%">
		            <col width="*%">
		            <col width="6%">
		            <col width="*%">
		            <col width="6%">
		            <col width="*">
		            <col width="6%">
		            <col width="*">
		        </colgroup>
		        <tbody>
		            <tr>
		                <th scope="row">회원등급</th>
		                <td>
		                    <code:commCode name="mshipGradeCd" codeCd="MB020" className="select crucial" multiple="true" selectedValue="" />
		                </td>
		                <th scope="row">등급점수</th>
		                <td>
		                    <input class="it w70" type="text" data-type="number" name="mshipAdvncmtScoreSta" /> ~ 
							<input class="it w70" type="text" data-type="number" name="mshipAdvncmtScoreEnd" />
		                </td>
		                <th scope="row">회원구분</th>
		                <td>
		                    <code:commCode name="mshipTypeCd" codeCd="MB010" className="select crucial" multiple="true" selectedValue="" />
		                </td>
		                <th scope="row">가입일자</th>
		                <td class="left">
		                    <input class="it w70" type="text" data-type="dateRangeStart" data-range-end="mshipSbscDayEnd" id="mshipSbscDaySta" name="mshipSbscDaySta" data-button="Y"/> ~ 
							<input class="it w70" type="text" id="mshipSbscDayEnd" name="mshipSbscDayEnd" data-button="Y"/>
		                </td>
		            </tr>
		        </tbody>
		    </table>
		</div>
		<!-- //board -->
		</form>
	</div>
	<!-- 고객마스터 -->
	
	<!-- 접촉이력 -->
	<div id="contactHisInput" class="scroll mCustomScrollbar tabCont hidden">
        <div class="gTitle1 line">
            <h3 class="mTitle1">부가정보</h3>
        </div>
        
        <form role="form" id="contactHisCondInfoForm">
        <!-- list -->
        <div class="mList4">
            <!-- col -->
            <div class="col mBoard2">
                <table>
                    <caption>세라체크</caption>
                    <colgroup>
                        <col width="35%">
                        <col width="*">
                    </colgroup>
                     <thead>
                     <tr>
                         <th scope="col" colspan="2" class="lPrimary">세라체크</th>
                     </tr>
                     </thead>
                     <tbody>
                         <tr>
                             <th scope="row" class="left">측정횟수</th>
                             <td>
                                 <div class="mFlex2">
									<input class="it w100" type="text" data-type="number" name="mesrCntSta" />
									<span class="bar5">~</span>
									<input class="it w100" type="text" data-type="number" name="mesrCntEnd" />
                                 </div>
                             </td>
                         </tr>
                         <tr>
                             <th scope="row" class="left">최근 측정일</th>
                             <td>
								<div class="mDate1">
									<input class="it w80" type="text" data-type="dateRangeStart" data-range-end="mesrDayEnd" id="mesrDaySta" name="mesrDaySta" data-button="Y" value="" />
			                        <span class="bar">~</span>
									<input class="it w80" type="text" id="mesrDayEnd" name="mesrDayEnd" data-button="Y" value=""/>
								</div>
                             </td>
                         </tr>
                     </tbody>
                 </table>
             </div>
             <!-- //col -->
            <!-- col -->
            <div class="col mBoard2">
                <table>
                    <caption>상담이력</caption>
                    <colgroup>
                        <col width="35%">
                        <col width="*">
                    </colgroup>
                     <thead>
                     <tr>
                         <th scope="col" colspan="2" class="lPrimary">상담이력</th>
                     </tr>
                     </thead>
                     <tbody>
                         <tr>
                             <th scope="row" class="left">상담유형</th>
                             <td class="left">
                                 <code:commCode name="cnslgTypeCd" codeCd="CU210" multiple="true" />
                             </td>
                         </tr>
                         <tr>
                             <th scope="row" class="left">최종 상담일</th>
                             <td>
								<div class="mDate1">
									<input class="it w80" type="text" data-type="dateRangeStart" data-range-end="cnslgDayEnd" id="cnslgDaySta" name="cnslgDaySta" data-button="Y" value="" />
									<span class="bar">~</span>
									<input class="it w80" type="text" id="cnslgDayEnd" name="cnslgDayEnd" data-button="Y" value=""/>
								</div>
                             </td>
                         </tr>
                         <tr>
                            <th scope="row" class="left">상담횟수</th>
                            <td class="left">
                                <div class="mFlex2">
									<input class="it w100" type="text" data-type="number" name="cnslgCntSta" />
									<span class="bar5">~</span>
									<input class="it w100" type="text" data-type="number" name="cnslgCntEnd" />
                                </div>
                            </td>
                        </tr>
                     </tbody>
                 </table>
             </div>
             <!-- //col -->
            <!-- col -->
            <div class="col mBoard2">
                <table>
                    <caption>세라체크 DNA</caption>
                    <colgroup>
                        <col width="35%">
                        <col width="*">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col" colspan="2" class="lPrimary">세라체크 DNA</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row" class="left">DNA 검사여부</th>
                            <td class="left">
                                <code:commCode name="dnaChkYn" codeCd="S050" className="select w110" prefixLabel="검사여부" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="left">DNA 검사일</th>
                            <td>
                                <div class="mFlex2">
                                    <input class="it w80" type="text" data-type="dateRangeStart" data-range-end="dnaChkDayEnd" id="dnaChkDaySta" name="dnaChkDaySta" data-button="Y" value="" />
									<span class="bar">~</span>
									<input class="it w80" type="text" id="dnaChkDayEnd" name="dnaChkDayEnd" data-button="Y" value=""/>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- //col -->
        </div>
        <!-- //list -->
        
        <!-- list -->
        <div class="mList4">
            <!-- col -->
            <div class="col mBoard2">
                <table>
                    <caption>AS이력</caption>
                    <colgroup>
                        <col width="35%">
                        <col width="*">
                    </colgroup>
                     <thead>
                     <tr>
                         <th scope="col" colspan="2" class="lPrimary">AS이력</th>
                     </tr>
                     </thead>
                     <tbody>
                         <tr>
                             <th scope="row" class="left">보증 만료일</th>
                             <td>
								<div class="mDate1">
									<input class="it w80" type="text" data-type="dateRangeStart" data-range-end="grntExpDayEnd" id="grntExpDaySta" name="grntExpDaySta" data-button="Y" value="" />
									<span class="bar">~</span>
									<input class="it w80" type="text" id="grntExpDayEnd" name="grntExpDayEnd" data-button="Y" value=""/>
								</div>
                             </td>
                         </tr>
                         <tr>
                             <th scope="row" class="left">최종 AS일</th>
                             <td>
								<div class="mDate1">
									<input class="it w80" type="text" data-type="dateRangeStart" data-range-end="asDayEnd" id="asDaySta" name="asDaySta" data-button="Y" value="" />
									<span class="bar">~</span>
									<input class="it w80" type="text" id="asDayEnd" name="asDayEnd" data-button="Y" value=""/>
								</div>
                             </td>
                         </tr>
                     </tbody>
                 </table>
             </div>
             <!-- //col -->
            <!-- col -->
            <div class="col mBoard2">
                <table>
                    <caption>IOT사용이력</caption>
                    <colgroup>
                        <col width="35%">
                        <col width="*">
                    </colgroup>
                     <thead>
                     <tr>
                         <th scope="col" colspan="2" class="lPrimary">IOT사용이력</th>
                     </tr>
                     </thead>
                     <tbody>
                     	 <tr>
                            <th scope="row" class="left">사용 제외여부</th>
                            <td class="left">
                                <div class="mFlex2">
                                    <code:commCode name="iotUseExcldYn" codeCd="S050" className="select w110" prefixLabel="사용 제외여부" />
                                </div>
                            </td>
                        </tr>
                         <tr>
                             <th scope="row" class="left">최근 사용일</th>
                             <td>
								<div class="mDate1">
									<input class="it w80" type="text" data-type="dateRangeStart" data-range-end="iotUseDayEnd" id="iotUseDaySta" name="iotUseDaySta" data-button="Y" value="" />
									<span class="bar">~</span>
									<input class="it w80" type="text" id="iotUseDayEnd" name="iotUseDayEnd" data-button="Y" value=""/>
								</div>
                             </td>
                         </tr>
                         <tr>
                             <th scope="row" class="left">사용 횟수</th>
                             <td>
                                 <div class="mFlex2">
                                    <input class="it w100" type="text" data-type="number" name="iotUseCntSta" />
									<span class="bar5">~</span>
									<input class="it w100" type="text" data-type="number" name="iotUseCntEnd" />
                                 </div>
                             </td>
                         </tr>
                     </tbody>
                 </table>
             </div>
             <!-- //col -->
            <!-- col -->
            <div class="col mBoard2">
                <table>
                    <caption>추천이력</caption>
                    <colgroup>
                        <col width="35%">
                        <col width="*">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col" colspan="2" class="lPrimary">추천이력</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row" class="left">홈체험추천 횟수</th>
                            <td class="left">
                                <div class="mFlex2">
                                    <input class="it w100" type="text" data-type="number" name="exprnRcmdCntSta" />
									<span class="bar5">~</span>
									<input class="it w100" type="text" data-type="number" name="exprnRcmdCntEnd" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="left">구매추천 횟수</th>
                            <td class="left">
                                <div class="mFlex2">
                                    <input class="it w100" type="text" data-type="number" name="buyRcmdCntSta" />
									<span class="bar5">~</span>
									<input class="it w100" type="text" data-type="number" name="buyRcmdCntEnd" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="left">가입추천 횟수</th>
                            <td class="left">
                                <div class="mFlex2">
                                    <input class="it w100" type="text" data-type="number" name="sbscRcmdCntSta" />
									<span class="bar5">~</span>
									<input class="it w100" type="text" data-type="number" name="sbscRcmdCntEnd" />
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- //col -->
        </div>
        <!-- //list -->
        
        <!-- list -->
        <div class="mList4">
            <!-- col -->
            <div class="col mBoard2">
                <table>
                    <caption>매장체험</caption>
                    <colgroup>
                        <col width="35%">
                        <col width="*">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col" colspan="2" class="lPrimary">매장체험</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row" class="left">체험 횟수</th>
                            <td class="left">
                                <div class="mFlex2">
                                    <input class="it w100" type="text" data-type="number" name="storExprnCntSta" />
									<span class="bar5">~</span>
									<input class="it w100" type="text" data-type="number" name="storExprnCntEnd" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                             <th scope="row" class="left">체험 기간</th>
                             <td>
								<div class="mDate1">
									<input class="it w80" type="text" data-type="dateRangeStart" data-range-end="storExprnPerdEnd" id="storExprnPerdSta" name="storExprnPerdSta" data-button="Y" value="" />
									<span class="bar">~</span>
									<input class="it w80" type="text" id="storExprnPerdEnd" name="storExprnPerdEnd" data-button="Y" value=""/>
								</div>
                             </td>
                        </tr>
                        <tr>
                            <th scope="row" class="left">체험 기기</th>
                            <td class="left">
                            	<input type="hidden" title="제품번호" value="" name="storExprnGodsNo">
                                <div class="mFind1">
									<input type="text" class="it" title="제품명" value="" name="storExprnGodsNm">
									<a href="#;" class="iFind" data-click="exprnGodsSearchPop" data-type="store">검색</a>
								</div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- //col -->
            <!-- col -->
            <div class="col mBoard2">
                <table>
                    <caption>홈체험</caption>
                    <colgroup>
                        <col width="35%">
                        <col width="*">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col" colspan="2" class="lPrimary">홈체험</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row" class="left">체험 제외여부</th>
                            <td class="left">
                                <div class="mFlex2">
                                    <code:commCode name="homeExprnExcldYn" codeCd="S050" className="select w110" prefixLabel="체험 제외여부" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                             <th scope="row" class="left">체험 기간</th>
                             <td>
								<div class="mDate1">
									<input class="it w80" type="text" data-type="dateRangeStart" data-range-end="homeExprnPerdEnd" id="homeExprnPerdSta" name="homeExprnPerdSta" data-button="Y" value="" />
									<span class="bar">~</span>
									<input class="it w80" type="text" id="homeExprnPerdEnd" name="homeExprnPerdEnd" data-button="Y" value=""/>
								</div>
                             </td>
                        </tr>
                        <tr>
                            <th scope="row" class="left">체험 기기</th>
                            <td class="left">
                            	<input type="hidden" title="제품번호" value="" name="homeExprnGodsNo">
                                <div class="mFind1">
									<input type="text" class="it" title="제품명" value="" name="homeExprnGodsNm">
									<a href="#;" class="iFind" data-click="exprnGodsSearchPop" data-type="home">검색</a>
								</div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- //col -->
            <!-- col -->
            <div class="col mBoard2">
                <table>
                    <caption>최근활동</caption>
                    <colgroup>
                        <col width="35%">
                        <col width="*">
                    </colgroup>
                     <thead>
                     <tr>
                         <th scope="col" colspan="2" class="lPrimary">최종활동</th>
                     </tr>
                     </thead>
                     <tbody>
                         <tr>
                             <th scope="row" class="left">최종 활동 기간</th>
                             <td>
								<div class="mDate1">
									<input class="it w80" type="text" data-type="dateRangeStart" data-range-end="rcntlyAtvyDayEnd" id="rcntlyAtvyDaySta" name="rcntlyAtvyDaySta" data-button="Y" value="" />
									<span class="bar">~</span>
									<input class="it w80" type="text" id="rcntlyAtvyDayEnd" name="rcntlyAtvyDayEnd" data-button="Y" value=""/>
								</div>
                             </td>
                         </tr>
                     </tbody>
                 </table>
             </div>
             <!-- //col -->
        </div>
        <!-- //list -->
        </form>
    </div>
	<!-- 접촉이력 -->
	
	<!-- 거래이력 -->
	<div id="dealHisInput" class="scroll mCustomScrollbar tabCont hidden">
		<div class="gTitle1 line mt13">
			<h3 class="mTitle1">거래정보</h3>
		</div>
		
		<form role="form" id="dealHisCondInfoForm">
		<div class="mSort2 mini"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
            <ul>
                <li class="w30per">
                    <div class="tit w65">거래일자</div>
                    <div class="txt">
                        <div class="mFlex2">
                            <input class="it" type="text" data-type="dateRangeStart" data-range-end="dealDayEnd" id="dealDaySta" name="dealDaySta" data-button="Y" value="" />
							<span class="bar5">~</span>
							<input class="it" type="text" id="dealDayEnd" name="dealDayEnd" data-button="Y" value=""/>
                        </div>
                    </div>
                </li>
                <li class="w30per">
                    <div class="tit w65">구매총액</div>
                    <div class="txt">
                        <div class="mFlex2">
                            <input type="text" class="it" data-type="number" title="구매총액" name="buyTotAmtSta">
                            <span class="bar5">~</span>
                            <input type="text" class="it" data-type="number" title="구매총액" name="buyTotAmtEnd">
                        </div>
                    </div>
                </li>
                <li class="w40per">
                    <div class="tit w65">구매채널</div>
                    <div class="txt">
                    	<div class="mFlex2">
                            <code:commCode name="buyChlCd" codeCd="ST040" className="select crucial" multiple="true" selectedValue="" />
                        </div>
                    </div>
                </li>
                <li class="w30per">
                    <div class="tit w65">결제총액</div>
                    <div class="txt">
                        <div class="mFlex2">
                            <input type="text" class="it" data-type="number" title="결제총액 시작일" name="payTotAmtSta">
                            <span class="bar5">~</span>
                            <input type="text" class="it" data-type="number" title="결제총액 마지막일" name="payTotAmtEnd">
                        </div>
                    </div>
                </li>
                <li class="w40per">
                    <div class="tit w65">구매제품</div>
                    <div class="txt">
                        <div class="mFlex2">
                            <a href="#" class="mBtn1 lWhite" data-click="dealGodsSearchPop">조건추가</a>&nbsp;
                            <label class="mCheckbox1">
								<input type="checkbox" title="조건제품 제외여부" name="godsExcldYn" value="Y">
								<span class="label">해당제품 제외여부</span>
							</label>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        </form>
        <!-- //sort -->
        <p>&nbsp;</p>
        <div class="gTitle1">
        	<h3 class="mTitle1">구매제품</h3>
			<div class="gRt posT-5">
				<a href="#" data-click="godsInfoGridDel" class="mBtn1 lWhite">삭제</a>
			</div>
		</div>
        <div id="divGodsGrid" style="height:290px" 
			data-post="Y" 
			data-grid-id="grdGodsInfo" 
			data-pagenation="N" 
			data-get-url="" 
			data-type="grid" 
			data-grid-callback="onGridLoad" 
			data-tpl-url="<c:url value='/static/gridTemplate/cst/crmCustGrpDealGods.xml'/>">
		</div>
	</div>
	<!-- 거래이력 -->
	<p>&nbsp;</p>
	<div class="mSort2 medium"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
		<ul>
			<li class="wAuto ml20">
				<div class="tit"></div>
				<div class="txt">
					
				</div>
			</li>
		</ul>
		<div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
			<a href="#" class="mBtn1 lWhite" data-click="targetConfirmPop">고객현황</a>
			<a href="#" class="mBtn1 lGray" data-auth-type="c" style="display:none"  data-click="targetQueryPop">SQL 추출</a>
			<a href="#" class="mBtn1 lPrimary" data-auth-type="c" style="display:none"  data-click="targetCondInfoUpd">조건 저장</a>
		</div>
	</div>
</div>
<!-- VQ -->

<!-- EXCEL -->
<div id="divExcel" class="mBox1 p10 hidden">
	<p>&nbsp;</p>
    <div class="gTitle1 mb10">
        <h3 class="mTitle1">추출고객</h3>
        <div class="gRt posT-5">
            <a href="#" class="mBtn1 lWhite" data-click="targetExcelClear">초기화</a>
            <!-- <a href="#" class="mBtn1 lWhite" data-click="targetExcelDel">삭제</a> -->
            <a href="#" class="mBtn1" data-click="targetExcelSampleDownload">양식다운로드</a>
            <a href="#" class="mBtn1" data-auth-type="c" style="display:none"  data-click="targetExcelUpload">엑셀업로드</a>
        </div>
    </div>
	<!-- //추출고객 그리드영역 -->
	<div id="divTargetExcelGrid" style="height:400px" 
		data-post="Y" 
		data-grid-id="grdTargetExcel" 
		data-pagenation="N" 
		data-get-url="" 
		data-type="grid" 
		data-grid-callback="onGridLoad" 
		data-tpl-url="<c:url value='/static/gridTemplate/cst/crmCustGrpTargetExt.xml'/>">
	</div>
	<!-- //추출고객 그리드영역 -->
	<!-- //추출양식 그리드영역 -->
	<div style="display:none;">
		<div id="divTargetExcelSampleGrid" style="height:400px;" 
			data-post="Y" 
			data-grid-id="grdTargetExcelSample" 
			data-pagenation="N" 
			data-get-url="" 
			data-type="grid" 
			data-grid-callback="onGridLoad" 
			data-tpl-url="<c:url value='/static/gridTemplate/cst/crmCustGrpTargetExtSample.xml'/>">
		</div>
	</div>
	<!-- //추출양식 그리드영역 -->
	<p>&nbsp;</p>
	<div class="mSort2 medium"> <!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
		<ul>
			<li class="wAuto ml20">
				<div class="tit"></div>
				<div class="txt">
					
				</div>
			</li>
		</ul>
		<div class="button posRt"> <!-- 우측 정렬 : class="posRt" -->
			<a href="#" class="mBtn1 lPrimary" data-click="targetExcelInfoSave">대상고객 등록</a>
		</div>
	</div>
</div>
<!-- EXCEL -->

<!-- SQL -->
<div id="divSQL" class="mBox1 p10 hidden">
	<p>&nbsp;</p>
	<div class="gTitle1">
		<div class="gRt posT-5">
			<a href="#" class="mBtn1 lWhite" data-auth-type="c" style="display:none"  data-click="targetSearchQueryCheck">SQL 검증</a>
			<a href="#" class="mBtn1 lPrimary" data-auth-type="c" style="display:none"  data-click="targetSearchQuerySave">SQL 저장</a>
		</div>
	</div>
	
	<div class="mGrid2 type2">
		<div class="lt">
			<br>
			<textarea class="textarea" rows="22" title="쿼리" id="inputTargetSearchQuery"></textarea>
		</div>
		<div class="rt">
			<!-- //대상고객 그리드영역 -->
			<div id="divTargetQueryChkGrid" style="height:460px" 
				data-post="Y" 
				data-grid-id="grdTargetQueryChk" 
				data-pagenation="Y" 
				data-get-url="" 
				data-block-ui="Y"
				data-type="grid" 
				data-grid-callback="onGridLoad" 
				data-tpl-url="<c:url value='/static/gridTemplate/cst/crmCustGrpTargetQueryChk.xml'/>">
			</div>
			<!-- //대상고객 그리드영역 -->
		</div>
	</div>
	<!-- <textarea class="textarea" rows="20" title="쿼리" id="inputTargetSearchQuery"></textarea> -->
	
	<div class="mInfo1" style="display:none">
		현재 선택하신 조건에 해당하는 고객은 <span class="count" id="inputTargetSearchQueryCount">0</span> 명 입니다.
	</div>

	<div class="mButton1 center">
		<a href="#" class="mBtn1 round m2" data-click="targetInfoByQuerySave">대상고객 등록</a>
	</div>
</div>
<!-- SQL -->

<script>
	var currCustGrpNo = "";	//현재 선택된 고객그룹번호
	var gridLoaded = 0;	//그리드가 로드되기 전에 호출되는 것을 방지하기 위한 변수값
	
	$("document").ready(function(){
		//Utilities.setChkboxData("intrstFildCd", "CU060", "mCheckbox1", "");
		$("#extType").change( function() {
			chgExtType($(this).val());
		});
	});
		

	//서브페이지의 정보가 수정되면 부모페이지의 고객그룹목록부터 새로가져옵니다.(모든 하위항목까지 새로고침 됩니다.)
	function totalInfoInit(){
		parent.groupBasListInit();
	}

	function initPage(custGrpNo){
		currCustGrpNo = custGrpNo;
//console.log("=======> 대상고객 추출페이지 초기화 : "+ currCustGrpNo);
		targetCondInfoLoading(currCustGrpNo);
		targetExcelClear();
		groupBasInfoView(currCustGrpNo);
	}

	//initPage보다 먼저 호출될경우를 위해(팝업에서 호출될때?)
	function onGridLoad(grid, gridId){
		++gridLoaded;
		if(currCustGrpNo != "" && gridLoaded >= 3){
//console.log("=======> 대상고객 추출페이지 onGridLoad : "+ currCustGrpNo);
			targetCondInfoLoading(currCustGrpNo);
		}
	}

	function chgExtType(type){
		switch(type) {
			case "002" :
				$("#divVQ").hide();
				$("#divExcel").show();
				$("#divSQL").hide();
			break;
			case "003" :
				$("#divVQ").hide();
				$("#divExcel").hide();
				$("#divSQL").show();
			break;
			default :
				$("#divVQ").show();
				$("#divExcel").hide();
				$("#divSQL").hide();
		}
	}

	function targetCondInfoLoading(custGrpNo){
		var param = {
			custGrpNo : custGrpNo
		};
		var url = "<c:url value='${urlPrefix}/custGroup/getTargetCondInfo'/>${urlSuffix}";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "대상조건 읽기에 실패했습니다.")) {
				var custMasterCondData = data.custMasterCond;
				var contactHisCondData = data.cnttHstCond;
				var dealHisCondData = data.dealHstCond;
				
				custMasterInfoSetting(custMasterCondData);
				contactHisInfoSetting(contactHisCondData);
				dealHisInfoSetting(dealHisCondData);
			}
		});
	}

	//거래이력의 구매제품 목록만 재로딩한다.
	function dealHisGodsInfoLoading(custGrpNo){
		var param = {
			custGrpNo : custGrpNo
		};
		var url = "<c:url value='${urlPrefix}/custGroup/getTargetCondInfo'/>${urlSuffix}";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "대상조건(구매제품) 읽기에 실패했습니다.")) {
				var dealHisGodsData = data.dealHstCond;

				if(dealHisGodsData != null){
					var totalData = {
						data : {
							contents : dealHisGodsData.godsList,
							pagination : {
								totalCount : 30000	//임의설정
							}
						}
					};

					grdGodsInfo.loadJson(totalData);
				}
				
			}
		});
	}

	function custMasterInfoSetting(data){
		if(data != null){
			Utilities.mapToForm(data, "custMasterCondInfoForm");
			Utilities.setChkboxData("intrstFildCd", "CU060", "mCheckbox1", data.intrstFildCd, true);
			storeInfoClear($('#custMasterCondInfoForm [name="storNo"]')[0]);
			storeInfoSetting($('#custMasterCondInfoForm [name="storNo"]')[0], data.storNo);
		}else{
			Utilities.resetForm("custMasterCondInfoForm");
			Utilities.setChkboxData("intrstFildCd", "CU060", "mCheckbox1", "", true);
			storeInfoClear($('#custMasterCondInfoForm [name="storNo"]')[0]);
		}
	}

	function storeInfoClear(element){
		var storeSelt = element.selectize;
		storeSelt.clear();
		storeSelt.clearOptions();
	}

	function storeInfoSetting(element, storeList){
		var storeSelt = element.selectize;
		var storeMap = element.storeMap;
	    var maxItems = $(element).data("maxCnt");
	    if(!maxItems || maxItems < 0)
	    	maxItems = 10000;

		if(storeList != null && storeList != ""){
			var orgList = storeSelt.getValue();
			if(orgList.length > 0){
				orgList += ",";
			}
			var totList = orgList + storeList;
			var totArr = totList.split(",");
			var totOpts = [];
			var totMaps = {};
			var totItems = [];
			var itemLeft = false;
			for(var i=0; i<totArr.length ; i++){
				if(totMaps[totArr[i]])
					continue;
				totMaps[totArr[i]] = storeMap[totArr[i]];
				totOpts.push(storeMap[totArr[i]]);
				totItems.push(totArr[i]);
				if(maxItems <= totOpts.length)
				{
					itemLeft = maxItems < totArr.length;
					break;
				}
			}
			storeSelt.addOption(totOpts);
			storeSelt.setValue(totItems);
			if(itemLeft){
				alert("최대 " + maxItems + " 개 매장만 추가 가능합니다." )
			}
		}
	}

	function storeInfoGetting(element){
		var storeSelt = element.selectize;
		return storeSelt.getValue();
	}

	function contactHisInfoSetting(data){
		if(data != null){
			Utilities.mapToForm(data, "contactHisCondInfoForm");
		}else{
			Utilities.resetForm("contactHisCondInfoForm");
		}
	}

	function dealHisInfoSetting(data){
		if(typeof grdGodsInfo !== "undefined"){
			grdGodsInfo.clear();
		}
		if(data != null){
			Utilities.mapToForm(data, "dealHisCondInfoForm");
			if(data.godsExcldYn == "Y"){
				$('#dealHisCondInfoForm [name="godsExcldYn"]').prop('checked',true);
			}else{
				$('#dealHisCondInfoForm [name="godsExcldYn"]').prop('checked',false);
			}
			
			var totalData = {
				data : {
					contents : data.godsList,
					pagination : {
						totalCount : 30000	//임의설정
					}
				}
			};

			if(typeof grdGodsInfo !== "undefined"){
				grdGodsInfo.loadJson(totalData);
			}
		}else{
			Utilities.resetForm("dealHisCondInfoForm");
		}
	}

	function groupBasInfoView(custGrpNo){
		targetSearchQueryClear();
		var param = {
			custGrpNo : custGrpNo
		};
		var url = "<c:url value='${urlPrefix}/custGroup/getGroupBasInfo'/>${urlSuffix}";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "고객그룹정보 읽기에 실패했습니다.")) {
				if(data != null){
					$('#inputTargetSearchQuery').val(data.custGrpExtrSqlCtnts);
				}else{
					$('#inputTargetSearchQuery').val("");
				}
			}
		});
	}

	function storeSearchPop(){
		Utilities.openStorePop("storeSearchInfoGet", "Y");
	}

	function storeSearchInfoGet(data){
		if(data != null){
			var storeNoStr = "";
			for(key in data) {
				storeNoStr += ","+ data[key].storNo;
			}
			storeNoStr = storeNoStr.substr(1, storeNoStr.length)
			storeInfoSetting($('#custMasterCondInfoForm [name="storNo"]')[0], storeNoStr);
		}
	}

	function storeAllRemove(){
		var storeNoStr = $('#custMasterCondInfoForm [name="storNo"]')[0].selectize;
		storeNoStr.clear();
		storeNoStr.clearOptions();
	}

	function exprnGodsSearchPop(element, data){
		var url = "<c:url value='${urlPrefix}/custGroup/popExprnGodsSearchInfo${urlSuffix}'/>";
		url += "?exprnType="+ data.type +"&callFuncNm=exprnGodsSelect";
		Utilities.openModal(url,1000,700);
	}

	function exprnGodsSelect(type, data){
		if(data != null){
			if(type == "store"){
				$('#contactHisCondInfoForm [name="storExprnGodsNo"]').val(data.godsNo);
				$('#contactHisCondInfoForm [name="storExprnGodsNm"]').val(data.godsNm);
			}else{
				$('#contactHisCondInfoForm [name="homeExprnGodsNo"]').val(data.godsNo);
				$('#contactHisCondInfoForm [name="homeExprnGodsNm"]').val(data.godsNm);
			}
		}
	}

	function dealGodsSearchPop(){
		Utilities.openDealGodsPop("godsInfoCondAdd");
	}
	
	function godsInfoCondAdd(chkData){
		if(chkData != null){
			var addData = {
					custGrpNo : currCustGrpNo,
					godsList : chkData
				};
			
			var url = "<c:url value='${urlPrefix}/custGroup/addDealGodsInfoList${urlSuffix}'/>";
			Utilities.getAjax(url, addData, true, function(data, jqXHR) {
				if (Utilities.processResult(data, jqXHR, "거래제품정보 등록에 실패했습니다.")) {
					//alert("거래제품정보 등록에 성공했습니다.");
					
					/*
					for(var i=0; i<chkData.length; i++){
						grdGodsInfo.addRow(chkData[i]);
					};*/
					dealHisGodsInfoLoading(currCustGrpNo);
				}
			});
		}
	}

	function godsInfoGridDel(){
		var saveJson = grdGodsInfo.getCheckedJson();
		if (saveJson.length == 0) {
			alert("삭제할 데이터를 선택해주세요.");
			return;
		}
//console.log("====godsInfoGridDel==> "+ JSON.stringify(saveJson));
		if (!confirm("데이터를 삭제하면 복구할 수 없습니다.\n계속하시겠습니까?"))
			return;
		var url = "<c:url value='${urlPrefix}/custGroup/delDealGodsInfoList${urlSuffix}'/>";
		Utilities.getAjax(url, saveJson, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "거래제품정보 삭제에 실패했습니다.")) {
				//alert("거래제품정보 삭제에 성공했습니다.");
				grdGodsInfo.removeCheckRow();	//ROW추가만한 데이터의 삭제를 위해
			}
		});
	}

	function targetConfirmPop(){
		if(currCustGrpNo == ""){
			alert("고객그룹을 선택해주세요.");
			return false;
		}
	
		var url = "<c:url value='${urlPrefix}/custGroup/popTargetConfirmInfo${urlSuffix}'/>?custGrpNo="+ currCustGrpNo;
		Utilities.openModal(url,1100,700);
	}

	function targetQueryPop(){
		if(currCustGrpNo == ""){
			alert("고객그룹을 선택해주세요.");
			return false;
		}
		
		var url = "<c:url value='${urlPrefix}/custGroup/popTargetQueryInfo${urlSuffix}'/>?custGrpNo="+ currCustGrpNo;
		Utilities.openModal(url,1000,700);
	}

	function targetCondInfoUpd(){
		if(currCustGrpNo == ""){
			alert("고객그룹을 선택해주세요.");
			return false;
		}

		var param = getTotalTargetCondInput(false);
//console.log("===\n"+JSON.stringify(param));return;
		var url = "<c:url value='${urlPrefix}/custGroup/updTargetCondInfo${urlSuffix}'/>";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "대상조건 수정에 실패했습니다.")) {
				alert("대상조건 수정에 성공했습니다.");
				totalInfoInit();			//모든 서브페이지 정보 새로고침
			}
		});
	}

	function targetExcelClear() {
		if(currCustGrpNo != "" && typeof grdTargetExcel !== "undefined"){
			grdTargetExcel.clear();
		}
	}

	function targetExcelDel() {
		var chkdJson = grdTargetExcel.getCheckedJson();
		if (chkdJson.length == 0) {
			alert("삭제할 데이터를 선택해주세요.");
			return;
		}
		
		grdTargetExcel.removeCheckRow();
	}

	function grdTargetExcelSample_load(grid, gridId) {
		var data = [{
				itgCustNo : "고객번호",
				custNm : "갑돌이",
				gndrCd : "M",
				birthday : "19900101",
				mphonNo : "01012345678"
			},{
				itgCustNo : "고객번호",
				custNm : "갑순이",
				gndrCd : "F",
				birthday : "19900101",
				mphonNo : "01012345678"
			}];

		grdTargetExcelSample.loadJson(data);
	}

	function targetExcelSampleDownload(){
		if (!confirm("양식엑셀파일을 다운로드 하시겠습니까?")) return;
		grdTargetExcelSample.exportExcel("대상고객 샘플파일.xlsx");
	}

	function targetExcelUpload() {
		grdTargetExcel.importExcel();
	}
//zodiack
	function targetExcelInfoSave(){
		var saveJson = grdTargetExcel.getData();

		if (saveJson.length == 0) {
			alert("저장할 데이터가 존재하지 않습니다.");
			return;
		}

		if(!gridTargetValidateChk(grdTargetExcel)){
			return;
		}
		
//console.log("testCall : "+ JSON.stringify(saveJson));return;
		if (!confirm("기존 저장된 대상고객 데이터는 삭제됩니다.\n계속하시겠습니까?"))
			return;
		var param = {
				custGrpNo : currCustGrpNo,
				targetData : saveJson
			};

		Utilities.blockUI();
		var url = "<c:url value='${urlPrefix}/custGroup/saveTargetRelList1${urlSuffix}'/>";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			Utilities.unblockUI();
			if (Utilities.processResult(data, jqXHR, "대상고객엑셀 등록에 실패했습니다.")) {
				
				alert("대상고객엑셀 등록에 성공했습니다.");
				targetExcelClear();
				totalInfoInit();		//모든 서브페이지 정보 새로고침
				parent.tabCall("#targetRelTabBtn");
			}
		});
	}

	//모든 검색조건 입력폼의 내용을 JSON형태로 가져온다
	function getTotalTargetCondInput(type){
		//고객마스터 조건파라미터
		var custMasterCondParam = Utilities.formToMap("custMasterCondInfoForm");
		custMasterCondParam.custGrpNo = currCustGrpNo;
		custMasterCondParam.storNo = storeInfoGetting($('#custMasterCondInfoForm [name="storNo"]')[0]);

		//접촉이력 조건파라미터
		var contactHisCondParam = Utilities.formToMap("contactHisCondInfoForm");
		contactHisCondParam.custGrpNo = currCustGrpNo;

		//거래이력 조건파라미터
		var dealGodsCondJson = null;
		if(type){
			dealGodsCondJson = grdGodsInfo.getData();	//모든 데이터를 가져온다.
		}else{
			dealGodsCondJson = grdGodsInfo.getSaveJson();	//변경된 데이터만 가져온다.
		}
		var dealHisCondParam = Utilities.formToMap("dealHisCondInfoForm");
		dealHisCondParam.custGrpNo = currCustGrpNo;
		dealHisCondParam.godsList = dealGodsCondJson;	//거래제품조건 리스트 저장
		if($('#dealHisCondInfoForm [name="godsExcldYn"]').is(':checked')){
			dealHisCondParam.godsExcldYn = "Y";
		}else{
			dealHisCondParam.godsExcldYn = "N";
		}
		
		//고객마스터,접촉이력,거래이력 전체 JSON 파라미터 전달
		var param = {
			custMasterCond : custMasterCondParam,
			cnttHstCond : contactHisCondParam,
			dealHstCond : dealHisCondParam
		};

		return param;
	}

	function targetSearchQueryCheck(){
		var inputQuery = $('#inputTargetSearchQuery').val();
		var checkQuery = $.trim(inputQuery);
		if(checkQuery.length == 0){
			alert("SQL 쿼리를 입력해주세요.");return;
		}
		
		checkQuery = checkQuery.toLowerCase();
		checkQuery = checkQuery.replace(/\n/g, " ");//행바꿈제거
		checkQuery = checkQuery.replace(/\r/g, " ");//엔터제거
//console.log(">> checkQuery\n"+ checkQuery);
		/*
		///^insert$|^update$|^delete$/g
		if(/insert$|update$|delete$/gi.test(checkQuery) ){
			alert("걸렸음");
			return false;
		}
		return;
		
		*/
		grdTargetQueryChk.clear();
		//$('#inputTargetSearchQueryCount').text("0");
		var param = {
				inputQuery : inputQuery
			};
		var url = "<c:url value='${urlPrefix}/custGroup/getTargetWithQuery'/>${urlSuffix}";
		
		Utilities.blockUI();
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			Utilities.unblockUI();
			if (Utilities.processResult(data, jqXHR, "대상고객 검색쿼리 검증에 실패했습니다.")) {
				
//console.log("data\n"+ JSON.stringify(data.data.pagination.totalCount));
				
				//grdTargetQueryChk.loadJson(data);
				grdTargetQueryChk.loadUrl(url, param);
				//$('#inputTargetSearchQueryCount').text(data.data.pagination.totalCount);
			}
		});
		
	}

	function targetSearchQuerySave(){
		if (!confirm("입력한 SQL문을 저장하시겠습니까?")) return;
		
		var inputQuery = $('#inputTargetSearchQuery').val();
		//console.log("inputQuery\n"+ inputQuery); return;
		var param = {
				custGrpNo : currCustGrpNo,
				inputQuery : inputQuery
			};
		var url = "<c:url value='${urlPrefix}/custGroup/saveTargetQuery'/>${urlSuffix}";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "대상고객 검색쿼리 저장에 실패했습니다.")) {
				alert("대상고객 검색쿼리를 저장하였습니다.");
			}
		});
	}

	function targetInfoByQuerySave(){
		var saveJson = grdTargetQueryChk.getData();
		var inputQuery = $('#inputTargetSearchQuery').val();

		if(inputQuery.length == 0){
			alert("등록할 쿼리를 입력해주세요.");
			return;
		}

		if (saveJson.length == 0) {
			alert("등록할 데이터가 존재하지 않습니다.");
			return;
		}

		if (!confirm("기존 저장된 대상고객 데이터는 삭제됩니다.\n계속하시겠습니까?")) return;
		
		var param = {
				custGrpNo : currCustGrpNo,
				inputQuery : inputQuery
			};

		Utilities.blockUI();
		var url = "<c:url value='${urlPrefix}/custGroup/saveTargetRelInpQuery${urlSuffix}'/>";
		Utilities.getAjax(url, param, true, function(data, jqXHR) {
			Utilities.unblockUI();
			if (Utilities.processResult(data, jqXHR, "대상고객 등록에 실패했습니다.")) {
				
				alert("대상고객 등록에 성공했습니다.");
				totalInfoInit();		//모든 서브페이지 정보 새로고침
				parent.tabCall("#targetRelTabBtn");
			}
		});
	}

	function targetSearchQueryClear() {
		if(currCustGrpNo != "" && typeof grdTargetQueryChk !== "undefined"){
			grdTargetQueryChk.clear();
			$('#inputTargetSearchQuery').val("");
			$('#inputTargetSearchQueryCount').text("0");
		}
	}

	function gridTargetValidateChk(obj){
		var nameRule = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
		var gndrRule = /(M|F)/;
		var numRule = /^[0-9]*$/;
		var birthRule = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
		var saveJson = obj.getData();

		if (saveJson.length > 0) {
			for(key in saveJson) {
				if(saveJson[key].itgCustNo == ""){
					if(
						saveJson[key].custNm == null || 
						saveJson[key].custNm.trim().length === 0 || 
						saveJson[key].mphonNo == null || 
						saveJson[key].mphonNo.trim().length === 0
					){
						alert("통합고객번호가 없을 시\n이름과 전화번호는 필수 입력값입니다.");
						grdTargetExcel.focusAt(key, 1);
						return false;
					}
				}
				
				//이름 체크
				if(saveJson[key].custNm != "" && saveJson[key].custNm != null){
					if(saveJson[key].custNm.trim().length == 0){
						alert("이름에 빈값을 넣을 수 없습니다.");
						grdTargetExcel.focusAt(key, 1);
						return false;
					}
					if(nameRule.test(saveJson[key].custNm)){
						alert("이름에 특수문자를 넣을 수 없습니다.");
						grdTargetExcel.focusAt(key, 1);
						return false;
					}
				}
				//성별 체크
				if(saveJson[key].gndrCd != "" && saveJson[key].gndrCd != null){
					if(saveJson[key].gndrCd.trim().length == 0){
						alert("성별에 빈값을 넣을 수 없습니다.");
						grdTargetExcel.focusAt(key, 2);
						return false;
					}
					if(!gndrRule.test(saveJson[key].gndrCd)){
						alert("성별에 M(남자) 또는 F(여자)만 올 수 있습니다.");
						grdTargetExcel.focusAt(key, 2);
						return false;
					}
				}
				//연령 체크
				if(saveJson[key].birthday != "" && saveJson[key].birthday != null){
					if(saveJson[key].birthday.trim().length == 0){
						alert("연령에 빈값을 넣을 수 없습니다.");
						grdTargetExcel.focusAt(key, 3);
						return false;
					}
					if(!birthRule.test(saveJson[key].birthday)){
						alert("연령을 생년월일(8자리) 형식으로 입력해주세요");
						grdTargetExcel.focusAt(key, 3);
						return false;
					}
				}
				//전화번호 체크
				if(saveJson[key].mphonNo != "" && saveJson[key].mphonNo != null){
					if(saveJson[key].mphonNo.trim().length == 0){
						alert("전화번호에 빈값을 넣을 수 없습니다.");
						grdTargetExcel.focusAt(key, 4);
						return false;
					}
					if(!numRule.test(saveJson[key].mphonNo)){
						alert("전화번호는 숫자만 입력할 수 있습니다.");
						grdTargetExcel.focusAt(key, 4);
						return false;
					}
				}
			}
		}

		return true;
	}

	function gridTargetNullChk(obj){
		var saveJson = obj.getData();

		if (saveJson.length > 0) {
			for(key in saveJson) {
				if(saveJson[key].itgCustNo == ""){
					if(
						saveJson[key].custNm == null || 
						saveJson[key].custNm.trim().length === 0 || 
						saveJson[key].mphonNo == null || 
						saveJson[key].mphonNo.trim().length === 0
					){
						return false;
					}
				}
				if(JSON.stringify(saveJson[key].mphonNo).indexOf('-') >= 0){
					return false;
				}
			}
		}

		return true;
	}

	function tabCall(tabID){
		parent.tabCall(tabID);
	}

	function birthdayAge(grid,row,col,json,value){
		return Utilities.getBirthdayAge(value);
	}
</script>