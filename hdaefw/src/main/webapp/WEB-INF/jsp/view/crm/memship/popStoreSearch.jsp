<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%>



<div class="mPopup1">

	<!-- header -->
	<div class="title">
		<h1>적용매장</h1>
		<a href="#" data-click="closeModal" class="close">팝업닫기</a>
	</div>
	<!-- //header -->

	<!-- cont -->
	<div class="cont">

		<!-- grid -->
		<div class="mGrid3 type2">
			<!-- left -->
			<div class="lt">
				<div class="gTitle1">
					<h3 class="mTitle1">전체 매장</h3>
				</div>
				
				
				
				<!-- sort -->
				<div class="mSort2 mini">
					<!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
					
					<form name="frmSearch" id="frmSearch" method="post" >
					
					<input type="hidden" class="it w185" name="stat" id="stat"   value="C">
					<input type="hidden" class="it w185" name="mshipCoupnBasNo" id="mshipCoupnBasNo"   value="${mshipCoupnBasNo}" title="쿠폰마스터">
					<input type="hidden" class="it w185" name="mshipCardBasNo" id="mshipCardBasNo"   value="${mshipCardBasNo}" title="쿠폰마스터">
					<input type="hidden" class="it w185" name="mshipPromBasNo" id="mshipPromBasNo"   value="${mshipPromBasNo}" title="쿠폰마스터">
							
							
					<ul>
						<li class="wAuto">
							<div class="tit">지역</div>
							<div class="txt">

								<code:commCode  className="select" id="distrctCd" name="distrctCd" codeCd="CU100" prefixLabel="전체" prefixValue=""  selectedValue="${distrctCd}"/>
								
							</div>
						</li>
						<li class="wAuto">
							<div class="tit">매장명</div>
							<div class="txt">
								<input type="text" class="it w150" title="매장명" placeholder="매장명 검색"  name="storNm" id="storNm" value="${storNm}" >
							</div>
							
							 <button type="submit" class="mBtn1" data-click="search()" onclick="search()">검색</button>
							 
							<a href="#" class="mBtn1 lPrimary"  style="margin-left:50px" data-click="pubStoreCoupn" >선택완료</a>
					
						</li>
					</ul>
					
				</div>
				<!-- //sort -->
				<!-- list -->
			
						
						
				<div class="list">
					<div class="mDir1 form mCustomScrollbar"  style="height:500px">
						<div class="dep1">
							<label class="mCheckbox1 notext"> 
							<input type="checkbox" title="구분"   name="allChk"  id="allChk"  onclick="allChk(this)"  value="Y"> 
							<span class="label">구분</span>
							</label> 구분
						</div>
						
						
						
				
								
						<ul id="divArea">

						
					
								
							<c:set var="distrctCd" value="" />
							<c:set var="i" value="0" />

							<c:forEach items="${allStore}" var="m" varStatus="status">
								<c:choose>

									<c:when test="${m.distrctCd != distrctCd}">

										<c:if test="${i > 0}"></ul></c:if>

										<li class="dep2"><label class="mCheckbox1 notext"> 
											<input type="checkbox" title="${m.comnCdNm}" name="storNo_${m.distrctCd}"  class="storNo_${m.distrctCd} storNo_${m.storNo} " id="storNo_${m.distrctCd}" value="Y" onclick="chkAll('${m.distrctCd}')"> 
											<span class="label">${m.comnCdNm}d</span>
										</label> 
										
										<a href="#">${m.comnCdNm}</a>
										
										
										<ul>
		
											<li class="dep3">
												<label class="mCheckbox1 notext">
													<input type="checkbox" title="${m.storNm}" name="storNo" id="storNo" class="storNo_${m.distrctCd} storNo_${m.storNo} storNo" value="${m.storNo}" sname="${m.storNm}"> 
													<span class="label">${m.storNm}</span>
												</label> 
												<a href="#"  onclick="chk('${m.storNo}')">${m.storNm} / ${m.storNo}</a></li>
											
											<c:set var="i" value="${i+1}" />
								
									</c:when> 
									
									
									<c:when test="${m.distrctCd == distrctCd}">

										<li class="dep3">
											<label class="mCheckbox1 notext">
												<input type="checkbox" title="${m.storNm}" name="storNo" id="storNo" class="storNo_${m.distrctCd}  storNo_${m.storNo} storNo" value="${m.storNo}"  sname="${m.storNm}"> 
												<span class="label">${m.storNm}</span>
											</label> 
											<a href="#"  onclick="chk('${m.storNo}')">${m.storNm} / ${m.storNo}</a></li>
										</li>
		
									</c:when> 
								</c:choose> 
								
									
								<c:set var="distrctCd" value="${m.distrctCd}" /> 
									
							
							</c:forEach>



						
						</ul>
						
					
					</div>
					
					
			
				</div>
				<!-- //list -->
			</div>
			<!-- //left -->
	
			
		</div>
		<!-- //grid -->

	</div>
	<!-- //cont -->

</div>


<script>
	// 모달 닫기
	function closeModal(){

		Utilities.closeModal();
	}
	
	// 전체 체크
	function allChk(obj){
		
		if( $(obj).is(":checked") ){
			 $(".storNo").prop("checked", true);
		 }else{
			 $(".storNo").prop("checked", false);
		 }
		
	}
	
	// 전체 체크
	function allChk2(obj){
		
		if( $(obj).is(":checked") ){
			 $(".storRelBasNo").prop("checked", true);
		 }else{
			 $(".storRelBasNo").prop("checked", false);
		 }
		
	}
	
	// 지역별 체크박스 선택
	function chkAll(distrctCd){
	 if( $("#storNo_"+ distrctCd).is(":checked") ){
		 $(".storNo_"+ distrctCd).prop("checked", true);
	 }else{
		 $(".storNo_"+ distrctCd).prop("checked", false);
	 }
	}
	
	function chk(e){		
		if( $('.storNo_'+ e).is(":checked") ){
			$('.storNo_'+ e).prop('checked', false);
		}else{
			$('.storNo_'+ e).prop('checked', true);			
		}
	}
	
	// 지역 검색
	function search(){
		var url = "<c:url value='${urlPrefix}/popStoreSearch${urlSuffix}'/>";
		$("#frmSearch").attr("action", url);
		$("#frmSearch").submit();
		
	}
	
	
	// 지역별 체크박스 선택
	function chkAll2(distrctCd){
		
		
	 if( $("#storRelBasNo_"+ distrctCd).is(":checked") ){
		 $(".storRelBasNo_"+ distrctCd).prop("checked", true);
	 }else{
		 $(".storRelBasNo_"+ distrctCd).prop("checked", false);
	 }
	 
	}
	
	function chk2(e){		
		if( $('.storRelBasNo_'+ e).is(":checked") ){
			$('.storRelBasNo_'+ e).prop('checked', false);
		}else{
			$('.storRelBasNo_'+ e).prop('checked', true);			
		}
	}
	
	
	// 적용 매장 추가
	function pubStoreCoupn(){
		
		
		var storeNm = "";
		var storeCd = "";
		var storeCnt = 0;
		
		$.each( $(".storNo"), function(i){
			
			if( $(this).is(":checked") ){
				storeNm += ( ( storeCnt > 0) ? ','+ $(this).attr('sname') :  $(this).attr('sname')  );
				storeCd += ( ( storeCnt > 0) ? ','+ $(this).val() : $(this).val()   );
				storeCnt += 1;
			}
			
		});

		Utilities.getOpener().rtnStoreInfo(storeNm, storeCd, storeCnt);
		closeModal();
	    
		
	}
	
	

</script>
