<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 


<style>
.mList3.type3 .col {
    width: calc(100% - 12px);
}
</style>

<div class="mPopup1">
    
    <!-- header -->
    <div class="title">
        <h1>쿠폰발급</h1>
        <a href="#" data-click="closeModal" class="close">팝업 닫기</a>
    </div>
    <!-- //header -->

    <!-- cont -->
    <div class="cont" >
    
    
         	<form role="form" id="frmDetail" name="frmDetail">
         	
				<input type="hidden" id="stat" name="stat" value="${addMode}"/>
				<input type="hidden" id="mshipCoupnBasNo" name="mshipCoupnBasNo" value="${mshipCoupnBasNo}"/>
				<input type="hidden" id="storeNo" name="storeNo" value="${storeNo}"/>
         		
      
        
			        <div class="gTitle1 line">
			            <h3 class="mTitle1">무기명쿠폰발급</h3>
			            <!-- <div class="gRt">
			                <a href="#" class="mBtn1 gray">캠페인 대상군 추가</a>
			            </div> -->
			        </div>
			        
			        
						         <!-- list -->
			            <div class="mList3 type3">
			                <!-- col -->
			                <div class="col">
			                    <div class="ti"><a href="#"  class="mBtn1 " >발행매수</a></div>
			                    <div class="tx2" style="padding-top:10px">
									<input  type="text" data-type="number" name="pubCoupnCnt" id="pubCoupnCnt" value="" size="5">
								</div>
			                   <!--  <a href="#" class="mBtn1 round">확인</a> -->
			                </div>
			                <!-- //col -->
			                <!-- col -->
			                <!-- <div class="col">
			                    <div class="ti"><a href="#"  class="mBtn1 "  data-click="popStoreSearch">매장선택</a></div>
			                    <div class="tx2"  id="storeInfo" style="padding-top:10px">
									
								</div>
			                </div>  -->
			                <!-- //col -->
			                
			                
			             
			            </div>
			            <!-- //list -->
            
               
			            <div class="ti"  style="margin-top:5px;text-align:center"><a href="#"  id="btnPub" class="mBtn1 "  style="font-weight:bold;font-size:14px" data-click="pubCoupon">발급하기</a></div>
			                    
			                    
            
            
                    
                    
                    
			        
			        </form>
			        
			    </div>
			    <!-- //cont -->
	
	
	
</div>


<script>


	function closeModal(){
		Utilities.closeModal();
	    Utilities.getTopWindow().search();
	}
	
	

	
	// 매장리스트 팝업
	function popStoreSearch(){
		
		var url = "<c:url value='${urlPrefix}/popStoreSearch${urlSuffix}'/>?mshipCoupnBasNo=${cpinfo.mshipCoupnBasNo}";
		Utilities.openModal(url, "700", "700");
		
	}
	
	
	function rtnStoreInfo( storeNm, storeCd, storeCnt ){
		
		$("#storeInfo").html( storeNm +'<br>(총 '+ storeCnt +'매장)');
		$("#storeNo").val( storeCd );
		
		if( storeCnt > 0 ) $("#btnPub").show();
	}
	

	
	// 쿠폰 발급
	function pubCoupon(){
		
		var saveJson = Utilities.formToMap("frmDetail");

		if( $("#mshipCoupnBasNo").val() == "" ){			
			alert('쿠폰 마스터 코드가 없습니다.');
			return false;
		}
		
		
		if( $("#pubCoupnCnt").val() == "" || $("#pubCoupnCnt").val() == "0" ){			
			alert('발행 매수를 기입해주세요.');
			$("#pubCoupnCnt").focus();
			return false;
		}
		
		if( $("#storeNo").val() == "" ){			
			alert('선택된 매장이 없습니다.');
			return false;
		}
		console.log(saveJson);
		//return;
		
		var url = "<c:url value='${urlPrefix}/pubStoreCoupon${urlSuffix}'/>";
		Utilities.blockUI();
		Utilities.getAjax(url,saveJson,true,function(data,jqXHR){
			Utilities.unblockUI();
	        if(Utilities.processResult(data,jqXHR,"쿠폰 발급에 실패했습니다."))
	        {
	            alert(data + " 장의 쿠폰 발급이 완료되었습니다.");
	            
	            
    			Utilities.getOpener().searchCpn();
	            Utilities.closeModal();
	          
	        }
	    });
		
		
	
	}

</script>
