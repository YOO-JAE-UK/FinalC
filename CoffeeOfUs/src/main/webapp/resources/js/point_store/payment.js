$("#juso").on('change','input[type=radio]',function(){
	console.log("라디오 체그 값="+$(this).val())
	var selectAdd=$(this).val();
	var post=$(this).next().val();
	var place=$(this).next().next().next().next().text()
	var name=$(this).next().next().val()
	var tel=$(this).next().next().next().val()
	console.log
	$("#post1").val(post)
	$("#address").val(selectAdd)
	$("#recieveaddress").val(place);
	$("#recievename").val(name);
	$("#recievetel").val(tel);


})

$("#addAddress").click(function(){
	var rname= $("#recievename").val();
	var rtel=$("#recievetel").val();
	var rplace=$("#recieveaddress").val();
	var rpost=$("#post1").val();
	var raddress=$("#address").val();
	
	
	if(raddress==''){
		alert("주소를 입력하세요")
	}else if(rname==''){
		alert("받는분 성함을 입력하세요")
	}else if(rtel==''){
		alert("받는분 연락처를 입력하세요")
	}else if(rplace==''){
		alert("받는곳을 입력해주세요")
	}else{
		
		$.ajax({
			url:"addAddress",
			type:"post",
			data:{rname:rname,
				  rtel:rtel,
				  rplace:rplace,
				  rpost:rpost,
				  raddress:raddress		
			},
		success:function(rdata){
		   if(rdata.result==1){
			alert("기본배송지로 설정되었습니다.");
			getAddressList();
			
		   }else{
			   alert("이미 설정되어 있습니다.")
			   
		   }
		}
		
		})
	}

})

function getAddressList(){
	output='';  
	$.ajax({
		url:"getAddressList",
		dataType: "json",
		type:"post",
		success:function(data){
		
			if(data.addresslist.length>0){
				$("#juso").empty();
			$(data.addresslist).each(function(index,item){
				console.log("afdsafd="+item.rcheck);
				if(item.rcheck==1){
				  
					output+='<div class="form-check form-check-inline">'	
					     +'<input class="form-check-input" type="radio"'
					     +'name="vaddress" id="inlineRadio1" value="'+item.raddress+ '" checked >'
					     +'<input type="hidden" value="'+item.rpost+'">'
					     +'<input type="hidden"  value="'+item.rname+'">'
					     +'<input type="hidden"  value="'+item.rtel+'">'
					     +'<label class="form-check-label" for="inlineRadio1">'+item.rplace+'</label></div>'
				}else{
					output+='<div class="form-check form-check-inline">'	
					     +'<input class="form-check-input" type="radio"'
					     +'name="vaddress" id="inlineRadio1" value="'+item.raddress+ '">'
					     +'<input type="hidden"  value="'+item.rpost+'">'
					     +'<input type="hidden"  value="'+item.rname+'">'
					     +'<input type="hidden" value="'+item.rtel+'">'
					     +'<label class="form-check-label" for="inlineRadio1">'+item.rplace+'</label></div>'
				}
				
			})	
			$("#juso").append(output);
				
			}
			
		}
	
	})
	
}

$("#joinform").submit(function(){
	var totalpoint=Number($("#totalpoint").val());
	var mypoint=Number($("#point").val());
	console.log("mypoint======"+mypoint)
	console.log("totalpoint====="+ totalpoint)
	var result=confirm("결제를 진행하시겠습니까?");
      if(result==true){
		if(totalpoint>mypoint){
			alert("보유하신 포인트가 부족합니다.")
			return false;
		}
      }
})
