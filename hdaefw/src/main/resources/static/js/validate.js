

	// 경고
	function callNoty(type, size, pos, msg){
		
		alert( msg );
		
	}
	
	// log
	function log(msg){
		console.log( msg );
	}



// 데이터 체크
	function chkDataFld(frmName){

//log('chkDataFld = '+ $( frmName +" .data-check").length );
		var errChk=0;
		var objTitle;
		$( frmName +" .data-check").each(function(){

			//objTitle = $(this).parent().find('h1').text();

			//if(!objTitle) objTitle = $(this).parent().parent().find('h1').text();

			//log("objTitle = "+ this.type  );
			//if(objTitle == ""){
				objTitle = $(this).attr('title');
			//}
			//console.log( typeof(objTitle)  );
			if( typeof(objTitle) == "object" || typeof(objTitle) == "undefined" ){
				objTitle = $(this).parent().prev().text();
			}

			// input text
			if( this.type == "text" ){
				if( $.trim( $(this).val() ) == "" && $(this).is(":visible") ){
					errChk++;
					callNoty( "warning", 700, "center", objTitle + ' 을 기입해 주세요.');
					$(this).focus();
					return false;
				}
			}else if( this.type == "select-one" || this.type == "select" ){
				
				if( $.trim( $(this).val() ) == "" && $(this).is(":visible") ){
					
					//$(this).attr("style", "background:#ff6633");
					
					errChk++;
					callNoty( "warning", 700, "center", objTitle + ' 을 선택해 주세요.');
					$(this).focus();
					return false;
				}
			}else if(this.type="textarea"){  // textarea editor
				if( $(this).val() == ""){
					/*if(typeof(oEditors.getById["ir1"]) != "undefinded" ){
						if(oEditors.getById["ir1"].getIR() =="<p><br></p>"){
							errChk++;
							callNoty( "warning", 700, "center",  '내용을 기입해 주세요.');
							$(this).focus();
							return false;
						}
					}else{*/
						errChk++;
						callNoty( "warning", 700, "center",  '내용을 기입해 주세요.');
						$(this).focus();
						return false;
					/*}*/
				}
			}else{  // select
			
				if( $(this).val() == "" && $(this).is(":visible") ){
					errChk++;
					callNoty( "warning", 700, "center",  objTitle + ' 을 기입해 주세요.');
					$(this).focus();
					return false;
				}
			}
		});

		return (errChk == 0) ? true : false;

	}



	// 데이터 바인딩
	function viewBindData(jsonData, type){
		var id;

		if(type == 'span') {

			$(".txt").each(function(){
				id = ( $(this).attr('id') ) ? $(this).attr('id') : $(this).attr('name');
				// 숫자 형식 콤마 추가
				if( eval( "jsonData."+ id ) ){
					if( $(this).attr('class').indexOf('num') > -1 ){
						$(this).text(  rtnComma( eval( "jsonData."+ id )  ) );
					}else{
						$(this).text( nl2br( eval( "jsonData."+ id ) ) );
					}
				}

			});		

		}else{

			$(".data-bind").each(function(){
				id = ( $(this).attr('id') ) ? $(this).attr('id') : $(this).attr('name');

				if(type == 'input') {

					// 숫자 형식 콤마 추가
					if( $(this).attr('class').indexOf('num') > -1 ){
						$(this).val(  rtnComma( eval( "jsonData."+ id )  ) );
					}else{
						$(this).val( nl2br( eval( "jsonData."+ id ) ) );
					}

				}else{

					// 숫자 형식 콤마 추가
					if( $(this).attr('class').indexOf('num') > -1 ){
						$(this).html(  rtnComma( eval( "jsonData."+ id )  ) );
					}else{
						$(this).html( nl2br(eval( "jsonData."+ id )) );
					}

				}
			});

		}
	}


	function nl2br(str){ 
		if( $.trim(str) == "" ) return str;
		return str.replace(/\n/g, "<br />");  
	} 
	
	