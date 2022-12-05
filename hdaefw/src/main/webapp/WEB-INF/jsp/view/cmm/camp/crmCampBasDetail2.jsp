<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<div class="mPopup1">
	<!-- header -->
	<div class="title">
		<h1>2차 캠페인 상세</h1>
		<a href="#" data-click="closeModal" class="close">팝업 닫기</a>
	</div>
	<!-- //header -->

	<!-- cont -->
	<div class="cont">


		<form role="form" id="frmDetail" name="frmDetail">

			<input type="hidden" id="stat" name="stat" value="${addMode}" />
			<input type="hidden" id="rspnApplyYn" name="rspnApplyYn" value="${rspnApplyYn}" />
			<input type="hidden" id="applyPoint" name="applyPoint" value="${cpinfo.applyPoint}" />
			<input type="hidden" id="applyPointStaYmd" name="applyPointStaYmd" value="${cpinfo.applyPointStaYmd}" />
			<input type="hidden" id="applyPointEndYmd" name="applyPointEndYmd" value="${cpinfo.applyPointEndYmd}" />
			<input type="hidden" id="applyPointValidPerd" name="applyPointValidPerd" value="${cpinfo.applyPointValidPerd}" />
			<input type="hidden" id="applyCoupnBasNo" name="applyCoupnBasNo" value="${cpinfo.applyCoupnBasNo}" />
			<input type="hidden" id="applyGrpNo" name="applyGrpNo" value="${cpinfo.applyGrpNo}" />
			<input type="hidden" id="dspCtntTypeNo" name="dspCtntTypeNo" value="${cpinfo.dspCtntTypeNo}" />
			<input type="hidden" id="prntsCampBasNo" name="prntsCampBasNo" value="${cpinfo.prntsCampBasNo}" />
			<input type="hidden" id="campShapCd" name="campShapCd" value="${cpinfo.campShapCd}" />
			<input type="hidden" id="dayGapCnt" name="dayGapCnt" value="${cpinfo.dayGapCnt}" />
			<input type="hidden" id="campStaYmd" name="campStaYmd" value="${cpinfo.campStaYmd}" />
			<input type="hidden" id="campEndYmd" name="campEndYmd" value="${cpinfo.campEndYmd}" />
			<input type="hidden" id="coupnIssueCnt" name="coupnIssueCnt" value="${cpinfo.coupnIssueCnt}" />
			
			<input type="hidden" id="ftgabltStaHour" name="ftgabltStaHour" value="${cpinfo.ftgabltStaHour}" />
			<input type="hidden" id="ftgabltEndHour" name="ftgabltEndHour" value="${cpinfo.ftgabltEndHour}" />
			<input type="hidden" id="ftgabltStaMnut" name="ftgabltStaMnut" value="${cpinfo.ftgabltStaMnut}" />
			<input type="hidden" id="ftgabltEndMnut" name="ftgabltEndMnut" value="${cpinfo.ftgabltEndMnut}" />
			<input type="hidden" id="rpeatCd" name="rpeatCd" value="001" />
			<input type="hidden" id="dsphour" name="dspHour" value="${cpinfo.dspHour}" />
			

			<div class="gTitle1 line">
				<h3 class="mTitle1">기본정보</h3>
				<div class="gRt">
				
				 <c:if test="${addMode == 'U'}">
				 
				 	<c:if test="${cpinfo.campStatusCd == '001' }">
					<a href="#" class="mBtn1 lWhite" onclick="statusChk('002')">승인</a> 
					</c:if>
					
					<c:if test="${cpinfo.campStatusCd == '002' || cpinfo.campStatusCd == '003' }">
					<a href="#" class="mBtn1 lWhite" onclick="statusChk('004')">중지</a> 
					</c:if>
					
					
					<!-- <a href="#" class="mBtn1 gray">승인요청</a> -->
				</c:if>
					
					<!-- <a href="#" class="mBtn1 gray">중지요청</a>  -->
					<a href="#" class="mBtn1 primary" data-click="saveCamp"><c:if test="${addMode == 'C'}">등록</c:if> <c:if test="${addMode == 'U'}">수정</c:if></a>
				</div>
			</div>
			<!-- board -->
			<div class="mBoard2">
				<table>
					<caption>기본정보</caption>
					<colgroup>
						<col width="15%">
						<col width="*">
						<col width="15%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
						
							<th scope="row" class="left"><span class="iMust">캠페인 코드</span></th>
							<td >
								<input type="text" class="it data-check must" id="campBasNo" name="campBasNo" value="${cpinfo.campBasNo}" placeholder="자동생성" readonly disabled>
							</td>
							
							<th scope="row" class="left">캠페인 명</th>
							<td >
								<input type="text" class="it data-check" title="캠페인명" id="campBasNm" name="campBasNm" value="${cpinfo.campBasNm}<c:if test='${cpinfo.campBasNo eq null}'>_2차</c:if>">
							</td>
							
						</tr>
						<tr>
						
							<th scope="row" class="left">주문 채널</th>
							<td class="left">
							
								<label class="mCheckbox1">
									<input type="checkbox" title="POS" class="data-check " name="ordrChlListAll" id="ordrChlListAll" onclick="cpnChlChk(this)"> <span class="label">전체</span>
								</label> 
								
								<label class="mCheckbox1"> 
									<code:commCode className="select data-check w300" id="ordrChlList" name="ordrChlList" codeCd="ST040" others=" title='주문 채널' " multiple="true" selectedValue="${cpinfo.ordrChlList}" />
								</label>	
														
							</td>
							
							<th scope="row" class="left">캠페인 상태</th>
							<td  class="left">
							
							<c:choose>	
								<c:when  test="${ cpinfo.campStatusCd eq '003' }">					
									 실행중 수정불가
									<input type="hidden" name="campStatusCd" id="campStatusCd" value="${cpinfo.campStatusCd}">
								</c:when>
								<c:otherwise>
								 <code:commCode className="select data-check w160" id="campStatusCd" name="campStatusCd" codeCd="CM040" prefixLabel="캠페인상태" prefixValue="" others=" title='캠페인 상태' " selectedValue="${cpinfo.campStatusCd}" />
								</c:otherwise>
								
								</c:choose>
								
							</td>
							
						</tr>
						
						
						<tr>
						
							<th scope="row" class="left">2차 캠페인 기간</th>
							<td class="left">
							
								1차 종료 후 <input type="text" title="POS" class="data-check w80" style="text-align:right" data-type="number" maxlength="6" name="endAftrDayCnt" id="endAftrDayCnt"   value="${cpinfo.endAftrDayCnt}"> 일
							</td>
							
							<th scope="row" class="left">매출 발생기간</th>
							<td  class="left">
								<input type="text" class="it data-check date w120" title="캠페인 시작일" data-type="dateRangeStart" data-range-end="saleOccurEndYmd" id="saleOccurStaYmd" name="saleOccurStaYmd" value="${cpinfo.saleOccurStaYmd}">
									<span class="bar">~</span> 
								<input type="text" class="it data-check date w120" data-button="Y"  id="saleOccurEndYmd" name="saleOccurEndYmd" value="${cpinfo.saleOccurEndYmd}">
							</td>
							
						</tr>
						
						<tr>
						
							<th scope="row" class="left">구매금액</th>
							<td  class="left">
								<input type="text" class="it data-check w120 comma" title="구매금액" data-type="number2" id="fromApplySaleAmt" name="fromApplySaleAmt" value="${cpinfo.fromApplySaleAmt}">
									<span class="bar">~</span> 
								<input type="text" class="it data-check w120 comma" id="toApplySaleAmt" data-type="number2"  name="toApplySaleAmt" value="${cpinfo.toApplySaleAmt}">
							</td>
							
							
							
							<th scope="row" class="left" >메세지 발송여부</th>
							<td class="left" >
							
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<label class=""> <input type="radio" title="일" class="data-check" name="dspYn" id="dspYn" value="Y" 
										<c:if test="${cpinfo.dspYn == 'Y'}"><c:out value="checked" /></c:if>>
										<span class="label">예</span>
								</label>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<label class=""> <input type="radio" title="일" class="data-check" name="dspYn" id="dspYn" value="N" 
										<c:if test="${cpinfo.dspYn == 'N'}"><c:out value="checked" /></c:if>>
										<span class="label">아니오</span>
								</label>
								
							
							</td>
							
							
						</tr>

						
					</tbody>
				</table>
			</div>
			

			<div class="gTitle1 line">
				<h3 class="mTitle1">캠페인 대상</h3>
				<!-- <div class="gRt">
					<a href="#" class="mBtn1 gray" data-click="popTarget">캠페인 대상군 추가</a>
				</div> -->
			</div>
			<!-- list -->
			<div class="mList1">
				<ul>
					<li>
						<div class="tit">혜택</div>
						
						<div class="txt">
							<div class="txtBg"  id="bnfitInfo" style="line-height:20px">
								
									
									<c:if test="${cpinfo.applyPoint ne null and cpinfo.applyPoint ne '' and cpinfo.applyPoint ne '0'}">
										<fmt:formatNumber value="${cpinfo.applyPoint}"  pattern="#,###" /> P
										<%-- <br>(유효기간:${cpinfo.applyPointStaYmd} ~ ${cpinfo.applyPointEndYmd}) --%>
										<br>(유효기간:${cpinfo.applyPointValidPerd}개월)
									</c:if>
									
									<c:if test="${cpinfo.applyCoupnBasNoNm ne null and cpinfo.applyCoupnBasNoNm ne '' }">
										<br>${cpinfo.applyCoupnBasNoNm} ${cpinfo.coupnIssueCnt}매<br>(${cpinfo.applyCoupnBasNo})
									</c:if>
								    
								    
							</div>
						</div> 
						
						<c:if test="${cpinfo.campStatusCd eq '001' || cpinfo.campStatusCd eq null }">						
							<a href="#"  data-click="popTgtPoint" class="bt">선택</a>
						</c:if>
					</li>
				
				
					 <li>
						<div class="tit">대상선택</div>
						<div class="txt">
							<div class="txtBg" id="tgtInfo"><br>
									<c:if test="${cpinfo.applyGrpNo ne null }">
										${cpinfo.applyGrpNoNm} <br> (${cpinfo.applyGrpNo})
									</c:if>
							
							</div>
						</div> 
						
						<div style="height:38px"></div>
						
						<!-- <a href="#"  data-click="popTarget" class="bt">선택</a> -->
					</li> 
					
					
					<%-- <li style="">
						<div class="tit">발송채널</div>
						<div class="txt">
							<div class="txtBg">
							<br>
								 <select class="select  data-check" name="dspChlCd" id="dspChlCd" title="유형" >
                                       
                                        <option value="">선택</option>
                                        <c:forEach items="${chlList}" var="m"  varStatus="status">
                                            <option value="${m.campDspBasNo}" <c:if test="${cpinfo.dspChlCd == m.campDspBasNo}">selected</c:if> > ${m.campDspChlNm}  / ${m.campDspAmt} 원</option>
                                        </c:forEach>
	                                                    
                                 </select>
							</div>
						</div> 
						<div style="height:38px"></div>
						
						<!-- <a href="#" data-click="popTgtChl" class="bt hidden"   >선택</a> -->
						
						
					</li> --%>
					<li>
						<div class="tit">발송 컨텐츠</div>
						<div class="txt">
							<div class="txtBg" id="tmpltInfo">
								
								<c:if test="${cpinfo.dspCtntTypeNo ne null }">
										${cpinfo.dspCtntTypeNoNm}<br>(${cpinfo.dspCtntTypeNo})
									</c:if>
									
									
							</div>
						</div>

						<c:if test="${cpinfo.campStatusCd eq '001' || cpinfo.campStatusCd eq null }">								
							<a href="#" data-click="popTgtCtnt" class="bt">선택</a>
						</c:if>
						
					</li>
				</ul>
			</div>
			<!-- //list -->

		</form>

	</div>
	<!-- //cont -->



</div>


<script>

	$(document).ready(function() {

		// 주문채널 체크처리
		/* 	var ordrChlList = "${cpinfo.ordrChlList}";
		 var arrOrdr = null;
		 if( ordrChlList != "" ){
		
		 arrOrdr = ordrChlList.split("/");
		 for( var i=0 ; i < arrOrdr.length ; i++ ){
		 $("input:checkbox[name='multiselect_arrOrdrChlList'][value='"+ arrOrdr[i] +"']").trigger('click');
		 }
		
		 } */
		 
		//chkCycle( $('#rpeatCd') );

	});
	
	 /* modal close  */
	function closeModal(){	
		
		try{
			Utilities.getOpener().reload();
		}catch(e){
			
		}
		Utilities.closeModal();
	}

	// 캠페인 등록 및 수정
	function saveCamp() {
		

		$("#btnSaveCamp").hide();

		var valid = validateForm("#frmDetail"); //  class='data-check' 인 경우만 체크

		if (valid) {

			var saveJson = Utilities.formToMap("frmDetail");
			
			log(saveJson);

			/* 	if( $("#coupnKndCd").val() == "002" ){
					if( $("#applyAmt").val() > 100 ){
						alert("정률할인은 100% 이상을 초과할 수 없습니다."+ $("#applyAmt").val());
						$("#applyAmt").val(""); 
						$("#applyAmt").focus();
						return false;
					}
				}

				if( $("input[name='admtMethCd']:checked").val() == "002" ){
				 	
					if( $("#admtAmt").val() > 100 ){
						alert("정산정률은 100% 이상을 초과할 수 없습니다."+ $("#admtAmt").val());
						$("#admtAmt").val("");
						$("#admtAmt").focus();
						return false;
					}
				 	
				} */
			
			if( !$("input[name='dspYn']:checked").val() ){
				alert("메세지 발송여부를 체크해 주세요.");
				$("#dspYn").eq(0).focus();
				return false;			
			}
				
				
				
				
			if( $("#applyPoint").val() == '' && $("#applyCoupnBasNo").val() == '' ){
				alert("캠페인 혜택을 선택해 주세요.");
				return false;
			}	
				
				
				
			if( $("#applyGrpNo").val() == '' ){
				alert("캠페인 대상군을 선택해 주세요.");
				return false;
			}	
			
			if( $("#dspCtntTypeNo").val() == '' ){
				alert("캠페인 발송콘텐츠를 선택해 주세요.");
				return false;
			}
				

			var url = "<c:url value='${urlPrefix}/save${urlSuffix}'/>";
			Utilities.getAjax(url, saveJson, true, function(data, jqXHR) {
				if (Utilities.processResult(data, jqXHR, "2차 캠페인 저장에 실패했습니다.")) {
					alert("2차 캠페인 저장이 완료되었습니다.");
					$("#btnSaveCamp").show();
					closeModal();
				}
			});

		} else {

			alert("필수 항목들을 기입해 주세요.");
			$("#btnSaveCamp").show();
			return false;
		}

	}

	// 반복주기 선택에 따른 제어
	function chkCycle(obj) {
		
		$(".cyclegrp001").attr("disabled", true);
		//$(".cyclegrp004").prop("checked", false);

		// 1회
		if ($(obj).val() == '001') {
			$(".cyclegrp001").attr("disabled", true);
		}

		// 매일
		if ($(obj).val() == '002') {
			$("#cyclegrp001").attr("disabled", true);
		}
		
		// 매주
		if ($(obj).val() == '003') {
			$("#rpeatDay").attr("disabled", true);
			$(".cyclegrp003").attr("disabled", false);
		}
		
		// 매월
		if ($(obj).val() == '004') {
			$("#rpeatMonth").attr("disabled", true);
			$("#rpeatDay").attr("disabled", false);

			//$(".cyclegrp004").prop("checked", false);
			$(".cyclegrp004").attr("disabled", true);
			 
		}
		
		// 분기, 매년
		if ($(obj).val() == '005' || $(obj).val() == '006') {

			$(".cyclegrp001").attr("disabled", false);

			//$(".cyclegrp004").prop("checked", false);
			$(".cyclegrp004").attr("disabled", true);
			
		}
		
		

	}

	//쿠폰사용기간 설정 체크
	function cpnChlChk(obj) {

		var objName = $(obj).attr("name");

		if ($(obj).is(":checked")) {
			$(".ui-multiselect-all").trigger('click');
			$("#arrOrdrChlList_ms").hide();
		} else {
			$(".ui-multiselect-none").trigger('click');
			$("#arrOrdrChlList_ms").show();
		}
	}

	// 켐페인 대상군 추가
	function popTarget() {

		//var url = "<c:url value='${urlPrefix}/popTarget${urlSuffix}'/>?campBasNo=";
		//Utilities.openModal(url, 1200, 600);
		Utilities.openGroupSelPop('retTarget');
	}

	// 대상군 리턴값
	function retTarget(data) {
		
		
		if (data != null) {

			$("#frmDetail #applyGrpNo").val(data.custGrpNo);
			
			var info = data.custGrpNm + "<br>(" + data.custCnt + " 명)";
			$("#tgtInfo").html(info);
			
		}
		

	}
	
	// 혜택
	function bindBenfit(data){

		var info = "";
		
		log("#vvv  ="+ data.applyPoint  );
		if( data.applyPoint > 0 ){
			//info += addComma(data.applyPoint) + " P <br>(유효기간 : " + data.applyPointStaYmd + " ~ "+  data.applyPointEndYmd +")";
			info += addComma(data.applyPoint) + " P <br>(유효기간 : " + data.applyPointValidPerd +"개월)";

			$("#frmDetail #applyPoint").val(data.applyPoint);
			//$("#frmDetail #applyPointStaYmd").val(data.applyPointStaYmd);
			//$("#frmDetail #applyPointEndYmd").val(data.applyPointEndYmd);
			$("#frmDetail #applyPointValidPerd").val(data.applyPointValidPerd);
			
		}else{
			$("#frmDetail #applyPoint").val("");
			$("#frmDetail #applyPointValidPerd").val("");
		}
		
		//if( data.applyCoupnBasNo != null ){
		//	info += '<br>' + data.applyCoupnBasNoNm +"("+  data.applyCoupnBasNo +")";
		//	$("#frmDetail #applyCoupnBasNo").val(data.applyCoupnBasNo);
		//}
		
		if( data.applyCoupnBasNo != null ){
			info += '<br>' + data.applyCoupnBasNoNm +" "+ data.coupnIssueCnt +"매 ("+  data.applyCoupnBasNo +")";
			$("#frmDetail #applyCoupnBasNo").val(data.applyCoupnBasNo);
			$("#frmDetail #coupnIssueCnt").val(data.coupnIssueCnt);
		}else{
			$("#frmDetail #applyCoupnBasNo").val("");
			$("#frmDetail #coupnIssueCnt").val("");
		}
		
		
		$("#bnfitInfo").html( info );
		
	}
	
	
	// 발송 콘텐츠
	function bindTemplet(data){

		var info = "";
		if( data.campTempltBasNo != '' ){
			info += data.tmpltNm +" ("+  data.campTempltBasNo +")";
			$("#frmDetail #dspCtntTypeNo").val(data.campTempltBasNo);			
		}
	
		$("#tmpltInfo").html( info );
		
	}

	// 캠페인 대상 포인트 헤택 선택
	function popTgtPoint() {
		var url = "<c:url value='${urlPrefix}/popTgtBnfit${urlSuffix}'/>?campBasNo="+ $("#campBasNo").val();
		Utilities.openModal(url, 1100,750);
	}

	//캠페인 대상 발송 채널 선택
	function popTgtChl() {
		var url = "<c:url value='${urlPrefix}/popTgtChl${urlSuffix}'/>?campBasNo="+ $("#campBasNo").val();
		Utilities.openModal(url, 1200, 600);
	}

	//캠페인 대상 발송 템플릿 설정
	function popTgtCtnt() {

		var url = "<c:url value='${urlPrefix}/popTgtCtnt${urlSuffix}'/>?campBasNo="+ $("#campBasNo").val() +"&dspCtntTypeNo="+  $("#frmDetail #dspCtntTypeNo").val();
		
		Utilities.openModal(url, 1200, 600);
	}
	
	
	// 승인, 중지 처리
	function statusChk(campStatusCd){
		
		log("campStatusCd = "+ campStatusCd);

			var statChk = "";
		    var obj = new Object(); //key, value형태로 저장할 Object
		    
		    obj.campStatusCd = campStatusCd;
		    obj.campBasNo =  $("#campBasNo").val();
			
			var url = "<c:url value='${urlPrefix}/updateCampStatus${urlSuffix}'/>";
			Utilities.getAjax(url, obj, true, function(data, jqXHR) {
				if (Utilities.processResult(data, jqXHR, "상태코드 변경에 실패했습니다.")) {
					alert("상태코드 변경을 완료하였습니다.");
					closeModal();
				}
			});
	}
	

</script>
