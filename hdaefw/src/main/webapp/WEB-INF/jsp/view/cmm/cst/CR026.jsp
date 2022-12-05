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
        <h1>세라체크 상세</h1>
        <a href="#" data-btn-type="closeModal" class="close">팝업 닫기</a>
    </div>
    
	<div class="cont">
        
        <!-- grid -->
        <div class="mGrid2">
            	<div class="gTitle1 line">
		            <h3 class="mTitle1">세라체크 상세</h3>
		        </div>
		        
				<!-- board -->
                <div class="mBoard2"> 
                    <table>
                        <caption>세라체크 상세</caption>
                         <colgroup>
                         	<col width="5%">
                         	<col width="*">
                         	<col width="*">
                            <col width="*">
                            <col width="*">
                            <col width="*">
                            <col width="*">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                            	<th class="center" scope="row">구분</th>
                                <th class="center" scope="row">두뇌스트레스</th>
                                <th class="center" scope="row">집중도</th>
                                <th class="center" scope="row">두뇌활동정도</th>
                                <th class="center" scope="row">죄우뇌불균형</th>
                                <th class="center" scope="row">피로도</th>
                                <th class="center" scope="row">신겅계건강도</th>
                                <th class="center" scope="row">활력도</th>
                            </tr>
                            <tr>
                            	<th class="center" scope="row">항목설명</th>
                                <td>두뇌의  긴장, 불안 상태를 의미합니다.</td>
                                <td>주의력과 몰입력에 대한 총체적인 평가 입니다.</td>
                                <td>뇌파로 본 두뇌의 활동(각성) 정도를 의미합니다.</td>
                                <td>좌·우 뇌파의 신경학적인 균형에 대한 평가입니다.</td>
                                <td>심박 간격의 변화 정도와 자율 신경의 활성 상태 본 전반적인 피로를 의미합니다.</td>
                                <td>자율신경의 교감과 부교감의 균형 정도로 본 전반적인 활력 상태를 의미합니다.</td>
                                <td>자율신경 중 교감신경과 부교감 신경의 활성 상태로 본 신경계 건강을 의미합니다.</td>
                            </tr>
                            <tr>
                            	<th class="center" scope="row">수치</th>
                                <td>${ceraCk.cstressCd}</td>
                                <td>${ceraCk.concentrationCd}</td>
                                <td>${ceraCk.mentalCd}</td>
                                <td>${ceraCk.balanceCd}</td>
                                <td>${ceraCk.bodyFatigueCd}</td>
                                <td>${ceraCk.nerveHealthCd}</td>
                                <td>${ceraCk.bodyEnergyCd}</td>
                            </tr>
                            <tr>
                            	<th class="center" scope="row">점수</th>
                                <td>${ceraCk.cbrainScore}</td>
                                <td>${ceraCk.concentration}</td>
                                <td>${ceraCk.mental}</td>
                                <td>좌뇌:${ceraCk.leftBalanceRatio}/우뇌:${ceraCk.rightBalanceRatio}</td>
                                <td>${ceraCk.bodyFatigue}</td>
                                <td>${ceraCk.nerveHealth}</td>
                                <td></td>
                            </tr>
                            <tr>
                            	<th class="center" scope="row">상세설명</th>
                                <td>두뇌 스트레스는 뇌파 중 베타파와 알파파의 비율로 본  두뇌의 긴장, 불안 상태를 의미합니다. 두뇌 스트레스는 수치가 낮을 수록 긍정적인 상태를 의미하므로 적정 범위인 70점 미만의 상태를 유지할 수 있도록 관리가 필요합니다.</td>
                                <td>집중도는 뇌파 중 세타파와 Low 베타파 + Middle 베타파의  비율로 본 주의력과 몰입력에 대한 총체적인 집중 능력을 의미합니다.<br/>집중도는 높을수록  긍정적인 상태를 의미하므로 적정범위인 40점 이상의 상태를 유지할 수 있도록 관리가 필요합니다.</td>
                                <td>두뇌 활동 정도는  두뇌에서 처리하고 있는 작업(각성)의 부하 정도를 의미하는 것으로 과도한 스트레스나 과도한 각성 시 높아지게 됩니다.<br/>두뇌 활동 정도는 적정 수준이 긍정적인 상태를 의미하므로 적정 수준인 12.2Hz~19.5Hz 의 상태를 유지할 수 있게  관리가 필요합니다.</td>
                                <td>좌뇌가 더 활성화된 경우 논리적, 분석적 정보 처리 방식의 문제 해결 성향에 익숙하며, 우뇌가 더 활성화 된 경우 직관적, 총체적 정보처리방식의 문제 해결에 익숙합니다.<br/>좌우뇌는 어느 한쪽으로 평균 상태가 아닌 균형 상태가 긍정적인 상태를 의미하므로 균형을 유지할 수 있도록 관리가 필요합니다.</td>
                                <td>피로도는 심박변이도(HRV-Index)와 자율신경 활성 (Total Power) 상태로 평가한 전반적인 피로 정도 입니다.<br/>피로도는 수치가 낮을 수록 긍정적인 상태를 의미하므로 적정 범위인 60점 미만의 상태를 유지할 수 있도록 관리가 필요합니다.</td>
                                <td>자율 신경은 균형을 이루며 활동 시에는 교감 신경이, 휴식 시에는 부교감 신경이 약간 더 활성화 되나 교감이 과하게 활성화 된 경우 긴장, 부교감이 과하게 활성화 된 경우  무기력 감을 느낄 수 있으니, 활력도는 보통~긴장 상태를 유지할 수 있도록 관리가 필요합니다. </td>
                                <td>신경계 건강도는 스트레스 상황에 활성화 되는 교감 신경과 스트레스 상황 후 신체를 안정시키는 부교감 신경의 전반적인  건강 상태를 의미합니다. 신경계 건강도는 수치가 높을 수록 긍정적인 상태를 의미하므로 적정 범위인 40점 이상의 상태를 유지할 수 있도록 관리가 필요합니다.</td>
                            </tr>
                            <tr>
                                <th class="center" scope="row">구분</th>
                                <th class="center" scope="row">혈압</th>
                                <th class="center" scope="row">맥압</th>
                                <th class="center" scope="row">혈당</th>
                                <th class="center" scope="row">체지방률</th>
                                <th class="center" scope="row">BMI</th>
                                <th class="center" scope="row">복부둘레</th>
                            </tr>
                             <tr>
                                <th class="center" scope="row">항목설명</th>
                                <td>심장 수축에 의해 혈액이 흐르며 혈관 벽에 부딪쳐서 생기는 압력을 의미합니다.</td>
                                <td>수축기 혈압과 이완기 혈압의 차이를 의미합니다</td>
                                <td>혈액 속에 함유되어 있는 포도당의 농도를 의미합니다.</td>
                                <td>체중에서 차지하는 체지방의 비율과 근육의 무게를 의미합니다.</td>
                                <td>신체질량지수(Body Mass Index)로 체중과 신장의 비율을 이용한 객관적 비만 지수 입니다.</td>
                                <td>복부 둘레로 본 복부 지방의 축적 상태 입니다.</td>
                            </tr>
                            <tr>
                                <th class="center" scope="row">수치</th>
                                <td>수축기:${ceraCk.bpSysCd}/이완기:${ceraCk.bpDiaCd}</td>
                                <td>${ceraCk.bpPowerCd}</td>
                                <td>${ceraCk.blCd}</td>
                                <td>체지방:${ceraCk.fatCd}/근육량:${ceraCk.muscleCd}</td>
                                <td>${ceraCk.bmiCd}</td> 
                                <td>${ceraCk.abdRoundCd}</td>
                            </tr>
                            <tr>
                                <th class="center" scope="row">점수</th>
                                <td>수축기:${ceraCk.bpSys}/이완기:${ceraCk.bpDia}</td>
                                <td>${ceraCk.bpPower}</td>
                                <td>${ceraCk.blVl}</td>
                                <td>체지방:${ceraCk.fat}/근육량:${ceraCk.muscle}</td>
                                <td>키:${ceraCk.height}/몸무게:${ceraCk.weight}</td> 
                                <td>${ceraCk.abdRound}</td>
                            </tr>
                            <tr>
                                <th class="center" scope="row">상세설명</th>
                                <td>심장이 수축할 때 나타나는 최고 압력은 수축기 혈압을 의미하며,이완기 동안 나타나는 최저 압력은 이완기 혈압을 의미합니다. 보통 나이가 들수록 혈압은 높아지나, 성인의 경우 수축기  120㎜Hg 미만, 이완기  80㎜Hg 미만를 유지할 수 있도록 관리가 필요합니다.</td>
                                <td>맥압은 혈압의 수축기와 이완기의 차로 맥압이 60mmHg 이상의 경우 심뇌혈관 질환 심장병 발생률 증가 등의 연구 결과가 있습니다. 단, 수축기 및 이완기 혈압 수준에 따라 맥압에 대한 의학적 해석이 달라질 수 있으므로 해당 수치에 의문이 생기는 경우 전문가와 상담하는 것을 권장합니다.</td>
                                <td>혈당은 혈액 내 포도당의 농도로 식후 높아지며, 운동 후 낮아지게  되며, 일반적인 경우 시간이 지남에 따라 정상 수치로 돌아옵니다. 혈당 치가 2시간 이상 200mg/dL 이상 유지될 때 당뇨병으로 판명하므로, 공복 혈당100mg/dL 미만, 식후 2시간 혈당 140mg/dL 미만을 유지할 수 있게 관리가 필요합니다.</td>
                                <td>통상적으로 피하조직에 지방이 과도하게 축적되어 있는 상태로 표준 체중보다 20% 이상 더 나가는 경우를 비만으로 판단합니다. 지방량은 적고 근육이 많은 상태는 비만이 아닌 과체중으로 판단하며, 체지방은 표준, 근육량은 표준 이상으로 유지할 수 있게 관리가 필요합니다.</td>
                                <td>BMI는 체중(Kg)을 신장(m)의 제곱으로 나눈 값으로 체지방 축적 상태를 잘 반영하기 때문에 비만 판정에 보편적으로 쓰이는 수치입니다. BMI의 통상적으로 과체중인 25까지 정상 범위로 보고 있으나 건강을 위해서는 정상 범위인 18.5~22.9를 유지할 수 있도록 관리가 필요합니다.</td> 
                                <td>복부둘레는 내장 지방량과 높은 관련이 있으며,  복부 비만의 경우 고지혈증, 당뇨병 같은 대사성 질환과 뇌졸증, 허혈성 심장질환 같은 심혈관 질환 위험이 증가할 수 있습니다. 복부 비만은 허리와 엉덩이의 비율로 측정하며 보통 남성은 90Cm 이하, 여성은 85Cm 이하가 될 수 있도록 관리가 필요합니다.</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //board -->
        </div>
        <!-- //grid -->
        
    </div>
	</form>
</div>

<div class="right" style="margin: 0px 30px">
		<a href="#" data-btn-type="closeModal" class="mBtn1">창닫기</a>
</div>



<script>

setToday(); 
</script>