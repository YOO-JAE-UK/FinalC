//아이디와 비밀번호 일치 확인
 $('#passcheck').focusout(function(){
	if($('#passcheck').val() != ""&&$("#passcheck").val()!=$("#idcheck").val()) {
		$("#pass_span").css("visibility", "visible");
		$("#pass_span").html("아이디와 비밀번호가 일치 하지 않습니다.");
		pandan=false;
   			
	}else{
		$("#pass_span").css("visibility", "visible");	
		$("#pass_span").css("color", "green").html("아이디와 비밀번호가 일치합니다.");
	}
	});
	     
 $('#idcheck').keyup(function(){
   	if($("#passcheck").val()!=null&&$("#passcheck").val()!=''){
   		if($("#idcheck").val()==$("#passcheck").val()){
  			$("#pass_span").css("visibility", "hidden");
   		}
   	}
 }) 