<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 


<div id="wrapIframe">
	
    <div class="mGrid1 type3"> <!-- class="type3" => left:610px -->
    	<!-- left -->
        <div class="gLeft">
			<form role="form" id="frmLeft">
			<input type="hidden" class="it" id="topComnCd" name="topComnCd" value="GD050">
			<input type="hidden" class="it" id="comnCdLvlNo" name="comnCdLvlNo" value="2">
            <!-- 고객정보 -->
            <div class="mBox1">
                <!-- title -->
                <div class="gTitle1">
                    <h3 class="mTitle1">제품상세유형 목록</h3>
                </div>
                <!-- //title -->
                <!-- sort -->
                <div class="mSort2">
                    <ul>
                        <li class="w50per">
                            <div class="tit">제품상세유형명</div>
                            <div class="txt">
                            	<div class="mFlex2">
	                                <span class="flex">
	                                    <input type="text" class="it" title="제품유형명" id="comnCdNmLike" name="comnCdNmLike">
	                                </span>
	                                
	                            </div>
                            </div>
                        </li>
                        
                        <li class="w28per">
                            <div class="tit w65">사용여부</div>
                            <div class="txt">
								<code:commCode id="useYn" name="useYn" codeCd="S010" prefixLabel="전체" prefixValue=""/>
							</div>
                        </li>
                    </ul>
                    <div class="button posRt"> <!-- 버튼 상하 가운데 정렬 : class="posVm" -->
						<a href="#" class="mBtn1" data-click="search">검색</a>
					</div>
                </div>
                <!-- //sort -->
                <!-- list -->
                <div id="divComnCdGrid"  style="height:${rightBoxHeight4}" 
                				   data-grid-id="comnCdGrdList" 
                                   data-pagenation="Y" 
                                   data-get-url="<c:url value='${urlPrefix}/getCrmComnCdList${urlSuffix}'/>" 
                                   data-type="grid" 
                                   data-grid-callback="onComnCdGridLoad" 
                                   data-tpl-url="<c:url value='/static/gridTemplate/mem/MB074_1.xml'/>">
				</div>
            </div>
            </form>
        </div>
        <!-- //left -->
        
        
        <!-- right -->
        <div class="gRight">
        	<form role="form" id="frmRight">
        	<input type="hidden" class="it" id="godsClassCd" name="godsClassCd" value="">
			 <!-- 고객정보 -->
            <div class="mBox1">
                <!-- title -->
                <div class="gTitle1">
                    <h3 class="mTitle1">제품 목록</h3>
                </div>
                <!-- //title -->
                <!-- sort -->
                <div class="mSort2">
                    <ul>
<%-- 						<li class="w20per">
							<div id="productGroupTxt" class="tit">제품군</div>
							<div class="txt">
									<code:commCode id="productGroup" name="productGroup" codeCd="CU260" prefixLabel="전체" prefixValue=""/>
							</div>
						</li> --%>	
						<li class="w26per">
							<div class="tit">제품명</div>
							<div class="txt">
									<input type="text" name="godsNmLike" id="godsNmLike" class="it" title="제품명">
							</div>
							
							
						</li>
						
 						<li class="w20per">
							<div class="tit">사용여부</div>
							<div class="txt">
									<code:commCode id="productUseYn" name="productUseYn" codeCd="S010" prefixLabel="전체" prefixValue=""/>
							</div>
						</li>		
					</ul>
					<div class="button posRt"> <!-- 버튼 상하 가운데 정렬 : class="posVm" -->
						<a href="#" class="mBtn1" data-click="productSearch">검색</a>
					</div>
                </div>
                <!-- //sort -->
                <!-- list -->
                <div  id="divGrid" style="height:${rightBoxHeight4}" data-grid-id="grdList" 
				    data-pagenation="Y" 
				    data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
				    data-type="grid" 
				    data-grid-callback="onGridLoad" 
				    data-tpl-url="<c:url value='/static/gridTemplate/mem/MB074.xml'/>">
				</div>
            </div>
			</form>	
        </div>
        <!-- //right -->
        
    </div>
	
</div>



<script>

/* 화면 로드 */
window.onload = function(){

}

/* 제품상세유형 목록 조회 */
function search(){
	
	grdList.clear();
	
    var url = "<c:url value='${urlPrefix}/getCrmComnCdList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmLeft");
    comnCdGrdList.loadUrl(url,param);
}

/* 제품목록 목록 조회 */
function productSearch(){
	
    var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmRight");
    if($("#godsClassCd").val() == "")
    {
    	alert("제품유형을 선택해주세요.");
    	return;
    }
   
    //param.useYn = $("#productUseYn").val();
    grdList.loadUrl(url,param);
}

/* 그리드 로드 */
function comnCdGrdList_load(gridView,gridId){
    search();
}


/* 그리드 셀 클릭 */
function comnCdGrdList_cellClick(gridView, itemIndex, column, index, field){
	
	clear();
	
	var objJson = gridView.getCurrentJson();
	
	$("#godsClassCd").val(objJson.comnCd);
	
	
	productSearch(); 
}

function clear()
{
	$("#godsNmLike").val("");
	$("#productUseYn").val("");
}


</script>