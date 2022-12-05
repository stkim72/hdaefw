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
		<h1>쿠폰적용제품</h1>
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
					<h3 class="mTitle1">전체제품</h3>
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
							<div class="tit">제품군</div>
							<div class="txt">

								<code:commCode  className="select" id="godsTypeCd" name="godsTypeCd" codeCd="GD040" prefixLabel="전체" prefixValue=""  selectedValue="${godsTypeCd}"/>
								
							</div>
						</li>
						<li class="">
							<div class="tit">제품명</div>
							<div class="txt">
								<input type="text" class="it w120" title="제품명" placeholder="제품 검색"  name="godsNm" id="godsNm" value="${godsNm}" >
							</div> <button type="submit" class="mBtn1" data-click="search()" onclick="search()">검색</button>
					
						</li>
					</ul>
					
				</div>
				<!-- //sort -->
				<!-- list -->
			
						
						
				<div class="list">
					<div class="mDir1 form mCustomScrollbar"  style="height:570px">
						<div class="dep1">
							<label class="mCheckbox1 notext"> <input type="checkbox" title="구분"  name="allChk"  id="allChk"  onclick="allChk(this)"  value="Y">  <span class="label">구분</span>
							</label> 구분
						</div>
						
						
						
				
								
						<ul id="divArea">

							<c:forEach items="${allGods}" var="m" varStatus="status">
								<%-- ${status.index} --%>
								<%-- ${status.count} --%>
								<%-- ${status.first} --%>
								<%-- ${status.last} --%>
								<%-- ${status.step} --%>
								<%-- ${status.begin} --%>
								<%-- ${status.end} --%>
								
								<c:set var="nextGodsTypeCd1" value="${ allGods[status.index+1].godsTypeCd1 }" />
								<c:set var="nextGodsTypeCd2" value="${ allGods[status.index+1].godsTypeCd2 }" />
								<c:set var="nextGodsTypeCd3" value="${ allGods[status.index+1].godsTypeCd3 }" />
								
								<%-- <c:out value="${ status.index }"/> : [this > <c:out value="${ m.godsTypeCd3 }"/>] , next > <c:out value="${ nextGodsTypeCd3 }"/>  <br>  --%>
								<%-- <c:out value="${ status.index }"/> : [this > <c:out value="${ m.godsTypeCd2 }"/>] , next > <c:out value="${ nextGodsTypeCd2 }"/>  <br> --%>
								<%-- <c:out value="${ status.index }"/> : [this > <c:out value="${ m.godsTypeCd1 }"/>] , next > <c:out value="${ nextGodsTypeCd1 }"/>  <br>  --%>
								
								<%-- <c:choose>
									<c:when test="${m.godsTypeCd1 == nextGodsTypeCd1}">
										<!-- step 2 -->
										
										<c:choose>
											<c:when test="${m.godsTypeCd2 == nextGodsTypeCd2}">
												<!-- step 3 -->
												
												<c:choose>
													<c:when test="${m.godsTypeCd3 == nextGodsTypeCd3}">
														<!-- step 4 -->
														
													</c:when>
													<c:when test="${m.godsTypeCd3 != nextGodsTypeCd3}">
														<!-- step4 [줄바꿈]</br> -->
														[STEP3]<c:out value="${ m.godsTypeNm3 }"/>[줄바꿈]</br>
													</c:when>
												</c:choose>
											</c:when>
											<c:when test="${m.godsTypeCd2 != nextGodsTypeCd2}">
												<!-- step3 [줄바꿈]</br> -->
										
												[STEP2]<c:out value="${ m.godsTypeNm2 }"/>[줄바꿈]</br>
											</c:when>
										</c:choose>
									</c:when>
									<c:when test="${m.godsTypeCd1 != nextGodsTypeCd1}">
										<!-- step2 [줄바꿈]</br> -->
										
									</c:when>
								</c:choose>
								 --%>
								<%-- <c:choose>
									<c:when test="${m.godsTypeCd1 == nextGodsTypeCd1}">
										<c:out value="${ m.godsTypeNm1 }"/>,
									</c:when>
									<c:when test="${m.godsTypeCd1 != nextGodsTypeCd1}">
										<c:out value="${ m.godsTypeNm1 }"/>[줄바꿈]</br>
									</c:when>
								</c:choose> --%>
								
								<%-- <c:choose>
									<c:when test="${m.godsTypeCd2 == nextGodsTypeCd2}">
										--<c:out value="${ m.godsTypeNm2 }"/>,
									</c:when>
									<c:when test="${m.godsTypeCd2 != nextGodsTypeCd2}">
										<c:out value="${ m.godsTypeNm2 }"/>[줄바꿈]</br>
									</c:when>
								</c:choose> --%>
								<%-- <c:out value="${ status.index }"/> : [this > <c:out value="${ m.godsTypeCd2 }"/>] , next > <c:out value="${ nextGodsTypeCd2 }"/> <br> --%>
								
								<c:choose>
									<c:when test="${m.godsTypeCd1 == nextGodsTypeCd1 and m.godsTypeCd2 == nextGodsTypeCd2 and m.godsTypeCd3 == nextGodsTypeCd3}">
										<c:out value="${ m.godsTypeNm1 }"/>[step1줄바꿈]</br>
									</c:when>
								</c:choose>
								
								<c:choose>
									<c:when test="${m.godsTypeCd2 == nextGodsTypeCd2 and m.godsTypeCd3 == nextGodsTypeCd3}">
										--<c:out value="${ m.godsTypeNm2 }"/>[step2줄바꿈]</br>
									</c:when>
								</c:choose>
								
								<c:choose>
									<c:when test="${m.godsTypeCd3 == nextGodsTypeCd3}">
										----<c:out value="${ m.godsTypeNm3 }"/></br>
									</c:when>
									<c:when test="${m.godsTypeCd3 != nextGodsTypeCd3}">
										----<c:out value="${ m.godsTypeNm3 }"/>[step3줄바꿈]</br>
									</c:when>
								</c:choose>
								
							</c:forEach>
							<!-- 
							<li class="dep2">
							   <label class="mCheckbox1 notext"> 
							   <input type="checkbox" title="음료" class="godsNoChk" name="godsNo_" id="godsNo_" value="Y" onclick="chkAll()"> 
							   <span class="label">음료</span>
							   </label> 
							   <a href="#">음료</a>
							   <ul>
							      <li class="dep3">
							         <label class="mCheckbox1 notext">
							         <input type="checkbox" title="콜라" name="godsNo" id="godsNo" class="godsNo_001 " value=""> 
							         <span class="label">콜라</span>
							         </label> 
							         <a href="#">콜라</a>
							         <ul>
							         	<li class="dep4">
							         		<label class="mCheckbox1 notext">
									        <input type="checkbox" title="콜라" name="godsNo" id="godsNo" class="godsNo_001 " value=""> 
									        <span class="label">펩시콜라</span>
									        </label> 
									        <a href="#">펩시콜라</a>
									        <ul>
									        	<li class="dep5">
									         		<label class="mCheckbox1 notext">
											        <input type="checkbox" title="콜라" name="godsNo" id="godsNo" class="godsNo_001 " value=""> 
											        <span class="label">PAUSE-1(Choco Brown)</span>
											        </label> 
											        <a href="#">PAUSE-1(Choco Brown)</a>
									         	</li>
									         	<li class="dep5">
									         		<label class="mCheckbox1 notext">
											        <input type="checkbox" title="콜라" name="godsNo" id="godsNo" class="godsNo_001 " value=""> 
											        <span class="label">PAUSE-1(Cream Beige-DP용)</span>
											        </label> 
											        <a href="#">PAUSE-1(Cream Beige-DP용)</a>
									         	</li>
									        </ul>
							         	</li>
							         	<li class="dep4">
							         		<label class="mCheckbox1 notext">
									        <input type="checkbox" title="콜라" name="godsNo" id="godsNo" class="godsNo_001 " value=""> 
									        <span class="label">코카콜라</span>
									        </label> 
									        <a href="#">코카콜라</a>
							         	</li>
							         </ul>
							      </li>
							      <li class="dep3">
							         <label class="mCheckbox1 notext">
							         <input type="checkbox" title="사이다" name="godsNo" id="godsNo" class="godsNo_001 " value=""> 
							         <span class="label">사이다</span>
							         </label> 
							         <a href="#">사이다</a>
							         <ul>
							         	<li class="dep4">
							         		<label class="mCheckbox1 notext">
									        <input type="checkbox" title="칠성사이다" name="godsNo" id="godsNo" class="godsNo_001 " value=""> 
									        <span class="label">칠성사이다</span>
									        </label> 
									        <a href="#">칠성사이다</a>
							         	</li>
							         	<li class="dep4">
							         		<label class="mCheckbox1 notext">
									        <input type="checkbox" title="콜라" name="godsNo" id="godsNo" class="godsNo_001 " value=""> 
									        <span class="label">사이다제로</span>
									        </label> 
									        <a href="#">사이다제로</a>
							         	</li>
							         </ul>
							      </li>
							   </ul>
							</li>
 -->


						
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
					<h3 class="mTitle1">적용제품</h3>
				</div>
				<!-- sort -->
				<div class="mSort2 mini">
					<!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
				
							
					<ul>
						<li class="wAuto">
							<div class="tit">제품군</div>
							<div class="txt">

								<code:commCode  className="select" id="godsTypeCd2" name="godsTypeCd2" codeCd="GD040" prefixLabel="전체" prefixValue="" selectedValue="${godsTypeCd2}"/>
								
							</div>
						</li>
						<li class="">
							<div class="tit">제품명</div>
							<div class="txt">
								<input type="text" class="it w120" title="제품명" placeholder="제품명 검색"  name="godsNm2" id="godsNm2" value="${godsNm2}" >
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
                                <input type="checkbox" title="구분"  name="allChk2"  id="allChk2"  onclick="allChk2(this)"  value="Y"> 
                                <span class="label">구분</span>
                            </label>
                            구분
                        </div>
                        
                  
						
					
							
                        
                        <ul id="divGodsArea">
                        
                        <c:set var="godsTypeCd" value="" />
							<c:set var="i" value="0" />

							<c:forEach items="${godsList}" var="m" varStatus="status">
								<c:choose>

									<c:when test="${m.godsTypeCd != godsTypeCd}">

										<c:if test="${i > 0}"></ul></c:if>
										
										
                            
										<li class="dep2"><label class="mCheckbox1 notext"> 
											<input type="checkbox" title="${m.godsTypeCdNm}" class="godsRelBasNo" name="godsRelBasNo_${m.godsTypeCd}" id="godsRelBasNo_${m.godsTypeCd}" value="Y" onclick="chkAll2('${m.godsTypeCd}')"> 
											<span class="label">${m.godsTypeCdNm}</span>
										</label> 
										
										
                                <a href="#">${m.godsTypeCdNm}</a>
										
										
										<ul>
		
											<li class="dep3">
												<label class="mCheckbox1 notext">
													<input type="checkbox" title="${m.godsNm}" name="godsRelBasNo" id="godsRelBasNo" class="godsRelBasNo_${m.godsTypeCd} godsRelBasNo_${m.godsNo} godsRelBasNo" value="${m.godsRelBasNo}"> 
													<span class="label">${m.godsNm}</span>
												</label> 
												<a href="#"  onclick="chk2('${m.godsNo}')">${m.godsNm}</a></li>
											
											<c:set var="i" value="${i+1}" />
								
									</c:when> 
									
									
									<c:when test="${m.godsTypeCd == godsTypeCd}">

										<li class="dep3">
											<label class="mCheckbox1 notext">
												<input type="checkbox" title="${m.godsNm}" name="godsRelBasNo" id="godsRelBasNo" class="godsRelBasNo_${m.godsTypeCd}  godsRelBasNo_${m.godsNo} godsRelBasNo" value="${m.godsRelBasNo}"> 
												<span class="label">${m.godsNm}</span>
											</label> 
											<a href="#"  onclick="chk2('${m.godsNo}')">${m.godsNm}</a></li>
										</li>
		
									</c:when> 
								</c:choose> 
								
									
								<c:set var="godsTypeCd" value="${m.godsTypeCd}" /> 
									
							
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
		Utilities.getOpener().searchGodsRel();
		Utilities.closeModal();
	}

	// 전체 체크
	function allChk(obj){
		
		if( $(obj).is(":checked") ){
			 $(".godsNo").prop("checked", true);
			 $(".godsNoChk").prop("checked", true);
		 }else{
			 $(".godsNo").prop("checked", false);;
			 $(".godsNoChk").prop("checked", false);
		 }
		
	}
	
	// 전체 체크
	function allChk2(obj){
		
		if( $(obj).is(":checked") ){
			 $(".godsRelBasNo").prop("checked", true);
		 }else{
			 $(".godsRelBasNo").prop("checked", false);
		 }
		
	}
	
	
	// 지역별 체크박스 선택

	
	function chkAll(obj){
		if( $("#godsNo_"+ obj ).is(":checked") ){
			 $(".godsNo_"+ obj).prop("checked", true);
		 }else{
			 $(".godsNo_"+ obj).prop("checked", false);
		 }
	}
	
	
	
	function chk(e){		
		if( $('.godsNo_'+ e).is(":checked") ){
			$('.godsNo_'+ e).prop('checked', false);
		}else{
			$('.godsNo_'+ e).prop('checked', true);			
		}
	}
	
	// 지역 검색
	function search(){
		var url = "<c:url value='${urlPrefix}/popGods${urlSuffix}'/>";
		$("#frmSearch").attr("action", url);
		$("#frmSearch").submit();
		
	}
	
	
	// 지역별 체크박스 선택
	function chkAll2(godsTypeCd){
		
		
	 if( $("#godsRelBasNo_"+ godsTypeCd).is(":checked") ){
		 $(".godsRelBasNo_"+ godsTypeCd).prop("checked", true);
	 }else{
		 $(".godsRelBasNo_"+ godsTypeCd).prop("checked", false);
	 }
	 
	}
	
	function chk2(e){		
		if( $('.godsNo_'+ e).is(":checked") ){
			$('.godsNo_'+ e).prop('checked', false);
		}else{
			$('.godsNo_'+ e).prop('checked', true);			
		}
	}
	
	
	// 적용 제품 추가
	function add(){
		
		
		var arr = new Array(); //Object를 배열로 저장할 Array
	    var obj = new Object(); //key, value형태로 저장할 Object
	    
		$.each( $("#divArea .godsNo"), function(i){
			if( $(this).is(":checked") ){
		       obj = new Object();
		       obj.mshipCoupnBasNo = $("#mshipCoupnBasNo").val();
		       obj.mshipCardBasNo = $("#mshipCardBasNo").val();
		       obj.mshipPromBasNo = $("#mshipPromBasNo").val();
		       obj.godsNo = $(this).val();
		       obj.stat = "C";
		       arr.push(obj);
			}
	     });
	    
		
		if(arr.length > 0) {
			var url = "<c:url value='${urlPrefix}/saveGodsList${urlSuffix}'/>";
			Utilities.getAjax(url, arr ,true,function(data,jqXHR){
		        if(Utilities.processResult(data,jqXHR,"제품 추가중 오류가 발생하였습니다."))
		        {
		            alert("제품 추가가 완료되었습니다.");
		            location.reload();
		        }
		    });
		}else{
			alert("선택된 제품이 없습니다.");
			return false;
		}
		
		
	}
	
	// 적용 제품 삭제
	function del(){
		var arr = new Array(); //Object를 배열로 저장할 Array
	    var obj = new Object(); //key, value형태로 저장할 Object
	    
	    
		$.each( $("#divGodsArea .godsRelBasNo"), function(i){
			if( $(this).is(":checked") ){
		       obj = new Object();
		       obj.godsRelBasNo = $(this).val();
		       obj.stat = "D";
		       arr.push(obj);
			}
	     });
	    
		
		if(arr.length > 0) {
			var url = "<c:url value='${urlPrefix}/delGodsList${urlSuffix}'/>";
			Utilities.getAjax(url, arr ,true,function(data,jqXHR){
		        if(Utilities.processResult(data,jqXHR,"제품 삭제중 오류가 발생하였습니다."))
		        {
		            alert("제품 삭제가 완료되었습니다.");
		            location.reload();
		        }
		    });
		}else{
			alert("선택된 제품이 없습니다.");
			return false;
		}
	
	}

</script>
