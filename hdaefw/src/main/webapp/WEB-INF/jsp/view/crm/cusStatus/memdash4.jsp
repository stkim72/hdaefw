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
        <li value="graph" id="graphTab" class="active"><a href="#graphData" data-click="graphSearchGrp">현황</a></li>
        <li value="raw" id="gridTab"><a href="#rawData" data-click="grid_load">상세</a></li>
    </ul>
</div>	

 <div class="mBox1 tabCont" id="graphData">     
 	<div class="gTitle1">
		<h3 class="mTitle1">회원 가입현황</h3>
	</div>
	<br>
	<div class="mSort2">
	
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
					<br>
					<div class="tit">매장명</div>
					<div class="txt">
						<input type="text" class="it" id="storNmGraph" name="storNmGraph" placeholder="전체" disabled/>
					</div>
				</li>
				
				<li class="w40per">
					<div class="tit">기준날짜</div>
					<div class="txt">
						<div class="mDate1">
		                    <input type="text" data-type="month" class="it" id="stndDt" name="stndDt" />
						</div>
					</div>
				</li>
   
               <li class="w12per">
                    <div class="right">
						<button class="mBtn1" data-click="initSearch" style="margin-right: 5px">초기화</button>
						<button class="mBtn1" data-click="graphSearchGrp" style="margin-right: 10px">검색</button>
					</div>
				</li>
			</ul>	
				
    </form>
    </div>
    <div class="chart-div">
		<div>
		<canvas id="barChartCanvas" width="1300px" height="270px" style="display:inline;"></canvas>
        </div>
        <div>
        <canvas id="lineChartCanvas" width="1300px" height="270px" style="display:inline;"></canvas>
        </div>
    </div>
</div>	

<div class="mBox1 tabCont hidden" id="rawData"> 
	
	<div class="mSort2">
		<form role="form" id="frmSearch">
		        <ul>
					<li class="w20per">
						<div class="tit">기간</div>
						<div class="txt">
							<div class="mDate1">
			                     <span>
			                     <input type="text" class="it data-check" title="시작일" data-type="dateRangeStart" data-range-end="endDt2" id="strtDt2" name="strtDt2" data-enter="search10" data-button="Y" value="">
			                     </span>
			                     <span class="bar">~</span>
			                     <span>
			                     <input type="text" class="it data-check" title="종료일" id="endDt2" name="endDt2" data-enter="search10" data-button="Y" value="">
			                     </span>
			                     </div>
						</div>
					</li>
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
				</ul>
				<ul class="searchCon">
					<li class="w20per">
						<div class="tit">회원명</div>
						<div class="txt">
							<div class="mFlex2">
								<span class="flex"><input type="text" class="it" id="custNm" name="custNm" placeholder="전체" title="회원명" disabled></span>
								<a href="#" class="mBtn1 lWhite" data-click="searchPop">검색</a>
							</div>
						</div>
					</li>
					<li class="w15per">
						<div class="tit">채널코드</div>
						<div class="txt">
							<div class="mFlex2">
								<code:commCode id="pblsChlCd" name="pblsChlCd" codeCd="ST040" prefixLabel="전체" prefixValue=""/>
								<!-- <select id="pblsChlCd" name="pblsChlCd" class="it">
				      		        <option value="all" selected>전체</option>
				      		        <option value="9200">나비엘</option>
				      		        <option value="9620">직영</option>
				      		        <option value="9630">오프라인</option>
				      		        <option value="9640">온라인</option>
				      		        <option value="9650">HP지원팀</option>
				      		        <option value="9651">HC지원팀</option>
				      		        <option value="9100">기타</option>
				      		    </select> -->
							</div>
						</div>
					</li>
					<li class="w15per">
						<div class="tit">매장상태코드</div>
						<div class="txt">
							<code:commCode id="storStatusCd" name="storStatusCd" codeCd="ST020" prefixLabel="전체" prefixValue=""/>
	                        <!-- <select id="storStatusCd" name="storStatusCd" class="it">
				      		    <option value="all" selected>전체</option>
				      		    <option value="01">운영</option>
				      		    <option value="02">휴업</option>
				      		    <option value="03">폐업</option>
				      	    </select> -->
						</div>
					</li>
	   
	               <li class="w12per">
	                    <div class="right">
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
				<code:btnGroup name="excelDown" hideDelete="true" hideInsert="true" hideSave="true" dispName="매장별신규가입자" gridId="grdList"/>
			</div>
	</div>
 	<div style="height:520px" data-grid-id="grdList"
										data-pagenation="Y" 
										data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
										data-type="grid" 
										data-block-ui="Y"
										data-grid-callback="onGridLoad" 
										data-tpl-url="<c:url value='/static/gridTemplate/cusstatus/storNewJoin.xml'/>" >
	</div>
</div>

<script>

//////////////추가 strat////////////

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
            		text: '회원수'
            	}	
        	},
        	x:{
        		title:{
        			display:true,
        			text:'가입일'
        		}
        	}
        }
    }
}

var barLabels = ${barLabels};
var barData = ${newJoinMonData};
var lineLabels = ${lineLabels};
var lineData = ${newJoinYearData};


//graphSearchGrp
async function graphSearchGrp(){	
	const barUrl = "<c:url value='${urlPrefix}/editBarGraph${urlSuffix}'/>";
	const lineUrl = "<c:url value='${urlPrefix}/editLineGraph${urlSuffix}'/>";
    const param = Utilities.formToMap("frmSearchGraph");

    await fetch(barUrl,{
    	method:"POST",
    	headers: {
  	      'Content-Type': 'application/json',
  	    },
    	body: JSON.stringify(param)
    }).then(response => {
            response.json().then(res => {
				barLabels = res[0];
            	barData = res[1];
            	
            	
            })
    });
    
    await fetch(lineUrl,{
    	method:"POST",
    	headers: {
  	      'Content-Type': 'application/json',
  	    },
    	body: JSON.stringify(param)
    }).then(response => {
            response.json().then(res => {
				lineLabels = res[0];
            	lineData = res[1];
            	
                search(true);
            })
    });
    
   
}

function search(changeValue)
{
	var valid = validateForm("#frmSearch"); //  class='data-check' 인 경우만 체크
	if(!valid) {
		alert("필수 항목들을 기입해 주세요.");
		return;
	}
	
    if($("#graphTab")[0].classList[0] == "active"){
    	if(changeValue){
            barChart.destroy();
            lineChart.destroy();
        }
    	
    	barChart = chartDraw('barChartCanvas', 'bar', barLabels, 
    			[{data: barData,
    				backgroundColor: ['rgb(255, 99, 132)',], label: '신규 가입자'
    			}], barOptions('한 달간 신규 가입자 현황'));
    	
    	lineChart = new Chart(document.getElementById('lineChartCanvas').getContext('2d'), {
            type: 'line',
            data: {
                labels: lineLabels,
                datasets: [{
                    data: lineData,
                    fill: false,
                    borderColor: 'rgb(255, 99, 132)', 
                    label: '신규 가입자'
                }] 
            },
            options: {
                //responsive: false,
                plugins:{
                	title:{
                    	text:'1년간 월별 가입자 현황',
                    	display:true
                    }
                },
                scales:{
                	
                	y:{
                		title:{
                    		display:true,
                    		text:'회원수'
                    	},
                		beginAtZero: true
                	},
                	x:{
                		title:{
                			display:true,
                			text:'가입연월'
                		}
                	}
                }
            }
        });
 		
    }
    
    if($("#gridTab")[0].classList[0] == "active"){
		grid_load();
	}
}

////////////////////추가 end//////////////



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
	dateSetting();
     search();
}



/* 회원목록 검색 팝업 로드 */
function searchPop(){
	var url = "/util/searchCust";
    Utilities.openModal(url,1000,600);
}

/* 회원목록 검색 팝업 종료 후처리 */
function custNmSelect(data){
	$("#itgCustNo").val(data.itgCustNo);
	$("#custNm").val(data.custNm);
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

function initSearch(){
	Utilities.mapToForm({}, "frmSearch");
	Utilities.mapToForm({}, "frmSearchGraph");
	// hidden 필드 초기화
	$("#initInput").val("");
}

function dateSetting(){
	var strStartDay= moment().subtract(1, 'month').format('YYYYMMDD');
    var strEndDay = moment().format("YYYYMMDD");
    
    $("#strtDt2").val(strStartDay);
    $("#endDt2").val(strEndDay);
}

////////////////그래프 구현 영역////////////////////



//사용할 변수 선언




////////////////////////////

///////////////////////////////////////////////
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