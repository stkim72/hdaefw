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
		<a href="#" data-click="closeModal" class="close">팝업 닫기</a>
	</div>
	<!-- //header -->

	<!-- cont -->
	<div class="cont">

		<!-- grid -->
		<div class="mGrid2 type2">
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
					<input type="hidden" class="it w185" name="mshipStmpBasNo" id="mshipStmpBasNo"   value="${mshipStmpBasNo}" title="쿠폰마스터">
					<input type="hidden" class="it w185" name="mshipPlcyBasNo" id="mshipPlcyBasNo"   value="${mshipPlcyBasNo}" title="쿠폰마스터">
				
							
							
					<ul>
						<li class="wAuto">
							<div class="tit">지역</div>
							<div class="txt">

								<code:commCode  className="select" id="distrctCd" name="distrctCd" codeCd="CU100" prefixLabel="전체" prefixValue=""  selectedValue="${distrctCd}"/>
								
							</div>
						</li>
						<li class="">
							<div class="tit">매장명</div>
							<div class="txt">
								<input type="text" class="it w120" title="매장명" placeholder="매장명 검색"  name="storNm" id="storNm" value="${storNm}" >
							</div> <button type="submit" class="mBtn1" data-click="search()" onclick="search()">검색</button>
					
						</li>
					</ul>
					
				</div>
				<!-- //sort -->
				<!-- list -->
			
						
						
				<div class="list">
					<div class="mDir1 form mCustomScrollbar"  style="height:570px">
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
											<input type="checkbox" title="${m.comnCdNm}" name="storNo_${m.distrctCd}"  class="storNo_${m.distrctCd} storNo_${m.storNo} storNo" id="storNo_${m.distrctCd}" value="Y" onclick="chkAll('${m.distrctCd}')"> 
											<span class="label">${m.comnCdNm}</span>
										</label> 
										
										<a href="#">${m.comnCdNm}</a>
										
										
										<ul>
		
											<li class="dep3">
												<label class="mCheckbox1 notext">
													<input type="checkbox" title="${m.storNm}" name="storNo" id="storNo" class="storNo_${m.distrctCd} storNo_${m.storNo} storNo" value="${m.storNo}"> 
													<span class="label">${m.storNm}</span>
												</label> 
												<a href="#"  onclick="chk('${m.storNo}')">${m.storNm} / ${m.storNo}</a></li>
											
											<c:set var="i" value="${i+1}" />
								
									</c:when> 
									
									
									<c:when test="${m.distrctCd == distrctCd}">

										<li class="dep3">
											<label class="mCheckbox1 notext">
												<input type="checkbox" title="${m.storNm}" name="storNo" id="storNo" class="storNo_${m.distrctCd}  storNo_${m.storNo} storNo" value="${m.storNo}"> 
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
			<!-- prev/next -->
			<div class="mPn1">
				<a href="#" class="prev" onclick="add()">왼쪽으로 이동</a> 
				<a href="#" class="next" onclick="del()">오른쪽으로 이동</a>
			</div>
			<!-- //prev/next -->
			<!-- right -->
			<div class="rt">
				<div class="gTitle1">
					<h3 class="mTitle1">적용 매장</h3>
				</div>
				<!-- sort -->
				<div class="mSort2 mini">
					<!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
				
							
					<ul>
						<li class="wAuto">
							<div class="tit">지역</div>
							<div class="txt">

								<code:commCode  className="select" id="distrctCd2" name="distrctCd2" codeCd="CU100" prefixLabel="전체" prefixValue="" selectedValue="${distrctCd2}"/>
								
							</div>
						</li>
						<li class="">
							<div class="tit">매장명</div>
							<div class="txt">
								<input type="text" class="it w120" title="매장명" placeholder="매장명 검색"  name="storNm2" id="storNm2" value="${storNm2}" >
							</div> <button type="submit" class="mBtn1" data-click="search()" onclick="search()">검색</button>
					
						</li>
					</ul>
					
				</div>
				<!-- //sort -->
				
				 <!-- list -->
                <div class="list">
                    <div class="mDir1 form mCustomScrollbar" style="height:570px">
                        <div class="dep1">
                            <label class="mCheckbox1 notext">
                                <input type="checkbox" title="구분" name="allChk2"  id="allChk2"  onclick="allChk2(this)"  value="Y"> 
                                <span class="label">구분</span>
                            </label>
                            구분
                        </div>
                        
                  
						
					
							
                        
                        <ul id="divStoreArea">
                        
                        <c:set var="distrctCd" value="" />
							<c:set var="i" value="0" />

							<c:forEach items="${storeList}" var="m" varStatus="status">
								<c:choose>

									<c:when test="${m.distrctCd != distrctCd}">

										<c:if test="${i > 0}"></ul></c:if>
										
										
                            
										<li class="dep2"><label class="mCheckbox1 notext"> 
											<input type="checkbox" title="${m.comnCdNm}" class="storRelBasNo" name="storRelBasNo_${m.distrctCd}" id="storRelBasNo_${m.distrctCd}" value="Y" onclick="chkAll2('${m.distrctCd}')"> 
											<span class="label">${m.comnCdNm}</span>
										</label> 
										
										
                                <a href="#">${m.comnCdNm}</a>
										
										
										<ul>
		
											<li class="dep3">
												<label class="mCheckbox1 notext">
													<input type="checkbox" title="${m.storNm}" name="storRelBasNo" id="storRelBasNo" class="storRelBasNo_${m.distrctCd} storRelBasNo_${m.storNo} storRelBasNo" value="${m.storRelBasNo}"> 
													<span class="label">${m.storNm}</span>
												</label> 
												<a href="#"  onclick="chk2('${m.storNo}')">${m.storNm}</a></li>
											
											<c:set var="i" value="${i+1}" />
								
									</c:when> 
									
									
									<c:when test="${m.distrctCd == distrctCd}">

										<li class="dep3">
											<label class="mCheckbox1 notext">
												<input type="checkbox" title="${m.storNm}" name="storRelBasNo" id="storRelBasNo" class="storRelBasNo_${m.distrctCd}  storRelBasNo_${m.storRelBasNo} storRelBasNo" value="${m.storRelBasNo}"> 
												<span class="label">${m.storNm}</span>
											</label> 
											<a href="#"  onclick="chk2('${m.storNo}')">${m.storNm}</a></li>
										</li>
		
									</c:when> 
								</c:choose> 
								
									
								<c:set var="distrctCd" value="${m.distrctCd}" /> 
									
							
							</c:forEach>   
                        </ul>
                        
                        
                        
                        
                        
                        
                        
                    </div>
             
</form>

                </div>
                <!-- //list -->
			</div>
			<!-- //right -->
		</div>
		<!-- //grid -->

	</div>
	<!-- //cont -->

</div>


<script>
	// 모달 닫기
	function closeModal(){

		Utilities.getOpener().searchStoreRel();
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
		
		if( $("#storNm").val() == "" ){
			alert("매장명을 입력해 주세요");
			$("#storNm").focus();
			return false;
		} 
		var url = "<c:url value='${urlPrefix}/popStore${urlSuffix}'/>";
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
	function add(){
		
		
		var arr = new Array(); //Object를 배열로 저장할 Array
	    var obj = new Object(); //key, value형태로 저장할 Object
	    
		$.each( $("#divArea input[name='storNo']"), function(i){
			if( $(this).is(":checked") ){
		       obj = new Object();
		       obj.mshipCoupnBasNo = $("#mshipCoupnBasNo").val();
		       obj.mshipCardBasNo = $("#mshipCardBasNo").val();
		       obj.mshipPromBasNo = $("#mshipPromBasNo").val();
		       obj.mshipStmpBasNo = $("#mshipStmpBasNo").val();
		       obj.mshipPlcyBasNo = $("#mshipPlcyBasNo").val();
		       obj.storNo = $(this).val();
		       obj.stat = "C";
		       arr.push(obj);
			}
	     });
	    
	    
	    
		
		if(arr.length > 0) {
			var url = "<c:url value='${urlPrefix}/saveStoreList${urlSuffix}'/>";
			Utilities.getAjax(url, arr ,true,function(data,jqXHR){
		        if(Utilities.processResult(data,jqXHR,"매장 추가중 오류가 발생하였습니다."))
		        {
		            alert("매장 추가가 완료되었습니다.");
		            location.reload();
		        }
		    });
		}else{
			alert("선택된 매장이 없습니다.");
			return false;
		}
		
		
	}
	
	// 적용 매장 삭제
	function del(){
		var arr = new Array(); //Object를 배열로 저장할 Array
	    var obj = new Object(); //key, value형태로 저장할 Object
	    
	    
		$.each( $("#divStoreArea .storRelBasNo"), function(i){
			if( $(this).is(":checked") ){
		       obj = new Object();
		       obj.mshipCoupnBasNo = $("#mshipCoupnBasNo").val();
		       obj.mshipCardBasNo = $("#mshipCardBasNo").val();
		       obj.mshipPromBasNo = $("#mshipPromBasNo").val();
		       obj.mshipStmpBasNo = $("#mshipStmpBasNo").val();
		       obj.storRelBasNo = $(this).val();
		       obj.stat = "D";
		       arr.push(obj);
			}
	     });
	    
		
		if(arr.length > 0) {
			var url = "<c:url value='${urlPrefix}/delStoreList${urlSuffix}'/>";
			Utilities.getAjax(url, arr ,true,function(data,jqXHR){
		        if(Utilities.processResult(data,jqXHR,"매장 삭제중 오류가 발생하였습니다."))
		        {
		            alert("매장 삭제가 완료되었습니다.");
		            location.reload();
		        }
		    });
		}else{
			alert("선택된 매장이 없습니다.");
			return false;
		}
	
	}

</script>
