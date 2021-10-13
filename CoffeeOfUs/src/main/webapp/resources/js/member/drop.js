 $(document).ready(function(e){
		$('#drop_member').submit(function(){
			//패스워드 입력 확인
			var result=confirm("탈퇴 하시겠습니까?");
			if(!result){
				return;
			}
			
			
			if($('#pass1').val() == ''){
				alert("패스워드를 입력해 주세요.");
				$('#pass1').focus();
				return;
			}else if($('#pass2').val() == ''){
				alert("패스워드를 입력해 주세요.");
				$('#pass2').focus();
				return;
			}
			//입력한 패스워드가 같인지 체크
			if($('#pass2').val() != $('#pass1').val()){
				alert("패스워드가 일치하지 않습니다.");
				$('#pass2').focus();
				return;
			}
	
		//	location.href="dropProcess";
			
		});
	});