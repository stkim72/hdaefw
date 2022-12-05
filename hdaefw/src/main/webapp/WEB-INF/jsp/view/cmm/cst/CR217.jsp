<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 

<div id="wrapIframe" class="closed"> <!-- 고객정보 닫힘 -->
	<div class="mGrid1">
		<!-- right -->
		<div class="gRight">
			<div class="gTitle1 line">
                <h3 class="mTitle1">IOT사용 통계</h3>
            </div>
            
			<!-- sort -->
			<div class="mSort2">
            	<form role="form" id="frmSearch">
				<ul>
					<li class="wAuto">
						<div class="gRadio1">
                    			&nbsp;&nbsp;&nbsp;&nbsp;
								<label class="mRadio1 type2">
		                            <input type="radio" title="월간" checked="true" value="month" name="searchDateType" id="searchDateType">
		                            <span class="label">월간</span>
		                        </label>
		                        <label class="mRadio1 type2">
		                            <input type="radio" title="일간" value="day" name="searchDateType" id="searchDateType">
		                            <span class="label">일간</span>
                        		</label>
                        </div>
					</li>
					
					<li class="">
						<div class="tit">기간</div>
						<div class="txt" id="monthSearchForm">
							<div class="mDate1">
								<input type="text" title="시작일" data-type="month" data-range-end="endDtM" id="strtDtM" name="strtDtM" data-enter="search" data-button="Y" value="">
								<span class="bar">~</span>
								<input type="text" title="마지막일" data-type="month" id="endDtM" name="endDtM" data-enter="search" data-button="Y" value="">
							</div>
						</div>
						<div class="txt" id="daySearchForm" hidden="true">
                        	<div class="mDate1">
								<input type="text" class="it date" title="시작일" data-type="dateRangeStart" data-range-end="endDtD" id="strtDtD" name="strtDtD" data-enter="search" data-button="Y" value="">
								<span class="bar">~</span>
								<input type="text" class="it date" title="마지막일" id="endDtD" name="endDtD" data-enter="search" data-button="Y" value="">
							</div>
						</div>
					</li>
					
					<li class="">
						<div class="tit">디바이스</div>
						<div class="txt">
							<select id="deviceCd" name="deviceCd" style="width:100px">
								<option value="VM34">V4</option>
								<option value="VM6">V6</option>
							</select>
						</div>
					</li>
					
					<li class="">
						<div class="tit">모드</div>
						<div class="txt">
							<select id="modeCd" name="modeCd" style="width:200px">
							</select>
						</div>
					</li>
				</ul>
				</form>
				<div class="button posRt">
                    <a href="#" class="mBtn1" data-click="searchStats">검색</a>
                </div>
			</div>
			<p>&nbsp;</p>
			<div class="mTab1 jsTab2">
				<ul>
					<li class="active"><a id="ageStatsTabBtn" href="#ageStatsTab">연령분포</a></li>
					<li><a id="gndrStatsTabBtn" href="#gndrStatsTab">성별분포</a></li>
					<li><a id="gradeStatsTabBtn" href="#gradeStatsTab">등급분포</a></li>
				</ul>
			</div>
			
			<div id="ageStatsTab" class="mBox1 p10 tabCont ">
				<iframe data-tab-type="iframe" id="ageStatsIFrm" scrolling="yes" src="<c:url value='${urlPrefix}/cusStat/iotUseAgeStats'/>${urlSuffix}" 
						style="width: 100%; min-height: 300px; border: 0px; height: 700px;"></iframe>
			</div>
			<div id="gndrStatsTab" class="mBox1 p10 tabCont hidden">
				<iframe data-tab-type="iframe" id="gndrStatsIFrm" scrolling="yes" src="<c:url value='${urlPrefix}/cusStat/iotUseGndrStats'/>${urlSuffix}" 
						style="width: 100%; min-height: 300px; border: 0px; height: 700px;"></iframe>
			</div>
			<div id="gradeStatsTab" class="mBox1 p10 tabCont hidden">
				<iframe data-tab-type="iframe" id="gradeStatsIFrm" scrolling="yes" src="<c:url value='${urlPrefix}/cusStat/iotUseGradeStats'/>${urlSuffix}" 
						style="width: 100%; min-height: 300px; border: 0px; height: 700px;"></iframe>
			</div>
		</div>
		<!-- //right -->
	</div>
</div>


<script>
	$("document").ready(function(){
		initPage();
	});

	function initPage(){
		$("input[name='searchDateType']:radio").change(function () {
			//라디오 버튼 값을 가져온다.
			var noticeCat = this.value;
			if(noticeCat == "month")
			{
				$("#daySearchForm").css('display', 'none');
				$("#monthSearchForm").css('display', 'block');
			}
			else if(noticeCat == "day")
			{
				$("#monthSearchForm").css('display', 'none');
				$("#daySearchForm").css('display', 'block');
			}
		});

		$("#deviceCd").change( function() {
			//console.log(">>> "+ $(this).val());
			getModeListByType($(this).val());
		});

		$('#deviceCd').val('VM34').trigger('change');
	}

	function getModeListByType(code){
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

	function searchStats(){
		var frmSearchCondParam = Utilities.formToMap("frmSearch");
//console.log(">>> "+ JSON.stringify(frmSearchCondParam));
		var ageStatsIFrmObj = $("#ageStatsIFrm")[0].contentWindow; 
		var gndrStatsIFrmObj = $("#gndrStatsIFrm")[0].contentWindow; 
		var gradeStatsIFrmObj = $("#gradeStatsIFrm")[0].contentWindow; 

		ageStatsIFrmObj.searchStats(frmSearchCondParam);
		gndrStatsIFrmObj.searchStats(frmSearchCondParam);
		gradeStatsIFrmObj.searchStats(frmSearchCondParam);
	}
</script>