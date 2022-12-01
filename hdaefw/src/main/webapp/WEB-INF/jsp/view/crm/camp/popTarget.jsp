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
        <h1>캠페인 대상 - 대상군 선택</h1>
        <a href="#" data-click="closeModal" class="close">팝업 닫기</a>
    </div>
    <!-- //header -->

    <!-- cont -->
    <div class="cont">

        <div class="gTitle1 mb10">
            <h3 class="mTitle1">대상군 선택</h3>
            <div class="gRt posT-5">
                <a href="#" class="mBtn1 lGray">승인요청</a>
                <a href="#" class="mBtn1 lPrimary">정보수정</a>
            </div>
        </div>
        <!-- box -->
        <div class="mBox1 p5">
            <!-- board -->
            <div class="mBoard1 mCustomScrollbar pType1 h469"> 
                <table>
                    <caption>캠페인 목록</caption>
                    <colgroup>
                        <col span="2" width="3%">
                        <col width="15%">
                        <col width="*">
                        <col span="4" width="12%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">NO</th>
                            <th scope="col">선택</th>
                            <th scope="col">그룹토드</th>
                            <th scope="col">그룹명</th>
                            <th scope="col">현재고객수</th>
                            <th scope="col">추출방식</th>
                            <th scope="col">사용만료일</th>
                            <th scope="col">등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>
                                <label class="mCheckbox1 notext">
                                    <input type="checkbox" title="선택">
                                    <span class="label">선택</span>
                                </label>
                            </td>
                            <td>CP000001</td>
                            <td class="left"><a href="#">최근 VIP 승급</a></td>
                            <td>SQL</td>
                            <td>진행중</td>
                            <td>2022-02-04</td>
                            <td>2022-02-04</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>
                                <label class="mCheckbox1 notext">
                                    <input type="checkbox" title="선택">
                                    <span class="label">선택</span>
                                </label>
                            </td>
                            <td>CP000001</td>
                            <td class="left"><a href="#">최근 VIP 승급</a></td>
                            <td>SQL</td>
                            <td>진행중</td>
                            <td>2022-02-04</td>
                            <td>2022-02-04</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>
                                <label class="mCheckbox1 notext">
                                    <input type="checkbox" title="선택">
                                    <span class="label">선택</span>
                                </label>
                            </td>
                            <td>CP000001</td>
                            <td class="left"><a href="#">최근 VIP 승급</a></td>
                            <td>SQL</td>
                            <td>진행중</td>
                            <td>2022-02-04</td>
                            <td>2022-02-04</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>
                                <label class="mCheckbox1 notext">
                                    <input type="checkbox" title="선택">
                                    <span class="label">선택</span>
                                </label>
                            </td>
                            <td>CP000001</td>
                            <td class="left"><a href="#">최근 VIP 승급</a></td>
                            <td>SQL</td>
                            <td>진행중</td>
                            <td>2022-02-04</td>
                            <td>2022-02-04</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>
                                <label class="mCheckbox1 notext">
                                    <input type="checkbox" title="선택">
                                    <span class="label">선택</span>
                                </label>
                            </td>
                            <td>CP000001</td>
                            <td class="left"><a href="#">최근 VIP 승급</a></td>
                            <td>SQL</td>
                            <td>진행중</td>
                            <td>2022-02-04</td>
                            <td>2022-02-04</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>
                                <label class="mCheckbox1 notext">
                                    <input type="checkbox" title="선택">
                                    <span class="label">선택</span>
                                </label>
                            </td>
                            <td>CP000001</td>
                            <td class="left"><a href="#">최근 VIP 승급</a></td>
                            <td>SQL</td>
                            <td>진행중</td>
                            <td>2022-02-04</td>
                            <td>2022-02-04</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>
                                <label class="mCheckbox1 notext">
                                    <input type="checkbox" title="선택">
                                    <span class="label">선택</span>
                                </label>
                            </td>
                            <td>CP000001</td>
                            <td class="left"><a href="#">최근 VIP 승급</a></td>
                            <td>SQL</td>
                            <td>진행중</td>
                            <td>2022-02-04</td>
                            <td>2022-02-04</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>
                                <label class="mCheckbox1 notext">
                                    <input type="checkbox" title="선택">
                                    <span class="label">선택</span>
                                </label>
                            </td>
                            <td>CP000001</td>
                            <td class="left"><a href="#">최근 VIP 승급</a></td>
                            <td>SQL</td>
                            <td>진행중</td>
                            <td>2022-02-04</td>
                            <td>2022-02-04</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>
                                <label class="mCheckbox1 notext">
                                    <input type="checkbox" title="선택">
                                    <span class="label">선택</span>
                                </label>
                            </td>
                            <td>CP000001</td>
                            <td class="left"><a href="#">최근 VIP 승급</a></td>
                            <td>SQL</td>
                            <td>진행중</td>
                            <td>2022-02-04</td>
                            <td>2022-02-04</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>
                                <label class="mCheckbox1 notext">
                                    <input type="checkbox" title="선택">
                                    <span class="label">선택</span>
                                </label>
                            </td>
                            <td>CP000001</td>
                            <td class="left"><a href="#">최근 VIP 승급</a></td>
                            <td>SQL</td>
                            <td>진행중</td>
                            <td>2022-02-04</td>
                            <td>2022-02-04</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>
                                <label class="mCheckbox1 notext">
                                    <input type="checkbox" title="선택">
                                    <span class="label">선택</span>
                                </label>
                            </td>
                            <td>CP000001</td>
                            <td class="left"><a href="#">최근 VIP 승급</a></td>
                            <td>SQL</td>
                            <td>진행중</td>
                            <td>2022-02-04</td>
                            <td>2022-02-04</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>
                                <label class="mCheckbox1 notext">
                                    <input type="checkbox" title="선택">
                                    <span class="label">선택</span>
                                </label>
                            </td>
                            <td>CP000001</td>
                            <td class="left"><a href="#">최근 VIP 승급</a></td>
                            <td>SQL</td>
                            <td>진행중</td>
                            <td>2022-02-04</td>
                            <td>2022-02-04</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>
                                <label class="mCheckbox1 notext">
                                    <input type="checkbox" title="선택">
                                    <span class="label">선택</span>
                                </label>
                            </td>
                            <td>CP000001</td>
                            <td class="left"><a href="#">최근 VIP 승급</a></td>
                            <td>SQL</td>
                            <td>진행중</td>
                            <td>2022-02-04</td>
                            <td>2022-02-04</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>
                                <label class="mCheckbox1 notext">
                                    <input type="checkbox" title="선택">
                                    <span class="label">선택</span>
                                </label>
                            </td>
                            <td>CP000001</td>
                            <td class="left"><a href="#">최근 VIP 승급</a></td>
                            <td>SQL</td>
                            <td>진행중</td>
                            <td>2022-02-04</td>
                            <td>2022-02-04</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>
                                <label class="mCheckbox1 notext">
                                    <input type="checkbox" title="선택">
                                    <span class="label">선택</span>
                                </label>
                            </td>
                            <td>CP000001</td>
                            <td class="left"><a href="#">최근 VIP 승급</a></td>
                            <td>SQL</td>
                            <td>진행중</td>
                            <td>2022-02-04</td>
                            <td>2022-02-04</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- //board -->
            <!-- paging -->
            <div class="mPag1">
                <div class="mCount1 posLt5">총 <strong>5</strong>건</div>

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
    <!-- //cont -->
	
</div>



<script>



// 켐페인 대상군 추가
function popTarget(){
	
	var url = "<c:url value='${urlPrefix}/add${urlSuffix}'/>?campBasNo=";
 	Utilities.openModal(url, 1200, 600);
}



</script>
