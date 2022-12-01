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
		<h1>적용채널</h1>
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
					<h3 class="mTitle1">전체채널</h3>
				</div>
				
				
				
				<!-- sort -->
				<div class="mSort2 mini">
					<!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
					
					<form name="frmSearch" id="frmSearch" method="post" >
					
					<input type="hidden" class="it w185" name="stat" id="stat"   value="C">
					<input type="hidden" class="it w185 basNo"  name="mshipCoupnBasNo" id="mshipCoupnBasNo"   value="${mshipCoupnBasNo}" title="쿠폰마스터">
					<input type="hidden" class="it w185 basNo"  name="mshipCardBasNo" id="mshipCardBasNo"   value="${mshipCardBasNo}" title="쿠폰마스터">
					<input type="hidden" class="it w185 basNo"  name="mshipPromBasNo" id="mshipPromBasNo"   value="${mshipPromBasNo}" title="쿠폰마스터">
							
							
					<ul>
						<li class="wAuto">
							<div class="tit">채널</div>
							<div class="txt">

								<code:commCode  className="select" id="applyChlCd" name="applyChlCd" codeCd="ST040" prefixLabel="전체" prefixValue=""  selectedValue="${applyChlCd}"/>
								
							</div>
						</li>
						<li class="">
							<button type="submit" class="mBtn1" data-click="search()" onclick="search()">검색</button>
						</li>
					</ul>
					
				</div>
				<!-- //sort -->
				<!-- list -->
			
						
						
				<div class="list">
					<div class="mDir1 form mCustomScrollbar"  style="height:570px">
						<div class="dep1">
							<label class="mCheckbox1 notext"> <input type="checkbox" title="구분"  name="allChk"  id="allChk" onclick="chkAll(this)"> <span class="label">구분</span>
							</label> 구분
						</div>
						
						
						
				
								
						<ul id="divArea">

						
					

							<c:forEach items="${allChannel}" var="m" varStatus="status">
								
										<li class="dep2"><label class="mCheckbox1 notext"> 
											<input type="checkbox" title="${m.comnCdNm}" class="applyChlCd_${m.comnCd} applyChlCd" name="applyChlCd" id="comnCd" value="${m.comnCd}" > 
											<span class="label">${m.comnCdNm}</span>
										</label> 
										
										<a href="#"  onclick="chk('${m.comnCd}')">${m.comnCdNm}</a>
							
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
					<h3 class="mTitle1">적용채널</h3>
				</div>
				<!-- sort -->
				<div class="mSort2 mini">
					<!-- class="mini" => 상하좌우 여백 좁은 사이즈-->
				
							
					<ul>
						<li class="wAuto">
							<div class="tit">채널</div>
							<div class="txt">

								<code:commCode  className="select" id="applyChlCd2" name="applyChlCd2" codeCd="ST040" prefixLabel="전체" prefixValue="" selectedValue="${applyChlCd2}"/>
								
							</div>
						</li>
						<li class="">
							<button type="submit" class="mBtn1" data-click="search()" onclick="search()">검색</button>
					
						</li>
					</ul>
					
				</div>
				<!-- //sort -->
				
				 <!-- list -->
                <div class="list">
                    <div class="mDir1 form mCustomScrollbar" style="height:570px">
                        <div class="dep1">
                            <label class="mCheckbox1 notext">
                                <input type="checkbox" title="구분" onclick="chkAll2(this)" value="Y">
                                <span class="label">구분</span>
                            </label>
                            구분
                        </div>
                        
                  
						
					
							
                        
                        <ul id="divGodsArea">
                        

							<c:forEach items="${channelList}" var="m" varStatus="status">
								
                            
										<li class="dep2"><label class="mCheckbox1 notext"> 
											<input type="checkbox" title="${m.applyChlCdNm}" class="chlRelBasNo_${m.chlRelBasNo} chlRelBasNo" name="chlRelBasNo" id="chlRelBasNo" value="${m.chlRelBasNo}" > 
											<span class="label">${m.applyChlCdNm}</span>
										</label> 
										
										
                               		 <a href="#" onclick="chk2('${m.chlRelBasNo}')">${m.applyChlCdNm}</a>
										
										
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
		Utilities.getOpener().searchChlRel();
		Utilities.closeModal();
	}
	
	// 지역별 체크박스 선택
	function chkAll(obj){
	 if( $(obj).is(":checked") ){
		 $(".applyChlCd").prop("checked", true);
	 }else{
		 $(".applyChlCd").prop("checked", false);
	 }
	}
	
	function chk(e){
		
		if( $('.applyChlCd_'+ e).is(":checked") ){
			$('.applyChlCd_'+ e).prop('checked', false);
		}else{
			$('.applyChlCd_'+ e).prop('checked', true);			
		}
	}
	
	// 지역 검색
	function search(){
		var url = "<c:url value='${urlPrefix}/popChl${urlSuffix}'/>";
		$("#frmSearch").attr("action", url);
		$("#frmSearch").submit();
		
	}
	
	
	// 지역별 체크박스 선택
	function chkAll2(obj){
		log(  $( obj ).is(":checked") );
		 if( $( obj ).is(":checked") ){
			 $(".chlRelBasNo").prop("checked", true);
		 }else{
			 $(".chlRelBasNo").prop("checked", false);
		 }
	 
	}
	
	function chk2(e){		
		if( $('.chlRelBasNo_'+ e).is(":checked") ){
			$('.chlRelBasNo_'+ e).prop('checked', false);
		}else{
			$('.chlRelBasNo_'+ e).prop('checked', true);			
		}
	}
	
	
	// 적용 채널 추가
	function add(){
		
		var basCnt = 0;
		$.each( $(".basNo"), function(i){
			if ($(this).val() != '') {
				basCnt++;
			}
		});
		
		if (basCnt == 0) {
			alert('정책 코드를 확인해 주세요.');
			return false;
		}
		
		var arr = new Array(); //Object를 배열로 저장할 Array
	    var obj = new Object(); //key, value형태로 저장할 Object
	    
		$.each( $("#divArea .applyChlCd"), function(i){
			if( $(this).is(":checked") ){
		       obj = new Object();
		       obj.mshipCoupnBasNo = $("#mshipCoupnBasNo").val();
		       obj.mshipCardBasNo = $("#mshipCardBasNo").val();
		       obj.mshipPromBasNo = $("#mshipPromBasNo").val();
		       obj.applyChlCd = $(this).val();
		       obj.stat = "C";
		       arr.push(obj);
			}
	     });
	    
		
		if(arr.length > 0) {
			var url = "<c:url value='${urlPrefix}/saveChlList${urlSuffix}'/>";
			Utilities.getAjax(url, arr ,true,function(data,jqXHR){
		        if(Utilities.processResult(data,jqXHR,"채널 추가중 오류가 발생하였습니다."))
		        {
		            alert("채널 추가가 완료되었습니다.");
		            location.reload();
		        }
		    });
		}else{
			alert("선택된 채널이 없습니다.");
			return false;
		}
		
		
	}
	
	// 적용 채널 삭제
	function del(){
		var arr = new Array(); //Object를 배열로 저장할 Array
	    var obj = new Object(); //key, value형태로 저장할 Object
	    
	    
		$.each( $("#divGodsArea .chlRelBasNo"), function(i){
			if( $(this).is(":checked") ){
		       obj = new Object();
		       obj.chlRelBasNo = $(this).val();
		       obj.stat = "D";
		       arr.push(obj);
			}
	     });
	    
		
		if(arr.length > 0) {
			var url = "<c:url value='${urlPrefix}/delChlList${urlSuffix}'/>";
			Utilities.getAjax(url, arr ,true,function(data,jqXHR){
		        if(Utilities.processResult(data,jqXHR,"채널 삭제중 오류가 발생하였습니다."))
		        {
		            alert("채널 삭제가 완료되었습니다.");
		            location.reload();
		        }
		    });
		}else{
			alert("선택된 채널이 없습니다.");
			return false;
		}
	
	}

</script>
