<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div class="mPopup1">
	<form id="frmMain">
    <!-- header -->
    <div class="title">
        <h1>포인트 사용 현황</h1>
        <a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
    </div>
    
	<div class="cont">
        
        <!-- grid -->
        <div class="mGrid2">
            	<div class="gTitle1 line">
		            <h3 class="mTitle1">포인트 사용 현황 정보</h3>
		        </div>
		        <input type="hidden" class="it" id="storNo" name="storNo" value="${storNo}" disabled/>
				<%-- <input type="hidden" class="it" id="onOffCd" name="onOffCd" value="${onOffCd}" disabled/> --%>
				<!-- board -->
                <div class="mBoard2"> 
                    <table>
                        <caption>충성고객 정보</caption>
                         <colgroup>
                         	<col width="15%">
                            <col width="25%">
                            <col width="15%">
                            <col width="45%">
                        </colgroup>
                        <tbody>
                            <tr>
                            	<th class="center" scope="row">거래일</th>
                                <td>
                                	<div class="mDate1">
										<input type="text" class="it" id="strtDt" name="strtDt" value="${strtDt}" disabled/>
										<span class="bar">~</span>
										<input type="text" class="it" id="endDt" name="endDt" value="${endDt}" disabled/>
								    </div>
                                </td>
                                <th class="center" scope="row">매장명</th>
                                <td>
									<input type="text" class="it" id="storNm" name="storNm" value="${storNm}" disabled/>
                                </td>
<%--                                 <th class="center" scope="row">온오프</th>
                                <td>
									<input type="text" class="it" id="onOffNm" name="onOffNm" value="${onOffNm}" disabled/>
                                </td> --%>
                            </tr>
                            
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
                
                <div class="gTitle1 line">
		            <h3 class="mTitle1">포인트 사용 현황 상세목록</h3>
		        </div>
                <div class="mGrid2">
					<div  id="divGrid" style="height:${rightBoxHeight2}" data-grid-id="grdList" 
					     data-pagenation="Y" 
					     data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
					     data-type="grid" 
					     data-grid-callback="onGridLoad" 
					     data-tpl-url="<c:url value='/static/gridTemplate/cst/CR042.xml'/>">
					</div>
				</div>

        </div>
        <!-- //grid -->
        
    </div>
	</form>
</div>

<div class="right" style="margin: 0px 30px">
		<a href="#" data-btn-type="closeModal" class="mBtn1">창닫기</a>
</div>



<script>

window.onload = function(){
	
	$("#strtDt").val("${strtDt}");
	$("#endDt").val("${endDt}");

}

function search()
{
	/* var param = {};
    param.itgCustNo = '${itgCustNo}';
    param.salesDivCd = '${salesDivCd}';
     */
    var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmMain");
    grdList.loadUrl(url,param);
}

/* 그리드 로드 */
function grdList_load(gridView,gridId){
    search();
}

setToday(); 
</script>