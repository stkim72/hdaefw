<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 
			
<script src="static/js/chart_3.6.0.js"></script>
<script src="static/js/chartjs-plugin-datalabels.min.js"></script>
			
<div class="mTab1 jsTab2">
    <ul class="tabs">
        <li value="graph" id="graphTab" class="active"><a href="#graphData" data-click="graphSearch">현황</a></li>
        <li value="raw" id="gridTab"><a href="#rawData">상세</a></li>
    </ul>
</div>	
			
<div class="mBox1 tabCont" id="graphData">     
 	<div class="mSort2">
	<input type="hidden" id="initInput" name="initInput"/>
	<form role="form" id="frmSearchGraph">
			<ul class="searchCon">
				<li class="w15per">
					<div class="tit">매장코드</div>
					<div class="txt">
						<div class="mFlex2">
							<span class="flex"><input type="text" class="it" id="storNoGraph" name="storNoGraph" placeholder="전체" title="매장코드" disabled></span>
							<a href="#" class="mBtn1 lWhite" data-click="storeSearchPop">검색</a>
						</div>
					</div>
				</li>
				<li class="w15per">
					<div class="tit">매장명</div>
					<div class="txt">
						<input type="text" class="it" id="storNmGraph" name="storNmGraph" placeholder="전체" disabled/>
					</div>
				</li>
				<li class="w20per">
					<div class="tit">회원명</div>
					<div class="txt">
						<div class="mFlex2">
							<span class="flex"><input type="text" class="it" id="custNmGraph" name="custNmGraph" placeholder="전체" title="회원명" disabled></span>
							<a href="#" class="mBtn1 lWhite" data-click="searchPop">검색</a>
						</div>
					</div>
				</li>
			</ul>
			<ul class="searchCon">
				<li class="w12per">
                        <div class="tit w85">쿠폰리스트</div>
                        <div class="txt">
                            <code:commCode  className="select" id="coupnTypeCdGraph" name="coupnTypeCdGraph" codeCd="MB080" prefixLabel="전체" prefixValue=""/>
                        </div>
               </li>
               
				<li class="w30per">
				    <div class="tit">기준일자</div>
				    <div class="tit"><button class="mBtn1" id="dateBtnGraph" data-click="dateClick" style="margin-right: 5px">연별로 전환</button></div>
				    <div class="txt" id="monthDateGraph">
				        <input type="text" data-type="month" class="it" id="stndDateMGraph" name="stndDateMGraph" />
				    </div>
				    <div class="hidden" id="yearDateGraph">
				        <input type="text" data-type="year" class="it" id="stndDateYGraph" name="stndDateYGraph" />
				    </div>
				</li>
                <li class="w25per">
                     <div class="tit">
                         <button class="mBtn1" data-click="initSearch" style="margin-right: 5px">초기화</button>
                         <button class="mBtn1" data-click="graphSearch" style="margin-right: 10px">검색</button>
                     </div>
				</li>
			</ul>	
    </form>
    </div>
    
    <div class="gTitle1">
		<h3 class="mTitle1">쿠폰 발행 현황</h3>
		<div class="chart-div">
		<div>
		<canvas id="barChartCanvas" width="1350px" height="600px" style="display:inline;"></canvas>
        </div>
    	</div>
	</div>
    
    
</div>





<div class="mBox1 tabCont hidden" id="rawData"> 
	
<div class="mSort2">
	<form role="form" id="frmSearch">
			<ul class="searchCon">
				<li class="w15per">
					<div class="tit">매장코드</div>
					<div class="txt">
						<div class="mFlex2">
							<span class="flex"><input type="text" class="it" id="storNo" name="storNo" placeholder="전체" title="매장코드" disabled></span>
							<a href="#" class="mBtn1 lWhite" data-click="storeSearchPop">검색</a>
						</div>
					</div>
				</li>
				<li class="w15per">
					<div class="tit">매장명</div>
					<div class="txt">
						<input type="text" class="it" id="storNm" name="storNm" placeholder="전체" disabled/>
					</div>
				</li>
				<li class="w20per">
					<div class="tit">회원명</div>
					<div class="txt">
						<div class="mFlex2">
							<span class="flex"><input type="text" class="it" id="custNm" name="custNm" placeholder="전체" title="회원명" disabled></span>
							<a href="#" class="mBtn1 lWhite" data-click="searchPop">검색</a>
						</div>
					</div>
				</li>
				</ul>
				<ul class="searchCon2">
				<li class="w12per">
                        <div class="tit w85">쿠폰리스트</div>
                        <div class="txt">
                            <code:commCode  className="select" id="coupnTypeCd" name="coupnTypeCd" codeCd="MB080" prefixLabel="전체" prefixValue=""/>
                        </div>
               </li>
				
				<li class="w30per">
				    <div class="tit">기준일자</div>
				    <div class="tit"><button class="mBtn1" id="dateBtn" data-click="dateClick" style="margin-right: 5px">연별로 전환</button></div>
				    <div class="txt" id="monthDate">
				        <input type="text" data-type="month" class="it" id="stndDateM" name="stndDateM" />
				    </div>
				    <div class="hidden" id="yearDate">
				        <input type="text" data-type="year" class="it" id="stndDateY" name="stndDateY" />
				    </div>
				</li>
                <li class="w25per">
                     <div class="tit">
                         <button class="mBtn1" data-click="initSearch" style="margin-right: 5px">초기화</button>
                         <button class="mBtn1" data-click="search" style="margin-right: 10px">검색</button>
                     </div>
				</li>
			</ul>	
    </form>
</div>
     
 	<div class="gTitle1">
		<h3 class="mTitle1">상세 정보 목록</h3>
			<div class="gRt">
				<code:btnGroup name="excelDown" hideDelete="true" hideInsert="true" hideSave="true" dispName="쿠폰발행내역" gridId="grdList"/>
			</div>
	</div>
 	<div style="height:520px" data-grid-id="grdList"
										data-pagenation="Y" 
										data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
										data-type="grid" 
										data-block-ui="Y"
										data-grid-callback="onGridLoad" 
										data-tpl-url="<c:url value='/static/gridTemplate/cusstatus/couponIssued.xml'/>" >
	</div>
</div>

<script>

//function search(changeValue)
//{   
//	if($("#gridTab")[0].classList[0] == "active"){
//		grid_load();
//	}
//}
//////////////////////////////////////////////////////

function search(changeValue)
{   
	if($("#graphTab")[0].classList[0] == "active"){
		if(changeValue){
            barChart.destroy();
        }
		
		barChart = chartDraw('barChartCanvas', 'bar', barLabels, 
    			[{data: barData,
    				backgroundColor: ['rgb(255, 99, 132)',],
    				label: '쿠폰발급 수'}], barOptions('쿠폰발급내역 그래프'));
	}
	
	if($("#gridTab")[0].classList[0] == "active"){
		grid_load();
	}
}

const chartDraw = function(chartId, chartType, chartLabels, chartDataSets, chartOptions){
	return pieChart = new Chart(document.getElementById(chartId).getContext('2d'), {
        type: chartType,
        data: {
            labels: chartLabels,
            datasets: chartDataSets
        },
        options: chartOptions,
        
        
        plugins: [ChartDataLabels]
    });
}

const barConfig = {
		formatter: function(value, context){
			return new Intl.NumberFormat('ja-JP').format(value);
		}
}


const barOptions = function(title){
	return {
        plugins:{
        	title:{
            	text: title,
            	display:true
            },
            datalabels: barConfig,
            legend:{
            	display:true,
            	position:'top'
            }
        },
        scales:{
        	y:{
        		title:{
            		display:true,
            		text: '쿠폰 수'
            	}	
        	},
        	x:{
        		title:{
        			display:true,
        			text:'발급날짜'
        		}
        	}
        }
    }
}

var barLabels = '';
var barData = '';

async function graphSearch(){
	const barUrl = "<c:url value='${urlPrefix}/editBarGraph${urlSuffix}'/>";
	const param = Utilities.formToMap("frmSearchGraph");
	Utilities.blockUI();
	await fetch(barUrl,{
    	method:"POST",
    	headers: {
  	      'Content-Type': 'application/json',
  	    },
    	body: JSON.stringify(param)
    }).then(response => {
            response.json().then(res => {
            	Utilities.unblockUI();
				barLabels = res[0];
            	barData = res[1];
            	
            	search(true);
            })
    }); 
}



//////////////////////////////////////////



function grid_load(){   
	const url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
    const param = Utilities.formToMap("frmSearch");
    grdList.loadUrl(url,param);	
}

function grdList_pageMove(gridView,pageNo){
    $("form#frmSearch").find("#currentPageNo").val(pageNo);
    search();
}

function grdList_load(gridView,gridId){
	initSearch();
	//dateSettingYear();
	dateSettingMonth();
	search();
	graphSearch();
}


///////////////////////반영////////////////////////////
/* 회원목록 검색 팝업 로드 */
function searchPop(){
	var url = "/util/searchCust";
    Utilities.openModal(url,1000,600);
}

/* 회원목록 검색 팝업 종료 후처리 */
function custNmSelect(data){
	$("#custNm").val(data.custNm);
	$("#custNmGraph").val(data.custNm);
}

/* 매장목록 검색 팝업 로드 */
function storeSearchPop(){
	Utilities.openStorePop("storeSearchInfoGet");
}

/* 매장목록 검색 팝업 종료 후처리 */
function storeSearchInfoGet(data){
	if(data != null){
		if(data.storNo == $('#storNo').val()){
			alert("같은 매장입니다.");
			return false;
		}
		
		$('#storNo').val(data.storNo);
		$('#storNm').val(data.storNm);
		$('#storNoGraph').val(data.storNo);
		$('#storNmGraph').val(data.storNm);
	}
}
///////////////////////////////////////////////////////////

function initSearch(){
	Utilities.mapToForm({}, "frmSearch");
	Utilities.mapToForm({}, "frmSearchGraph");
	// hidden 필드 초기화
	$("#initInput").val("");
}
/////////////////////////////////////////////////
function dateClick(){
	$("#stndDateY").val("");
	$("#stndDateM").val("");
	$("#stndDateYGraph").val("");
	$("#stndDateMGraph").val("");
	
	/* if($("#yearDate")[0].classList[0] == "txt"){
		$("#yearDate").addClass("hidden")
		$("#yearDate").removeClass("txt")
		
		$("#monthDate").removeClass("hidden")
		$("#monthDate").addClass("txt")
		
		$("#dateBtn")[0].innerText = "연도로 전환";
		dateSettingMonth();
	}else{
		$("#monthDate").addClass("hidden")
		$("#monthDate").removeClass("txt")
		
		$("#yearDate").addClass("txt")
		$("#yearDate").removeClass("hidden")	
		
		$("#dateBtn")[0].innerText = "월별로 전환";
		dateSettingYear();
	} */
	
	if($("#yearDateGraph")[0].classList[0] == "txt"){
		$("#yearDateGraph").addClass("hidden")
		$("#yearDateGraph").removeClass("txt")
		
		$("#monthDateGraph").removeClass("hidden")
		$("#monthDateGraph").addClass("txt")
		
		$("#dateBtnGraph")[0].innerText = "연도로 전환";
		dateSettingMonth();
		
		$("#yearDate").addClass("hidden")
		$("#yearDate").removeClass("txt")
		
		$("#monthDate").removeClass("hidden")
		$("#monthDate").addClass("txt")
		
		$("#dateBtn")[0].innerText = "연도로 전환";
	}else{
		$("#monthDateGraph").addClass("hidden")
		$("#monthDateGraph").removeClass("txt")
		
		$("#yearDateGraph").addClass("txt")
		$("#yearDateGraph").removeClass("hidden")		
		
		$("#dateBtnGraph")[0].innerText = "월별로 전환";
		dateSettingYear();
		
		$("#monthDate").addClass("hidden")
		$("#monthDate").removeClass("txt")
		
		$("#yearDate").addClass("txt")
		$("#yearDate").removeClass("hidden")	
		
		$("#dateBtn")[0].innerText = "월별로 전환";
	}
}

function dateSettingMonth(){
    var strDateM = moment().format("YYYYMM");
    
    $("#stndDateMGraph").val(strDateM);
    $("#stndDateM").val(strDateM);
}

function dateSettingYear(){
    var strDateY = moment().format("YYYY");
    
    $("#stndDateYGraph").val(strDateY);
    $("#stndDateY").val(strDateY);
}

$(document).ready(function(){
	/* $("#excelDown").off().on("click", function(){
		const dt = new Date();
		const year = dt.getFullYear();
		const month = ("0"+(dt.getMonth() + 1)).slice(-2);
		const day = ("0"+dt.getDate()).slice(-2);
		
		const excelName = "쿠폰사용내역_" + year + month + day + ".xlsx"
		
		grdList.getGridExcel(excelName, true);
	}); */
	
	$("#stndDateMGraph").change(function(){
	    $("#stndDateM").val(this.value);
	});
	$("#stndDateYGraph").change(function(){
	    $("#stndDateY").val(this.value);
	});
	
	$("#stndDateM").change(function(){
	    $("#stndDateMGraph").val(this.value);
	});
	$("#stndDateY").change(function(){
	    $("#stndDateYGraph").val(this.value);
	});
});
</script>

<style>
.mTab1 li a{
	padding: 0px;
}

input:disabled{
    background-color: rgba(0,0,0,.05) !important;	
}

button{
    border: 1px solid #898989;
    background-color: #fff;
    display: inline-block;
    border-radius: 2px;
    color: #797979;
    letter-spacing: -1px;
    padding: 0 8px;
    height: 24px;
    font-size: 12px;
    font-family: "Noto Sans KR", "맑은 고딕", "돋움", dotum, sans-serif;
}
</style>