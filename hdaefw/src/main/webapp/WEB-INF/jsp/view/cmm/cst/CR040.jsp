<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%>

<form role="form" id="frmSearch">
<div class="mSort2 medium">
				<ul>
					<li class="w26per">
						<div class="tit">사용기간</div>
						<div class="txt">
							<div class="mDate1">
								<input type="text" class="it date" title="시작일" data-type="dateRangeStart" data-range-end="endDt" id="strtDt" name="strtDt" data-enter="search" data-button="Y" value="">
								<span class="bar">~</span>
								<input type="text" class="it date" title="마지막일" id="endDt" name="endDt" data-enter="search" data-button="Y" value="">
							</div>
						</div>
						
						
					</li>	
					<!-- <li class="w26per">
						<div class="tit">이름</div>
						<div class="txt">
							<input type="text" id="custNm" name="custNm" class="it" title="이름" placeholder="이름">
						</div>
					</li> -->
					<!-- <li class="w26per">
						<div class="tit">아이디</div>
						<div class="txt">
							<input type="text" id="custNm" name="custNm" class="it" title="이름" placeholder="이름">
						</div>
					</li> -->
					
					<li class="w26per">
						<div class="tit">디바이스</div>
						<!-- <div class="txt">
								<input type="text" name="model" id="model" class="it" title="" value="" >
						</div> -->
						<div class="txt">
                            <select id="deviceCd" name="deviceCd" style="width:100px">
                                <option value="">전체</option>
                                <option value="VM34">V4</option>
                                <option value="VM6">V6</option>
                            </select>
                        </div>
					</li>
					
					<li class="w26per">
						<div class="tit">모드</div>
						<%-- <div class="txt">
								<code:commCode id="mode1" name="mode1" codeCd="CU260" prefixLabel="전체" prefixValue=""/>
						</div> --%>
                        <div class="txt">
                            <select id="modeCd" name="modeCd" style="width:200px">
                            </select>
                        </div>
					</li>
					
<%-- 					<li class="w26per">
						<div class="tit">강도</div>
						<div class="txt">
								<code:commCode id="gndrCd" name="gndrCd" codeCd="CU290" prefixLabel="전체" prefixValue=""/>
						</div>
					</li> --%>
					
				</ul>
				<div class="button posRt"> <!-- 버튼 상하 가운데 정렬 : class="posVm" -->
					<a href="#" class="mBtn1" data-click="search">검색</a>
				</div>
</div>
</form>

<div  id="divGrid" style="height:335px" data-grid-id="grdList" 
    data-pagenation="Y" 
    data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
    data-type="grid" 
    data-grid-callback="onGridLoad" 
    data-tpl-url="<c:url value='/static/gridTemplate/cst/CR040.xml'/>">
</div>


<script>

$("document").ready(function(){
    initPage();
});

function initPage(){
    
    $("#deviceCd").change( function() {
        //console.log(">>> "+ $(this).val());
        getModeListByType($(this).val());
    });

    $('#deviceCd').val('').trigger('change');
}

function getModeListByType(code){

	if(code)
	{
		var url = "/commCode/getComboCode";
	    var param = {codeCd : code};
	    Utilities.getAjax(url, param, true, function(list,jqXHR){
	        if(Utilities.processResult(list,jqXHR,"콤보데이터를 가져올 수 없습니다.")){
	            var modeEl = $('#modeCd');
	            if(list.length > 0){
	                modeEl.html("");
	                var modeListStr = "<option value=''>모드선택</option>";
	                for(var i=0;i<list.length;i++){
	                    let cData = list[i];
	                    modeListStr += '<option value="'+ cData.comnCd +'">'+ cData.comnCdNm +'</option>';
	                }
	                modeEl.html(modeListStr);
	            }
	        }
	    });
	}
	else
	{
		var modeEl = $('#modeCd');
		modeEl.html("");
        var modeListStr = "<option value=''>전체</option>";
        modeEl.html(modeListStr);
	}
    
}

function grdList_load(gridView,gridId){
    search();
}

function search()
{
    var url = "<c:url value='${urlPrefix}/getCeraIotList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    //if(parent.document.all["itgCustNo"].value != "")
    if(parent.parenItgCustNo)   
    {
        //param.itgCustNo = parent.document.all["itgCustNo"].value;
        param.itgCustNo = parent.parenItgCustNo;
        grdList.loadUrl(url,param);
    }
}
//setToday(); 

</script>