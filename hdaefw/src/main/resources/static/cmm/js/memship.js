

/*

 2022-04-22
 
	MemberShip 관련 js 정의

 */



// log
function log(msg){
	console.log( msg );
}


// grid 데이터 로드 후 체크박스 처리 
// ele : $("#frm #chk") , val1 : input 원래 value , val2 : grid 에서 넘어온 value	
function chkEleVal(ele, val1, val2){
	
	$(ele).val( val1 );
	
	if( val1 == val2 ){
		$(ele).prop("checked", true);
	}else{
		$(ele).prop("checked", false);	
	}
}


// checkbox checked
function chkAll(ele, tele){
	
	if( $(ele).is(":checked") ){
		$(tele).prop("checked", true);
	}else{
		$(tele).prop("checked", false);
	}
}


// form to object 
function getRowObject(obj){
	
	var arrData = new Array();
	
	 $.each( $(obj), function(i){
		 
		 var fObj = new Object();
		 var chkVal = "";
		 var type = null;
		 $.each( $(this).find('input, select'), function(j){
			
				type = $(this).attr("type");
				if( type == null ) type = $(this).prop("tagName");
				if( typeof(type) == "undefined") return;
				if( type.toUpperCase() == "CHECKBOX"  ){
					if( $(this).is(":checked") ){
						chkVal = $(this).val();
					}else{
						chkVal = "";
					}
				}else{
					chkVal = $(this).val();
				}
				
				if( $(this).attr("name") ){
					eval( "fObj."+ $(this).attr("name") +"='"+  chkVal +"'" );
				}
		 });
		 
		 if( fObj != null) arrData.push( fObj ); 
	});
	
	return arrData;	
}


$(document).ready(function(){
	
	// 천단위 콤마
	$(".comma").on("keyup", function(){
	
	  // $(this).val($(this).val().replace(/\,/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
	   //$(this).val(addComma($(this).val().replace(/[^\.|^0(0)+|^0-9\.]/g, '') ));
	   $(this).val(addComma($(this).val() ));
	});
	
	
	$.each( $(".comma"), function(){
		//$(this).val(addComma($(this).val().replace(/[^\.|^0(0)+|^0-9\.]/g, '') ));
		$(this).val(addComma($(this).val() ));
	});
	
});


// 툴팁
$(function() {
   $( document ).tooltip({position: {my: "left top", at: "right top"},
   items: ".data-check",
     content: function() {
		return null; 
		//return $(this).attr( "title" ); 
	}
   });
 });
 
 

//천단위 콤마 추가
function addComma(val){
	
	val = $.trim(val).replace(/[^-?\.|^0(0)+|^0-9\.]/g, '');
	var value = val.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	return value; 
}
    
//천단위 콤마 삭제
function minusComma(val){
    var value = $.trim(val).replace(/[^\.|^0(0)+|^0-9\.-]/g, '');
    return value; 
}    
    
	
// form validate  class='data-check' 있는 Element 체크 후 색상 변경
// obj = #frmDetail
function validateForm(obj) {
	var valid = true;
	$( obj + " .data-check").each(function(){
		
		
		$(this).removeClass('invalid');
		
		if( typeof( $(this).attr("disabled") ) == "string" ) return true;	
		
		if( $(this).is(":disabled") ) {
			return true;
		}
		

		
		if(!$(this).val()){ 
			$(this).addClass('invalid');
			//$(".ui-multiselect").addClass('invalid');
			//$(this).attr('title', $(this).attr("title") );
			//log( $(this).attr('id') +'//'+  $(this).attr('title') );
			valid = false;
		}
		
		if($(this).attr("type")=="email" && !$(this).val().match(/^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/)){
			$(this).addClass('invalid');
			//$(this).attr('title','올바른 이메일 형식이 아닙니다.');
			valid = false;
		}  
	}); 
	
	
	$( obj + " .comma").each(function(){	
		if( $(this).attr("data-type") == "number2" ) {	
			$(this).val( minusComma($(this).val() ) );
		}
	}); 	
		
	return valid;
}


 
 
 
 
/* directory */
$(document).on("click", ".mDir1 li a", function () {
	if ($(this).parent().hasClass("active"))
		$(this).parent().removeClass("active");
	else
	$(this).parent().addClass("active");
	return false;
});
/* //directory */
 
 
 /* modal close  */
function closeModal(){	

	 Utilities.closeModal();
	 try{
	     Utilities.getTopWindow().search();
     }catch(e){
		 try{
	     	Utilities.getOpener().search();
	     }catch(e){
		}
	}
}


function callAjax(apiAddress, type, param, callback){
	//$("#loadingBar").show();
	$.ajax({
		url:apiAddress,
		type:type,
		//dataType:"json",
		data:param,
		success: function(data){
			if( callback != '')  callback( data ) ;
		//	$("#loadingBar").hide();
		//	if(authSave == 'N')  $('.btnSave').remove();
		//	if(authDown == 'N')  $('.btnDown').remove();
		},
		error : function(request, status, error ) {   // 오류가 발생했을 때 호출된다.
			//$("#loadingBar").hide();
		  // callNoty( 'error', 1000, 'bottom', '에러야~~!!! \n\n\n 콘솔 확인 하삼~!!!!!.');
		//	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}

	}).done(function(){
	//	screenHeight();
	//	$("#loadingBar").hide();
	});

}


function cardDash(str){
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';
    if( str.length < 4){
        return str;
    }
    else if(str.length < 8){
        tmp += str.substr(0, 4);
        tmp += '-';
        tmp += str.substr(4,4);
        return tmp;
    }else if(str.length < 12){
        tmp += str.substr(0, 4);
        tmp += '-';
        tmp += str.substr(4, 4);
        tmp += '-';
        tmp += str.substr(8,4);
        return tmp;
    }else if(str.length < 17) {

        tmp += str.substr(0, 4);
        tmp += '-';
        tmp += str.substr(4, 4);
        tmp += '-';
        tmp += str.substr(8,4);
        tmp += '-';
        tmp += str.substr(12,4);
        return tmp;
    }
    return str;
}



// json data to form 
function mapToForm(map, frm) {
	
    if (!map)
        return;
    var jFrm = Utilities.getFormObject(frm);
    if (!jFrm || !jFrm.length)
        return null;
    var frmObj = jFrm[0];
    frmObj.reset();
    for ( var name in map) {
		//	console.log(name + " : " + map[name]);
        var inp = jFrm.find("[name=" + name + "]");
        if(inp.length>1){

            if($(inp[0]).attr("type")=="radio"){
                var rArray = inp;
                for(var i=0;i<rArray.length;i++){
                    var rdo = $(rArray[i]);
                    var name = rdo.attr("name");
                    var value = rdo.val();
                    if(name && value && map[name]){
                        rdo.prop("checked",map[name]==value);
                    }
                }
            }
            else{
                var rArray = map[name];
                if(rArray == null)
                	continue;
                if(typeof(rArray) == typeof([])){
                    for(var i=0;i<rArray.length&&i<inp.length;i++){
                        $(inp[i]).val(rArray[i]);                           
                    }
                }
                else{
                    $(inp[0]).val(map[name]);
                }
            }
        }
        else if(inp.length == 1){
			var val = map[name];
			
			
			if( val != null && !isNaN(val) && name.toLocaleUpperCase().indexOf("DATE") == -1 && name.toLocaleUpperCase().indexOf("YMD") == -1 && name.toLocaleUpperCase().indexOf("DAY") == -1 ) {
				val = Utilities.numberWithCommas(val);
			}
			
			
			
			if(inp.prop('tagName') == "SELECT" && inp.prop("multiple"))
			{
				
				if(val){
					var arr = null;
					if(Array.isArray(val)){
						arr = val;
					}else{
						arr = val.split(",");
					}
					inp.val(arr);
					
				}else {
					inp.val(val);
				}
			}
			else
            	//inp.val(map[name]);
            	inp.val(val); 
        }
        
    }

    return;

}