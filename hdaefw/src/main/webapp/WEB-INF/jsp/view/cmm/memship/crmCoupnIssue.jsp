<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/ezTagLib.tld"%> 


<style>

.mList4.type4 .mem .mTxt2 .btn {
    background-color: #d00e2d;
}
.mTxt2 .btn {
    /* display: block; */
    position: absolute;
    /* top: 0; */
    /* right: 0; */
    background: url(/static/cmm/images/ico_reselect1.png) 11px 50% no-repeat #5b5b5b;
    border-radius: 27px;
    color: #fff;
    font-size: 16px;
    padding: 0 0 0 25px;
    letter-spacing: -1px;
    width: 120px;
    line-height: 26px;
    height: 30px;
}

.mList4.type4 .lt, .mList4.type4 .rt {
    width: 356px;
    min-height: 60px;
}
.mList4.type4 > div {
    padding: 17px 0;
}
.mList4 .lt {
    float: left;
    width: 239px;
}

.mList4 .rt {
    float: right;
    width: 239px;
}


.mList4 > div {
    /* background-color: #f4f4f4; */
   /*  border: 1px solid #e3e3e3; */
    border-radius: 10px;
    /* color: #333; */
    font-size: 14px;
    line-height: 150%;
    padding: 10px 0;
    text-align: center;
}

</style>


<div class="mPopup1">
    
    <!-- header -->
    <div class="title">
        <h1>회원쿠폰발급</h1>
        <a href="javascript:window.close();" class="close" data-click="closeModal">팝업 닫기</a>
    </div>
    <!-- //header -->

    <!-- cont -->
    <div class="cont">

        <div class="gTitle1 line">
            <h3 class="mTitle1">회원쿠폰발급</h3>
            <div class="gRt posT-10">
                <a href="#" class="mBtn1 lWhite" id="btnPub"  data-click="pubCoupon">회원쿠폰발급</a>
            </div>
        </div>
        
                
        
         	<form role="form" id="frmDetail" name="frmDetail">
         	
				<input type="hidden" id="stat" name="stat" value="${addMode}"/>
				<input type="hidden" id="mshipCoupnBasNo" name="mshipCoupnBasNo" value="${mshipCoupnBasNo}"/>
				
				
				<input type="hidden" id="custGrpNo" name="custGrpNo" value=""/>
				<input type="hidden" id="custNo" name="custNo" value=""/>
				
				
				
				
        <!-- list -->
        <div class="mList4 type4">

				
            <!-- left -->
            <div class="lt mem">
                <!-- <label class="mRadio1 type3">
                    <input type="radio" name="radio1" title="개별 회원" >
                    <span class="label"><a href="#"  class=" " >개별 회원</a></span>
                </label> -->
                <!-- <div class="txt"></div> -->
                <div class="mTxt2">
                    <!-- <div class="tx" id="custInfo" ></div> -->
                    <a href="#" class="btn"  data-click="popMemSearch">개별 회원 선택</a>
                </div>
            </div>
            <!-- //left -->
            <!-- right -->
            <div class="rt">
                <!-- <label class="mRadio1 type3">
                    <span class="label">회원선택</span>
                </label> -->
                <!-- <div class="txt" ></div> -->
                <div class="mTxt2">
                    <!-- <div class="tx" id="grpInfo"></div> -->
                    <a href="#" class="btn"  data-click="popGrpSearch">그룹 회원 선택</a>
                </div>
            </div>
            <!-- //right -->
            
        </div>
        
        
         
			                    <div id="divCpn" style="height:450px"
								  data-post="Y"
								  data-block-ui="Y"
								  data-grid-id="grdPubCustList"
								  data-pagenation="Y"
								  data-get-url="<c:url value='/cmmMshipCoupnBas/getPubList'/>"
								  data-type="grid" 
								  data-tpl-url="<c:url value='/static/gridTemplate/memship/cmmCoupnPblsCust.xml'/>"
								  >
								</div>
        	
        
        
            </form>
            
        <!-- //list -->
        
    </div>
    <!-- //cont -->
    
    	                    
			         
	
</div>

<!-- popup2 -->
<div id="jsPopup2" class="mPopup2" style="display: none;">
    <div class="modalBg"></div>
    <div class="cont">
        <div class="text noresult">
            <p class="txt ico1" id = "coupnMsg"></p>
            <ul>
            	<li class="wAuto">
            		<h3 >쿠폰 발급 매수 : <input type="number" class="it data-check w80" min="1" max="100" class="it" id="issuCnt" name="issuCnt"  oninput="checkIssuCnt(this)"/></h3>
            	</li>
            </ul>
        </div>
        <div class="mButton1">
            <a href="#jsPopup2" class="jsBtnConfirm1"><strong>예</strong></a>
            <a href="#jsPopup2" class="jsBtnClose1">아니오</a>
        </div>
    </div>
</div>
<!-- //popup2 -->


<script>

	var memType = '';
	var memCut = 0;
	function onGridDataLoaded(gridView,gridJson,data){
		
		var custNo = new Array();
	    for(var i=0;i<gridJson.length;i++){
	        custNo.push(gridJson[i].itgCustNo);
	    }
	    
	    if (memType == 'M') {
	    	//memCut = gridJson.length;
			$("#custInfo").html( memCut +'명' );
	    } else if (memType == 'G') {
	    	$("#grpInfo").html( Number(gridJson.length - memCut) +'명' );
	    }
		//$("#custNo").val( custNo );
		
	}

	function closeModal(){
		Utilities.closeModal();
	    Utilities.getTopWindow().search();
	}
	
	
	//회원쿠폰발급 팝업
	function popMemSearch(){
		
		var url = "<c:url value='${urlPrefix}/popMemSearch${urlSuffix}'/>?mshipCoupnBasNo=${cpinfo.mshipCoupnBasNo}";
		Utilities.openModal(url, "1400", "950");
		
	}
	
	//회원쿠폰발급 팝업
	function popGrpSearch(){
		
		var url = "<c:url value='${urlPrefix}/popGrpSearch${urlSuffix}'/>?mshipCoupnBasNo=${cpinfo.mshipCoupnBasNo}";
		Utilities.openModal(url, "1200", "700");
		
	}
	
	function rtnGrpInfo( grpNm, grpCd, grpCnt ){
		//console.log(grpCd)
		// $("#custGrpNo").val( grpCd );
		
		//$("#custInfo").html("");
		// $("#custNo").val( $("#custNo").val() );
		var currGrp = $("#custGrpNo").val();
		if (currGrp == '') {
			currGrp = grpCd;
		} else {
			currGrp += ',' +grpCd;
		}
		$("#custGrpNo").val( currGrp );
		console.log(currGrp);
		memType = 'G';
		if( grpCnt > 0 ){
			$("#btnPub").show();
			searchCust();
			//$("#custGrpNo").val("");
		}
	}
	
	function rtnCustInfo( custNo, custCnt ){
		
		//$("#grpInfo").html("");
		//$("#custGrpNo").val("");
		
		// $("#custInfo").html(  custCnt +'명' );
		var currCust = $("#custNo").val();
		if (currCust == '') {
			currCust = custNo;
		} else {
			currCust += ',' +custNo;
		}
		$("#custNo").val( currCust );
		
		memType = 'M';
		memCut += custCnt;
		if( custCnt > 0 ){
			$("#btnPub").show();
			searchCust();			
		}
	}
	
	
	/* 발급예정 회원리스트 */
	function searchCust() {
		$("form#frmStore").find("#currentPageNo").val(1);
	 	var url = "<c:url value='${urlPrefix}/getPubCustList${urlSuffix}'/>";
		var param = Utilities.formToMap("frmDetail");
		param.recordCountPerPage = 20;
		// grdPubCustList.clear();
		grdPubCustList.loadUrl(url, param);
	} 
	
	
	
	// 쿠폰 발급
	function pubCoupon(){
		
		if( $("#mshipCoupnBasNo").val() == "" ){			
			alert('쿠폰 마스터 코드가 없습니다.');
			return false;
		}
		
		if( $("#custGrpNo").val() == "" &&  $("#custNo").val() == "" ){			
			alert('선택된 회원 또는 그룹이 없습니다.');
			return false;
		}
		var saveJson = Utilities.formToMap("frmDetail");
		if (saveJson.custNo != '' || saveJson.custGrpNo != '') {
			$('#jsPopup2 #coupnMsg').html("쿠폰 발급 하시겠습니까?" ); // custInfo , 
			$('#jsPopup2').show();
		}
		
	}

	$(document).ready(function() {
		 /* button */
		$(".jsBtnShow1").on("click", function(){
			$( $(this).attr("href") ).show();
			return false;
		});
		$(".jsBtnClose1").on("click", function(){
			$( $(this).attr("href") ).hide();
			return false;
		});
		$(".jsBtnConfirm1").on("click", function(){
			
			if (!confirm("쿠폰발행 매수가 많으면 서버가 다운될수 있습니다. \n진행 하시겠습니까?"))
				return;
			
			if ($('#issuCnt').val() === '') {
				alert("쿠폰발행 매수는 1 ~ 100 이내로 입력해 주세요.");
				return false;
			}
			
			$( $(this).attr("href") ).hide();
			var saveJson = Utilities.formToMap("frmDetail");
			saveJson.issuCnt = $('#issuCnt').val();
			console.log(saveJson);
			// return ;
			var url = "<c:url value='${urlPrefix}/pubCoupon${urlSuffix}'/>";
			Utilities.blockUI();
			Utilities.getAjax(url,saveJson,true,function(data,jqXHR){
				Utilities.unblockUI();
		        if(Utilities.processResult(data,jqXHR,"쿠폰 발급에 실패했습니다."))
		        {
		            // alert(data + " 명에게 쿠폰 발급이 완료되었습니다.");
	    			Utilities.getOpener().searchCpn();
		            Utilities.closeModal();
		          
		        }
		    });
			return false;
		});
		 /* //button */
		
	});
	
	function checkIssuCnt (e) {
		if (e.value < 1 && e.value > 100) {
	        alert("쿠폰발행 매수는 1 ~ 100 이내로 입력해 주세요.");
	        e.value = e.value.substring(0,2);
	    }
	}	
	
</script>
