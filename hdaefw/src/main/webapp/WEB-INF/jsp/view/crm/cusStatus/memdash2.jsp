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
        <li value="raw" id="gridTab"><a href="#rawData" data-click="grid_load">상세</a></li>
    </ul>
</div>	

<!-- 현황탭 (그래프 영역) -->			
 <div class="mBox1 tabCont" id="graphData">     
 	
 	<div class="gTitle1">
		<h3 class="mTitle1">체험 여부 현황</h3>
	</div>

    <br>
	<div class="mSort2">
		<form role="form" id="frmSearchGraph">
				
				<ul class="searchCon">
					<li class="w30per">
	                 	<div class="tit">체험 일자</div>
	                    <div class="txt">
		                     <div class="mDate1">
		                     	<span>
		                     		<input type="text" class="it data-check" title="체험 시작일" data-type="dateRangeStart" data-range-end="endDt" id="strtDt" name="strtDt" data-enter="search10" data-button="Y" value="">
		                     	</span>
		                     	<span class="bar">~</span>
		                     	<span>
		                     		<input type="text" class="it data-check" title="체험 종료일" id="endDt" name="endDt" data-enter="search10" data-button="Y" value="">
		                     	</span>
		                     </div>
	                     </div>
	               	</li>
	               	<!-- 22.11.10 영업채널 추가 요청 -->
	                <li class="w15per">
                        <div class="tit">영업채널</div>
                        <div class="txt">
	                        <div class="mFlex2">
	                            <span class="flex" style="padding-right:10px;">
                                    <code:commCode id="storChlCd" name="storChlCd" codeCd="ST040" prefixLabel="전체" prefixValue="" useYn6="Y"/>
                                </span>
                            </div>    
                        </div>
                    </li>
	                <li class="w12per">
		            	<div class="right">
							<button class="mBtn1" data-click="initSearch" style="margin-right: 5px">초기화</button>
							<button class="mBtn1" data-click="graphSearch" style="margin-right: 10px">검색</button>
						</div>
					</li>
				</ul>
					
		</form>
		
	</div>
	<br>
	
	<!-- 그래프 선언 부분 -->
	<div class="chart-div">
	
<!-- 		<div> -->
<%-- 			<canvas data-chart-name="memberType" data-chart-title="멤버십 체험" id="pieChartCanvas001" height="300px" style="float:left;"></canvas> --%>
<%--         	<canvas data-chart-name="gender" data-chart-title="성별 체험" id="pieChartCanvas002" height="300px"></canvas> --%>
<!-- 		</div> -->
		
<!-- 		<br><br><br> -->
		
		<div>
        
            <canvas data-chart-name="memberType" data-chart-title="멤버십 체험" id="pieChartGrade003" height="300px" style="float:left;"></canvas>
            <canvas data-chart-name="gender" data-chart-title="성별 체험" id="pieChartGrade004" height="300px" style="float:left;"></canvas>
            
			<canvas data-chart-name="grade" data-chart-title="등급별 체험"  id="pieChartGrade001" height="300px" style="float:left;"></canvas>
        	<canvas data-chart-name="number" data-chart-title="체험 횟수"  id="pieChartGrade002" height="300px" style="float:left;"></canvas>
			
			<canvas id="pieChartGrade005" height="300px" style="float:left;"></canvas>
			<canvas id="pieChartGrade006" height="300px"></canvas>
		</div>
		
		<br><br><br>
		
		<div>
			<canvas data-chart-name="age" data-chart-title="연령별 체험"  id="barChartExpAge001" width="900%" height="300px" style="float:left; margin-right:25px;"></canvas>
			<canvas data-chart-name="week" data-chart-title="요일별 체험"  id="barChartExpAge002" width="900%" height="300px"></canvas>    	
		</div>
		
    </div>
  	<br>  
</div>

<!-- 상세 탭 -->
<div class="mBox1 tabCont hidden" id="rawData">
 
	<div class="mSort2">
		<form role="form" id="frmSearch">
				<ul class="searchCon">
					<li class="w30per">
	                     <div class="tit" style="width:20%;">체험 일자</div>
	                     <div class="txt">
		                     <div class="mDate1">
		                     <span>
		                     <input type="text" class="it data-check" title="체험 시작일" data-type="dateRangeStart" data-range-end="endDt2" id="strtDt2" name="strtDt2" data-enter="search10" data-button="Y" value="">
		                     </span>
		                     <span class="bar">~</span>
		                     <span>
		                     <input type="text" class="it data-check" title="체험 종료일" id="endDt2" name="endDt2" data-enter="search10" data-button="Y" value="">
		                     </span>
		                     </div>
	                     </div>
	               </li>
	               <!-- 22.11.10 영업채널 추가 요청 -->
	               <li class="w15per">
                        <div class="tit">영업채널</div>
                        <div class="txt">
                            <div class="mFlex2">
                                <span class="flex" style="padding-right:10px;">
                                    <code:commCode id="storChlCd" name="storChlCd" codeCd="ST040" prefixLabel="전체" prefixValue="" useYn6="Y"/>
                                </span>
                            </div>    
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
				<code:btnGroup name="excelDown" hideDelete="true" hideInsert="true" hideSave="true" dispName="체험현황" gridId="grdList"/>
			</div>
	</div>
	
 	<div style="height:520px" data-grid-id="grdList"
							  data-pagenation="Y" 
							  data-get-url="<c:url value='${urlPrefix}/getList${urlSuffix}'/>" 
							  data-type="grid" 
							  data-block-ui="Y"
							  data-grid-callback="onGridLoad" 
							  data-tpl-url="<c:url value='/static/gridTemplate/cusstatus/cusStatusExp.xml'/>" >
	</div>
	
</div>


<script>

const config = {
		formatter: function(value, context){
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


//사용할 변수 선언///

const pieColor = ['rgb(255, 99, 132)', 'rgb(255, 200, 150)']; //차트색깔
const ages = ['10대', '20대', '30대', '40대', '50대', '60대', '70대', '80대 이상']; //x축 값
const days = ['월', '화', '수', '목', '금', '토', '일']; //x축 값

var pieExpData1 = [${pieDataExp[0]}, ${pieDataExp[1]}]; //전체 체험여부
var pieExpData2 = [${pieDataExpGen[0]}, ${pieDataExpGen[1]}]; //성별 체험여부

var pieGradeData = [${pieDataExpGra[0]}, ${pieDataExpGra[1]}, ${pieDataExpGra[2]}, ${pieDataExpGra[3]}, 
	                ${pieDataExpGra[4]}, ${pieDataExpGra[5]}, ${pieDataExpGra[6]}, ${pieDataExpGra[7]},
					${pieDataExpGra[8]}, ${pieDataExpGra[9]}, ${pieDataExpGra[10]}, ${pieDataExpGra[11]}]; //등급별 체험여부

var barAgeData = [${barExpAgeData[0]}, ${barExpAgeData[1]}, ${barExpAgeData[2]}, ${barExpAgeData[3]}, 
    			  ${barExpAgeData[4]}, ${barExpAgeData[5]},${barExpAgeData[6]}, ${barExpAgeData[7]},
    			  ${barExpAgeData[8]}, ${barExpAgeData[9]}, ${barExpAgeData[10]}, ${barExpAgeData[11]}, 
       			  ${barExpAgeData[12]}, ${barExpAgeData[13]},${barExpAgeData[14]}, ${barExpAgeData[15]}]; //연령별 체험여부

var barDayData = [${barExpDayData[0]}, ${barExpDayData[1]}, ${barExpDayData[2]}, ${barExpDayData[3]}, 
    			   ${barExpDayData[4]}, ${barExpDayData[5]},${barExpDayData[6]}, ${barExpDayData[7]},
    			   ${barExpDayData[8]}, ${barExpDayData[9]}, ${barExpDayData[10]}, ${barExpDayData[11]}, 
    			   ${barExpDayData[12]}, ${barExpDayData[13]}]; //요일별 체험 여부

const barBackGroundColor = [
	'rgb(255, 99, 132, 0.9)', 'rgb(255, 99, 132, 0.9)', 
	'rgb(255, 99, 132, 0.9)', 'rgb(255, 99, 132, 0.9)', 
	'rgb(255, 99, 132, 0.9)', 'rgb(255, 99, 132, 0.9)', 
	'rgb(255, 99, 132, 0.9)', 'rgb(255, 99, 132, 0.9)']; //bar그래프 색깔

//pie차트 그래프 함수
const pieChartDraw = function(chartId, chartType, chartLabels, chartDataSets, chartOptions){
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

//bar 그래프 함수 (연령별 체험/비겨험을 비교한 막대그래프)
const barDoubleChartDraw1 = function(chartId, chartType, chartLabels, chartDataSets, backColor, chartOptions){
	return pieChart = new Chart(document.getElementById(chartId).getContext('2d'), {
        type: chartType,
        data: {
            labels: chartLabels,
            
            datasets:
            	[
            		{
            			label: '체험',
                		data: [chartDataSets[0], chartDataSets[2],
                			   chartDataSets[4], chartDataSets[6],
                			   chartDataSets[8], chartDataSets[10],
                			   chartDataSets[12], chartDataSets[14]],
                		backgroundColor: backColor
                	},
              
                	{
                		label: '비체험',
                		data: [chartDataSets[1], chartDataSets[3],
             			   chartDataSets[5], chartDataSets[7],
            			   chartDataSets[9], chartDataSets[11],
            			   chartDataSets[13], chartDataSets[15]]
                	}
            	]
        },
        options: chartOptions,
        plugins: [ChartDataLabels]
    });
}

//bar 그래프 함수 (요일별 체험/비체험을 비교한 막대그래프)
const barDoubleChartDraw2 = function(chartId, chartType, chartLabels, chartDataSets, backColor, chartOptions){
	return pieChart = new Chart(document.getElementById(chartId).getContext('2d'), {
        type: chartType,
        data: {
            labels: chartLabels,
            
            datasets:
            	[
            		{
            			label: '체험',
                		data: [chartDataSets[1], chartDataSets[2],
                			   chartDataSets[3], chartDataSets[4],
                			   chartDataSets[5], chartDataSets[6], chartDataSets[0]],
                		backgroundColor: backColor
                	},
              
                	{
                		label: '비체험',
                		data: [chartDataSets[8], chartDataSets[9],
             			   chartDataSets[10], chartDataSets[11],
            			   chartDataSets[12], chartDataSets[13], chartDataSets[7]]
                	}
            	]
        },
        options: chartOptions,
        plugins: [ChartDataLabels]
    });
}


const pieOptions = function(title){
	return {
        responsive: false,
        plugins: {
           	tooltip:{
           		enabled: false
           	},
           	datalabels: config,
           	title:{
            	display: true,
            	text:title
            },
            legend:{
            	position:'bottom'
            }
        }
    }
}

const barConfig = {
		formatter: function(value, context){
			return new Intl.NumberFormat('ja-JP').format(value);
		}
}

const barOptions = function(title){
	return {
        responsive: false,
        plugins: {
           	tooltip:{
           		enabled: false
           	},
           	title:{
            	display: true,
            	text:title
            },
            datalabels: barConfig,
            legend:{
            	position:'bottom'
            }
        }
    }
}

let _chartArray=[];
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
function drawPie(pieMap){
	for(const index in pieMap){
		const list = pieMap[index];
		const chartData = {
				label : [],
				dataSet : [],
				bgColor : []
		};
		for(let i=0;i<list.length;i++){
			chartData.label.push(list[i].name);
			chartData.dataSet.push(list[i].cnt);
			chartData.bgColor.push(list[i].colorCd);
		}
		randerPie(chartData,index);
	}
}


function randerPie(chartData,name){
	const element = $("[data-chart-name="+name+"]");
	if(!element.length)
		return;
	chartData.canvas = element[0];
	chartData.title = element.attr("data-chart-title");
// 	console.log(chartData);
	const bgColor = ['rgb(255, 99, 132)', 'rgb(255, 200, 150)'];
	const opt = {
	        type: 'pie', 
	        data: {
	            labels: chartData.label,
	            datasets: [{
	                data: chartData.dataSet,
	                backgroundColor: chartData.bgColor
	            }] 
	        },
	        options: {
	            responsive: false,
// 	            rotation : 270,
// 	            circumference : 180,
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
function drawBar(barMap){
	const bgColors =['rgba(222, 222, 222, 1)', 'rgba(171, 171, 171, 1)' ,'rgba(100, 100, 100, 1)'];
			
    for(const index in barMap){
    	const list = barMap[index];
        const chartData = {
        		maxData : 0,
                label : [],
                dataSet : [{
                    type: 'bar',
                    label: '회원',
                    backgroundColor: bgColors[0],
                    borderColor: bgColors[0],
                    borderWidth: 0,
                    data: [],
                },{
                    type: 'bar',
                    label: '통합회원',
                    backgroundColor :bgColors[1],
                    borderColor : bgColors[1],
                    borderWidth: 0,
                    data: [],
                },{
                    type: 'bar',
                    label: '비회원',
                    backgroundColor: bgColors[2],
                    borderColor:bgColors[2],
                    borderWidth: 0,
                    data: [],
                }]
        };
        
        for(let i=0;i<list.length;i++){
            chartData.label.push(list[i].name);
            
            chartData.dataSet[0].data.push(list[i]["cnt001"]);
            chartData.dataSet[1].data.push(list[i]["cnt002"]);
            chartData.dataSet[2].data.push(list[i]["cnt000"]);
            if(i==0){
            	 chartData.dataSet[0].label=list[i]["title001"];
                 chartData.dataSet[1].label=list[i]["title002"];
                 chartData.dataSet[2].label=list[i]["title000"];
                 
                 chartData.dataSet[0].backgroundColor=list[i]["color001"];
                 chartData.dataSet[1].backgroundColor=list[i]["color002"];
                 chartData.dataSet[2].backgroundColor=list[i]["color000"];
                 chartData.dataSet[0].borderColor=list[i]["color001"];
                 chartData.dataSet[1].borderColor=list[i]["color002"];
                 chartData.dataSet[2].borderColor=list[i]["color000"];
                 
            }
            if(list[i].cnt>chartData.maxData)
            	chartData.maxData = list[i].cnt;
        }
        randerBar(chartData, index);
    }
}

function randerBar(chartData,name){
	const element = $("[data-chart-name="+name+"]");
    if(!element.length)
        return;
    chartData.canvas = element[0];
    chartData.title = element.attr("data-chart-title");
    
    
	   const maxNum = getMaxNumber(chartData.maxData);
	   
	    
	    var opt = {
	            type : "bar",
	         data: {
	          labels: chartData.label,
	          datasets: chartData.dataSet
	          },
	        options : {
	             responsive: false,
	             interaction: {
	                  intersect: false,
	                  mode: 'index',
	                },
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
	                	 position: 'bottom'
// 	                  display:false
	                 }
	             },
	             scales:{
	              y:{
	                  min: 0,
	                  max: maxNum,
	                  ticks: {
	                    }
	              }
	             }
	         },
	         plugins: [ChartDataLabels]
	    };
	    
	//  opt.options.scales.yAxes[0].ticks.max = maxNum;
//	     opt.options.scales.yAxes[0].ticks.stepSize = maxNum/5;
	    const chart = new Chart(chartData.canvas,opt);
	    _chartArray.push(chart);
}

function clearChart(){
    while(_chartArray.length){
        _chartArray.pop().destroy();
    }
}

//갱신된 정보가 있는 확인하는 기능 (갱신될 경우 serach 함수 True를 보냄)
function graphSearch(){	
	const url = '${urlPrefix}/getGraphData';
	const param = Utilities.formToMap("frmSearchGraph");
	Utilities.blockUI();
     Utilities.getAjax(url,param,true,function(data,jqXHR){
    	 Utilities.unblockUI();
         if(Utilities.processResult(data,jqXHR,""))
         {
        	 clearChart();
        	 drawPie(data.pie);
        	 drawBar(data.bar);
         }
     });
// 	const pieUrl1 = "<c:url value='${urlPrefix}/editGetExpPie${urlSuffix}'/>"; // 전체 체험여부
// 	const pieUrl2 = "<c:url value='${urlPrefix}/editGetExpGenPie${urlSuffix}'/>"; // 성별 체험여부
// 	const pieUrl3 = "<c:url value='${urlPrefix}/editGetExpGra${urlSuffix}'/>"; // 등글별 체험여부 
	

// 	const barUrl1 = "<c:url value='${urlPrefix}/editGetExpAgeBar${urlSuffix}'/>";
// 	const barUrl2 = "<c:url value='${urlPrefix}/editGetExpDayBar${urlSuffix}'/>";
	
// 	const param = Utilities.formToMap("frmSearchGraph");

// 	//async와 await 비동기>>동기 변환
// 	await fetch(pieUrl1,{
//     	method:"POST",
//     	headers: {
//   	      'Content-Type': 'application/json',
//   	    },
//     	body: JSON.stringify(param)
//     }).then(response => {
//             response.json().then(res => {
//             	pieExpData1 = res;
//             })
//     });
    
// 	await fetch(pieUrl2,{
//     	method:"POST",
//     	headers: {
//   	      'Content-Type': 'application/json',
//   	    },
//     	body: JSON.stringify(param)
//     }).then(response => {
//             response.json().then(res => {
//             	pieExpData2 = res;
//             })
//     });
    
// 	await fetch(pieUrl3,{
//     	method:"POST",
//     	headers: {
//   	      'Content-Type': 'application/json',
//   	    },
//     	body: JSON.stringify(param)
//     }).then(response => {
//             response.json().then(res => {
//             	pieGradeData = res;
//             })
//     });
    
    
// 	await fetch(barUrl1,{
//     	method:"POST",
//     	headers: {
//   	      'Content-Type': 'application/json',
//   	    },
//     	body: JSON.stringify(param)
//     }).then(response => {
//             response.json().then(res => {
//             	barAgeData = res;
//             })
//     });
    
    
// 	await fetch(barUrl2,{
//     	method:"POST",
//     	headers: {
//   	      'Content-Type': 'application/json',
//   	    },
//     	body: JSON.stringify(param)
//     }).then(response => {
//             response.json().then(res => {
//             	barDayData = res;
//             	search(true);
//             })
//     });
  
}

// 그리드 값 불러오기 및 그래프 갱신 기능
function search(changeValue) {
	grid_load();
// 	if($("#gridTab")[0].classList[0] == "active") {
// 		var valid = validateForm("#frmSearch"); //  class='data-check' 인 경우만 체크
// 		if(!valid) {
// 			alert("필수 항목들을 기입해 주세요.");
// 			return;
// 		}
// 		grid_load();
// 	}

//     if($("#graphTab")[0].classList[0] == "active") {
//     	var valid = validateForm("#frmSearchGraph"); //  class='data-check' 인 경우만 체크
//     	if(!valid) {
//     		alert("필수 항목들을 기입해 주세요.");
//     		return;
//     	}
//     	if(changeValue){
//             pieExpChart001.destroy();
//             pieGenChart001.destroy();
            
//             pieGradeChart001.destroy();
//             pieGradeChart002.destroy();
//             pieGradeChart003.destroy();
//             pieGradeChart004.destroy();
//             pieGradeChart005.destroy();
//             pieGradeChart006.destroy();
            
//             barChart001.destroy();
//             barChart002.destroy();
            
//         }//변경된 정보가 있을 경우 기존에 존재하던 그래프 삭제
    	
//     	//pie차트 생성
//     	pieExpChart001 = pieChartDraw('pieChartCanvas001', 'pie', ['체험','비체험'], 
//     			[{data: 
//     				[pieExpData1[0], pieExpData1[1]], 
//     				backgroundColor: pieColor}], 
//     				pieOptions('체험 여부'));
    	
//     	pieGenChart001 = pieChartDraw('pieChartCanvas002', 'pie', ['남자','여자'], 
//     			[{data: 
//     				[pieExpData2[0], pieExpData2[1]], 
//     				backgroundColor: pieColor}], 
//     				pieOptions('성별 체험 여부'));
    	
//     	pieGradeChart001 = pieChartDraw('pieChartGrade001', 'pie', ['체험','비체험'], 
//     			[{data: 
//     				[pieGradeData[0], pieGradeData[1]], 
//     				backgroundColor: pieColor}], 
//     				pieOptions('일방등급 체험 여부'));
    	
//     	pieGradeChart002 = pieChartDraw('pieChartGrade002', 'pie', ['체험','비체험'], 
//     			[{data: 
//     				[pieGradeData[2], pieGradeData[3]], 
//     				backgroundColor: pieColor}], 
//     				pieOptions('화이트등급 체험 여부'));
    	
//     	pieGradeChart003 = pieChartDraw('pieChartGrade003', 'pie', ['체험','비체험'], 
//     			[{data: 
//     				[pieGradeData[4], pieGradeData[5]], 
//     				backgroundColor: pieColor}], 
//     				pieOptions('브로즌등급 체험 여부'));
    	
//     	pieGradeChart004 = pieChartDraw('pieChartGrade004', 'pie', ['체험','비체험'], 
//     			[{data: 
//     				[pieGradeData[6], pieGradeData[7]], 
//     				backgroundColor: pieColor}], 
//     				pieOptions('실버등급 체험 여부'));
    	
//     	pieGradeChart005 = pieChartDraw('pieChartGrade005', 'pie', ['체험','비체험'], 
//     			[{data: 
//     				[pieGradeData[8], pieGradeData[9]], 
//     				backgroundColor: pieColor}], 
//     				pieOptions('골드등급 체험 여부'));
    	
//     	pieGradeChart006 = pieChartDraw('pieChartGrade006', 'pie', ['체험','비체험'], 
//     			[{data: 
//     				[pieGradeData[10], pieGradeData[11]], 
//     				backgroundColor: pieColor}], 
//     				pieOptions('VIP등급 체험 여부'));
    	
    	
//     	//bar그래프 생성
//     	barChart001 = barDoubleChartDraw1('barChartExpAge001', 'bar', ages, barAgeData, barBackGroundColor, barOptions('연령별 체험 여부'));
//     	barChart002 = barDoubleChartDraw2('barChartExpAge002', 'bar', days, barDayData, barBackGroundColor, barOptions('요일별 체험 여부'));
//     }
}


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
	graphSearch();
}



//초기화 기능
function initSearch(){
	Utilities.mapToForm({}, "frmSearch");
	Utilities.mapToForm({}, "frmSearchGraph");
	$("#initInput").val("");
}

function dateSetting(){
	var strStartDay= moment().subtract(1, 'month').format('YYYYMMDD');
    var strEndDay = moment().format("YYYYMMDD");
    
    $("#strtDt").val(strStartDay);
    $("#endDt").val(strEndDay);
    $("#strtDt2").val(strStartDay);
    $("#endDt2").val(strEndDay);
}

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