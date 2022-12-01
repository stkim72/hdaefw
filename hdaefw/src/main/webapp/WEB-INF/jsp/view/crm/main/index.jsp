<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<div class="gLeft">

				<!-- 고객정보 -->
				<div class="mBox1">
					<!-- title -->
					<div class="gTitle1">
						<h3 class="mTitle1">고객정보</h3>
						<div class="gRt">
							<label class="mRadio1 posRt">
								<input type="radio" name="radioGuestInfo1" title="개인" checked="checked">
								<span class="label">개인</span>
							</label>
							<label class="mRadio1 posRt">
								<input type="radio" name="radioGuestInfo1" title="법인">
								<span class="label">법인</span>
							</label>
						</div>
					</div>
					<!-- //title -->
					<!-- search -->
					<div class="mFlex1">
						<input type="text" class="it w1" title="고객명" placeholder="고객명">
						<input type="text" class="it w2" title="전화번호" placeholder="전화번호">
						<input type="text" class="it" title="통합검색" placeholder="통합검색">
						<a href="#;" class="mBtn1">검색</a>
					</div>
					<!-- //search -->
					<!-- list -->
					<div class="mBoard1 mCustomScrollbar">
						<table>
							<caption>고객정보</caption>
							<colgroup>
								<col width="30">
								<col width="80">
								<col width="*">
								<col width="50">
								<col span="2" width="35">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">NO</th>
									<th scope="col">통화고객번호</th>
									<th scope="col">멤버십 ID</th>
									<th scope="col">이름</th>
									<th scope="col">성별</th>
									<th scope="col">연령</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>40001614</td>
									<td class="left">ceragemjjang</td>
									<td>김세라</td>
									<td>남</td>
									<td>20</td>
								</tr>
								<tr class="active"> <!-- 선택된 행-->
									<td>2</td>
									<td>40001614</td>
									<td class="left">ceragemjjang</td>
									<td>김세라</td>
									<td>남</td>
									<td>20</td>
								</tr>
								<tr>
									<td>3</td>
									<td>40001614</td>
									<td class="left">ceragemjjang</td>
									<td>김세라</td>
									<td>남</td>
									<td>20</td>
								</tr>
								<tr>
									<td>4</td>
									<td>40001614</td>
									<td class="left">ceragemjjang</td>
									<td>김세라</td>
									<td>남</td>
									<td>20</td>
								</tr>
								<tr>
									<td>5</td>
									<td>40001614</td>
									<td class="left">ceragemjjang</td>
									<td>김세라</td>
									<td>남</td>
									<td>20</td>
								</tr>
								<tr>
									<td>6</td>
									<td>40001614</td>
									<td class="left">ceragemjjang</td>
									<td>김세라</td>
									<td>남</td>
									<td>20</td>
								</tr>
								<tr>
									<td>7</td>
									<td>40001614</td>
									<td class="left">ceragemjjang</td>
									<td>김세라</td>
									<td>남</td>
									<td>20</td>
								</tr>
								<tr>
									<td>8</td>
									<td>40001614</td>
									<td class="left">ceragemjjang</td>
									<td>김세라</td>
									<td>남</td>
									<td>20</td>
								</tr>
								<tr>
									<td>9</td>
									<td>40001614</td>
									<td class="left">ceragemjjang</td>
									<td>김세라</td>
									<td>남</td>
									<td>20</td>
								</tr>
								<tr>
									<td>10</td>
									<td>40001614</td>
									<td class="left">ceragemjjang</td>
									<td>김세라</td>
									<td>남</td>
									<td>20</td>
								</tr>
								<tr>
									<td>11</td>
									<td>40001614</td>
									<td class="left">ceragemjjang</td>
									<td>김세라</td>
									<td>남</td>
									<td>20</td>
								</tr>
								<tr>
									<td>12</td>
									<td>40001614</td>
									<td class="left">ceragemjjang</td>
									<td>김세라</td>
									<td>남</td>
									<td>20</td>
								</tr>
								<tr>
									<td>13</td>
									<td>40001614</td>
									<td class="left">ceragemjjang</td>
									<td>김세라</td>
									<td>남</td>
									<td>20</td>
								</tr>
								<tr>
									<td>14</td>
									<td>40001614</td>
									<td class="left">ceragemjjang</td>
									<td>김세라</td>
									<td>남</td>
									<td>20</td>
								</tr>
								<tr>
									<td>15</td>
									<td>40001614</td>
									<td class="left">ceragemjjang</td>
									<td>김세라</td>
									<td>남</td>
									<td>20</td>
								</tr>
								<tr>
									<td>16</td>
									<td>40001614</td>
									<td class="left">ceragemjjang</td>
									<td>김세라</td>
									<td>남</td>
									<td>20</td>
								</tr>
								<tr>
									<td>17</td>
									<td>40001614</td>
									<td class="left">ceragemjjang</td>
									<td>김세라</td>
									<td>남</td>
									<td>20</td>
								</tr>
								<tr>
									<td>18</td>
									<td>40001614</td>
									<td class="left">ceragemjjang</td>
									<td>김세라</td>
									<td>남</td>
									<td>20</td>
								</tr>
								<tr>
									<td>19</td>
									<td>40001614</td>
									<td class="left">ceragemjjang</td>
									<td>김세라</td>
									<td>남</td>
									<td>20</td>
								</tr>
								<tr>
									<td>20</td>
									<td>40001614</td>
									<td class="left">ceragemjjang</td>
									<td>김세라</td>
									<td>남</td>
									<td>20</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //list -->
				</div>
				<!-- //고객정보 -->
				
			</div>
			<!-- //left -->
			<!-- right -->
			<div class="gRight">

				<!-- box -->
				<div class="mBox1 pt25"> <!-- class="pt25" : padding top 25px -->
					<!-- row -->
					<div class="row">
						<!-- 기본정보 -->
						<div class="col w57per">
							<div class="gTitle1 line">
								<h3 class="mTitle1">기본정보</h3>
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
											<th scope="row" class="left"><span class="iMust">통합고객번호</span></th>
											<td>
												<input type="text" class="it must" title="통합고객번호" value="IND000000000XXXX">
											</td>
											<th scope="row" class="left">고객명</th>
											<td>
												<input type="text" class="it" title="고객명" value="김세라">
											</td>
											<th scope="row" class="left">생년월일</th>
											<td>
												<input type="text" class="it center" title="생년월일" value="1995-05-05">
											</td>
											<th scope="row" class="left">성별</th>
											<td>
												<select class="select" title="성별">
													<option>남</option>
													<option>여</option>
												</select>
											</td>
											<th scope="row" class="left">외국인</th>
											<td>
												<select class="select" title="외국인">
													<option>N</option>
													<option>Y</option>
												</select>
											</td>
										</tr>
										<tr>
											<th scope="row" class="left">일반전화</th>
											<td>
												<div class="mFlex2">
													<span class="flex">
														<select class="select" title="국번">
															<option>02</option>
															<option></option>
														</select>
													</span>
													<span class="flex">
														<input type="text" class="it" title="일반전화" value="555-5555">
													</span>
												</div>
											</td>
											<th scope="row" class="left">휴대전화</th>
											<td colspan="2">
												<div class="mFlex2">
													<span class="flex">
														<input type="text" class="it" title="휴대전화" value="010-555-5555">
													</span>
													<a href="#;" class="mBtn1 m lWhite">중복체크</a>
												</div>
											</td>
											<th scope="row" class="left">이메일</th>
											<td colspan="4">
												<div class="mFlex2">
													<span class="flex">
														<input type="text" class="it" title="이메일" value="crm_12004@ceragem.com">
													</span>
													<a href="#;" class="mBtn1 m lWhite">중복체크</a>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row" class="left">고객상태</th>
											<td>
												<select class="select crucial" title="고객상태">
													<option>휴면/정상탈회</option>
												</select>
											</td>
											<th scope="row" class="left">고객유형</th>
											<td>
												<select class="select crucial" title="고객유형">
													<option>가망고객</option>
												</select>
											</td>
											<th scope="row" class="left">고객구분</th>
											<td>
												<select class="select crucial" title="고객구분">
													<option>개인</option>
												</select>
											</td>
											<th scope="row" class="left"><span class="iMust">상태변경</span></th>
											<td>
												<input type="text" class="it center must" title="상태변경" value="2022-01-01">
											</td>
											<th scope="row" class="left"><span class="iMust">외국인</span></th>
											<td>
												<input type="text" class="it center must" title="외국인" value="2022-01-01">
											</td>
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
								<div class="gRt pos1">
									<a href="#;" class="mBtn1 r5 lPrimary"><span class="iPoint">포인트</span></a>
									<a href="#;" class="mBtn1 r5 lPrimary"><span class="iStamp">스템프</span></a>
									<a href="#;" class="mBtn1 r5 lPrimary"><span class="iCoupon">쿠폰</span></a>
									<a href="#;" class="mBtn1 r5 lPrimary"><span class="iCard">카드</span></a>
								</div>
							</div>
							<div class="gProfile1">
								<div class="mImg1" style="background-image:url(/static/crm/images/x_profile1.png);"></div>
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
												<th scope="row" class="left"><span class="iMust">멤버십 ID</span></th>
												<td>
													<input type="text" class="it must" title="멤버십 ID" value="a1313131313">
												</td>
												<th scope="row" class="left"><span class="iMust">멤버십 PW</span></th>
												<td>
													<input type="password" class="it must" title="멤버십 PW" value="12345678">
												</td>
												<th scope="row" class="left">멤버십 가입일자</th>
												<td>
													<input type="text" class="it date" title="멤버십 가입일자" value="2021-02-03">
												</td>
											</tr>
											<tr>
												<th scope="row" class="left">회원구분</th>
												<td>
													<select class="select crucial" title="회원구분">
														<option>임직원</option>
													</select>
												</td>
												<th scope="row" class="left">정보변경</th>
												<td>
													<input type="text" class="it center" title="정보변경" value="2021-02-03">
												</td>
												<th scope="row" class="left">정보확인</th>
												<td>
													<input type="text" class="it" title="정보확인" value="PD-123123154">
												</td>
											</tr>
											<tr>
												<th scope="row" class="left">회원등급</th>
												<td>
													<select class="select crucial" title="회원등급">
														<option>일반</option>
													</select>
												</td>
												<th scope="row" class="left">등급변경</th>
												<td>
													<input type="text" class="it center" title="등급변경" value="2021-02-03">
												</td>
												<th scope="row" class="left">멤버십 채널</th>
												<td>
													<input type="text" class="it center" title="멤버십 채널" value="멤버십앱">
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
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
											<th scope="row" class="left">주소 1</th>
											<td colspan="5">
												<div class="mFlex2">
													<div class="mFind1">
														<input type="text" class="it" title="우편번호" value="00082">
														<a href="#;" class="iFind">검색</a>
													</div>
													<input type="text" class="it" title="주소" value="서울시 서울구 서울동">
													<input type="text" class="it" title="상세주소" value="서울 아파트 104 2003호">
												</div>
											</td>
											<th scope="row" class="left">주거평수</th>
											<td>
												<select class="select" title="주거평수">
													<option>남</option>
													<option>여</option>
												</select>
											</td>
										</tr>
										<tr>
											<th scope="row" class="left">주소 2</th>
											<td colspan="5">
												<div class="mFlex2">
													<div class="mFind1">
														<input type="text" class="it" title="우편번호" value="00082">
														<a href="#;" class="iFind">검색</a>
													</div>
													<input type="text" class="it" title="주소" value="서울시 서울구 서울동">
													<input type="text" class="it" title="상세주소" value="서울 아파트 104 2003호">
												</div>
											</td>
											<th scope="row" class="left">주거평수</th>
											<td>
												<select class="select" title="주거평수">
													<option>남</option>
													<option>여</option>
												</select>
											</td>
										</tr>
										<tr>
											<th scope="row" class="left">추천인 고객번호</th>
											<td>
												<input type="text" class="it" title="추천인 고객번호" value="S13546651322">
											</td>
											<th scope="row" class="left">추천인 임직원</th>
											<td>
												<input type="text" class="it" title="추천인 임직원" value="임직원">
											</td>
											<th scope="row" class="left">가입매장</th>
											<td>
												<div class="mFind1">
													<input type="text" class="it" title="가입매장" value="00082">
													<a href="#;" class="iFind">검색</a>
												</div>
											</td>
											<th scope="row" class="left">매장명</th>
											<td>
												<input type="text" class="it" title="매장명" value="현대백화점 서울역점">
											</td>
										</tr>
										<tr>
											<th scope="row" class="left">결혼여부</th>
											<td>
												<select class="select" title="결혼여부">
													<option>선택</option>
												</select>
											</td>
											<th scope="row" class="left">가족관계</th>
											<td>
												<select class="select" title="가족관계">
													<option>선택</option>
												</select>
											</td>
											<th scope="row" class="left">관심분야</th>
											<td class="left" colspan="3">
												<label class="mCheckbox1">
													<input type="checkbox" title="건강" checked="checked">
													<span class="label">건강</span>
												</label>
												<label class="mCheckbox1">
													<input type="checkbox" title="음식" checked="checked">
													<span class="label">음식</span>
												</label>
												<label class="mCheckbox1">
													<input type="checkbox" title="주거" checked="checked">
													<span class="label">주거</span>
												</label>
												<label class="mCheckbox1">
													<input type="checkbox" title="의료">
													<span class="label">의료</span>
												</label>
												<label class="mCheckbox1">
													<input type="checkbox" title="스포츠">
													<span class="label">스포츠</span>
												</label>
												<label class="mCheckbox1">
													<input type="checkbox" title="연애">
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
									<label class="mCheckbox1">
										<input type="checkbox" title="전체 수신거부">
										<span class="label">전체 수신거부</span>
									</label>
								</div>
							</div>
							<div class="mBoard2">
								<table>
									<caption>정보 활용동의</caption>
									<colgroup>
										<col width="16%">
										<col width="*">
										<col width="10%">
										<col width="*">
										<col width="9%">
										<col width="*">
										<col width="11%">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" class="left">SMS 수신동의</th>
											<td>
												<select class="select" title="SMS 수신동의">
													<option>Y</option>
													<option>N</option>
												</select>
											</td>
											<th scope="row" class="bgWhite">동의일</th>
											<td>
												<input type="text" class="it center" title="동의일" value="2021-02-03">
											</td>
											<th scope="row" class="bgWhite">채널</th>
											<td>
												<input type="text" class="it must center" title="채널" value="멤버쉽앱">
											</td>
											<th scope="row" class="bgWhite">유효기간</th>
											<td>
												<input type="text" class="it center" title="유효기간" value="2021-02-03">
											</td>
										</tr>
										<tr>
											<th scope="row" class="left">이메일 수신동의</th>
											<td>
												<select class="select" title="이메일 수신동의">
													<option>Y</option>
													<option>N</option>
												</select>
											</td>
											<th scope="row" class="bgWhite">동의일</th>
											<td>
												<input type="text" class="it center" title="동의일" value="2021-02-03">
											</td>
											<th scope="row" class="bgWhite">채널</th>
											<td>
												<input type="text" class="it must center" title="채널" value="커뮤니티">
											</td>
											<th scope="row" class="bgWhite">유효기간</th>
											<td>
												<input type="text" class="it center" title="유효기간" value="2021-02-03">
											</td>
										</tr>
										<tr>
											<th scope="row" class="left">알림톡 수신동의</th>
											<td>
												<select class="select" title="알림톡 수신동의">
													<option>Y</option>
													<option>N</option>
												</select>
											</td>
											<th scope="row" class="bgWhite">동의일</th>
											<td>
												<input type="text" class="it center" title="동의일" value="2021-02-03">
											</td>
											<th scope="row" class="bgWhite">채널</th>
											<td>
												<input type="text" class="it must center" title="채널" value="멤버쉽앱">
											</td>
											<th scope="row" class="bgWhite">유효기간</th>
											<td>
												<input type="text" class="it center" title="유효기간" value="2021-02-03">
											</td>
										</tr>
										<tr>
											<th scope="row" class="left">PUSH 수신동의</th>
											<td>
												<select class="select" title="PUSH 수신동의">
													<option>Y</option>
													<option>N</option>
												</select>
											</td>
											<th scope="row" class="bgWhite">동의일</th>
											<td>
												<input type="text" class="it center" title="동의일" value="2021-02-03">
											</td>
											<th scope="row" class="bgWhite">채널</th>
											<td>
												<input type="text" class="it must center" title="채널" value="커뮤니티">
											</td>
											<th scope="row" class="bgWhite">유효기간</th>
											<td>
												<input type="text" class="it center" title="유효기간" value="2021-02-03">
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- //정보활용동의 -->
					</div>
					<!-- //row -->
				</div>
				<!-- //box -->

				<!-- tab -->
				<div class="mTab1 hasSub jsTab1">
					<ul>
						<li class="active">
							<a href="#;">부가정보</a>
							<div class="sub">
								<a href="#;" class="active">가구정보</a>
								<a href="#;">연락처정보</a>
								<a href="#;">정보동의 이력</a>
								<a href="#;">등급변경 이력</a>
								<a href="#;">정보변경 이력</a>
							</div>
						</li>
						<li>
							<a href="#;">거래이력</a>
							<div class="sub">
								<a href="#;">거래이력 sub1</a>
								<a href="#;">거래이력 sub2</a>
								<a href="#;">거래이력 sub3</a>
								<a href="#;">거래이력 sub4</a>
								<a href="#;">거래이력 sub5</a>
							</div>
						</li>
						<li>
							<a href="#;">접촉이력</a>
							<div class="sub">
								<a href="#;">접촉이력 sub1</a>
								<a href="#;">접촉이력 sub2</a>
								<a href="#;">접촉이력 sub3</a>
								<a href="#;">접촉이력 sub4</a>
								<a href="#;">접촉이력 sub5</a>
							</div>
						</li>
						<li>
							<a href="#;">회원이력</a>
							<div class="sub">
								<a href="#;">회원이력 sub1</a>
								<a href="#;">회원이력 sub2</a>
								<a href="#;">회원이력 sub3</a>
								<a href="#;">회원이력 sub4</a>
								<a href="#;">회원이력 sub5</a>
							</div>
						</li>
					</ul>
				</div>
				<!--
				<div class="mTab1 jsTab1">
					<a href="#jsTab1_1" class="active">부가정보</a>
					<a href="#jsTab1_2">거래이력</a>
					<a href="#jsTab1_3">접촉이력</a>
					<a href="#jsTab1_4">회원이력</a>
				</div>
				<div id="jsTab1_1" class="mTab2">
					<a href="#;" class="active">가구정보</a>
					<a href="#;">연락처정보</a>
					<a href="#;">정보동의 이력</a>
					<a href="#;">등급변경 이력</a>
					<a href="#;">정보변경 이력</a>
				</div>
				//tab -->

				<!-- box -->
				<div class="mBox1 p10">
					<!-- sort -->
					<div class="mSort1">
						<div class="mBoard2">
							<table>
								<caption>가구정보</caption>
								<colgroup>
									<col width="40">
									<col width="225">
									<col width="40">
									<col width="110">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">기간</th>
										<td class="bgGray">
											<div class="mDate1">
												<input type="text" class="it date" title="기간 시작일" value="2022-01-01">
												<span class="bar">~</span>
												<input type="text" class="it date" title="기간 마지막일" value="2022-01-03">
											</div>
										</td>
										<th scope="row">관계</th>
										<td class="bgGray">
											<select class="select" title="관계">
												<option>전체</option>
											</select>
										</td>
										<td class="left bgGray">
											<a href="#;" class="mBtn1">검색</a>
											<a href="#;" class="mBtn1 primary">관계등록</a>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- //sort -->
					<!-- board -->
					<div class="mBoard1 mCustomScrollbar">
						<table>
							<caption>가구정보</caption>
							<colgroup>
								<col width="40">
								<col width="12%">
								<col width="12%">
								<col width="12%">
								<col width="9%">
								<col width="9%">
								<col width="9%">
								<col width="9%">
								<col width="*">
								<col span="2" width="5%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">NO</th>
									<th scope="col">관계등록일시</th>
									<th scope="col">가구번호</th>
									<th scope="col">통합고객번호</th>
									<th scope="col">사용유형</th>
									<th scope="col">관계</th>
									<th scope="col">관계코드</th>
									<th scope="col">이름</th>
									<th scope="col">휴대폰</th>
									<th scope="col">관계수정</th>
									<th scope="col">관계삭제</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>2021-01-02 00:00:01</td>
									<td>40001614</td>
									<td>40001612</td>
									<td>AS신청자</td>
									<td>배우자</td>
									<td>01</td>
									<td>박**</td>
									<td>010-555-5555</td>
									<td>
										<a href="#;" class="mBtn1 m lWhite">수정</a>
									</td>
									<td>
										<a href="#;" class="mBtn1 m lGray">삭제</a>
									</td>
								</tr>
								<tr>
									<td>2</td>
									<td>2021-01-02 00:00:01</td>
									<td>40001614</td>
									<td>40001612</td>
									<td>AS신청자</td>
									<td>배우자</td>
									<td>01</td>
									<td>박**</td>
									<td>010-555-5555</td>
									<td>
										<a href="#;" class="mBtn1 m lWhite">수정</a>
									</td>
									<td>
										<a href="#;" class="mBtn1 m lGray">삭제</a>
									</td>
								</tr>
								<tr>
									<td>3</td>
									<td>2021-01-02 00:00:01</td>
									<td>40001614</td>
									<td>40001612</td>
									<td>AS신청자</td>
									<td>배우자</td>
									<td>01</td>
									<td>박**</td>
									<td>010-555-5555</td>
									<td>
										<a href="#;" class="mBtn1 m lWhite">수정</a>
									</td>
									<td>
										<a href="#;" class="mBtn1 m lGray">삭제</a>
									</td>
								</tr>
								<tr>
									<td>4</td>
									<td>2021-01-02 00:00:01</td>
									<td>40001614</td>
									<td>40001612</td>
									<td>AS신청자</td>
									<td>배우자</td>
									<td>01</td>
									<td>박**</td>
									<td>010-555-5555</td>
									<td>
										<a href="#;" class="mBtn1 m lWhite">수정</a>
									</td>
									<td>
										<a href="#;" class="mBtn1 m lGray">삭제</a>
									</td>
								</tr>
								<tr>
									<td>5</td>
									<td>2021-01-02 00:00:01</td>
									<td>40001614</td>
									<td>40001612</td>
									<td>AS신청자</td>
									<td>배우자</td>
									<td>01</td>
									<td>박**</td>
									<td>010-555-5555</td>
									<td>
										<a href="#;" class="mBtn1 m lWhite">수정</a>
									</td>
									<td>
										<a href="#;" class="mBtn1 m lGray">삭제</a>
									</td>
								</tr>
								<tr>
									<td>6</td>
									<td>2021-01-02 00:00:01</td>
									<td>40001614</td>
									<td>40001612</td>
									<td>AS신청자</td>
									<td>배우자</td>
									<td>01</td>
									<td>박**</td>
									<td>010-555-5555</td>
									<td>
										<a href="#;" class="mBtn1 m lWhite">수정</a>
									</td>
									<td>
										<a href="#;" class="mBtn1 m lGray">삭제</a>
									</td>
								</tr>
								<tr>
									<td>7</td>
									<td>2021-01-02 00:00:01</td>
									<td>40001614</td>
									<td>40001612</td>
									<td>AS신청자</td>
									<td>배우자</td>
									<td>01</td>
									<td>박**</td>
									<td>010-555-5555</td>
									<td>
										<a href="#;" class="mBtn1 m lWhite">수정</a>
									</td>
									<td>
										<a href="#;" class="mBtn1 m lGray">삭제</a>
									</td>
								</tr>
								<tr>
									<td>8</td>
									<td>2021-01-02 00:00:01</td>
									<td>40001614</td>
									<td>40001612</td>
									<td>AS신청자</td>
									<td>배우자</td>
									<td>01</td>
									<td>박**</td>
									<td>010-555-5555</td>
									<td>
										<a href="#;" class="mBtn1 m lWhite">수정</a>
									</td>
									<td>
										<a href="#;" class="mBtn1 m lGray">삭제</a>
									</td>
								</tr>
								<tr>
									<td>9</td>
									<td>2021-01-02 00:00:01</td>
									<td>40001614</td>
									<td>40001612</td>
									<td>AS신청자</td>
									<td>배우자</td>
									<td>01</td>
									<td>박**</td>
									<td>010-555-5555</td>
									<td>
										<a href="#;" class="mBtn1 m lWhite">수정</a>
									</td>
									<td>
										<a href="#;" class="mBtn1 m lGray">삭제</a>
									</td>
								</tr>
								<tr>
									<td>10</td>
									<td>2021-01-02 00:00:01</td>
									<td>40001614</td>
									<td>40001612</td>
									<td>AS신청자</td>
									<td>배우자</td>
									<td>01</td>
									<td>박**</td>
									<td>010-555-5555</td>
									<td>
										<a href="#;" class="mBtn1 m lWhite">수정</a>
									</td>
									<td>
										<a href="#;" class="mBtn1 m lGray">삭제</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //board -->
				</div>
				<!-- //box -->

			</div>