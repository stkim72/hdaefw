<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 




<div id="wrapIframe">
		
	<div class="mGrid1 type2"> <!-- class="type2" => left width="263px" -->
        <!-- left -->
        <div class="gLeft">

            <!-- 발송채널 관리 -->
            <div class="mBox1">
                <!-- title -->
                <div class="gTitle1">
                    <h3 class="mTitle1">제공 혜택 관리</h3>
                </div>
                <!-- //title -->
                <!-- list -->
                <div class="mDir1 form2 mCustomScrollbar"> <!-- class="form2" : checkbox만 있는 리스트 -->
                    <ul>
                        <li>
                            <label class="mCheckbox1">
                                <input type="checkbox" title="포인트 쿠폰" checked="checked">
                                <span class="label">포인트 쿠폰</span>
                            </label>
                        </li>
                        <li>
                            <label class="mCheckbox1">
                                <input type="checkbox" title="할인 쿠폰">
                                <span class="label">할인 쿠폰</span>
                            </label>
                        </li>
                        <li>
                            <label class="mCheckbox1">
                                <input type="checkbox" title="스탬프 쿠폰">
                                <span class="label">스탬프 쿠폰</span>
                            </label>
                        </li>
                        <li>
                            <label class="mCheckbox1">
                                <input type="checkbox" title="포인트">
                                <span class="label">포인트</span>
                            </label>
                        </li>
                        <li>
                            <label class="mCheckbox1">
                                <input type="checkbox" title="스템프">
                                <span class="label">스템프</span>
                            </label>
                        </li>
                       
                    </ul>
                </div>
                <!-- //list -->
            </div>
            <!-- //발송채널 관리 -->
            
        </div>
        <!-- //left -->
		<!-- right -->
		<div class="gRight">

			<!-- sort -->
			<div class="mSort2">
				<ul>
					<li class="w32per">
						<div class="tit">사용여부</div>
						<div class="txt">
							<div class="mFlex2">
								<span class="flex">
                                    <select class="select" title="사용여부">
                                        <option></option>
                                    </select>
                                </span>
                                <span class="button">
                                    <a href="#" class="mBtn1">검색</a>
                                </span>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<!-- //sort -->

			<!-- box -->
			<div class="mBox1 p24">
				
				<div class="gTitle1">
					<h3 class="mTitle1">유형관리 목록</h3>
					<div class="gRt">
						<a href="#" class="mBtn1 gray">엑셀다운로드</a>
					</div>
				</div>
				<!-- board -->
				<div class="mBoard1 mCustomScrollbar hSortRow1 pType1"> 
                    <!--
                        class="hSortRow1"   => 상단 검색이 1줄 일 경우
                        class="pType1"      => td height="30px"
                    -->
					<table>
						<caption>캠페인 목록</caption>
						<colgroup>
							<col width="3%">
							<col width="5%">
							<col width="10%">
							<col width="*">
							<col span="3" width="12%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">NO</th>
								<th scope="col">구분</th>
								<th scope="col">유형Code</th>
								<th scope="col">유형명</th>
								<th scope="col">사용</th>
								<th scope="col">형태</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>캠페인</td>
								<td>PR001</td>
								<td class="left">기념일</td>
								<td>
                                    <select class="select" title="사용">
                                        <option>사용</option>
                                    </select>
                                </td>
								<td>
                                    <select class="select" title="형태">
                                        <option>원샷</option>
                                    </select>
                                </td>
								<td>2022-11-01</td>
							</tr>
							<tr>
								<td>2</td>
								<td>캠페인</td>
								<td>PR001</td>
								<td class="left">기념일</td>
								<td>
                                    <select class="select" title="사용">
                                        <option>사용</option>
                                    </select>
                                </td>
								<td>
                                    <select class="select" title="형태">
                                        <option>원샷</option>
                                    </select>
                                </td>
								<td>2022-11-01</td>
							</tr>
							<tr>
								<td>3</td>
								<td>캠페인</td>
								<td>PR001</td>
								<td class="left">기념일</td>
								<td>
                                    <select class="select" title="사용">
                                        <option>사용</option>
                                    </select>
                                </td>
								<td>
                                    <select class="select" title="형태">
                                        <option>원샷</option>
                                    </select>
                                </td>
								<td>2022-11-01</td>
							</tr>
							<tr>
								<td>4</td>
								<td>캠페인</td>
								<td>PR001</td>
								<td class="left">기념일</td>
								<td>
                                    <select class="select" title="사용">
                                        <option>사용</option>
                                    </select>
                                </td>
								<td>
                                    <select class="select" title="형태">
                                        <option>원샷</option>
                                    </select>
                                </td>
								<td>2022-11-01</td>
							</tr>
							<tr>
								<td>5</td>
								<td>캠페인</td>
								<td>PR001</td>
								<td class="left">기념일</td>
								<td>
                                    <select class="select" title="사용">
                                        <option>사용</option>
                                    </select>
                                </td>
								<td>
                                    <select class="select" title="형태">
                                        <option>원샷</option>
                                    </select>
                                </td>
								<td>2022-11-01</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- //board -->
				<!-- paging -->
				<div class="mPag1">
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
			<!-- //box -->

		</div>
		<!-- //right -->
                </div>
                <!-- //grid -->
				
			</div>
			<!-- //box -->

		</div>
		<!-- //right -->
	</div>
	
</div>



<script>
var _current_code_cd = null;


/* 공통코드 그리드 load */
function grdList_load(gridView, gridId) {
	search();
}

/* 하부코드 그리드 load */
function grdDetail_load(gridView, gridId) {
}

/* 공통코드 Row클릭 시 */
function grdList_rowChanged(grdList, oldRow, newRow, rowData) {
	
}


function onGridLoad(gridView, gridId) {
}



/* 그리드 컬럼 클릭 */
function onGridCellClick(gridView, rowIndex, columnName, colIndex, fieldIndex) {

}

function grdList_cellClick(gridView, itemIndex, column, index, field){

	var url = "<c:url value='${urlPrefix}/add${urlSuffix}'/>?mshipCoupnBasNo="+ gridView.getCurrentJson().mshipCoupnBasNo ;
	Utilities.openModal(url, "100%", 1800);
	//location.href = url;

}

function cpyCamp(){
	var saveJson = grdList.getCheckedJson();
	
	if (saveJson.length == 0) {
		alert("복사할 캠페인을 선택해주세요.");
		return;
	}
	
	if( saveJson.length > 1){
		alert("복사할 캠페인 한개만 선택해 주세요.");
		return;
	}


	saveJson[0].stat = "c";
	saveJson[0].mshipCoupnBasNo = null;
	saveJson[0]._attributes = null;
	
	if (saveJson.length) {
		
		if (!confirm("캠페인 기본 코드는 자동으로 생성됩니다. \n\n선택된 캠페인을 복사하시겠습니까?"))
			return;
		
		var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
		Utilities.getAjax(url, saveJson[0], true, function(data, jqXHR) {
			if (Utilities.processResult(data, jqXHR, "캠페인 복사가 실패했습니다.")) {
				alert("캠페인 복사가 완료되었습니다.");
					search();
					$("#frmDetail")[0].reset();
			}
		});
	} else {
		alert("선택된 데이터가 없습니다.");
	}
	
}

/* 그리드 컬럼 더블 클릭 */
function onGridCellDblClick(gridView, rowIndex, columnName, colIndex,
		fieldIndex) {

}

function onGridRowChanged(gridView, oldRow, newRow) {

}

/* 검색조건 검색 */
function search() {
	$("form#frmSearch").find("#currentPageNo").val(1);
 	var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
	var param = Utilities.formToMap("frmSearch");
	param.recordCountPerPage = 20;
	grdList.loadUrl(url, param);
}

/* 캠페인상세 */
function newCamp(){
 	var url = "<c:url value='${urlPrefix}/add${urlSuffix}'/>?campBasNo=";
 	// openModal :function(url,width,height,callFunc,callbackFunc,callbackWin)
 	Utilities.openModal(url, 1200, 600);
 	//Utilities.windowOpen(url,  900, 730);
}

/* 대분류 저장 */
function saveCode(){
	saveCodeList(grdList);
}



</script>