<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%>

<div class="mSort2">
<form role="form" id="frmSearch">
			<ul >
				<li class="w100per">
					 <div class="tit" style="width: 10%;">채널</div>
                     <div class="txt" style="width:20%">
                     <code:commCode id="sysCd" name="sysCd" codeCd="S000" prefixLabel="전체" prefixValue=""/>

                     </div>
                     <div class="tit" style="width: 10%;">배치명</div>
                     <div class="txt" style="width:20%">
                     <input type="text" id="batchNmLike" data-enter="search" name="batchNmLike" class="it" placeholder="배치명">
                     </div>

                     
                     <div class="tit" style="width : 10%;">Job ID</div>
                     <div class="txt" style="width : 20%">
                        <input type="text" id="jobIdLike" data-enter="search" name="jobIdLike" class="it" placeholder="Job ID">
                     </div>



					 <div class="tit" style="width: 10%;">
                         <a href="#" class="mBtn1" data-click="search" >검색</a>
                     </div>
				</li>
			</ul>
</form>
</div>

			
 <div class="mBox1 ">
 	<div class="gTitle1">
			<h3 class="mTitle1">배치 관리</h3>
				<div class="gRt">
					<code:btnGroup name="Batch" gridId="grdList"/>
				</div>
		</div>
 	<div  id="divGrid"  style="height:${rightBoxHeight4}" data-grid-id="grdList" 
 	
										data-pagenation="Y" 
										data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
										data-type="grid" 
										data-grid-callback="onGridLoad" 
										data-tpl-url="<c:url value='/static/gridTemplate/system/batchInfoBas.xml'/>" >
</div>
		
</div>

                   

<script>

function newBatch(element,data){
    grdList.addRow({sysCd:"CRM",useYn : 'Y'});
}
function search()
{
    var url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
    var param = Utilities.formToMap("frmSearch");
    grdList.loadUrl(url,param);
}
function grdList_pageMove(gridView,pageNo){
    $("form#frmSearch").find("#currentPageNo").val(pageNo);
    search();
}

function saveValidate(){
	var cuGridData = grdList.getSaveJson();
	for(var i=0; i<cuGridData.length; i++){
	    if(Utilities.isEmpty(cuGridData[i].sysCd)){
	    	alert("채널정보 입력하세요.");
	    	return false;
	    }
	    if(Utilities.isEmpty(cuGridData[i].batchNm)){
            alert("배치명을 입력하세요.");
            return false;
        }
	    if(Utilities.isEmpty(cuGridData[i].wrkId)){
            alert("JobId를 입력하세요.");
            return false;
        }
       
	}
	return true;
	//return true;
}

function saveBatch(){

	if(!saveValidate()) return;
	
    var saveJson = grdList.getSaveJson();
    if(saveJson.length){
        if(!confirm("수정된 데이터를 저장하시겠습니까?"))
            return ;
        var url = "<c:url value='${urlPrefix}/saveList${urlSuffix}'/>";
        Utilities.getAjax(url,saveJson,true,function(data,jqXHR){
            if(Utilities.processResult(data,jqXHR,"API 저장에 실패했습니다."))
            {
                alert("API 저장에  성공했습니다.");
                grdList.reload();
            }
        });
    }
    else{
        alert("수정된 데이터가 없습니다.");
    }
}
function addBatch(data){
    if(!data)
        return;
    data.stat = "n";
    grdList.addRow(data);
}
function removeBatch(){
    var list = grdList.getCheckedJson();
    if(list.length ==0)
    {
        alert("체크된 데이터가 존재하지 않습니다.");
        return;
    }
    var saveJson = grdList.getCheckedJson();
    if(saveJson.length){
        if(!confirm("데이터를 삭제하면 복구할  수 없습니다. 계속하시겠습니까?"))
            return ;
        var url = "<c:url value='${urlPrefix}/deleteList${urlSuffix}'/>";
        Utilities.getAjax(url,saveJson,true,function(data,jqXHR){
            if(Utilities.processResult(data,jqXHR,"Batch 삭제에 실패했습니다."))
            {
                alert("Batch 삭제에  성공했습니다.");
                grdList.removeCheckRow();
            }
        });
    }
    else{
        alert("선택된 데이터가 없습니다.");
    }
}


function grdList_load(gridView,gridId){
	
		
	if(${LOGIN_USER.hasGroup("A0001")} 
	   && (_user_login_id=="crm_13007@ceragem.com" || _user_login_id=="crm_13002@ceragem.com")){
		grdList.showColumn("btnExecute","btnExecute");
	}
     search();
}
function grdList_btnDetail_buttonClicked(gridView,row,col,json){
    showDetail(json);
}
function grdList_btnExecute_buttonClicked(gridView,row,col,json){
    executeBatch(json);
}

/* 그리드 컬럼 더블 클릭 */
// function onGridCellDblClick(gridView,itemIndex, column, json, value){
//     showDetail(json);
// }

function showDetail(json){
    var url = "<c:url value='${urlPrefix}/detail${urlSuffix}'/>/"+ json.batchCd;
    Utilities.openModal(url,1500,750);
}
function executeBatch(json){
	if(confirm("배치를 실행하시겠습니까?"))
	var url = "<c:url value='${urlPrefix}/execute/'/>" + json.batchCd;
    Utilities.getAjax(url,null,false,function(data,jqXHR){
        if(Utilities.processResult(data,jqXHR,"배치실행에 실패했습니다."))
        {
            alert("배치를 실행시켰습니다.\n잠시 후 실행기록을 확인해 주세요");
        }
    });
}
</script>