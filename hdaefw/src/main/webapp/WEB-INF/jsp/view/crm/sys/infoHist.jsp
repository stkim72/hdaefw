<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 
<!-- mBtn1 m lWhite -->

<div class="mBox1">
 	
			<div class="mBoard2 ">
			<form role="form" id="frmSearch">
								<table>
									<caption>기본정보</caption>
									<colgroup>
										<col width="10%" />
										<col width="10%" />
										<col width="10%"  />
										<col width="10%" />
										<col width="10%"  />
										<col width="10%" />
										<col width="10%" />
										<col width="10%" />
										<col width="10%" />
										<col width="10%" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" class="left">조회일</th>
											<td>
												<input class="it" type="text" data-type="dateRangeStart" data-range-end="endDt" id="strtDt" name="strtDt" data-enter="search" data-button="Y" value="" />
											</td>
											<td>
												<input  class="it" type="text" id="endDt" name="endDt" data-enter="search" data-button="Y" value=""/>
											</td>
											<td scope="row" class="left" colspan="2">
												<button class="mBtn1 m lWhite" id="setToday" data-click="setToday" style="margin: 1px 0px;">오늘</button>
					                            <button class="mBtn1 m lWhite" id="set1Week" data-click="set1Week" style="margin: 1px 0px;" data-default-button="Y">1주일</button>
					                            <button class="mBtn1 m lWhite" id="set1month" data-click="set1month" style="margin: 1px 0px;">1개월</button>
					                            <button class="mBtn1 m lWhite" id="set3month" data-click="set3month" style="margin: 1px 0px;">3개월</button>
					                            <button class="mBtn1 m lWhite" id="set6month" data-click="set6month" style="margin: 1px 0px;">6개월</button>
					                            <button class="mBtn1 m lWhite" id="setAllmonth" data-click="setAllmonth" style="margin: 1px 0px;">전체</button>
											</td>
											<th>
												조회자
											</th>
											<td scope="row" class="left">
												<input class="it" type="text" id="indiInfoHandlPrsnNo" data-enter="search" name="indiInfoHandlPrsnNo" placeholder="개인정보취급자번호">
											</td>
											
											<th>
												수행업무
											</th>
											<td scope="row" class="left">
                                                <code:commCode codeCd="S120" id="pfmWorkCd" name="pfmWorkCd" prefixLabel="전체"/>
<!-- 												<input class="it" type="text" id="custNm" data-enter="search" name="custNm" placeholder="사용자명"> -->
											</td>
																				
											<th scope="row" class="left">
											<button class="mBtn1" data-click="search" >검색</button>
											</th>
											
										</tr>
										
									</tbody>
								</table>
								</form>
							</div>
	
 </div> 
 
 <div class="mBox1 btnTopMargin">
 <div class="gTitle1 ">
								<h3 class="mTitle1">정보조회 이력</h3>
								<div class="gRt">
									<code:btnGroup name="SearchHist" hideDelete="true" hideInsert="true" hideSave="true" dispName="정보조회이력" gridId="grdList"/>
								</div>
			</div>
 	<div id="divGrid"  style="height:${rightBoxHeight4}" data-grid-id="grdList" 
                                        data-pagenation="Y" 
                                        data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
                                        data-type="grid" 
                                        data-grid-callback="onGridLoad" 
                                        data-tpl-url="<c:url value='/static/gridTemplate/system/cmmSnstvInfoInqryHst.xml'/>"
				>
				
				</div>
 </div>



<script>

function search()
{
    var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    grdList.loadUrl(url,param);
}

function grdList_load(gridView,gridId){
     search();
}

setToday();
</script>