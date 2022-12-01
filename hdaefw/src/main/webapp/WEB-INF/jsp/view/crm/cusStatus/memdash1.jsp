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
        <li value="graph" id="graphTab" class="active"><a href="#graphData">현황</a></li>
        <li value="raw" id="gridTab"><a href="#rawData" data-click="grid_load">상세</a></li>			<!-- data-click="grid_load" -->
        <li value="graph" id="lineTab"><a href="#lineData" data-click="lineGraph">현황 그래프</a></li>	<!-- data-click="lineGraph" -->
    </ul>
</div>	
			
 <div class="mBox1 tabCont" id="graphData">     
 	<div class="gTitle1">
		<h3 class="mTitle1">회원 가입현황</h3>
	</div>
	<br>
	<div class="mSort2">
	<input type="hidden" id="initInput" name="initInput"/>
	<form role="form" id="frmSearchGraph">
	        <ul class="searchCon">
				<li class="w40per">
                     <div class="tit" style="width:10%;">가입일</div>
                     <div class="txt" style="width:25%">
	                     <div class="mDate1">
	                     <span>
	                     <input type="text" class="it" title="계약 시작일" data-type="dateRangeStart" data-range-end="endDt" id="strtDt" name="strtDt" data-enter="search" data-button="Y" value="">
	                     </span>
	                     <span class="bar">~</span>
	                     <span>
	                     <input type="text" class="it" title="계약 종료일" id="endDt" name="endDt" data-enter="search" data-button="Y" value="">
	                     </span>
	                     </div>
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
	<br>
	<div class="chart-div">
		<div>
		<%-- <canvas data-chart-type="gender" id="pieChartCanvas001" height="200px" style="float:left;"></canvas> --%>
        <canvas data-chart-type="gender" id="pieChartCanvas002" height="200px" style="float:left;"></canvas>
        <canvas data-chart-type="gender" id="pieChartCanvas003" height="200px" style="float:left;"></canvas>
        <canvas data-chart-type="gender" id="pieChartCanvas004" height="200px" style="float:left;"></canvas>
        <canvas data-chart-type="gender" id="pieChartCanvas005" height="200px" style="float:left;"></canvas>
        <canvas data-chart-type="gender" id="pieChartCanvas006" height="200px"></canvas>
		</div>
		
        <br><br><br>
        
        <div style="width:100%">
<%--          <canvas data-chart-type="age" id="gradeCanvas" height="400px" style="width:100%"></canvas> --%>
        <%-- <canvas data-chart-type="age" id="barChartCanvas001" height="400px" style="float:left;"></canvas> --%>
        <canvas data-chart-type="age" id="barChartCanvas002" height="400px" style="float:left;"></canvas>
        <canvas data-chart-type="age" id="barChartCanvas003" height="400px" style="float:left;"></canvas>
        <canvas data-chart-type="age" id="barChartCanvas004" height="400px" style="float:left;"></canvas>
        <canvas data-chart-type="age" id="barChartCanvas005" height="400px" style="float:left;"></canvas>
        <canvas data-chart-type="age" id="barChartCanvas006" height="400px"></canvas>
        </div>
        
    </div>
</div>

<div class="mBox1 tabCont hidden" id="rawData"> 
	
<div class="mSort2">
	<form role="form" id="frmSearch">
	        <ul class="searchCon">
	            <li class="w12per">
	                <div class="tit">성별</div>
	                <div class="txt">
                        <select id="gndrCd" name="gndrCd" class="it">
			      		    <option value="all" selected>전체</option>
			      		    <option value="M">남</option>
			      		    <option value="F">여</option>
                            <option value="A">성별없음</option>
			      	    </select>
                    </div> 
	            </li>
	            <li class="w15per">
	                <div class="tit">멤버십등급</div>
	                <div class="txt">
                         <code:commCode name="mshipGradeCd" id="mshipGradeCd" codeCd="MB020" prefixLabel="전체" prefixValue="all"/>
<!--                         <select id="mshipGradeCd" name="mshipGradeCd" class="it"> -->
<!-- 			      		    <option value="all">전체</option> -->
<!-- 			      		    <option value="001">일반</option> -->
<!-- 			      		    <option value="002" selected>화이트</option> -->
<!-- 			      		    <option value="003">브론즈</option> -->
<!-- 			      		    <option value="004">실버</option> -->
<!-- 			      		    <option value="005">골드</option> -->
<!-- 			      		    <option value="006">VIP</option> -->
<!-- 			      	    </select> -->
                    </div> 
	            </li>
	            <li class="w15per">
	                <div class="tit">연령대</div>
	                <div class="txt">
                        <select id="mshipAges" name="mshipAges" class="it">
			      		    <option value="all">전체</option>
			      		    <option value="20" selected>20대이하</option>
			      		    <option value="30">30대</option>
			      		    <option value="40">40대</option>
			      		    <option value="50">50대</option>
			      		    <option value="60">60대</option>
			      		    <option value="70">70대이상</option>
			      		    <option value="00">미입력</option>
			      	    </select>
                    </div> 
	            </li>
	        </ul>
			<ul class="searchCon">
				<li class="w40per">
                     <div class="tit" style="width:10%;">가입일</div>
                     <div class="txt" style="width:25%">
	                     <div class="mDate1">
	                     <span>
	                     <input type="text" class="it" title="계약 시작일" data-type="dateRangeStart" data-range-end="endDt2" id="strtDt2" name="strtDt2" data-enter="search" data-button="Y" value="">
	                     </span>
	                     <span class="bar">~</span>
	                     <span>
	                     <input type="text" class="it" title="계약 종료일" id="endDt2" name="endDt2" data-enter="search" data-button="Y" value="">
	                     </span>
	                     </div>
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
				<code:btnGroup name="excelDown" hideDelete="true" hideInsert="true" hideSave="true" dispName="등급별회원현황" gridId="grdList"/>
			</div>
	</div>
 	<div style="height:520px" data-grid-id="grdList"
										data-pagenation="Y" 
										data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
										data-type="grid" 
										data-block-ui="Y"
										data-grid-callback="onGridLoad" 
										data-tpl-url="<c:url value='/static/gridTemplate/cusstatus/cusStatus.xml'/>" >
	</div>
</div>

<div class="mBox1 tabCont hidden" id="lineData"> 
	<div class="gTitle1">
		<h3 class="mTitle1">기간별 등급현황</h3>
	</div>
	<br>
	<div class="mSort2">
	<input type="hidden" id="initInput" name="initInput"/>
	<form role="form" id="frmSearchLine">
	        <ul class="searchCon">
				<li class="w40per">
                     <div class="tit" style="width:10%;">가입일</div>
                     <div class="txt" style="width:25%">
	                     <div class="mDate1">
	                     <span>
	                     <input type="text" class="it" title="계약 시작일" data-type="dateRangeStart" data-range-end="endDt3" id="strtDt3" name="strtDt3" data-enter="search" data-button="Y" value="">
	                     </span>
	                     <span class="bar">~</span>
	                     <span>
	                     <input type="text" class="it" title="계약 종료일" id="endDt3" name="endDt3" data-enter="search" data-button="Y" value="">
	                     </span>
	                     </div>
                     </div>
               </li>
               <li class="w25per">
                     <div class="tit">
                         <button class="mBtn1" data-click="initSearch" style="margin-right: 5px">초기화</button>
                         <button class="mBtn1" data-click="searchLineGraph" style="margin-right: 10px">검색</button>
                     </div>
				</li>
			</ul>	
    </form>
    </div>
	<br>
	
    <div>
    <canvas id="lineChartCanvas" width="1350px" height="500px" style="display:inline;"></canvas>
    </div>
</div>

<script>


function search(changeValue)
{   
	if($("#gridTab")[0].classList[0] == "active"){
		grid_load();
	}

}

function searchLineGraph () {
	lineGraph();
}

async function lineGraph(changeValue){
	console.log(changeValue);
	const param = Utilities.formToMap("frmSearchLine");
	const labelUrl = "<c:url value='${urlPrefix}/lineGraphLabel${urlSuffix}'/>";
	const dataUrl = "<c:url value='${urlPrefix}/lineGraphData${urlSuffix}'/>";
	const levelUrl = "<c:url value='${urlPrefix}/gradeLevel${urlSuffix}'/>";
	Utilities.blockUI();
	
    await fetch(levelUrl,{
    	method:"GET",
    }).then(response => {
        response.json().then(res => {
            levelData = res;
        })
	});
	
    await fetch(labelUrl,{
    	/* method:"GET", */
    	method:"POST",
    	headers: {
  	      'Content-Type': 'application/json',
  	    },
    	body: JSON.stringify(param)
    }).then(response => {
        response.json().then(res => {
            lineLabel = res;
        })
	});
    
    await fetch(dataUrl,{
    	/* method:"GET", */
    	method:"POST",
    	headers: {
  	      'Content-Type': 'application/json',
  	    },
    	body: JSON.stringify(param)
    }).then(response => {
        response.json().then(res => {
        	Utilities.unblockUI();
            lineData = res;
            try{
            	line_load(changeValue);	
            }catch{}
        })
	});

}

// if(typeof x !== "undefined") {

function line_load(changeValue){
	
	if(typeof lineChart !== "undefined") {
		lineChart.destroy();
	}
	
	if(lineData && lineLabel){
		//Line
	    lineChart = new Chart(document.getElementById('lineChartCanvas').getContext('2d'), {
	        type: 'line',
	        data: {
	            labels: lineLabel,
	            datasets: [/* {
	                data: lineData[0],
	                fill: false,
	                borderColor: 'rgb(255, 99, 132)', 
	                label: levelData[0]
	            }, */{
	                data: lineData[1],
	                fill: false,
	                borderColor: 'rgb(255, 200, 30)',
	                label: levelData[1]
	            },{
	                data: lineData[2],
	                fill: false,
	                borderColor: 'rgb(255, 70, 164)',
	                label: levelData[2]
	            },{
	                data: lineData[3],
	                fill: false,
	                borderColor: 'rgb(150, 255, 64)',
	                label: levelData[3]
	            },{
	                data: lineData[4],
	                fill: false,
	                borderColor: 'rgb(155, 110, 255)',
	                label: levelData[4]
	            },{
	                data: lineData[5],
	                fill: false,
	                borderColor: 'rgb(64, 159, 255)',
	                label: levelData[5]
	            }] 
	        },
	        options: {
	            plugins:{
	            	title:{
	                	text:'기간별 등급현황',
	                	display:true
	                }
	            },
	            scales:{
	            	y:{
	            		title:{
	                		display:true,
	                		text:'회원수'
	                	}	
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
}
function graphSearch(){
	initGraph();
}
function grid_load(){   
	const url = "<c:url value='${urlPrefix}/getList${urlSuffix}'/>";
    const param = Utilities.formToMap("frmSearch");
    
    var date1 = new Date(param.strtDt2.substr(0,4),param.strtDt2.substr(4,2)-1,param.strtDt2.substr(6,2));
    var date2 = new Date(param.endDt2.substr(0,4),param.endDt2.substr(4,2)-1,param.endDt2.substr(6,2));

    var interval = date2 - date1;
    var day = 1000*60*60*24;
    var month = day*30;
    var year = month*12;

    if (parseInt(interval/month) > 6) {
    	alert('등록일 검색 범위는 6개월 이내로 입력해 주세요.');
    	// dateSetting();
	    return ;
    }
    
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

function initSearch(){
	Utilities.mapToForm({}, "frmSearch");
	Utilities.mapToForm({}, "frmSearchGraph");
	// hidden 필드 초기화
	$("#initInput").val("");
	dateSetting();
}


const ageColors = ['rgb(255, 99, 132)', 'rgb(255, 200, 150)' , 'rgb(251, 203, 203)'];
const gradeColors = ['rgb(255, 99, 132)', 'rgb(255, 200, 30)', 'rgb(255, 70, 164)',  'rgb(150, 255, 64)', 'rgb(155, 110, 255)', 'rgb(64, 159, 255)', 'rgb(155, 50, 255)'];
const _chartArray = [];


function clearChart(){
	while(_chartArray.length){
		_chartArray.pop().destroy();
	}
}
function initGraph(){
	const url = "${urlPrefix}/graphData";
	const param = Utilities.formToMap("frmSearchGraph");
	console.log(param);
	var date1 = new Date(param.strtDt.substr(0,4),param.strtDt.substr(4,2)-1,param.strtDt.substr(6,2));
    var date2 = new Date(param.endDt.substr(0,4),param.endDt.substr(4,2)-1,param.endDt.substr(6,2));

    var interval = date2 - date1;
    var day = 1000*60*60*24;
    var month = day*30;
    var year = month*12;

    if (parseInt(interval/month) > 6) {
    	alert('등록일 검색 범위는 6개월 이내로 입력해 주세요.');
    	//dateSetting();
	    return ;
    }
	
	Utilities.blockUI();
	Utilities.getAjax(url,param,true,function(data,jqXHR){
		Utilities.unblockUI();
        if(Utilities.processResult(data,jqXHR,""))
        {
            render(data);
            //lineGraph();
        }
    });
// 	const pieUrl = "<c:url value='${urlPrefix}/editPieGraph${urlSuffix}'/>";
//     const barUrl = "<c:url value='${urlPrefix}/editBarGraph${urlSuffix}'/>";
}
function render(data){
	clearChart();
	initGenderGraph(data.gender);
	initAgeGraph(data.age);
}

function initGenderGraph(list){
	const map= {};
	let chartIndex = 0;
	const cvs = $('[data-chart-type="gender"]'); 
	for(let i=0;i<list.length;i++){
		const data = list[i];
		if(!map[data.gradeCd]){
			map[data.gradeCd] = {
					label : [],
					dataSet : [],
                    canvas : cvs[chartIndex++],
                    title : data.gradeNm +"등급 성별비율"
			};
		}
		const chartData = map[data.gradeCd];
		chartData.label.push(data.gndrNm);
		chartData.dataSet.push(data.cnt);
	}
	for(const idx in map){
		const chartData = map[idx];
		renderGenderGraph(chartData);
	}
}
function renderGenderGraph(chartData){
	
	const opt = {
        type: 'doughnut', 
        data: {
            labels: chartData.label,
            datasets: [{
                data: chartData.dataSet,
                backgroundColor: ageColors
            }] 
        },
        options: {
            responsive: false,
            rotation : 270,
            circumference : 180,
            plugins: { 
            	legend: {
            		position: 'bottom'
                },
                 title:{
                 display: true,
                 text: chartData.title
                },
                datalabels : {
                     formatter: function(value, context){
                    	 if(!value)
                    		 return null;
                     const datapoints = context.chart.data.datasets[0].data;
                     function totalSum(total, datapoints){
                         return total + datapoints;
                     }
                     const totalvalue = datapoints.reduce(totalSum, 0);
                     var percentageValue = (value / totalvalue * 100).toFixed(1) + "%";
                        
                     if(percentageValue == 'NaN%'){
                         percentageValue = '데이터 없음';
                     }
                     return percentageValue;
                 }
              }
            }
        },
        plugins: [ChartDataLabels]
    };
	
	 const chart = new Chart(chartData.canvas,opt);
	 _chartArray.push(chart);
}
function initAgeGraph(list){
	const map= {};
    let chartIndex = 0;
    const cvs = $('[data-chart-type="age"]'); 
    for(let i=0;i<list.length;i++){
        const data = list[i];
        if(!map[data.gradeCd]){
            map[data.gradeCd] = {
                    label : [],
                    dataSet : [],
                    color : gradeColors[chartIndex],
                    canvas : cvs[chartIndex],
                    title : data.gradeNm +"등급 나이별 분포도",
                    maxData : 0
            };
            chartIndex++;
        }
        const chartData = map[data.gradeCd];
        if(chartData.maxData<data.cnt )
        	chartData.maxData = data.cnt ;
        chartData.label.push(data.ageNm);
        chartData.dataSet.push(data.cnt);
    }
    for(const idx in map){
        const chartData = map[idx];
        renderAgeGraph(chartData);
    }
}

function renderAgeGraph(chartData){
	const maxNum = getMaxNumber(chartData.maxData);
	const dataset = [{
            backgroundColor: gradeColors,
            borderColor: gradeColors,
            borderWidth: 0,
            data: chartData.dataSet,
        }];
    
	var opt = {
			type : "bar",
		 data: {
	      labels: chartData.label,
	      datasets: dataset
	      },
		options : {
	         responsive: false,
	         plugins:{
	          title:{
	              text: chartData.title,
	              display: true
	             },
 	             datalabels: {
 	            	anchor: 'end',
 	            	align : "top",
	              formatter: function(value, context){
	            	  if(!value)
	            		  return "";
	              return new Intl.NumberFormat('ja-JP').format(value);
 	         }	 
 	             },
	             legend:{
	              display:false
	             }
	         },
	         scales:{
	          y:{
// 	              title : {
// 	                  display:true,
// 	                  text: '회원수'
// 	              }  ,
	              min: 0,
                  max: maxNum,
	              ticks: {
	                  // For a category axis, the val is the index so the lookup via getLabelForValue is needed
// 	                  callback: function(val, index) {
// 	                    // Hide every 2nd tick label
// 	                    return index % 2 === 0 ? this.getLabelForValue(val) : '';
// 	                  },
// 	                  color: 'red',
                      
	                }
	          }
	         }
	     },
	     plugins: [ChartDataLabels]
	};
	
// 	opt.options.scales.yAxes[0].ticks.max = maxNum;
//     opt.options.scales.yAxes[0].ticks.stepSize = maxNum/5;
	const chart = new Chart(chartData.canvas,opt);
    _chartArray.push(chart);
}

function getMaxNumber(number){
    const str = number + "";
    if(str.length == 1)
        return 10;
    const len = str.length-1;
    let num = parseInt(str.substring(0,1)) + 1;
    for(let i=0;i<len;i++){
        num += "0"
    }
    return parseInt(num);
}

function dateSetting(){
	var strStartDay= moment().subtract(1, 'month').format('YYYYMMDD');
    var strEndDay = moment().format("YYYYMMDD");
    
    $("#strtDt").val(strStartDay);
    $("#endDt").val(strEndDay);
    $("#strtDt2").val(strStartDay);
    $("#endDt2").val(strEndDay);
    $("#strtDt3").val(strStartDay);
    $("#endDt3").val(strEndDay);
}

$(document).ready(function(){
	
	dateSetting();
	initGraph();
	
	$("#strtDt").change(function(){
	    $("#strtDt2").val(this.value);
	    $("#strtDt3").val(this.value);
	});
	$("#strtDt2").change(function(){
	    $("#strtDt").val(this.value);
	    $("#strtDt3").val(this.value);
	});
	$("#strtDt3").change(function(){
	    $("#strtDt").val(this.value);
	    $("#strtDt2").val(this.value);
	});
	
	$("#endDt").change(function(){
	    $("#endDt2").val(this.value);
	    $("#endDt3").val(this.value);
	});
	$("#endDt2").change(function(){
	    $("#endDt").val(this.value);
	    $("#endDt3").val(this.value);
	});
	$("#endDt3").change(function(){
	    $("#endDt").val(this.value);
	    $("#endDt2").val(this.value);
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
    letter-spacing: -1px;
    padding: 0 8px;
}
</style>