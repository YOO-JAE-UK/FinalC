$(function() {
	// 비밀번호 확인
	$('#newpasscheck').focusout(function() {
		if ($('#newpasscheck').val() != "" && $("#newpasscheck").val() != $("#newpass").val()) {
			$("#pass2").css("visibility", "visible");
			$("#pass2").html("입력한 비밀번호와 일치 하지 않습니다.");

			pandan = false;
		} else {
			$("#pass2").css("visibility", "visible");
			$("#pass2").css("color", "green").html("입력한 비밀번호와 일치합니다.");
		}
	});

	$('#newpass').keyup(function() {
		if ($("#newpasscheck").val() != null && $("#newpasscheck").val() != '') {
			if ($("#newpass").val() == $("#newpasscheck").val()) {
				$("#pass2").css("visibility", "hidden");
			}
		}
	});

	$('#newpass').focusout(function() {
		var pattern = /^[A-za-z0-9]{8,15}$/;
		var pass = $.trim($('#newpass').val());
		pandan = pattern.test(pass);
		if (!pandan) {
			$('#pass1').html('영문자, 숫자로 구성된 8~15 자리를 입력해주세요');
			$('#pass1').css('visibility', 'visible');
		} else {
			$('#pass1').css('visibility', 'hidden');
		}
	});
	$('#newpass').focus(function() {
		if ($.trim($("#curpass").val()) == '') {
			$('#pass1').html('현재 비밀번호를 입력하세요')
			$('#curpass').focus();
			$('#pass1').css('visibility', 'visible');
			$('#pass1').css('color', 'red');
		} else
			$('#pass1').css('visibility', 'hidden');
	});

}) // ready
    
