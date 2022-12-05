<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%>
 

			<div class="gLeft">
			
				<!-- 고객정보 -->
				<div class="mBox1">
					<form role="form" id="frmSearch">
						<input type="hidden" name="currentPageNo" id="currentPageNo" value="1" />
						<!-- title -->
						<div class="gTitle1">
						<!-- 싱글뷰 고객정보 -->
							<h3 class="mTitle1">고객정보</h3>
							<div class="gRt">
								<label class="mRadio1 posRt">
									<input type="radio" title="개인" checked="true" value="001" name="custDivCd" id="custDivCd" data-custDivCd="${custDivCd}" >
									<span class="label">개인</span>
								</label>
								<label class="mRadio1 posRt">
									<input type="radio" title="법인" value="002" name="custDivCd" id="custDivCd" data-custDivCd="${custDivCd}" >
									<span class="label">법인</span>
								</label>
<!-- 		                        <label class="mRadio1 type2"> -->
<!-- 		                            <input type="radio" name="radio1" title="개인" checked=""> -->
<!-- 		                            <span class="label">개인</span> -->
<!-- 		                        </label> -->
<!-- 		                        <label class="mRadio1 type2"> -->
<!-- 		                            <input type="radio" name="radio1" title="법인"> -->
<!-- 		                            <span class="label">법인</span> -->
<!-- 		                        </label>								 -->
							</div>
						</div>
						<!-- //title -->
						<!-- search -->
						<div class="mSort2 mini">
                            <%-- <input type="hidden" title="통합고객번호" name="itgCustNo" id="itgCustNo" value="${itgCustNo}" /> --%>
							<input type="text" class="it w41" title="고객명" placeholder="고객명" name="custNm" id="custNm" value="${custNm}" data-enter="search" onkeydown="searchOnChange()">							
							<input type="text" class="it w80"  title="전화번호" placeholder="전화번호" name="mphonNo" id="mphonNo" data-enter="search" onkeydown="searchOnChange()">
							<input type="text" class="it w130" title="통합고객번호"  placeholder="통합고객번호" name="itgCustNo" id="itgCustNo" data-enter="search" value="${itgCustNo}" onkeydown="searchOnChange()" />
							<!-- <input type="text" class="it w2" title="전화번호" placeholder="전화번호뒷자리" name="mphonBkDgtNo" id="mphonBkDgtNo" data-enter="search" onkeydown="searchOnChange()"> -->							
<!-- 							<input type="text" class="it" title="통합검색" placeholder="통합검색" name="itgSearch" id="itgSearch" data-enter="search"> -->
							<a href="#;" class="mBtn1" data-click="search">검색</a>
						</div>
						<!-- //search -->
						<!-- list 좌측 그리드 1 -->
						<!-- <div  id="divGridList" mBoard1 mCustomScrollbar style="height: ${rightBoxHeight5}"  -->

							<div id="divGridList" style="height:730px"
								data-get-url="<c:url value='${urlPrefix}/getList'/>${urlSuffix}"
								data-grid-id="grdList" data-pagenation="Y" data-type="grid"
								data-scroll-y="Y"
								data-block-ui="Y"
								data-post="Y" data-load-focus="N"
								data-tpl-url="<c:url value='/static/gridTemplate/main/CR001.xml'/>">
							</div>	

						<!-- //list -->
					</form>					
 				</div>
				<!-- //고객정보 -->
			</div>
			<!-- //left -->
			<!-- right -->
			<div class="gRight">
				<!-- box -->
				<div class="mBox1 pt25" id="custType1"> <!-- class="pt25" : padding top 25px -->
				
				<form  id="frmDetail1">
					<input type="hidden" name="homeDistrctCd" id="homeDistrctCd"/>
					<input type="hidden" name="homeDistrctCdNm" id="homeDistrctCdNm"/>
					<input type="hidden" name="homeZipCd" id="homeZipCd"/>
					<input type="hidden" name="homeAddr1" id="homeAddr1"/>
					<input type="hidden" name="homeAddr2" id="homeAddr2"/>
					<!-- row -->
					<div class="row">
						<!-- 기본정보 -->
						<div class="col w57per" >
							<div class="gTitle1 line">
								<h3 class="mTitle1">기본정보</h3>
								<div class="gRt">
								    <a href="#;" class="mBtn1 r5 lPrimary" data-auth-type="u" style="display:none" data-click="mshipPersonAdvn" id="btnMshipAdvn"><span>개별승급</span></a>
								    <a href="#;" class="mBtn1 r5 lPrimary" data-auth-type="u" style="display:none" data-click="memshipDormancy" id="btnMemshipDormancy"><span>휴면</span></a>
								    <a href="#;" class="mBtn1 r5 lPrimary" data-auth-type="u" style="display:none" data-click="memshipCancelDormancy" id="btnMemshipCancelDormancy"><span>휴면취소</span></a>
                                    <a href="#;" class="mBtn1 r5 lPrimary" data-auth-type="d" style="display:none" data-click="deleteMemShip" id="btnDeleteMemShip"><span>삭제</span></a>
									<a href="#;" class="mBtn1 r5 lPrimary" data-auth-type="u" style="display:none" data-click="updateCust" id="btnUpdateCust" ><span>수정</span></a>

								</div>								
							</div>
											
							<div class="mBoard2">
								<table>
									<caption>기본정보</caption>
									<colgroup>
										<col width="11%">
										<col width="17%">
										<col width="7%">
										<col width="*">
										<col width="7%">
										<col width="*">
										<col width="8%">
										<col width="10%">
										<col width="7%">
										<col width="10%">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" class="left"><span >통합고객번호</span></th>
											<td>
												<input type="text" class="it must" title="통합고객번호" name="itgCustNo" id="itgCustNo" disabled="disabled" >
											</td>
											<th scope="row" class="left iMust">고객명</th>
											<td>
												<input type="text" class="it must" title="고객명" name="custNm" id="custNm" >
											</td>
											<th scope="row" class="left iMust">생년월일</th>
											<td>
												<input type="text" class="it must center" title="생년월일" name="birthday" id="birthday" maxlength="10" onchange="birthdayChange(this.value)"/>
											</td>
											<th scope="row" class="left iMust">성별</th>
											<td>
												<code:commCode className="it must center" id="gndrCd" name="gndrCd" codeCd="S040" prefixValue="" multiple="false" />
											</td>
											<th scope="row" class="left iMust">외국인</th>
											<td>
												<code:commCode className="it must center" id="fornYn" name="fornYn" codeCd="CU120" prefixValue="" multiple="false" />
											</td>
										</tr>
										<tr>
											<th scope="row" class="left iMust">자택전화</th>
											<td>
												<div class="mFlex2">
<!-- 													<span class="flex"> -->
<!-- 														<select class="it must center" title="국번" disabled> -->
<!-- 															<option>02</option> -->
<!-- 															<option></option> -->
<!-- 														</select> -->
<!-- 													</span> -->
													<span class="flex">
														<input type="text" class="it must" title="자택전화" name="homeTelNo" id="homeTelNo" maxlength="11" onchange="homeTelNoChange(this.value)" oninput="this.value=this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');"/>
													</span>
												</div>
											</td>
											<th scope="row" class="left iMust">휴대전화</th>
											<td colspan="2">
												<div class="mFlex2">
													<span class="flex">
														<input type="text" class="it must" title="휴대전화" name="mphonNo" id="mphonNo" onchange="mphonNoChange(this.value)" oninput="this.value=this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');"/>
													</span>
<!-- 													<a href="#;" class="mBtn1 m lWhite">중복체크</a> -->
												</div>
											</td>
											<th scope="row" class="left iMust">이메일</th>
											<td colspan="4">
												<div class="mFlex2">
													<span class="flex">
														<input type="text" class="it must" title="이메일" name="emailAddr" id="emailAddr" >
													</span>
<!-- 													<a href="#;" class="mBtn1 m lWhite">중복체크</a> -->
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row" class="left">고객상태</th>
                                            <td>
                                                <!-- <div class="mFlex2">
                                                    <a href="#;" class="mBtn1 m r5 lPrimary" data-click="memshipDormancy" id="btnMemshipDormancy" style="margin-left: 14px" ><span>휴면</span></a>
                                                    <a href="#;" class="mBtn1 m r5 lPrimary" data-click="deleteMemShip" id="btnDeleteMemShip" style="margin-left: 5px" ><span>탈회</span></a>
                                                </div> -->
                                                <code:commCode className="it must center" id="custStatusCd" name="custStatusCd" codeCd="CU020" prefixValue="" multiple="false" others="disabled"/>
                                            </td>
											<th scope="row" class="left">고객유형</th>
											<td>
												<code:commCode className="it must center" id="custTypeCd" name="custTypeCd" codeCd="CU030" prefixValue="" multiple="false" others="disabled" />
											</td>
											<th scope="row" class="left">고객구분</th>
											<td>
												<code:commCode className="it must center" id="custDivCd" name="custDivCd" codeCd="CU010" prefixValue="" multiple="false" others="disabled"/>
											</td>
											<th scope="row" class="left"><span >정보변경</span></th>
											<td colspan="3">
												<input type="text" maxlength="19" data-type="datetime" class="it must center" title="정보변경" id="amdDt" name="amdDt" disabled="disabled" >
											</td>
<!-- 											<th scope="row" class="left"><span >외국인</span></th> -->
<!-- 											<td> -->
<!-- 												<input type="text" class="it must" title="외국인" disabled="disabled" > -->
<!-- 											</td> -->
										</tr>
									</tbody>
								</table>
							</div>
		
						</div>										
						<!-- //기본정보 -->
						
						<!-- 멤버십정보 -->
						<div class="col w43per">
							<div class="gTitle1 line">
								<h3 class="mTitle1">멤버십정보</h3>
								<div class="gRt">
									<!-- <a href="#;" class="mBtn1 r5 lPrimary" data-click="popupTopJourney" id="btnTopJourney" ><span class="iJourney">등급</span></a> -->
									<a href="#;" class="mBtn1 r5 lPrimary" data-auth-type="c" style="display:none"  data-click="popupTopAdPoint" id="btnTopAdPoint" ><span class="iAdPoint">승급점수</span></a>
									<a href="#;" class="mBtn1 r5 lPrimary" data-auth-type="c" style="display:none" data-click="popupTopPoint" id="btnTopPoint" ><span class="iPoint">포인트</span></a>
									<a href="#;" class="mBtn1 r5 lPrimary" data-auth-type="c" style="display:none" data-click="popupTopStamp" id="btnTopStamp" ><span class="iStamp">스템프</span></a>
									<a href="#;" class="mBtn1 r5 lPrimary" data-auth-type="c" style="display:none" data-click="popupTopCoupon" id="btnTopCoupon" ><span class="iCoupon">쿠폰</span></a>
									<!-- <a href="#;" class="mBtn1 r5 lPrimary" data-click="popupTopCard" id="btnTopCard" ><span class="iCard">카드</span></a> -->
								</div>
							</div>
<!-- 							<div class="gProfile1"> -->
<!-- 								<div class="mImg1" style="background-image:url(/static/cmm/images/x_profile1.png);"></div> -->
								<div class="mBoard2">
									<table>
										<caption>멤버십정보</caption>
										<colgroup>
											<col width="13%">
											<col width="*">
											<col width="14%">
											<col width="*">
											<col width="19%">
											<col width="*">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row" class="left"><span >멤버십 ID</span></th>
												<td colspan="2">
													<input type="text" class="it must" title="멤버십 ID" name="mshipLoginId"  id="mshipLoginId" disabled="disabled">
													<input type="hidden" class="it must" title="멤버십여부" name="mshipSbscYn"  id="mshipSbscYn" disabled="disabled">
												</td>
												<th scope="row" class="left"><span >카드번호</span></th>
												<td colspan="2">
													<input type="text" class="it must" title="카드번호" name="cardNo" id="cardNo" disabled="disabled">
												</td>
											</tr>
											<tr>
												<th scope="row" class="left">회원구분</th>
												<td>
													<code:commCode className="it must center" id="mshipTypeCd" name="mshipTypeCd" codeCd="MB010" prefixValue="" multiple="false" others="disabled "/>
												</td>
												<th scope="row" class="left">제휴사명</th>
												<td>
													<input type="text" class="it must center" title="제휴사명" name="cprtCmpNm" id="cprtCmpNm" disabled="disabled">
												</td>
												<th scope="row" class="left">멤버십 가입일자</th>
												<td>
													<input type="text" maxlength="10" data-type="datetime" class="it must center" title="멤버십 가입일자" name="mshipSbscDt" id="mshipSbscDt" maxlength="8" disabled="disabled">
												</td>
											</tr>
											<tr>
												<th scope="row" class="left">회원등급</th>
												<td>
													<code:commCode className="it must center" id="mshipGradeCd" name="mshipGradeCd" codeCd="MB020" prefixValue="" multiple="false" others="disabled "/>
												</td>
												<th scope="row" class="left">승급점수</th>
												<td>
													<input type="text" class="it must center" title="멤버십 채널" id="mshipAdvncmtScore" name="mshipAdvncmtScore" disabled="disabled" >
												</td>												
												<th scope="row" class="left">예정등급</th>
												<td>
													<code:commCode className="it must center" id="mshipExptGradeCd" name="mshipExptGradeCd" codeCd="MB020" prefixValue="" multiple="false" others="disabled "/>
<!-- 													<input type="text" class="it must center" title="등급변경" id="mshipExptGradeCd" name="mshipExptGradeCd" disabled="disabled" > -->
												</td>

											</tr>
											<!-- 22.11.15 명칭 변경 -->
											<tr>
												<!-- <th scope="row" class="left">멤버쉽 여부</th> -->
												<th scope="row" class="left">멤버십 여부</th>
												<td>
													<input type="text" class="it must" title="멤버십 여부" name="mshipSbscYnView" id="mshipSbscYnView" disabled="disabled">
												</td>
												<!-- <th scope="row" class="left">CI 여부</th> -->
												<th scope="row" class="left">본인인증 여부</th>
												<td>
													<input type="text" class="it must" title="본인인증 여부" name="ciCertfYn" id="ciCertfYn" disabled="disabled">
												</td>
												<!-- <th scope="row" class="left">DI 여부</th> -->
												<th scope="row" class="left">쿠폰 보유 개수</th>
												<td>
													<input type="text" class="it must" title="쿠폰 보유 개수" name="couponCnt" id="couponCnt" disabled="disabled">
												</td>
											</tr>
										</tbody>
									</table>
								</div>
<!-- 							</div> -->
						</div>
						<!-- //멤버십정보 -->

					</div>


					
					<!-- //row -->
					<!-- row -->
					<div class="row">
						<!-- 선택정보 -->
						<div class="col w57per">
							<div class="gTitle1 line">
								<h3 class="mTitle1">선택정보</h3>
							</div>
							<div class="mBoard2">
								<table>
									<caption>선택정보</caption>
									<colgroup>
										<col width="11%">
										<col width="19%">
										<col width="10%">
										<col width="*">
										<col width="9%">
										<col width="*">
										<col width="9%">
										<col width="14%">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" class="left iMust">기본주소</th>
											<td colspan="5">
												<div class="mFlex2">
													<div class="mFind1">
														<input type="text" class="it must" title="우편번호" name="zipCd" id="zipCd" disabled="disabled">
														<a href="#" data-click="popupZip" id="btnPopupZip" class="iFind">검색</a>
													</div>
													<input type="text" class="it must" title="주소" name="addr1Ctnts" id="addr1Ctnts" >
													
<!-- 													<input type="text" class="it must" title="상세주소" name="addr2Ctnts" id="addr2Ctnts" disabled="disabled"> -->
												</div>
											</td>

											<th scope="row" class="left iMust">주거평수</th>
											<td>
												<code:commCode className="it must center" id="dwelNfpyCd" name="dwelNfpyCd" codeCd="CU050" prefixValue="" multiple="false" />
											</td>
										</tr>
										<tr>
											<th scope="row" class="left iMust">상세주소</th>
											<td colspan="3">
												<div class="mFlex2">
													<input type="text" class="it must" title="상세주소" name="addr2Ctnts" id="addr2Ctnts" >
												</div>
											</td>											
											<th scope="row" class="left">주의여부</th>
											<td colspan="1">
												<div class="mFlex2">
													<input type="text" class="it must" title="블랙리스트고객여부" id="bllkmshpYn" name="bllkmshpYn" disabled="disabled" >
												</div>
											</td>

											<th scope="row" class="left iMust">보호가족</th>
											<td colspan="3">
												<code:commCode className="it must center" id="prtctFamlyYn" name="prtctFamlyYn" codeCd="S050" prefixValue="" multiple="false" />
											</td>									
										</tr>
										<tr>
											<th scope="row" class="left">추천인 고객번호</th>
											<td>
												<input type="text" class="it must" title="추천인 고객번호" name="rcmdrCustNo" id="rcmdrCustNo" disabled="disabled">
											</td>
											<th scope="row" class="left">추천인 임직원</th>
											<td>
												<input type="text" class="it must" title="추천인 임직원" name="rcmdExecvdempNo" id="rcmdExecvdempNo" disabled="disabled">
											</td>
											<th scope="row" class="left">가입매장</th>
											<td>
												<div class="mFind1">
													<input type="text" class="it must" title="가입매장" name="rcmdStorNo" id="rcmdStorNo" disabled="disabled">
													<!-- <a href="#;" class="iFind">검색</a> -->
												</div>
											</td>
											<th scope="row" class="left">매장명</th>
											<td>
												<input type="text" class="it must" title="매장명" id="rcmdStorNoNm" name="rcmdStorNoNm" disabled="disabled" >
											</td>
										</tr>
										<tr>
											<th scope="row" class="left iMust">결혼여부</th>
											<td>
												<code:commCode className="it must center" id="marryYn" name="marryYn" codeCd="CU130" prefixValue="" multiple="false" />
											</td>
											<th scope="row" class="left">가족관계</th>
											<td>
												<code:commCode className="it must center" id="famlyRelCd" name="famlyRelCd" codeCd="CU040" prefixValue="" multiple="false" others="disabled "/>
											</td>
											<th scope="row" class="left">관심분야</th>
											<td class="left" colspan="3">
												<label class="mCheckbox1">
													<input type="checkbox" title="건강" data-intrst="intrstFildCd" id="intrstFildCd1" name="intrstFildCd1" value="001" >
													<span class="label">건강</span>
												</label>
												<label class="mCheckbox1">
													<input type="checkbox" title="음식" data-intrst="intrstFildCd" id="intrstFildCd2" name="intrstFildCd2" value="002" >
													<span class="label">음식</span>
												</label>
												<label class="mCheckbox1">
													<input type="checkbox" title="주거" data-intrst="intrstFildCd" id="intrstFildCd3" name="intrstFildCd3" value="003" >
													<span class="label">주거</span>
												</label>
												<label class="mCheckbox1">
													<input type="checkbox" title="의료" data-intrst="intrstFildCd" id="intrstFildCd4" name="intrstFildCd4" value="004" >
													<span class="label">의료</span>
												</label>
												<label class="mCheckbox1">
													<input type="checkbox" title="스포츠" data-intrst="intrstFildCd" id="intrstFildCd5" name="intrstFildCd5" value="005" >
													<span class="label">스포츠</span>
												</label>
												<label class="mCheckbox1">
													<input type="checkbox" title="연애" data-intrst="intrstFildCd" id="intrstFildCd6" name="intrstFildCd6" value="006" >
													<span class="label">연애</span>
												</label>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- //선택정보 -->
						<!-- 정보활용동의 -->
						<div class="col w43per">
							<div class="gTitle1 line">
								<h3 class="mTitle1">정보 활용동의</h3>
								<div class="gRt">
									<!-- <label class="mCheckbox1">
										<input type="checkbox" title="전체 수신거부" id="rcvRfslYn" name="rcvRfslYn" disabled="disabled">
										<span class="label">전체 수신거부</span>
									</label> -->
								</div>
							</div>
							<div class="mBoard2">
								<table>
									<caption>정보 활용동의</caption>
									<colgroup>
										<col width="27%">
										<col width="*">
										<col width="10%">
										<col width="*">
										<col width="9%">
										<col width="*">
										<col width="*">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" class="left">마케팅 개인정보 수집동의</th>
											<td>
												<code:commCode id="marketingAgreeYn" name="marketingAgreeYn" codeCd="CU150" prefixLabel="없음" prefixValue=""/>	<!-- CU161 Y,N -->
												<!-- <input type="text" class="it must" title="마케팅 개인정보 수집동의" id="marketingAgreeYn" name="marketingAgreeYn" disabled="disabled" > -->
												<!-- <input type="text" class="it must" title="마케팅 개인정보 수집동의" id="alrmTkRcvAgreeYn" name="alrmTkRcvAgreeYn" disabled="disabled" > -->
<!-- 												<select class="it must center" title="알림톡 수신동의" id="alrmTkRcvAgreeYn" name="alrmTkRcvAgreeYn" disabled> -->
<!-- 													<option>Y</option> -->
<!-- 													<option>N</option> -->
<!-- 												</select> -->
											</td>
											<th scope="row" class="bgWhite">동의일</th>
											<td>
												<input type="text" maxlength="10" data-type="datetime" class="it must center" title="동의일" name="marketingAgreeDt" id="marketingAgreeDt" disabled="disabled">
												<!-- <input type="text" maxlength="10" data-type="datetime" class="it must center" title="동의일" name="alrmTkRcvAgreeDt" id="alrmTkRcvAgreeDt" disabled="disabled"> -->
											</td>
											<th scope="row" class="bgWhite">채널</th>
											<td>
												<input type="text" class="it must" title="채널" name="marketingAgreeChlCd" id="marketingAgreeChlCd" disabled="disabled">
												<!-- <input type="text" class="it must" title="채널" name="alrmTkRcvAgreeChlCd" id="alrmTkRcvAgreeChlCd" disabled="disabled"> -->
											</td>
											<!-- <th scope="row" class="bgWhite">유효기간</th>
											<td>
												<input type="text" maxlength="10" data-type="datetime" class="it must center" title="유효기간" name="indiInfoValidPerdEndDt3" id="indiInfoValidPerdEndDt3" disabled="disabled" >
											</td> -->
										</tr>
										<tr>
											<th scope="row" class="left">SMS 수신동의</th>
											<td>
												<code:commCode id="smsRcvAgreeYn" name="smsRcvAgreeYn" codeCd="CU150" prefixLabel="없음" prefixValue=""/>
												<!-- <input type="text" class="it must" title="SMS 수신동의" id="smsRcvAgreeYn" name="smsRcvAgreeYn" disabled="disabled" > -->
<!-- 												<select class="it must center" title="SMS 수신동의" id="smsRcvAgreeYn" name="smsRcvAgreeYn" disabled> -->
<!-- 													<option>Y</option> -->
<!-- 													<option>N</option> -->
<!-- 												</select> -->
											</td>
											<th scope="row" class="bgWhite">동의일</th>
											<td>
												<input type="text" maxlength="10" data-type="datetime" class="it must center" title="동의일" name="smsRcvAgreeDt" id="smsRcvAgreeDt" disabled="disabled">
											</td>
											<th scope="row" class="bgWhite">채널</th>
											<td>
												<input type="text" class="it must" title="채널" name="smsRcvAgreeChlCd" id="smsRcvAgreeChlCd" disabled="disabled">
											</td>
											<!-- <th scope="row" class="bgWhite">유효기간</th>
											<td>
												<input type="text" maxlength="10" data-type="datetime" class="it must center" title="유효기간" name="indiInfoValidPerdEndDt1" id="indiInfoValidPerdEndDt1" disabled="disabled" >
											</td> -->
										</tr>
										<tr>
											<th scope="row" class="left">이메일 수신동의</th>
											<td>
												<code:commCode id="emailRcvAgreeYn" name="emailRcvAgreeYn" codeCd="CU150" prefixLabel="없음" prefixValue=""/>
												<!-- <input type="text" class="it must" title="이메일 수신동의" id="emailRcvAgreeYn" name="emailRcvAgreeYn" disabled="disabled" > -->
<!-- 												<select class="it must center" title="이메일 수신동의" id="emailRcvAgreeYn" name="emailRcvAgreeYn" disabled> -->
<!-- 													<option>Y</option> -->
<!-- 													<option>N</option> -->
<!-- 												</select> -->
											</td>
											<th scope="row" class="bgWhite">동의일</th>
											<td>
												<input type="text" maxlength="10" data-type="datetime" class="it must center" title="동의일" name="emailRcvAgreeDt" id="emailRcvAgreeDt" disabled="disabled">
											</td>
											<th scope="row" class="bgWhite">채널</th>
											<td>
												<input type="text" class="it must" title="채널" name="emailRcvAgreeChlCd" id="emailRcvAgreeChlCd" disabled="disabled">
											</td>
											<!-- <th scope="row" class="bgWhite">유효기간</th>
											<td>
												<input type="text" maxlength="10" data-type="datetime" class="it must center" title="유효기간" name="indiInfoValidPerdEndDt2" id="indiInfoValidPerdEndDt2" disabled="disabled" >
											</td> -->
										</tr>
										<tr>
											<th scope="row" class="left">PUSH 수신동의</th>
											<td>
												<code:commCode id="pushRcvAgreeYn" name="pushRcvAgreeYn" codeCd="CU150" prefixLabel="없음" prefixValue=""/>
												<!-- <input type="text" class="it must" title="PUSH 수신동의" id="pushRcvAgreeYn" name="pushRcvAgreeYn" disabled="disabled" > -->
<!-- 												<select class="it must center" title="PUSH 수신동의" name="pushRcvAgreeYn" id="pushRcvAgreeYn" disabled> -->
<!-- 													<option>Y</option> -->
<!-- 													<option>N</option> -->
<!-- 												</select> -->
											</td>
											<th scope="row" class="bgWhite">동의일</th>
											<td>
												<input type="text" maxlength="10" data-type="datetime" class="it must center" title="동의일" name="pushRcvAgreeDt" id="pushRcvAgreeDt" disabled="disabled">
											</td>
											<th scope="row" class="bgWhite">채널</th>
											<td>
												<input type="text" class="it must" title="채널" name="pushRcvAgreeChlCd" id="pushRcvAgreeChlCd" disabled="disabled">
											</td>
											<!-- <th scope="row" class="bgWhite">유효기간</th>
											<td>
												<input type="text" maxlength="10" data-type="datetime" class="it must center" title="유효기간" name="indiInfoValidPerdEndDt4" id="indiInfoValidPerdEndDt4" disabled="disabled" >
											</td> -->
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- //정보활용동의 -->
						
					</div>
					
					<!-- //row -->
					</form>
				</div>
				<!-- //box -->
<!-- 개인고객일때  -->
<!-- --------------------------------------------------------------------------------------------------------- -->
<!-- 법인고객일때  -->
				<div class="mBox1 pt25" id="custType2" hidden="true"> <!-- class="pt25" : padding top 25px -->
				<form  id="frmDetail2">
					<!-- row -->
					<div class="row">
						<!-- 기본정보 -->
						<div class="col w57per">
							<div class="gTitle1 line">
								<h3 class="mTitle1">기본정보</h3>
								<div class="gRt">
								    <a href="#;" class="mBtn1 r5 lPrimary" data-click="memshipDormancy" id="btnMemshipDormancy"><span>휴면</span></a>
								    <a href="#;" class="mBtn1 r5 lPrimary" data-click="memshipCancelDormancy" id="btnMemshipCancelDormancy"><span>휴면취소</span></a>
                                    <a href="#;" class="mBtn1 r5 lPrimary" data-click="deleteMemShip" id="btnDeleteMemShip"><span>삭제</span></a>
									<a href="#;" class="mBtn1 r5 lPrimary" data-click="updateCust" id="btnUpdateCust" ><span>수정</span></a>

								</div>	
							</div>
							<div class="mBoard2">
								<table>
									<caption>기본정보</caption>
									<colgroup>
										<col width="11%">
										<col width="17%">
										<col width="7%">
										<col width="*">
										<col width="7%">
										<col width="*">
										<col width="8%">
										<col width="10%">
										<col width="7%">
										<col width="10%">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" class="left"><span>통합고객번호</span></th>
											<td>
												<input type="text" class="it must" title="통합고객번호" name="itgCustNo" id="itgCustNo" disabled="disabled">
											</td>
											<th scope="row" class="left">고객명</th>
											<td>
												<input type="text" class="it must" title="고객명" name="custNm" id="custNm" disabled="disabled">
											</td>
											<th scope="row" class="left" ><span class="iMust">사업번호</span></th>
											<td>
												<input type="text" class="it must center" title="사업자번호" name="bizNo" id="bizNo" disabled="disabled">
											</td>
											<th scope="row" class="left"><span class="iMust">대표자</span></th>
											<td>
												<input type="text" class="it must center" title="대표자" name="repNm" id="repNm" disabled="disabled">
											</td>
											<th scope="row" class="left"><span class="iMust">법인번호</span></th>
											<td>
												<input type="text" class="it must center" title="법인번호" name="corpRegNo" id="corpRegNo" disabled="disabled">
											</td>
										</tr>
										<tr>
											<th scope="row" class="left">법인전화</th>
											<td>
												<div class="mFlex2">
<!-- 													<span class="flex"> -->
<!-- 														<select class="it must center" title="국번" disabled> -->
<!-- 															<option>02</option> -->
<!-- 															<option></option> -->
<!-- 														</select> -->
<!-- 													</span> -->
													<span class="flex">
														<input type="text" class="it must" title="법인전화" name="corpTelNo" id="corpTelNo"  disabled="disabled">
													</span>
												</div>
											</td>
											<th scope="row" class="left">휴대전화</th>
											<td colspan="1">
												<div class="mFlex2">
													<span class="flex">
														<input type="text" class="it must" title="휴대전화" name="mphonNo" id="mphonNo" disabled="disabled">
													</span>
<!-- 													<a href="#;" class="mBtn1 m lWhite">중복체크</a> -->
												</div>
											</td>
											<th scope="row" class="left"><span class="iMust">고객상태</span></th>
											<td>
												<code:commCode className="it must center" id="custStatusCd" name="custStatusCd" codeCd="CU020" prefixValue="" multiple="false" others="disabled " />
											</td>
											<th scope="row" colspan="2" class="left"><span class="iMust">담당자휴대전화</span></th>
											<td colspan="2">
												<div class="mFlex2">
													<span class="flex">
														<input type="text" class="it must" title="휴대전화" name="picMphonNo" id="picMphonNo" disabled="disabled">
													</span>
<!-- 													<a href="#;" class="mBtn1 m lWhite">중복체크</a> -->
												</div>
											</td>		
										</tr>
										<tr>
											<th scope="row" class="left">이메일</th>
											<td >
												<div class="mFlex2">
													<span class="flex">
														<input type="text" class="it must" title="이메일" name="emailAddr" id="emailAddr" disabled="disabled">
													</span>
<!-- 													<a href="#;" class="mBtn1 m lWhite">중복체크</a> -->
												</div>
											</td>
											<th scope="row" class="left">고객유형</th>
											<td>
												<code:commCode className="it must center" id="custTypeCd" name="custTypeCd" codeCd="CU030" prefixValue="" multiple="false" others="disabled "/>
											</td>
											<th scope="row" class="left"><span class="iMust">담당자명</span></th>
											<td>
												<input type="text" class="it must" title="담당자명" name="picNm" id="picNm" disabled="disabled">
											</td>
											<th scope="row" colspan="2" class="left"><span class="iMust">담당자이메일</span></th>
											<td colspan="2">
												<div class="mFlex2">
													<span class="flex">
														<input type="text" class="it must" title="담당자이메일" name="picEmailAddr" id="picEmailAddr" disabled="disabled">
													</span>
<!-- 													<a href="#;" class="mBtn1 m lWhite">중복체크</a> -->
												</div>
											</td>											
<!-- 											<th scope="row" class="left"><span >외국인</span></th> -->
<!-- 											<td> -->
<!-- 												<input type="text" class="it must" title="외국인" disabled="disabled" > -->
<!-- 											</td> -->
										</tr>
									</tbody>
								</table>
							</div>
						</div>										
						<!-- //기본정보 -->
						<!-- 멤버십정보 -->
						<div class="col w43per">
							<div class="gTitle1 line">
								<h3 class="mTitle1">멤버십정보</h3>
								<div class="gRt">
									<a href="#;" class="mBtn1 r5 lPrimary" data-click="popupTopJourney" id="btnTopJourney" ><span class="iJourney">등급</span></a>
									<a href="#;" class="mBtn1 r5 lPrimary" data-click="popupTopAdPoint" id="btnTopAdPoint" ><span class="iAdPoint">승급점수</span></a>								
									<a href="#;" class="mBtn1 r5 lPrimary" data-click="popupTopPoint" id="btnTopPoint" ><span class="iPoint">포인트</span></a>
									<a href="#;" class="mBtn1 r5 lPrimary" data-click="popupTopStamp" id="btnTopStamp" ><span class="iStamp">스템프</span></a>
									<a href="#;" class="mBtn1 r5 lPrimary" data-click="popupTopCoupon" id="btnTopCoupon" ><span class="iCoupon">쿠폰</span></a>
									<!-- <a href="#;" class="mBtn1 r5 lPrimary" data-click="popupTopCard" id="btnTopCard" ><span class="iCard">카드</span></a> -->
								</div>
							</div>
<!-- 							<div class="gProfile1"> -->
<!-- 								<div class="mImg1" style="background-image:url(/static/cmm/images/x_profile1.png);"></div> -->
								<div class="mBoard2">
									<table>
										<caption>멤버십정보</caption>
										<colgroup>
											<col width="13%">
											<col width="*">
											<col width="14%">
											<col width="*">
											<col width="19%">
											<col width="*">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row" class="left"><span >멤버십 ID</span></th>
												<td colspan="2">
													<input type="text" class="it must" title="멤버십 ID" name="mshipLoginId"  id="mshipLoginId" disabled="disabled">
													<input type="hidden" class="it must" title="멤버십여부" name="mshipSbscYn"  id="mshipSbscYn" disabled="disabled">
												</td>
												<th scope="row" class="left"><span >카드번호</span></th>
												<td colspan="2">
													<input type="text" class="it must" title="카드번호" name="cardNo" id="cardNo" disabled="disabled">
												</td>
											</tr>
											<tr>
												<th scope="row" class="left">회원구분</th>
												<td>
													<code:commCode className="it must center" id="mshipTypeCd" name="mshipTypeCd" codeCd="MB010" prefixValue="" multiple="false" others="disabled "/>
												</td>
												<th scope="row" class="left">제휴사명</th>
												<td>
													<input type="text" class="it must center" title="제휴사명" name="cprtCmpNm" id="cprtCmpNm" disabled="disabled">
												</td>
												<th scope="row" class="left">멤버십 가입일자</th>
												<td>
													<input type="text" maxlength="10" data-type="datetime" class="it must center" title="멤버십 가입일자" name="mshipSbscDt" id="mshipSbscDt" maxlength="8" disabled="disabled">
												</td>
											</tr>
											<tr>
												<th scope="row" class="left">회원등급</th>
												<td>
													<code:commCode className="it must center" id="mshipGradeCd" name="mshipGradeCd" codeCd="MB020" prefixValue="" multiple="false" others="disabled "/>
												</td>
												<th scope="row" class="left">승급점수</th>
												<td>
													<input type="text" class="it must center" title="멤버십 채널" id="mshipAdvncmtScore" name="mshipAdvncmtScore" disabled="disabled" >
												</td>												
												<th scope="row" class="left">예정등급</th>
												<td>
													<code:commCode className="it must center" id="mshipExptGradeCd" name="mshipExptGradeCd" codeCd="MB020" prefixValue="" multiple="false" others="disabled "/>
<!-- 													<input type="text" class="it must center" title="등급변경" id="mshipExptGradeCd" name="mshipExptGradeCd" disabled="disabled" > -->
												</td>

											</tr>
										</tbody>
									</table>
								</div>
<!-- 							</div> -->
						</div>
						<!-- //멤버십정보 -->
					</div>
					<!-- //row -->
					<!-- row -->
					<div class="row">
						<!-- 선택정보 -->
						<div class="col w57per">
							<div class="gTitle1 line">
								<h3 class="mTitle1">선택정보</h3>
							</div>
							<div class="mBoard2">
								<table>
									<caption>선택정보</caption>
									<colgroup>
										<col width="13%">
										<col width="13%">
										<col width="11%">
										<col width="*">
										<col width="9%">
										<col width="*">
										<col width="9%">
										<col width="16%">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" class="left">기본주소</th>
											<td colspan="5">
												<div class="mFlex2">
													<div class="mFind1">
														<input type="text" class="it must" title="우편번호" name="zipCd" id="zipCd" disabled="disabled">
<!-- 														<a href="#;" class="iFind">검색</a> -->
													</div>
													<input type="text" class="it must" title="주소" name="addr1Ctnts" id="addr1Ctnts" disabled="disabled">
													
<!-- 													<input type="text" class="it must" title="상세주소" name="addr2Ctnts" id="addr2Ctnts" disabled="disabled"> -->
												</div>
											</td>
											<th scope="row" class="left">주거평수</th>
											<td>
												<code:commCode className="it must center" id="dwelNfpyCd" name="dwelNfpyCd" codeCd="CU050" prefixValue="" multiple="false" others="disabled "/>
											</td>																					

										</tr>
										<tr>
											<th scope="row" class="left">상세주소</th>
											<td colspan="3">
												<div class="mFlex2">
													<input type="text" class="it must" title="상세주소" name="addr2Ctnts" id="addr2Ctnts" disabled="disabled">
												</div>
											</td>											
											<th scope="row" class="left">주의여부</th>
											<td colspan="1">
												<div class="mFlex2">
													<input type="text" class="it must" title="블랙리스트고객여부" id="bllkmshpYn" name="bllkmshpYn" disabled="disabled" >
												</div>
											</td>
											<th scope="row" class="left">보호가족</th>
											<td colspan="3">
												<code:commCode className="it must center" id="prtctFamlyYn" name="prtctFamlyYn" codeCd="S050" prefixValue="" multiple="false" />
											</td>									
										</tr>
										<tr>
											<th scope="row" class="left">추천인 고객번호</th>
											<td>
												<input type="text" class="it must" title="추천인 고객번호" name="rcmdrCustNo" id="rcmdrCustNo" disabled="disabled">
											</td>
											<th scope="row" class="left">추천인 임직원</th>
											<td>
												<input type="text" class="it must" title="추천인 임직원" name="rcmdExecvdempNo" id="rcmdExecvdempNo" disabled="disabled">
											</td>
											<th scope="row" class="left">가입매장</th>
											<td>
												<div class="mFind1">
													<input type="text" class="it must" title="가입매장" name="rcmdStorNo" id="rcmdStorNo" disabled="disabled">
													<a href="#;" class="iFind">검색</a>
												</div>
											</td>
											<th scope="row" class="left">매장명</th>
											<td>
												<input type="text" class="it must" title="매장명" id="rcmdStorNm" name="rcmdStorNm" disabled="disabled" >
											</td>
										</tr>
										<tr>
											<th scope="row" class="left">결혼여부</th>
											<td>
												<code:commCode className="it must center" id="marryYn" name="marryYn" codeCd="CU130" prefixValue="" multiple="false" others="disabled "/>
											</td>
											<th scope="row" class="left">가족관계</th>
											<td>
												<code:commCode className="it must center" id="famlyRelCd" name="famlyRelCd" codeCd="CU040" prefixValue="" multiple="false" others="disabled "/>
											</td>
											<th scope="row" class="left">관심분야</th>
											<td class="left" colspan="3">
												<label class="mCheckbox1">
													<input type="checkbox" title="건강" id="intrstFildCd1" name="intrstFildCd1" value="001" disabled="disabled">
													<span class="label">건강</span>
												</label>
												<label class="mCheckbox1">
													<input type="checkbox" title="음식" id="intrstFildCd2" name="intrstFildCd2" value="002" disabled="disabled">
													<span class="label">음식</span>
												</label>
												<label class="mCheckbox1">
													<input type="checkbox" title="주거" id="intrstFildCd3" name="intrstFildCd3" value="003"  disabled="disabled">
													<span class="label">주거</span>
												</label>
												<label class="mCheckbox1">
													<input type="checkbox" title="의료" id="intrstFildCd4" name="intrstFildCd4" value="004" disabled="disabled">
													<span class="label">의료</span>
												</label>
												<label class="mCheckbox1">
													<input type="checkbox" title="스포츠" id="intrstFildCd5" name="intrstFildCd5" value="005" disabled="disabled">
													<span class="label">스포츠</span>
												</label>
												<label class="mCheckbox1">
													<input type="checkbox" title="연애" id="intrstFildCd6" name="intrstFildCd6" value="006" disabled="disabled">
													<span class="label">연애</span>
												</label>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- //선택정보 -->
						<!-- 정보활용동의 -->
						<div class="col w43per">
							<div class="gTitle1 line">
								<h3 class="mTitle1">정보 활용동의</h3>
								<div class="gRt">
									<!-- <label class="mCheckbox1">
										<input type="checkbox" title="전체 수신거부" id="rcvRfslYn" name="rcvRfslYn" disabled="disabled">
										<span class="label">전체 수신거부</span> -->
<%-- 										<code:commCode className="it must center" id="rcvRfslYn" name="rcvRfslYn" codeCd="CU050" prefixValue="" multiple="false" others="disabled "/> --%>
									<!-- </label> -->
								</div>
							</div>
							<div class="mBoard2">
								<table>
									<caption>정보 활용동의</caption>
									<colgroup>
										<col width="27%">
										<col width="*">
										<col width="10%">
										<col width="*">
										<col width="9%">
										<col width="*">
										<col width="*">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" class="left">마케팅 개인정보 수집동의</th>
											<td>
												<input type="text" class="it must" title="마케팅 개인정보 수집동의" id="marketingAgreeYn" name="marketingAgreeYn" disabled="disabled" >
												<!-- <input type="text" class="it must" title="마케팅 개인정보 수집동의" id="alrmTkRcvAgreeYn" name="alrmTkRcvAgreeYn" disabled="disabled" > -->
<!-- 												<select class="it must center" title="알림톡 수신동의" id="alrmTkRcvAgreeYn" name="alrmTkRcvAgreeYn" disabled> -->
<!-- 													<option>Y</option> -->
<!-- 													<option>N</option> -->
<!-- 												</select> -->
											</td>
											<th scope="row" class="bgWhite">동의일</th>
											<td>
												<input type="text" maxlength="10" data-type="datetime" class="it must center" title="동의일" name="marketingAgreeDt" id="marketingAgreeDt" disabled="disabled">
												<!-- <input type="text" maxlength="10" data-type="datetime" class="it must center" title="동의일" name="alrmTkRcvAgreeDt" id="alrmTkRcvAgreeDt" disabled="disabled"> -->
											</td>
											<th scope="row" class="bgWhite">채널</th>
											<td>
												<input type="text" class="it must" title="채널" name="marketingAgreeChlCd" id="marketingAgreeChlCd" disabled="disabled">
												<!-- <input type="text" class="it must" title="채널" name="alrmTkRcvAgreeChlCd" id="alrmTkRcvAgreeChlCd" disabled="disabled"> -->
											</td>
											<!-- <th scope="row" class="bgWhite">유효기간</th>
											<td>
												<input type="text" maxlength="10" data-type="datetime" class="it must center" title="유효기간" name="indiInfoValidPerdEndDt3" id="indiInfoValidPerdEndDt3" disabled="disabled" >
											</td> -->
										</tr>
										<tr>
											<th scope="row" class="left">SMS 수신동의</th>
											<td>
												<input type="text" class="it must" title="SMS 수신동의" id="smsRcvAgreeYn" name="smsRcvAgreeYn" disabled="disabled" >
<!-- 												<select class="it must center" title="SMS 수신동의" id="smsRcvAgreeYn" name="smsRcvAgreeYn" disabled> -->
<!-- 													<option>Y</option> -->
<!-- 													<option>N</option> -->
<!-- 												</select> -->
											</td>
											<th scope="row" class="bgWhite">동의일</th>
											<td>
												<input type="text" maxlength="10" data-type="datetime" class="it must center" title="동의일" name="smsRcvAgreeDt" id="smsRcvAgreeDt" disabled="disabled">
											</td>
											<th scope="row" class="bgWhite">채널</th>
											<td>
												<input type="text" class="it must" title="채널" name="smsRcvAgreeChlCd" id="smsRcvAgreeChlCd" disabled="disabled">
											</td>
											<!-- <th scope="row" class="bgWhite">유효기간</th>
											<td>
												<input type="text" maxlength="10" data-type="datetime" class="it must center" title="유효기간" name="indiInfoValidPerdEndDt5" id="indiInfoValidPerdEndDt5" disabled="disabled" >
											</td> -->
										</tr>
										<tr>
											<th scope="row" class="left">이메일 수신동의</th>
											<td>
												<input type="text" class="it must" title="이메일 수신동의" id="emailRcvAgreeYn" name="emailRcvAgreeYn" disabled="disabled" >
<!-- 												<select class="it must center" title="이메일 수신동의" id="emailRcvAgreeYn" name="emailRcvAgreeYn" disabled> -->
<!-- 													<option>Y</option> -->
<!-- 													<option>N</option> -->
<!-- 												</select> -->
											</td>
											<th scope="row" class="bgWhite">동의일</th>
											<td>
												<input type="text" maxlength="10" data-type="datetime" class="it must center" title="동의일" name="emailRcvAgreeDt" id="emailRcvAgreeDt" disabled="disabled">
											</td>
											<th scope="row" class="bgWhite">채널</th>
											<td>
												<input type="text" class="it must" title="채널" name="emailRcvAgreeChlCd" id="emailRcvAgreeChlCd" disabled="disabled">
											</td>
											<!-- <th scope="row" class="bgWhite">유효기간</th>
											<td>
												<input type="text" maxlength="10" data-type="datetime" class="it must center" title="유효기간" name="indiInfoValidPerdEndDt6" id="indiInfoValidPerdEndDt6" disabled="disabled" >
											</td> -->
										</tr>
										<tr>
											<th scope="row" class="left">PUSH 수신동의</th>
											<td>
												<input type="text" class="it must" title="PUSH 수신동의" id="pushRcvAgreeYn" name="pushRcvAgreeYn" disabled="disabled" >
<!-- 												<select class="it must center" title="PUSH 수신동의" name="pushRcvAgreeYn" id="pushRcvAgreeYn" disabled> -->
<!-- 													<option>Y</option> -->
<!-- 													<option>N</option> -->
<!-- 												</select> -->
											</td>
											<th scope="row" class="bgWhite">동의일</th>
											<td>
												<input type="text" maxlength="10" data-type="datetime" class="it must center" title="동의일" name="pushRcvAgreeDt" id="pushRcvAgreeDt" disabled="disabled">
											</td>
											<th scope="row" class="bgWhite">채널</th>
											<td>
												<input type="text" class="it must" title="채널" name="pushRcvAgreeChlCd" id="pushRcvAgreeChlCd" disabled="disabled">
											</td>
											<!-- <th scope="row" class="bgWhite">유효기간</th>
											<td>
												<input type="text" maxlength="10" data-type="datetime" class="it must center" title="유효기간" name="indiInfoValidPerdEndDt8" id="indiInfoValidPerdEndDt8" disabled="disabled" >
											</td> -->
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- //정보활용동의 -->
						
					</div>
					
					<!-- //row -->
					</form>
				</div>
				<!-- //box -->
<!-- 법인일때 위 기본정보 끝  -->
<!-- --------------------------------------------------------------------------------------------------------- -->
				<!-- tab -->
				<div class="mTab1 hasSub jsTab1" id="tabs">
					
					<ul>
						<li id="syn" class="active" data-tab1-type="6"  >
							<a href="#mainTab06" data-tab1-type="6" onclick="tab1Click(6)" style="cursor:pointer">종합이력</a>
							<div id="syn00" class="sub">
								<a id="syn2" data-url='<c:url value="cmmCustBas/syn/cmmCustSynthesisHst2List"/>' data-tab2-type="30" onclick="tab2Click(30)" style="cursor:pointer">고객여정(전일자)</a> <!-- 22.11.8 종합이력과 고객여정 위치 변경 -->
								<a id="syn1" class="active" data-url='<c:url value="cmmCustBas/syn/cmmCustSynthesisHstList"/>' data-tab2-type="29" onclick="tab2Click(29)" style="cursor:pointer">종합</a>							
							</div>

						</li>					
						<li id="sub" data-tab1-type="1"  >
							<a href="#mainTab01" data-tab1-type="1" onclick="tab1Click(1)" style="cursor:pointer">부가정보</a>
							<div id="sub00" class="sub">
								<a id="sub1" class="active" data-url='<c:url value="cmmCustBas/sub/cmmCustHshldBasList"/>' data-tab2-type="1" onclick="tab2Click(1)" style="cursor:pointer">가구정보</a>
								<a id="sub2" data-url='<c:url value="cmmCustBas/sub/cmmCustCntplcBas"/>' data-tab2-type="2" onclick="tab2Click(2)" style="cursor:pointer">연락처정보</a>
								<a id="sub3" data-url='<c:url value="cmmCustBas/sub/cmmCustInfoPtuseAgreeHstList"/>' data-tab2-type="3" onclick="tab2Click(3)" style="cursor:pointer">정보동의</a>
								<%-- <a id="sub4" data-url='<c:url value="cmmCustBas/sub/cmmRcvRfslHstList"/>' data-tab2-type="4" onclick="tab2Click(4)" style="cursor:pointer">수신거부</a> --%>
								<a id="sub5" data-url='<c:url value="cmmCustBas/sub/cmmCustGradeChngHstList"/>' data-tab2-type="5" onclick="tab2Click(5)" style="cursor:pointer">등급변경</a>
								<a id="sub6" data-url='<c:url value="cmmCustBas/sub/cmmCustInfoChngHstList"/>' data-tab2-type="6" onclick="tab2Click(6)" style="cursor:pointer">정보변경</a>
								<a id="sub7" data-url='<c:url value="cmmCustBas/sub/knownpersonList"/>' data-tab2-type="7" onclick="tab2Click(7)" style="cursor:pointer">지인정보</a>
								<a id="sub8" data-url='<c:url value="cmmCustBas/sub/cmmCustPatronStorBasList"/>' data-tab2-type="8" onclick="tab2Click(8)" style="cursor:pointer">단골매장</a>							
							</div>

						</li>
						<li id="trn" data-tab1-type="2" >
							<a href="#mainTab02" onclick="tab1Click(2)" data-tab1-type="2" style="cursor:pointer">거래이력</a>
							<div id="trn00" class="sub">
								<a class="active" data-url='<c:url value="cmmCustBas/trn/cmmCustBosCntrtTxnList"/>' data-tab2-type="9" onclick="tab2Click(9)" style="cursor:pointer">BOS거래</a>
								<a data-url='<c:url value="cmmCustBas/trn/cmmCustPosSaleHstList"/>' data-tab2-type="28" onclick="tab2Click(28)" style="cursor:pointer">POS거래</a>
							</div>
						</li>
						<li id="cot" data-tab1-type="3">
							<a href="#mainTab03" onclick="tab1Click(3)" data-tab1-type="3" style="cursor:pointer">접촉이력</a>
							<div id="cot00" class="sub">
								<a id="sub10" class="active" data-url='<c:url value="cmmCustBas/cot/cmmCustPhnCnslHistList"/>' data-tab2-type="10" onclick="tab2Click(10)" style="cursor:pointer">상담</a>
								<a id="sub11" data-url='<c:url value="cmmCustBas/cot/cmmCustAsSubmitHistList"/>' data-tab2-type="11" onclick="tab2Click(11)" style="cursor:pointer">AS</a>
								<a id="sub12" data-url='<c:url value="cmmCustBas/cot/cmmCustBosCntrtTxnHCList"/>' data-tab2-type="12" onclick="tab2Click(12)" style="cursor:pointer">홈체험</a>
								<a id="sub13" data-url='<c:url value="cmmCustBas/cot/cmmCustExprnHstList"/>' data-tab2-type="13" onclick="tab2Click(13)" style="cursor:pointer">체험</a>
								<a id="sub14" data-url='<c:url value="cmmCustBas/cot/cmmCustBosHcHstList"/>' data-tab2-type="27" onclick="tab2Click(27)" style="cursor:pointer">HC</a>
								<a id="sub15" data-url='<c:url value="cmmCustBas/sub/ceraCkList"/>' data-tab2-type="14" onclick="tab2Click(14)" style="cursor:pointer">세라체크</a>
								<a id="sub16" data-url='<c:url value="cmmCustBas/sub/ceraDnaList"/>' data-tab2-type="15" onclick="tab2Click(15)" style="cursor:pointer">세라체크DNA</a>
								<a id="sub17" data-url='<c:url value="cmmCustBas/sub/ceraIotList"/>' data-tab2-type="16" onclick="tab2Click(16)" style="cursor:pointer">IOT</a>
								<a id="sub18" data-url='<c:url value="cmmCustBas/sub/recommendList"/>' data-tab2-type="17" onclick="tab2Click(17)" style="cursor:pointer">추천</a>
							</div>
						</li>
						<li id="mem" data-tab1-type="4">
							<a href="#mainTab04" onclick="tab1Click(4)" data-tab1-type="4" style="cursor:pointer">회원이력</a>
							<div id="mem00" class="sub">
								<a class="active" data-url='<c:url value="cmmCustBas/sub/couponList"/>' data-tab2-type="18" value="18getElementByClassName" onclick="tab2Click(18)" style="cursor:pointer">쿠폰</a>
								<a data-url='<c:url value="cmmCustBas/sub/pointList"/>' data-tab2-type="19" onclick="tab2Click(19)" style="cursor:pointer">포인트</a>
								<a data-url='<c:url value="cmmCustBas/sub/stampList"/>' data-tab2-type="20" onclick="tab2Click(20)" style="cursor:pointer">스탬프</a>
								<a data-url='<c:url value="cmmCustBas/sub/cardList"/>' data-tab2-type="21" onclick="tab2Click(21)" style="cursor:pointer">카드</a>
								<a data-url='<c:url value="cmmCustBas/sub/sendList"/>' data-tab2-type="22" onclick="tab2Click(22)" style="cursor:pointer">발송</a>
								<a data-url='<c:url value="cmmCustBas/sub/campaignList"/>' data-tab2-type="25" onclick="tab2Click(25)" style="cursor:pointer">프로모션</a>
								<a data-url='<c:url value="cmmCustBas/sub/advncmtList"/>' data-tab2-type="23" onclick="tab2Click(23)" style="cursor:pointer">승급점수</a>
													
							</div>
						</li>
						<li id="svy" data-tab1-type="5" >
						    <a href="#mainTab02" onclick="searchMove()" data-tab1-type="5" style="cursor:pointer">설문이력</a>
							<%-- <a href="#mainTab02" onclick="tab1Click(5)" data-tab1-type="5" style="cursor:pointer">설문이력</a>
							<div id="trn00" class="sub">
								<a class="active" data-url='<c:url value="cmmCustBas/sub/surveyList"/>' data-tab2-type="26" onclick="tab2Click(26)" style="cursor:pointer">설문</a>
							</div> --%>
						</li>					
					</ul>
				</div>	
<!-- 				<div class="mBox1 pt25" >			 -->
<!-- 				<iframe class="if001" name="iframe" id="iframe" frameborder="0"    src="" scrolling="no"></iframe> -->
<!-- 				</div>   -->
				<!-- //box -->
<!-- 				<div class="mBox1 p10"> -->
				<div id="custType3" class="mBox1" style="height: auto; min-height: 410px;">
					<!-- sort -->
<!-- 					<div class="mSort1"> -->
<!-- 						<div class="mBoard2"> -->
							<iframe name="iframe1" id="iframe1" frameborder="0"  width="100%" height="390px"  src="" scrolling="no"></iframe>
<!-- 						</div> -->
<!-- 					</div> -->
				</div>

			</div>
			
<form id='form1' name='form1' method='post'> 
	<input type=hidden id="USERID" name='USERID' value="${eonUser}">
	<input type=hidden id="VTYPE" name='VTYPE' value='4'>
	<input type=hidden id="CLIENT" name='CLIENT' value=''>
	<input type=hidden id="CAMPAIGN_ID" name='CAMPAIGN_ID' value=''>
	<input type=hidden id='REQ_KEY_INFO' name='REQ_KEY_INFO' value=''>
	<input type=hidden id='MENU_ID' name='MENU_ID' value='WSOMR450P0CR'>
</form>
        
<script>	

var agreement = {};
// padding-bottom: 28.25%; /* 16:9 비율 */ height: 100%; height="410px;" width="1440px" style="height: 425px; width:1440px"
$(document).ready(function(e) {
	isDormancy();
	/* a요소를 클릭 했을 시 */
// 	$('a').click(function(){
// 	/* iframe 요소의 src 속성값을 a 요소의 data-url 속성값으로 변경 */
			
// 		$('#iframe').attr('src',$(this).attr('data-url'));
	
// 	})

// 	$("#biz").show(true);	
	$( '#frmDetail1 [name="marketingAgreeYn"]' ).on('change',function () {
		  agreement.marketingYn = $('#frmDetail1 [name="marketingAgreeYn"]').val();
	});
	$( '#frmDetail1 [name="smsRcvAgreeYn"]' ).on('change',function () {
		  agreement.smsRcvAgreeYn = $('#frmDetail1 [name="smsRcvAgreeYn"]').val();
	});
	$( '#frmDetail1 [name="emailRcvAgreeYn"]' ).on('change',function () {
		  agreement.emailRcvAgreeYn = $('#frmDetail1 [name="emailRcvAgreeYn"]').val();
	});
	$( '#frmDetail1 [name="pushRcvAgreeYn"]' ).on('change',function () {
		  agreement.pushRcvAgreeYn = $('#frmDetail1 [name="pushRcvAgreeYn"]').val();
	});
});

// function resizeTopIframe(dynheight) {  
//     document.getElementById("iframe").style.height = parseInt(dynheight) + 'px';  
// } 



// CR002 또는 CR003
// var moveItgCustNo = "";

/* 공통코드 그리드 load */
function grdList_load(gridView, gridId) {
	
	searchFlag = '${searchFlag}';
	
	if($("[data-custDivCd='1']:checked").val() == 'undefined'){
		$("[data-custDivCd='1']").prop('checked', true);

	}else if($("[data-custDivCd='2']:checked").val() == 'undefined'){
		$("[data-custDivCd='2']").prop('checked', true);

	}else{
		$("[data-custDivCd='2']").prop('checked', true);

	}
 	
	// 
	if($("input[name='custDivCd']:checked").val() == "001"){
		$("#custType1").show();

		$("#custType2").hide();

		parenCustDivCd = $("input[name='custDivCd']:checked").val();
		parenItgCustNo =  $("#frmDetail1").find("[name=itgCustNo]").val();
		parenMshipSbscYn = $("#frmDetail1").find("[name=mshipSbscYn]").val();


	}
	if($("input[name='custDivCd']:checked").val() == "002"){
		$("#custType1").hide();

		$("#custType2").show();

		parenCustDivCd = $("input[name='custDivCd']:checked").val();
		parenItgCustNo =  $("#frmDetail2").find("[name=itgCustNo]").val();
		parenMshipSbscYn = $("#frmDetail2").find("[name=mshipSbscYn]").val();
	
	}	

	tabShowHide();
	
	// 폼초기화
	$('#frmDetail1').clearForm();
	$('#frmDetail2').clearForm();
	grdList.clear();
	tab2Click(nowSubTabNumBer);

	console.log("1번 : " , $("[data-custDivCd='1']:checked").val());
	console.log("2번 : " , $("[data-custDivCd='2']:checked").val());
	
// 	// 폼초기화 후 
// 	if($("[data-custDivCd='1']:checked").val() != 'undefined' && $("[data-custDivCd='2']:checked").val() != 'undefined'){

// 	}else if($("[data-custDivCd='2']:checked").val() == 'undefined'){
// 		$("[data-custDivCd='2']").prop('checked', true);

// 	}else if($("[data-custDivCd='1']:checked").val() == 'undefined'){
// 		$("[data-custDivCd='1']").prop('checked', true);
// // 		moveItgCustNo = ${itgCustNo};
// // 		search();
// 	}

	if(searchFlag == "1"){
		search();	
	}

}

var currRowKey = 0;	//변경이 있을 경우에도 기존 선택된 로우정보를 유지할 수 있도록 변수지정
function grdList_dataLoaded(grid,jsonList,data){
	if(jsonList.length > 0){	//검색된 자료가 있다면 제일최상위 로우를 선택한다.
		grdList.focusAt(currRowKey, 1);	//data-load-focus로 인해 안해도 된다.
	}else{	//검색된 자료가 없다면 기존 출력됐던 정보들을 초기화 한다.
		currRowKey = 0;
	}
}

/* 고객구분 : 개인 001 , 법인 002 에따라 쇼히든처리 */
function tabShowHide() {
	
	if($("input[name='custDivCd']:checked").val() == "001"){
		// 이력탭
// 		$("#sub").show();
			$("#sub1").show();
			$("#sub2").show();
			$("#sub3").show();
			$("#sub4").show();
			$("#sub5").show();
			$("#sub6").show();
			$("#sub7").show();
			$("#sub8").show();
			
// 		$("#cot").show();
			$("#sub10").show();
			$("#sub11").show();
			$("#sub12").show();
			$("#sub13").show();
			$("#sub14").show();
			$("#sub15").show();
			$("#sub16").show();
			$("#sub17").show();
			$("#sub18").show();		
			
// 		$("#trn").show();
// 		$("#mem").show();
// 		$("#svy").show();
	}
	if($("input[name='custDivCd']:checked").val() == "002"){
		// 부가정보
// 		$("#sub").show();
			$("#sub1").hide();
			$("#sub2").show();
			$("#sub3").show();
			$("#sub4").show();
			$("#sub5").show();
			$("#sub6").show();
			$("#sub7").hide();
			$("#sub8").hide();;
		
// 		$("#cot").show();
			$("#sub10").show();
			$("#sub11").show();
			$("#sub12").hide();
			$("#sub13").show();
			$("#sub14").show();
			$("#sub15").hide();
			$("#sub16").hide();
			$("#sub17").show();
			$("#sub18").show();	
		
			
// 		$("#trn").hide();
// 		$("#mem").hide();
// 		$("#svy").hide();
	}	
	
}



$("input[name='custDivCd']").change(function() {

	if($("input[name='custDivCd']:checked").val() == "001"){
// 		Utilities.mapToForm(rowData,"frmDetail1");
// 		parenItgCustNo =  $("#frmDetail1").find("[name=itgCustNo]").val();
		

// 		tab2Click(nowSubTabNumBer);

		
	}
	if($("input[name='custDivCd']:checked").val() == "002"){
// 		Utilities.mapToForm(rowData,"frmDetail2");
// 		parenItgCustNo =  $("#frmDetail2").find("[name=itgCustNo]").val();
		
		if(nowTabNumBer == 1 && nowSubTabNumBer == 1 || nowTabNumBer == 1 && nowSubTabNumBer == 7 || nowTabNumBer == 1 && nowSubTabNumBer == 8){
			nowSubTabNumBer = 2;
		}
		else if(nowTabNumBer == 3 && nowSubTabNumBer == 12 || nowTabNumBer == 3 && nowSubTabNumBer == 15 || nowTabNumBer == 3 && nowSubTabNumBer == 16){
			nowSubTabNumBer = 10; 
		}else{
			
		}			
	}	

	$("[data-tab2-type]").removeClass("active");
	$("[data-tab2-type='"+ nowSubTabNumBer +"']").addClass("active");	

	
	if($("input[name='custDivCd']:checked").val() == "001"){
		$("#custType1").show();

		$("#custType2").hide();

		parenCustDivCd = $("input[name='custDivCd']:checked").val();
		parenItgCustNo =  $("#frmDetail1").find("[name=itgCustNo]").val();
		parenMshipSbscYn = $("#frmDetail1").find("[name=mshipSbscYn]").val();


	}
	if($("input[name='custDivCd']:checked").val() == "002"){
		$("#custType1").hide();

		$("#custType2").show();

		parenCustDivCd = $("input[name='custDivCd']:checked").val();
		parenItgCustNo =  $("#frmDetail2").find("[name=itgCustNo]").val();
		parenMshipSbscYn =  $("#frmDetail2").find("[name=parenMshipSbscYn]").val();

		
	}	
	
	tabShowHide();
	
	// 폼초기화
	$('#frmDetail1').clearForm();
	$('#frmDetail2').clearForm();
	grdList.clear();
	tab2Click(nowSubTabNumBer);
//	search();
});


var parenCustDivCd = $("input[name='custDivCd']:checked").val();
var parenItgCustNo = "";
var parenMshipSbscYn = "";
//화면면환시 확인 플래그값
var searchFlag = "0";

/* 필수 값 체크 */
function validate(param){
	
    if(!param.custNm && !param.mphonNo && !param.itgCustNo){
        alert("조회조건을 입력해주세요.");
        return false;
    }
    
    return true;
}

function custNmLikeChange(param)
{
	var dataParam = param;
	if($("input[name='custDivCd']:checked").val() == "001"){
		return dataParam;
    }
    if($("input[name='custDivCd']:checked").val() == "002"){
    	dataParam.custNmLike = dataParam.custNm;
    	dataParam.custNm = "";
    	return dataParam;
    }   
}

/* 검색조건 검색 */
function search() {
	
	var param = Utilities.formToMap("frmSearch");
	
	if(!validate(param))
        return;
	
	param = custNmLikeChange(param);

	// 폼클리어
	$('#frmDetail1').clearForm();
	$('#frmDetail2').clearForm();
	
	$("form#frmSearch").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
	
	
// 	if(moveItgCustNo != ""){
// 		param.itgCustNo = moveItgCustNo;
// 	}

// 	param.recordCountPerPage = 100000;
	grdList.loadUrl(url, param);

	// 폼데이터 클리어
	if(grdList.getRowCount() == 0){
		
// 		if($("input[name='custDivCd']:checked").val() == "001"){
// 			$('#frmDetail1').clearForm();
// 		}
// 		if($("input[name='custDivCd']:checked").val() == "002"){
// 			$('#frmDetail2').clearForm();
// 		}	
		
		// 그리드및 고객번호 초기화
		parenItgCustNo =  "";
		parenMshipSbscYn = "";
		
		// 폼초기화
		$('#frmDetail1').clearForm();
		$('#frmDetail2').clearForm();
		grdList.clear();
		tab2Click(nowSubTabNumBer);
		
	}else {
		if($("input[name='custDivCd']:checked").val() == "001"){
			parenItgCustNo =  $("#frmDetail1").find("[name=itgCustNo]").val();
			parenMshipSbscYn =   $("#frmDetail1").find("[name=mshipSbscYn]").val();
		}
		if($("input[name='custDivCd']:checked").val() == "002"){
			parenItgCustNo =  $("#frmDetail2").find("[name=itgCustNo]").val();
			parenMshipSbscYn = $("#frmDetail2").find("[name=mshipSbscYn]").val();
		}		
		
		
	}
	searchFlag = "0";
	
	//grdList_rowChanged(grdList, 1, 1, null)
}

//수정항목 필드 활성화
//	이름
//	휴대전화 : 이름+전화번호 중복시 수정불가
//	일반전화
//	이메일
//	주소
//	가족관계
//	결혼여부
//	주거평수
//	수신동의
//	생년월일
//	성별
//	내외국인여부
//	고객상태 : 휴면->정상, 정상-> 탈퇴 (2개 가능)
//	고객구분	
//function ableCustField(){
//	console.log("선택자 : " , $("[updateyn='Y']"));
//	$("[updateyn='Y']").attr("disabled", "");

//}
//function disableCustField(){
//	$("[updateyn='Y']").attr("disabled", "disabled");

//}
//고객정보 수정
function updateCust(){

	if(parenItgCustNo == ""){
		alert("회원을 먼저 선택해주세요.");
		return;
	}else{
		
		if(Object.keys(agreement).length > 0){
			agreement.itgCustNo = $('#frmDetail1 [name="itgCustNo"]').val();
		}
		
		var intrstFildCd = "";
	    if ($('#frmDetail1 input:checkbox[name="intrstFildCd1"]').is(':checked')) {
	    	intrstFildCd += $('input:checkbox[name="intrstFildCd1"]').val()+","
	    }
	    if ($('#frmDetail1 input:checkbox[name="intrstFildCd2"]').is(':checked')) {
	    	intrstFildCd += $('input:checkbox[name="intrstFildCd2"]').val()+","
	    }
	    if ($('#frmDetail1 input:checkbox[name="intrstFildCd3"]').is(':checked')) {
	    	intrstFildCd += $('input:checkbox[name="intrstFildCd3"]').val()+","
	    }
	    if ($('#frmDetail1 input:checkbox[name="intrstFildCd4"]').is(':checked')) {
	    	intrstFildCd += $('input:checkbox[name="intrstFildCd4"]').val()+","
	    }
	    if ($('#frmDetail1 input:checkbox[name="intrstFildCd5"]').is(':checked')) {
	    	intrstFildCd += $('input:checkbox[name="intrstFildCd5"]').val()+","
	    }
	    if ($('#frmDetail1 input:checkbox[name="intrstFildCd6"]').is(':checked')) {
	    	intrstFildCd += $('input:checkbox[name="intrstFildCd6"]').val()+","
	    }

		// 1. 저장함수 호출
		var saveJson = {
						"itgCustNo"      		: $('#frmDetail1 [name="itgCustNo"]').val()
						, "custNm"       		: $('#frmDetail1 [name="custNm"]').val()	
						, "birthday"     		: $('#frmDetail1 [name="birthday"]').val().replace(/-/g,"")	
						, "gndrCd"       		: $('#frmDetail1 [name="gndrCd"]').val()
						, "fornYn"       		: $('#frmDetail1 [name="fornYn"]').val()	
						, "mphonNo"      		: $('#frmDetail1 [name="mphonNo"]').val().replace(/-/g,"")
						, "emailAddr"    		: $('#frmDetail1 [name="emailAddr"]').val()	
						, "custStatusCd" 		: $('#frmDetail1 [name="custStatusCd"]').val()	
						, "custDivCd"    		: $('#frmDetail1 [name="custDivCd"]').val()		
						, "prtctFamlyYn" 		: $('#frmDetail1 [name="prtctFamlyYn"]').val()		
						, "homeTelNo"    		: $('#frmDetail1 [name="homeTelNo"]').val().replace(/-/g,"")
						, "zipCd"        		: $('#frmDetail1 [name="zipCd"]').val()
						, "addr1Ctnts"      	: $('#frmDetail1 [name="addr1Ctnts"]').val()
						, "addr2Ctnts"      	: $('#frmDetail1 [name="addr2Ctnts"]').val()
						, "marryYn"         	: $('#frmDetail1 [name="marryYn"]').val()
						, "dwelNfpyCd"      	: $('#frmDetail1 [name="dwelNfpyCd"]').val()
						, "rcmdrCustNo"     	: $('#frmDetail1 [name="rcmdrCustNo"]').val()
						, "rcmdExecvdempNo" 	: $('#frmDetail1 [name="rcmdExecvdempNo"]').val()
						, "rcmdStorNo"      	: $('#frmDetail1 [name="rcmdStorNo"]').val()
						, "mshipLoginId" 		: $('#frmDetail1 [name="mshipLoginId"]').val()
						, "mshipSbscYn"     	: $('#frmDetail1 [name="mshipSbscYn"]').val()
						, "homeDistrctCd"   	: $('#frmDetail1 [name="homeDistrctCd"]').val()
						, "homeDistrctCdNm" 	: $('#frmDetail1 [name="homeDistrctCdNm"]').val()
						, "homeZipCd"       	: $('#frmDetail1 [name="homeZipCd"]').val()
						, "homeAddr1"       	: $('#frmDetail1 [name="homeAddr1"]').val()
						, "homeAddr2"       	: $('#frmDetail1 [name="homeAddr2"]').val()
						, "intrstFildCd"       	: intrstFildCd
						, "agreement"       	: agreement
						
		};
	    console.log(JSON.stringify(saveJson));
		//return;
		
		//22.11.15 수정버튼 클릭시 확인창 추가 요청
		if (!confirm("고객 정보를 수정하시겠습니까?"))
            return;
		
		var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
		Utilities.getAjax(url,saveJson,true,function(data , jqXHR){
	        if(Utilities.processResult(data , jqXHR , "기본정보 저장에 실패했습니다."))
	        {
	            alert("기본정보 저장에 성공했습니다.");
	            grdList.reload();
	        }
	    });	
	}

}

/* 그리드 컬럼 클릭 */
/* 공통코드 Row클릭 시 */
// 지금 현재 탭넘버
var nowTabNumBer = 6;
var nowSubTabNumBer = 30; /*22.11.8 종합이력 고객여정 위치 변경으로 현재 탭넘버 29 -> 30으로 수정*/

function grdList_rowChanged(grdList, oldRow, newRow, rowData) {
	agreement = {};
	if (newRow > -1) {
		currRowKey = newRow;
		
		if($("input[name='custDivCd']:checked").val() == "001"){
			Utilities.mapToForm(rowData,"frmDetail1");
			birthdayChange();
			cardNumChange();
			homeTelNoChange();
			mphonNoChange();
			fnAddComma();
			parenItgCustNo =  $("#frmDetail1").find("[name=itgCustNo]").val();
			parenMshipSbscYn = $("#frmDetail1").find("[name=mshipSbscYn]").val();
			$("#frmDetail1").find("[name=mshipSbscYnView]").val(rowData.mshipSbscYn);
			tab2Click(nowSubTabNumBer);
			
			isDormancy();
			// 멤버십 회원인 경우 멤버십정보 필드 클리어
			if($("#frmDetail1").find("[name=mshipSbscYn]").val() == "N" && $("#frmDetail1").find("[name=mshipGradeCd]").val() == "001"){
				$("#frmDetail1").find("[name=mshipLoginId]").val("");
				$("#frmDetail1").find("[name=cardNo]").val("");
				$("#frmDetail1").find("[name=mshipTypeCd]").val("");
				$("#frmDetail1").find("[name=cprtCmpNm]").val("");
				$("#frmDetail1").find("[name=mshipSbscDt]").val("");
				$("#frmDetail1").find("[name=mshipGradeCd]").val("");
				$("#frmDetail1").find("[name=mshipAdvncmtScore]").val("");
				$("#frmDetail1").find("[name=mshipExptGradeCd]").val("");
				$("#frmDetail1").find("[name=ciCertfYn]").val("");
				$("#frmDetail1").find("[name=diCertfYn]").val("");
				$("#frmDetail1").find("[name=mshipSbscYnView]").val("");
			}
		}
		if($("input[name='custDivCd']:checked").val() == "002"){

			Utilities.mapToForm(rowData,"frmDetail2");
			parenItgCustNo =  $("#frmDetail2").find("[name=itgCustNo]").val();
			parenMshipSbscYn = $("#frmDetail2").find("[name=mshipSbscYn]").val();
			$("#frmDetail2").find("[name=mshipSbscYnView]").val(rowData.mshipSbscYn);
			if(nowTabNumBer == 1 && nowSubTabNumBer == 1 || nowTabNumBer == 1 && nowSubTabNumBer == 7 || nowTabNumBer == 1 && nowSubTabNumBer == 8){
				tab2Click(2);
			}
			else if(nowTabNumBer == 3 && nowSubTabNumBer == 12 || nowTabNumBer == 3 && nowSubTabNumBer == 15 || nowTabNumBer == 3 && nowSubTabNumBer == 16){
				tab2Click(10);
			}else{
				tab2Click(nowSubTabNumBer);
			}
			
			isDormancy();
			// 멤버십 회원인 경우 멤버십정보 필드 클리어
			if($("#frmDetail2").find("[name=mshipSbscYn]").val() == "N" && $("#frmDetail2").find("[name=mshipGradeCd]").val() == "001"){
				$("#frmDetail2").find("[name=mshipLoginId]").val("");
				$("#frmDetail2").find("[name=cardNo]").val("");
				$("#frmDetail2").find("[name=mshipTypeCd]").val("");
				$("#frmDetail2").find("[name=cprtCmpNm]").val("");
				$("#frmDetail2").find("[name=mshipSbscDt]").val("");
				$("#frmDetail2").find("[name=mshipGradeCd]").val("");
				$("#frmDetail2").find("[name=mshipAdvncmtScore]").val("");
				$("#frmDetail2").find("[name=mshipExptGradeCd]").val("");
				$("#frmDetail1").find("[name=ciCertfYn]").val("");
				$("#frmDetail1").find("[name=diCertfYn]").val("");
				$("#frmDetail1").find("[name=mshipSbscYnView]").val("");
			}
		}	
		$("input[name='indiInfoValidPerdEndDt1']").val(rowData.indiInfoValidPerdEndDt);
		$("input[name='indiInfoValidPerdEndDt2']").val(rowData.indiInfoValidPerdEndDt);
		$("input[name='indiInfoValidPerdEndDt3']").val(rowData.indiInfoValidPerdEndDt);
		$("input[name='indiInfoValidPerdEndDt4']").val(rowData.indiInfoValidPerdEndDt);
		$("input[name='indiInfoValidPerdEndDt5']").val(rowData.indiInfoValidPerdEndDt);
		$("input[name='indiInfoValidPerdEndDt6']").val(rowData.indiInfoValidPerdEndDt);
		$("input[name='indiInfoValidPerdEndDt7']").val(rowData.indiInfoValidPerdEndDt);
		$("input[name='indiInfoValidPerdEndDt8']").val(rowData.indiInfoValidPerdEndDt);
		
		tabShowHide();

	}
	
	var intrstFildCd = rowData.intrstFildCd;
	if(intrstFildCd != null){
		
		var afterStrIntrstFildCd = intrstFildCd.split(',');		
		
		for(var i=0; i<afterStrIntrstFildCd.length; i++){
			var setafterStrIntrstFildCd = afterStrIntrstFildCd[i];
			
			if(setafterStrIntrstFildCd == "001"){
				$("input:checkbox[name='intrstFildCd1']").prop("checked", true);
			}
			if(setafterStrIntrstFildCd == "002"){
// 				$("input[name='intrstFildCd2']").val(setafterStrIntrstFildCd);
				$("input:checkbox[name='intrstFildCd2']").prop("checked", true);
			}
			if(setafterStrIntrstFildCd == "003"){
// 				$("input[name='intrstFildCd3']").val(setafterStrIntrstFildCd);
				$("input:checkbox[name='intrstFildCd3']").prop("checked", true);
			}
			if(setafterStrIntrstFildCd == "004"){
// 				$("input[name='intrstFildCd4']").val(setafterStrIntrstFildCd);
				$("input:checkbox[name='intrstFildCd4']").prop("checked", true);
			}
			if(setafterStrIntrstFildCd == "005"){
// 				$("input[name='intrstFildCd5']").val(setafterStrIntrstFildCd);
				$("input:checkbox[name='intrstFildCd5']").prop("checked", true);
			}
			if(setafterStrIntrstFildCd == "006"){
// 				$("input[name='intrstFildCd6']").val(setafterStrIntrstFildCd);
				$("input:checkbox[name='intrstFildCd6']").prop("checked", true);
			}			
		}
	}

}

// 탭1클릭 이벤트
function tab1Click(num1){
	$("[data-tab1-type]").removeClass("active");
	$("[data-tab1-type="+num1+"]").addClass("active");

	if(num1 == nowTabNumBer){

		
		if($("input[name='custDivCd']:checked").val() == "002"){
			if(num1 == 1){
				tab2Click(2);

			}
			if(num1 == 2){
				tab2Click(9);
			}
			if(num1 == 3){
				tab2Click(10);
			}
			if(num1 == 4){
				tab2Click(18);
			}	
			if(num1 == 5){
				tab2Click(26);
			}	
			if(num1 == 6){
				tab2Click(29);
			}				
		}
		
	}else{
		
		if($("input[name='custDivCd']:checked").val() == "002"){
			
			if(num1 == 1){
				tab2Click(2);

			}
			if(num1 == 2){
				tab2Click(9);
			}
			if(num1 == 3){
				tab2Click(10);
			}
			if(num1 == 4){
				tab2Click(18);
			}	
			if(num1 == 5){
				tab2Click(26);
			}
			if(num1 == 6){
				tab2Click(29);
			}				

		}else{
			if(num1 == 1){
				tab2Click(1);
			}
			if(num1 == 2){
				tab2Click(9);
			}
			if(num1 == 3){
				tab2Click(10);
			}
			if(num1 == 4){
				tab2Click(18);
			}	
			if(num1 == 5){
				tab2Click(26);
			}		
			if(num1 == 6){
				tab2Click(30);
			}				
		}
		
	
	}
	nowTabNumBer = num1;
	

}
// 탭2클릭 이벤트
function tab2Click(num2){

	nowSubTabNumBer = num2;
	
	$("[data-tab2-type]").removeClass("active");
	$("[data-tab2-type='"+num2+"']").addClass("active");	

	$('#iframe1').attr('src', '');
	$('#iframe1').attr('src',$("[data-tab2-type="+num2+"]").attr('data-url'));	


}



/* 우측상단 포인트 , 스템프 , 쿠폰 , 카드 팝업 호출 시작*/
// 여정
function popupTopJourney(){
	
	if(parenItgCustNo == ""){
        alert("회원을 먼저 선택해주세요.");
        return;
    }else if(parenMshipSbscYn == "Y"){
    	Utilities.showMembershipLoc(parenItgCustNo);   
    }else{
        alert("멤버십 회원이 아닙니다.");
        return;
    }
	
// 	if(parenItgCustNo != ""){
// 		Utilities.showMembershipLoc(parenItgCustNo);		
// 	}

}
// 승급점수
function popupTopAdPoint(){

	if(parenItgCustNo == ""){
		alert("회원을 먼저 선택해주세요.");
		return;
	}else if(parenMshipSbscYn == "Y"){
 		var url = "<c:url value='${urlPrefix}/sub/advncmtPopup${urlSuffix}'/>/" + parenItgCustNo ;
 		Utilities.openModal(url,800,280);	
	}else{
		alert("멤버십 회원이 아닙니다.");
		return;
	}
	
	
	// 파라미터 콜백 함수를 넣는다
 //	var pitgCustNo = document.all["itgCustNo"].value;
 //	var url = "<c:url value='${urlPrefix}/sub/pointPopup${urlSuffix}'/>/" + pitgCustNo ;
 //	Utilities.openModal(url,800,330);
}	
// 포인트
function popupTopPoint(){
	
	// 파라미터 콜백 함수를 넣는다
//	Utilities.openTopPoint("onPopupTopPoint");
	
	if(parenItgCustNo == ""){
		alert("회원을 먼저 선택해주세요.");
		return;
	}else if(parenMshipSbscYn == "Y"){
		var url = "<c:url value='${urlPrefix}/sub/pointPopup${urlSuffix}'/>/" + parenItgCustNo ;
		Utilities.openModal(url,800,330);		
	}else{
		alert("멤버십 회원이 아닙니다.");
		return;
	}	
	

}

//스탬프
function popupTopStamp(){
	
	if(parenItgCustNo == ""){
		alert("회원을 먼저 선택해주세요.");
		return;
	}else if(parenMshipSbscYn == "Y"){
		var url = "<c:url value='${urlPrefix}/sub/stmpPopup${urlSuffix}'/>/" + parenItgCustNo ;
		Utilities.openModal(url,800,350);					
	}else{
		alert("멤버십 회원이 아닙니다.");
		return;
	}	
	
// 	var pitgCustNo = document.all["itgCustNo"].value;
// 	var url = "<c:url value='${urlPrefix}/sub/pointPopup${urlSuffix}'/>?itgCustNo=" + pitgCustNo ;
// 	Utilities.openModal(url,800,600);	
}
//쿠폰
function popupTopCoupon(){
	
	if(parenItgCustNo == ""){
		alert("회원을 먼저 선택해주세요.");
		return;
	}else if(parenMshipSbscYn == "Y"){
		var url = "<c:url value='${urlPrefix}/sub/coupnPopup${urlSuffix}'/>/" + parenItgCustNo ;
		Utilities.openModal(url,800,280);					
	}else{
		alert("멤버십 회원이 아닙니다.");
		return;
	}	
	
// 	var pitgCustNo = document.all["itgCustNo"].value;
// 	var url = "<c:url value='${urlPrefix}/sub/pointPopup${urlSuffix}'/>?itgCustNo=" + pitgCustNo ;
// 	Utilities.openModal(url,800,600);	
}
//카드
function popupTopCard(){

	if(parenItgCustNo == ""){
		alert("회원을 먼저 선택해주세요.");
		return;
		
	}else if( $('#cardNo').val() != ""){
		alert("카드가 존재하는 회원입니다.");
		return;
		
	}else if(parenMshipSbscYn == "Y"){
		var url = "<c:url value='${urlPrefix}/sub/cardPopup${urlSuffix}'/>/" + parenItgCustNo ;
		Utilities.openModal(url,800,280);					
	}else{
		alert("멤버십 회원이 아닙니다.");
		return;
	}	
}

//카드발급후 콜백이벤트
function updatePop(data)
{
    if(data != "")
    {
        $('#cardNo').val(data);
        cardNumChange();
    }
    
}
/* 우측상단 포인트 , 스템프 , 쿠폰 , 카드 팝업 호출 끝*/


/* 블랙이력 팝업을 호출한다 */
// function popupBlackCus(){
	
// 	var pitgCustNo = document.all["itgCustNo"].value;
// 	var url = "<c:url value='blackCus/detailHistory'/>/" + pitgCustNo ;
// 	Utilities.openModal(url,1000,500);	
// //	Utilities.openMenuTab("blackCus");

// }

$.fn.clearForm = function() {
  return this.each(function() {
    var type = this.type, tag = this.tagName.toLowerCase();
    if (tag == 'form')
      return $(':input',this).clearForm();
    if (type == 'text' || type == 'password' || tag == 'textarea')
      this.value = '';
    else if (type == 'checkbox' || type == 'radio')
      this.checked = false;
    else if (tag == 'select')
      this.selectedIndex = -1;
  });
};

// 연락처 콜백팝업
function onAddressSelect(data){

	$("#zipCd").val(data.zipNo);
	$("#addr1Ctnts").val(data.roadAddr);

}

/* 주소 팝업을 호출한다 */
function popupZip(){
	
	// 파라미터 콜백 함수를 넣는다
	Utilities.openZipPop("onAddressSelect");
}

/* 조회조건을 수정한다 - 수정시 itgCustNo 초기화 */
function searchOnChange()
{
    //$("#itgCustNo").val("");
}

/* 생년월일 '-' 패턴 */
function birthdayChange()
{
	if($("#birthday").val() != ""){
		var strBirthday = $("#birthday").val().replace(/-/g,"");
		var strBirthdayY = strBirthday.substr(0,4);
		var strBirthdayM = strBirthday.substr(4,2);
		var strBirthdayD = strBirthday.substr(6,2);
		strBirthday = strBirthdayY + "-" + strBirthdayM + "-" + strBirthdayD;
		$("#birthday").val(strBirthday);
	}
}

/* 카드번호 '-' 패턴 */
function cardNumChange()
{
    if($("#cardNo").val() != ""){
        var strBirthday = $("#cardNo").val().replace(/-/g,"");
        var cardNum = ""; 
        var cardNum1 = strBirthday.substr(0,4);
        var cardNum2 = strBirthday.substr(4,4);
        var cardNum3 = strBirthday.substr(8,4);
        var cardNum4 = strBirthday.substr(12,4);
        cardNum = cardNum1 + "-" + cardNum2 + "-" + cardNum3 + "-" + cardNum4;
        $("#cardNo").val(cardNum);
    }
}

/* 자택전화 '-' 패턴 */
function homeTelNoChange()
{
	if($("#frmDetail1 #homeTelNo").val() != ""){
		var strHomeTelNo = $("#frmDetail1 #homeTelNo").val().replace(/-/g,"");
		var strFrontNo = "";
		var strMiddleNo = "";
		var strBackNo = "";
		if(strHomeTelNo.substr(0,2) == "02" && strHomeTelNo.length == "9"){
			strFrontNo = strHomeTelNo.substr(0,2);
			strMiddleNo = strHomeTelNo.substr(2,3);
			strBackNo = strHomeTelNo.substr(5,4);
		}else if(strHomeTelNo.substr(0,2) == "02" && strHomeTelNo.length == "10"){
			strFrontNo = strHomeTelNo.substr(0,2);
			strMiddleNo = strHomeTelNo.substr(2,4);
			strBackNo = strHomeTelNo.substr(6,4);
		}else if(strHomeTelNo.substr(0,3) == "070"){
			strFrontNo = strHomeTelNo.substr(0,3);
			strMiddleNo = strHomeTelNo.substr(3,4);
			strBackNo = strHomeTelNo.substr(7,4);
		}else{
			strFrontNo = strHomeTelNo.substr(0,3);
			strMiddleNo = strHomeTelNo.substr(3,3);
			strBackNo = strHomeTelNo.substr(6,4);
		}
		
		strHomeTelNo = strFrontNo + "-" + strMiddleNo + "-" + strBackNo;
		$("#frmDetail1 #homeTelNo").val(strHomeTelNo);
	}
}

/* 휴대전화 '-' 패턴 */
function mphonNoChange()
{
	if($("#frmDetail1 #mphonNo").val() != ""){	
		var strmphonNo = $("#frmDetail1 #mphonNo").val().replace(/-/g,"");
		var strFrontNo = "";
		var strMiddleNo = "";
		var strBackNo = "";
		// 11 자리 3-4-4 , 12 자리 4-4-4 , 나머지 3-4-나머지
		if (strmphonNo.length == 11) {
			strFrontNo = strmphonNo.substr(0,3); 
			strMiddleNo = strmphonNo.substr(3,4);
			strBackNo = strmphonNo.substr(7,4);  
		} else if (strmphonNo.length == 12) {
			strFrontNo = strmphonNo.substr(0,4); 
			strMiddleNo = strmphonNo.substr(4,4);
			strBackNo = strmphonNo.substr(8,4);  
		} else {
			strFrontNo = strmphonNo.substr(0,3); 
			strMiddleNo = strmphonNo.substr(3,4);
			strBackNo = strmphonNo.substr(7,strmphonNo.length);
		}

		strmphonNo = strFrontNo + "-" + strMiddleNo + "-" + strBackNo;
		$("#frmDetail1 #mphonNo").val(strmphonNo);
	}
}

/* 점수필드 comma 추가 */
function fnAddComma(){
	$("#mshipAdvncmtScore").val(addComma($("#mshipAdvncmtScore").val()));
}



// 개별 승급 실행 
function mshipPersonAdvn(){
	
	if(parenItgCustNo == ""){
		alert("회원을 먼저 선택해주세요.");
		return;
	}else if(parenMshipSbscYn == "Y"){
		
		if (!confirm("개별 승급을 업데이트 하시겠습니까?"))
	        return;
		
 		var url = "<c:url value='${urlPrefix}/updateAdvn${urlSuffix}'/>";
 		
 		var save = Utilities.formToMap("frmDetail1") ;
		Utilities.getAjax(url,save,true,function(data , jqXHR){

			if( data == "999" ){
				alert("변경 적용될 등급이 없습니다. ");
				return false;
			}else{
		        if(Utilities.processResult(data , jqXHR , "개별 승급 업데이트에 실패했습니다."))
		        {
		        	
		            alert("개별 승급 업데이트를 성공했습니다.");
		            grdList.reload();
		           
		        }
			}
	    });	
	}else{
		alert("멤버십 회원이 아닙니다.");
		return;
	}
	
	
}


function memshipDormancy()
{
	if (!confirm("멤버십 휴면등록을 하시겠습니까?"))
        return;
	
	var param = {};
	
	if($("input[name='custDivCd']:checked").val() == "001"){
		param.itgCustNo = $("#frmDetail1 #itgCustNo").val();
	}else if($("input[name='custDivCd']:checked").val() == "001"){
		param.itgCustNo = $("#frmDetail2 #itgCustNo").val();
	}
    
    var url = "<c:url value='${urlPrefix}/saveMemshipDormancy${urlSuffix}'/>";
    Utilities.getAjax(url, param, true, function(data, jqXHR) {
        if (Utilities.processResult(data, jqXHR, "멤버십 휴면등록이 실패했습니다.")) {
            alert("멤버십 휴면등록이 완료되었습니다.");
            grdList.reload();
                //search();
/*                 Utilities.getOpener().search();
                Utilities.closeModal()
                $("#frmSearch")[0].reset(); */
        }
    });
 }
 
function memshipCancelDormancy()
{
	if (!confirm("멤버십 휴면취소를 하시겠습니까?"))
        return;
	
	var param = {};
	
	if($("input[name='custDivCd']:checked").val() == "001"){
		param.itgCustNo = $("#frmDetail1 #itgCustNo").val();
	}else if($("input[name='custDivCd']:checked").val() == "002"){
		param.itgCustNo = $("#frmDetail2 #itgCustNo").val();
	}
    
    var url = "<c:url value='${urlPrefix}/saveMemshipCancelDormancy${urlSuffix}'/>";
    Utilities.getAjax(url, param, true, function(data, jqXHR) {
        if (Utilities.processResult(data, jqXHR, "멤버십 휴면취소가 실패했습니다.")) {
            alert("멤버십 휴면취소가 완료되었습니다.");
            grdList.reload();
        }
    });
 }
 
function deleteMemShip()
{
    if (!confirm("고객정보를 삭제하시겠습니까?"))
        return;
    
    var param = {};
    
    if($("input[name='custDivCd']:checked").val() == "001"){
    	param.itgCustNo = $("#frmDetail1 #itgCustNo").val();
	}else if($("input[name='custDivCd']:checked").val() == "001"){
		param.itgCustNo = $("#frmDetail2 #itgCustNo").val();
	}
    
    var url = "<c:url value='${urlPrefix}/deleteMemShip${urlSuffix}'/>";
    Utilities.getAjax(url, param, true, function(data, jqXHR) {
        if (Utilities.processResult(data, jqXHR, "고객정보삭제가 실패했습니다.")) {
            alert("고객정보삭제가 완료되었습니다.");
            grdList.reload();
                //search();
/*                 Utilities.getOpener().search();
                Utilities.closeModal()
                $("#frmSearch")[0].reset(); */
        }
    });
 }

// 고객상태가 정상인지, 휴면인지에 따른 버튼 hidden처리
function isDormancy(){
	if(window["_user_auth_u"]!="Y")
		return;
	if($("input[name='custDivCd']:checked").val() == "001"){
		if($("#frmDetail1").find("[name=custStatusCd]").val() == "001"){ // 정상
			$("#frmDetail1").find("[id=btnMemshipCancelDormancy]").hide();
			$("#frmDetail1").find("[id=btnMemshipDormancy]").show();
		}else if($("#frmDetail1").find("[name=custStatusCd]").val() == "002"){ // 휴면
			$("#frmDetail1").find("[id=btnMemshipCancelDormancy]").show();
			$("#frmDetail1").find("[id=btnMemshipDormancy]").hide();
		}
	}else if($("input[name='custDivCd']:checked").val() == "002"){
		if($("#frmDetail2").find("[name=custStatusCd]").val() == "001"){ // 정상
			$("#frmDetail2").find("[id=btnMemshipCancelDormancy]").hide();
			$("#frmDetail2").find("[id=btnMemshipDormancy]").show();
		}else if($("#frmDetail2").find("[name=custStatusCd]").val() == "002"){ // 휴면
			$("#frmDetail2").find("[id=btnMemshipCancelDormancy]").show();
			$("#frmDetail2").find("[id=btnMemshipDormancy]").hide();
		}
	}
}
 
function searchMove(){
    
	if(parenItgCustNo == ""){
        alert("회원을 먼저 선택해주세요.");
        return;
    }
	
	$('#form1 [name="REQ_KEY_INFO"]').val(parenItgCustNo);

    var pop_title = "sendPopup" ;
    window.open("", pop_title, "width=1500, height=800, resizable=yes, scrollbars=no") ;
    
    var frmData = document.form1;
    frmData.target = pop_title;
    frmData.method = "post";
    frmData.action = "${eonUrl}";
    
    frmData.submit() ;
    
}

</script>

