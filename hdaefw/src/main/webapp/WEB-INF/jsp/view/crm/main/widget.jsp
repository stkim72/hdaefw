<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="/static/crm/js/Chart.min.js"></script>
<script type="text/javascript" src="/static/crm/js/chartjs-plugin-labels.js"></script>

<body>
    
    <!-- grid -->
    <div class="mGrid4">
        <!-- 공지사항 -->
        <div class="col mNotice1">
            <h3 class="mTitle2">공지사항</h3>
            <ul>
            <c:forEach items="${noticeList }" var="notice" varStatus="stat">
                <li>
                    <a href="#;" class="tit" data-click="showNotice" data-ntcart-id="${notice.ntcartId }">
                        <span class="n">${stat.count }</span> 
                        <c:choose>
                            <c:when test="${notice.noteYn == 'Y'}"> <strong class="txtRed">[긴급]</strong></c:when>
                            <c:otherwise><strong>[일반]</strong></c:otherwise>
                        </c:choose>
                        ${notice.ntcartNm } 
                    </a>
                    <c:if test="${notice.fileCnt>0 }" >
                    <a href="#;" class="iAttach1" data-click="showNotice" data-ntcart-id="${notice.ntcartId }">첨부파일</a>
                    </c:if>
                    <div class="dat">${notice.regDt }</div>
                </li>
            </c:forEach>
            <c:if test="${empty noticeList }">
                 <li>
                    <a href="#" class="tit">
                        <span class="n">-</span> 
                        등록된 공지가 없습니다.
                    </a>
                    <div class="dat"></div>
                </li>
            </c:if>
            </ul>
        </div>
        <!-- //공지사항 -->
        <!-- 고객여정 -->
        <c:set var="custType" value="${widgetData.custType }" />
        <fmt:formatNumber type="number" maxFractionDigits="3" value="${custType.cnt001}" var="cnt001"/>
        <fmt:formatNumber type="number" maxFractionDigits="3" value="${custType.cnt002}" var="cnt002"/>
        <fmt:formatNumber type="number" maxFractionDigits="3" value="${custType.cnt003}" var="cnt003"/>
        <fmt:formatNumber type="number" maxFractionDigits="3" value="${custType.cnt004}" var="cnt004"/>
        <fmt:formatNumber type="number" maxFractionDigits="3" value="${custType.cnt005}" var="cnt005"/>
        <fmt:formatNumber type="number" maxFractionDigits="3" value="${custType.cnt006}" var="cnt006"/>
        <fmt:formatNumber type="number" maxFractionDigits="3" value="${custType.cnt007}" var="cnt007"/>
        <fmt:formatNumber type="number" maxFractionDigits="3" value="${custType.cnt008}" var="cnt008"/>
        <fmt:formatNumber type="number" maxFractionDigits="3" value="${custType.cnt009}" var="cnt009"/>
<!--         <div class="col mGraph2"> -->
<!--             <h3 class="mTitle2">고객여정</h3> -->
<!--             <div class="graph"> -->
<!--                 <div class="sco"> -->
<%--                     <div class="sc sc1"><strong></strong>${cnt001}명 (${custType.avg001}%)</div> --%>
<%--                     <div class="sc sc2 yellow"><strong>${cnt002}</strong>명 (${custType.avg002}%)</div> --%>
<%--                     <div class="sc sc3 gray"><strong>${cnt003}</strong>명 (${custType.avg003}%)</div> --%>
                    
<%--                     <div class="sc sc4 red"><strong>${cnt004}</strong>명 (${custType.avg004}%)</div> --%>
<%--                     <div class="sc sc5 gray"><strong>${cnt005}</strong>명 (${custType.avg005}%)</div> --%>
<%--                     <div class="sc sc6 gray"><strong>${cnt006}</strong>명 (${custType.avg006}%)</div> --%>
<!--                 </div> -->
<!--                 <div class="label"> -->
<!--                     <div class="tx">잠재고객</div> -->
<!--                     <div class="tx">가망고객</div> -->
<!--                     <div class="tx">체험고객</div> -->
<!--                     <div class="tx red">구매고객</div> -->
<!--                     <div class="tx gray">추천고객</div> -->
                    
<!--                     <div class="tx gray">충성고객</div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<div class="col chart-map">
            <h3 class="mTitle2">고객여정</h3>
            <div>
                <div class="float-l custom-width">등급점수</div>
                <div class="float-l map-bg with90">
                    <div class="chart-map-con">
                        <div class="height-h2 ml6">
                          <div class="rectangle rec6" style="white-space: nowrap;"><span class="result-number">${cnt006}</span>명(${custType.avg006}%)</div>
                        </div>
                        <div class="height-h ml5">
                            <div class="rectangle rec5" style="white-space: nowrap;"><span class="result-number">${cnt005}</span>명(${custType.avg005}%)</div>
                        </div>
                        <div class="height-h ml4">
                          <div class="rectangle rec4" style="white-space: nowrap;"><span class="result-number">${cnt004}</span>명(${custType.avg004}%)</div>
                        </div>
                        <div class="height-h ml3">
                            <div class="rectangle rec3" style="white-space: nowrap;"><span class="result-number">${cnt003}</span>명(${custType.avg003}%)</div>
                        </div>
                        <div class="height-h ml2">
                          <div class="rectangle rec2" style="white-space: nowrap;"><span class="result-number">${cnt002}</span>명(${custType.avg002}%)</div>
                        </div>
                        <div class="height-h">
                            <div class="rectangle rec1" style="white-space: nowrap;"><span class="result-number">${cnt001}</span>명(${custType.avg001}%)</div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div>
                        <div class="label-item type-gray">잠재고객</div>
                        <div class="label-item type-gray">가망고객</div>
                        <div class="label-item type-gray">체험고객</div>
                        <div class="label-item type-red">구매고객</div>
                        <div class="label-item type-black">추천고객</div>
                        <div class="label-item type-black">충성고객</div>
                    </div>   
                </div>
                <div class="float-r custom-width align-top-r">고객유형</div>  
                <div class="clear"></div>
            </div> 
        </div>
        <!-- //고객여정 -->
        <!-- 쿠폰사용 현황 -->
        <div class="col mGraph3">
            <h3 class="mTitle2 mb0">쿠폰사용 현황</h3>
            <!-- graph -->
            <div class="graph">
                <canvas id="cvCoupon" width="330" height="220"></canvas>
            </div>
            <!--./graph-->
        </div>
        <!-- //쿠폰사용 현황 -->
    </div>
    <!-- //grid -->
    <fmt:formatNumber type="number" maxFractionDigits="3" value="${widgetData.custCountInfo.custCnt}" var="custCnt"/>
    <fmt:formatNumber type="number" maxFractionDigits="3" value="${widgetData.custCountInfo.mshipCnt}" var="mshipCnt"/>
    <fmt:formatNumber type="number" maxFractionDigits="3" value="${widgetData.custCountWeek.thisWeekCnt}" var="thisWeekCnt"/>
    <fmt:formatNumber type="number" maxFractionDigits="3" value="${widgetData.custCountWeek.lastWeekCnt}" var="lastWeekCnt"/>
    <!-- grid -->
    <div class="mGrid4 type2">
        <!-- 주간 멤버십 신규회원 가입현황 -->
        <div class="col">
            <div class="gTitle2">
                <h3 class="mTitle2">주간 멤버십 신규회원 가입현황</h3>
                <div class="rt">전체회원 : ${mshipCnt }명</div>
            </div>
            <!-- graph -->
            <div class="graph">
                <canvas id="cvMember" width="330" height="220"></canvas>
            </div>
            <!-- //graph -->
        </div>
        <!-- //주간 멤버십 신규회원 가입현황 -->
        <!-- 주간 통합고객  신규등록 비율 -->
        <div class="col">
            <div class="gTitle2">
                <h3 class="mTitle2">주간 통합고객  신규등록 비율</h3>
                <div class="rt">전주 : ${ lastWeekCnt}명 |&nbsp;</div>
                <div class="rt"> 금주 : ${ thisWeekCnt}명 |&nbsp;</div>
                <div class="rt"> 전체회원 : ${ custCnt}명</div>
            </div>
            <!-- graph -->
            <div class="graph flex">
                
                <div class="co">
                    <div class="ti">전주</div>
                    <canvas id="cvCustPrev" width="200" height="200"></canvas>
                </div>
                <div class="co">
                    <div class="ti">금주</div>
                    <canvas id="cvCust" width="200" height="200"></canvas>
                </div>
                
                <div class="label type2" >
                 <table class="table-con">
                        <thead >
                            <th width="140px"></th>
                            <th width="3px"></th>
                            <th width="140px"></th>
                        </thead>
                        <tbody id="lblCust">
                        </tbody>
                 </table>
<!--                     <span class="tx i1">멤버십</span> -->
<!--                     <span class="tx i2">세라체크</span> -->
<!--                     <span class="tx i3">상담</span> -->
<!--                     <span class="tx i4">IoT</span> -->
<!--                     <span class="tx i5">AS</span> -->
<!--                     <span class="tx i6">세라체크DNA</span> -->
<!--                     <span class="tx i7">웰카페(POS)</span> -->
<!--                     <span class="tx i8">부모님연구소</span> -->
<!--                     <span class="tx i9">BOS</span> -->
                    
<!--                     <span class="tx i6">세라체크DNA</span> -->
<!--                     <span class="tx i7">웰카페(POS)</span> -->
                </div>
            </div>
            <!-- //graph -->
        </div>
        <!-- //주간 통합고객  신규등록 비율 -->
    </div>
    <!-- //grid -->
    
    <!-- 구매건수 -->
    <div class="mGrid4">
        <div class="col">
            <div class="gTitle2">
                <h3 class="mTitle2">구매건수(BOS 계약건수)</h3>
            </div>
            <!-- graph -->
            <div class="graph">
                <canvas id="cvOrd" width="100%" height="220"></canvas>
            </div>
            <!-- //graph -->
        </div>
    </div>
    <!-- //구매건수 -->


<script>

const colorPrev = "#BABABA";
const colorThis = "#F09A9A";

function showNotice(elem,data){
	var url = "/util/notice/"+data.ntcartId;
    Utilities.openModal(url,1000,650);
    
	
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
function getDayName(dt){
	const wd = ["일","월","화","수","목","금","토"];
	const day = moment(dt,'YYYYMMDD').format("M월D일");
    const weekday = moment(dt,'YYYYMMDD').format("d");
    return day + "("+wd[weekday]+")";
}

function loadData(data){
	loadCustType(data.custType);
	loadCouponList(data.couponList);
	loadaMemberRegList
	loadaMemberRegList(data.memberRegList);
	loadCustRegList(data.custRegList);
	loadOrdList(data.ordList);
}
function loadCustType(custType){
// 	console.log(custType);
}
function loadCouponList(couponList){
	
	let pubMax = 0;
	let useMax = 0;
	const lbl = [''];
	const pubList = [null];
	const useList = [null];
	for(let i=0;i<couponList.length;i++){
		const coupon = couponList[i];
		
		lbl.push(getDayName(coupon.useDt));
		pubList.push(coupon.pubCnt);
		useList.push(coupon.useCnt);
		
		if(pubMax<coupon.pubCnt)
			pubMax= coupon.pubCnt;
		
		if(useMax<coupon.useCnt)
			useMax= coupon.useCnt;
	}
// 	if(pubMax<10)
// 		pubMax = 10;
	
// 	if(useMax<10)
// 		useMax = 10;
	
	lbl.push('');
	pubList.push(null);
	useList.push(null);
	//            labels: ['', '1월 20일 월', '1월 21일 화', '1월 22일 수', '1월 23일 목', '1월 24일 금', '1월 25일 토', ''],

	const cvCoupon = document.getElementById("cvCoupon").getContext("2d");
	const opt = {
	        type: 'line',
	        data: {
	            labels: lbl,
	            datasets: [{
	                label: '발행',
	                data: pubList,
	                borderColor: colorPrev,
	                backgroundColor: colorPrev,
	                fill: false,
	                lineTension: 0,
	                borderWidth: 1,
	                pointRadius: 2,
	                yAxisID: 'leftY',
	            },{
	                label: '사용',
	                data: useList,
	                borderColor: colorThis,
	                backgroundColor: colorThis,
	                fill: false,
	                lineTension: 0,
	                borderWidth: 1,
	                pointRadius: 2,
	                yAxisID: 'rightY',
	            }]
	        },
	        options: {
	            responsive: true,
	            maintainAspectRatio: false,
	            scales: {
	                xAxes: [{
	                    barPercentage: 0.2,
	                    gridLines : {
	                        display : false
	                    }
	                }],
	                yAxes: [{
	                    "scaleLabel": {
	                        "display": true,
	                        "labelString": "발행"
	                      },
	                      "id": "leftY",
	                      "stacked": false,
	                      "ticks": {
	                        "beginAtZero": true,
	                        min: 0,
//	                         max: pubMax,
	                        callback: function(value, index, ticks) {
	                            if(!value)
	                                return "";
	                            return Utilities.numberWithCommas( value);
	                        },
	                      }
	                    },
	                    {
	                      "scaleLabel": {
	                        "display": true,
	                        "labelString": "사용"
	                      },
	                                "id": "rightY",
	                                "position": "right",
	                      "stacked": false,
	                      "ticks": {
	                        "beginAtZero": true,
	                        min: 0,
//	                         max: useMax,
	                        callback: function(value, index, ticks) {
	                            if(!value)
	                                return "";
	                            return Utilities.numberWithCommas( value);
	                        },
//	                         stepSize: 10
	                      }
	                    }
	                    ]
	            },
	            maintainAspectRatio: false,
	            tooltips: {
	                mode: 'index',
	                intersect: true,
	                callbacks: {
	                    label: function(tooltipItem, data) {
	                    	 var label = data.datasets[tooltipItem.datasetIndex].label || '';

	                         if (label) {
	                             label += ': ';
	                         }
	                         label += Utilities.numberWithCommas( tooltipItem.yLabel);
	                         return label;
	                    }
	                }
	            }
	            
	        }
	    };
	
	pubMax = getMaxNumber(pubMax);
	opt.options.scales.yAxes[0].ticks.max = pubMax;
    opt.options.scales.yAxes[0].ticks.stepSize = pubMax/5;
    
    useMax  = getMaxNumber(useMax);
    opt.options.scales.yAxes[1].ticks.max = useMax;
    opt.options.scales.yAxes[1].ticks.stepSize = useMax/5;
  
	
	const chart1 = new Chart(cvCoupon, opt);
    
// 	console.log(couponList);
}

function loadaMemberRegList(memberRegList){
	const lbl = [];
    const curList = [];
    const prevList = [];
    let maxReg = 0;
    for(let i=0;i<memberRegList.length;i++){
        const data = memberRegList[i];
        
        lbl.push(getDayName(data.regDt));
        curList.push(data.regCnt);
        prevList.push(data.prevRegCnt);
        if(maxReg<data.regCnt)
            maxReg = data.regCnt;
        if(maxReg<data.prevRegCnt)
            maxReg = data.prevRegCnt;
    }

	const opt = {
	        type: 'bar',
	        data: {
	            labels: lbl,
	            datasets: [{
	                    type: 'bar',
	                    label: '전주',
	                    backgroundColor: colorPrev,
                        borderColor: colorPrev,
	                    borderWidth: 0,
	                    data: prevList,
	                },
	                {
	                    type: 'bar',
	                    label: '금주',
	                    backgroundColor: colorThis,
                        borderColor: colorThis,	                    
	                    borderWidth: 0,
	                    data: curList,
	                }]
	        },
	        options: {
	            responsive: true,
	            maintainAspectRatio: false,
	            scales: {
	                xAxes: [{
	                    gridLines : {
	                        display : false
	                    }
	                }],
	                yAxes: [{
	                    ticks: {
	                        min: 0,
// 	                         max: 100,
// 	                        stepSize: 1
	                        callback: function(value, index, ticks) {
	                            if(!value)
	                                return "";
	                            return Utilities.numberWithCommas( value);
	                        },
	                    }
	                }]
	            },
	            plugins: {
	                labels: {
	                    render: function(args){
	                        if(args.value)
	                            return Utilities.numberWithCommas(args.value);
	                        else return '';                 },
	                },
	            },
	            tooltips: {
                    mode: 'index',
                    intersect: true,
                    callbacks: {
                        label: function(tooltipItem, data) {
                             var label = data.datasets[tooltipItem.datasetIndex].label || '';

                             if (label) {
                                 label += ': ';
                             }
                             label += Utilities.numberWithCommas( tooltipItem.yLabel);
                             return label;
                        }
                    }
                }
	        }
	    };
	
	maxReg = getMaxNumber(maxReg);
    opt.options.scales.yAxes[0].ticks.max = maxReg;
    opt.options.scales.yAxes[0].ticks.stepSize = maxReg/5;
    
	
	const cvMember = document.getElementById('cvMember');
	const chart2 = new Chart(cvMember, opt );
}

function loadCustRegList(custRegList){
	const lblCust = $("#lblCust");
	const lbl = [];
    const curList = [];
    const prevList = [];
    const bgColors = [];
    let tr = null;
    let cnt = 0;
    for(let i=0;i<custRegList.length;i++){
    	cnt++;
    	const data = custRegList[i];
        lbl.push(data.chlCdNm);
        curList.push(data.regCnt);
        prevList.push(data.prevRegCnt);
        bgColors.push(data.colorCd);
        if(i % 2 ==0){
        	
        	if(i>0){
        		const sp = $('<tr><td colspan="3" class="ta-h"></td></tr>');
                lblCust.append(sp);	
        	}
        	tr = $("<tr></tr>")
            lblCust.append(tr);
        	
        	tr.append('<td style="background-color:'+data.colorCd+'; border: 1px solid #E5E5E9" class="ta-bg'+cnt+'">'+data.chlCdNm+'</td>');
        	tr.append('<td></td>');
        } else {
        	tr.append('<td style="background-color:'+data.colorCd+'; border: 1px solid #E5E5E9" class="ta-bg'+cnt+'">'+data.chlCdNm+'</td>');
        }
        
//         const tmpl = $('<span class="tx i'+( i+1 % 10 )+'">'+data.chlCdNm+'</span>');
//         const tmpl = $('<span class="tx i'+( i+1 )+'" style="background-color:'+data.colorCd+'; border: 1px solid #E5E5E9;margin-left:1px">'+data.chlCdNm+'</span>');
//         lblCust.append(tmpl);
    }
    if(cnt%2)
    	tr.append('<td></td>');
    	
                   
    
    
	var cvCust = document.getElementById('cvCust');
    var chart3 = new Chart(cvCust, {
        type: 'doughnut', 
        data: {
            labels: lbl,
            datasets: [{
                data: curList,
                backgroundColor: bgColors
            }] 
        },
        options: {
                responsive: false,
                legend: {
                    display: false
                }, tooltips: {
                    callbacks: {
                        label: function(tooltipItem, data) {
                             var label = data.labels[tooltipItem.index]|| '';

                             if (label) {
                                 label += ': ';
                             }
                             label += Utilities.numberWithCommas( data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index]);
                             return label;
                        }
                    }
                }
            }
        }); 
        
        var cvCustPrev = document.getElementById('cvCustPrev');
        var chart4 = new Chart(cvCustPrev, {
            type: 'doughnut', 
            data: {
                labels: lbl,
                datasets: [{
                    data: prevList,
                    backgroundColor: bgColors
                }] 
            },
            options: {
                responsive: false,
                legend: {
                    display: false
                }, tooltips: {
                    callbacks: {
                        label: function(tooltipItem, data) {
                             var label = data.labels[tooltipItem.index]|| '';

                             if (label) {
                                 label += ': ';
                             }
                             label += Utilities.numberWithCommas( data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index]);
                             return label;
                        }
                    }
                }
            }
        }); 
}
function loadOrdList(ordList){
	
	const lbl = [];
    const curList = [];
    const prevList = [];
    let maxReg = 0;
    for(let i=0;i<ordList.length;i++){
        const data = ordList[i];
        
        lbl.push(getDayName(data.ordDe));
        curList.push(data.ordCnt);
        prevList.push(data.prevOrdCnt);
        
        if(maxReg<data.ordCnt)
            maxReg = data.ordCnt;
        if(maxReg<data.prevOrdCnt)
            maxReg = data.prevOrdCnt;
    }
	
	 var cvOrd = document.getElementById('cvOrd');
	 var opt = {
	         type: 'bar',
	         data: {
	             labels: lbl,
	             datasets: [{
	                     type: 'bar',
	                     label: '전주',
	                     backgroundColor: colorPrev,
                         borderColor: colorPrev,
	                     borderWidth: 0,
	                     data: prevList,
	                 },
	                 {
	                     type: 'bar',
	                     label: '금주',
	                     backgroundColor: colorThis,
                         borderColor: colorThis,
	                     borderWidth: 0,
	                     data: curList,
	                 }]
	         },
	         options: {
	             responsive: true,
	             maintainAspectRatio: false,
	             scales: {
	                 xAxes: [{
	                     barPercentage: 0.4,
	                     gridLines : {
	                         display : false
	                     }
	                 }],
	                 yAxes: [{
	                     ticks: {
	                         min: 0,
//	                          max: 1500,
//	                          stepSize: 500
	                         callback: function(value, index, ticks) {
	                             if(!value)
	                                 return "";
	                             return Utilities.numberWithCommas( value);
	                         },
	                     }
	                 }]
	             },
	             plugins: {
	                 labels: {
	                     render: function(args){
	                         if(args.value)
	                             return Utilities.numberWithCommas(args.value);
	                         else return '';                 },
	                 }
	             },
	             tooltips: {
	                    mode: 'index',
	                    intersect: true,
	                    callbacks: {
	                        label: function(tooltipItem, data) {
	                             var label = data.datasets[tooltipItem.datasetIndex].label || '';

	                             if (label) {
	                                 label += ': ';
	                             }
	                             label += Utilities.numberWithCommas( tooltipItem.yLabel);
	                             return label;
	                        }
	                    }
	                }
	         
	         }
	     };
	 maxReg = getMaxNumber(maxReg);
	    opt.options.scales.yAxes[0].ticks.max = maxReg;
	    opt.options.scales.yAxes[0].ticks.stepSize = maxReg/5;
     var chart5 = new Chart(cvOrd, opt);
     
     
     
     
 }
     
     
     
     
$(document).ready(function(){
    const url = "/widget/data";
    Utilities.getAjax(url,null,false,function(data,jqXHR){
        if(Utilities.processResult(data,jqXHR,""))
        {
            loadData(data);
        }
    });
});
</script>

</body>