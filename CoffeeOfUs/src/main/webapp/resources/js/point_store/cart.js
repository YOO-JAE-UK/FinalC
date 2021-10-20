
var page=1;

function getList(currentpage){
	console.log("currentpage="+currentpage)
	var id= $("#id").val(); 
	output=""
		
		 $.ajax({
			url: "getCartList",
			dataType:"json",
			async:false,
			type:"post",
			data: {page:currentpage,
				   id:id},
			success:function(rdata){
				$("tbody").empty();
				 if(rdata.listcount>0){
					  $("#payment").show();
					  $("#message").text("");
					 $(rdata.cartlist).each(function(index,item){
		        	     console.log("item.cremain="+item.cremain)
						 output+='<tr class="text-center" id="'+item.ccode+'">'
		        		   +'<td class="product-remove">'
		        		   +'<a href="javascript:Del('+ item.ccode+')"><span class="ion-ios-close"></span></a></td>'
		        		   +'<td class="image-prod">'
		        		   +'<div class="img" style="background-image:url(../upload'+item.cimg+');"></div></td>'
		        		   +'<td class="product-name">'
		        		   +'<h3>'+item.cproductname+'</h3>'
		        		   +'<p>'+item.cdescription+'</p></td>'
		        		   +'<td class="price">'+item.cperpoint+'</td>'
		        		   +'<td class="quantity">'
		        		   +'<div id="rmain">(남은 수량:'+item.cremain+'개)</div>'
		        		   +'<div class="input-group col-md-10 mb-2">'
		        		   +'<span class="input-group-btn mr-2">'
		        		   +'<button type="button" class="quantity-left-minus btn " onclick="Minus('+item.ccode+','+item.cremain+')"' 
		        		   + 'data-type="minus" data-field="">'
		        		   +'<i class="ion-ios-remove"></i></button></span>'
		        		   +'<input type="text" id="quantity" name="quantity" class="form-control input-number" onKeyup="Keyup('+item.ccode+','+item.cremain+')"' 
		        		   + 'value="'+item.cquantity+'"' 
		        		   +'min="1" max="100">'
		        		   +'<span class="input-group-btn ml-2">'
		        		   +'<button type="button" class="quantity-right-plus btn " onclick="Plus('+item.ccode+','+item.cremain+')"' 
		        		   +'data-type="plus" data-field=""><i class="ion-ios-add"></i></button></span></div></td>'
		        		   +'<td class="total">'+item.ctotalpoint+'</td></tr>'
		         
		         })
		           $("tbody").append(output);
		         	
		         	$("#total").val(rdata.amount);
		         	if(rdata.listcount>rdata.cartlist.length){
		         		$("#submessage").text("더 보 기");
		         	}else{
		         		$("#submessage").text("");
		         	}
				  }else{
					      $("#message").text("장바구니에 상품을 추가하세요");
						 
					  $("#payment").hide();
				  }
				
				
			}
		 })
	
} //getList end
getList(1)

function Del(ccode){
	var id=$("#id").val();
	var result=confirm("장바구니에서 삭제하시겠습니까?");
	
	if(result==true){
	$.ajax({
		url:"cartItemDelet",
		type:"post",
		data:{ccode:ccode,id:id},
		dataType:"json",
		success:function(rdata){
			if(rdata==1){
				getList(1);

			}
		}
	
	})

	}else{
		return false;
	}
}

$("#backtolist").click(function(){
	
		location.href="list"

})

function Keyup(ccode,cremain){
	var id=$("#id").val()
	var cquantity=$("#"+ccode).find("#quantity").val();
	var cperpoint= Number($("#"+ccode).find(".price").text());
	var ctotalpoint=Number(cquantity*cperpoint);
	var total=Number($("#total").val());
	total+=cperpoint;
	var pattern = /^[0-9]+$/;
	if(!pattern.test(cquantity)){
		alert("숫자만 가능합니다.")
		$("#"+ccode).find("#quantity").val('');
		$("#"+ccode).find("#quantity").focus();
	}else{
	
	   if(cquantity>99 || cquantity<0){
		   alert("수량을 정확히 적어주세요")
	   }else if(cquantity>cremain){
	      alert("남은 수량 "+cremain+"개를 초과하였습니다")
	   
	}else{
		  $.ajax({
			url: "Keyup",
			data:{id:id,ccode:ccode,cquantity:cquantity,
				  ctotalpoint:ctotalpoint},	
		    type:"post",
		    dataType:"json",
		    success:function(rdata){
		    	if(rdata.result==1){
		    		$("#"+ccode).find("#quantity").val(cquantity);
		    		$("#total").val(rdata.amount);
		    		$("#"+ccode).find(".total").text(ctotalpoint);
		    		
		    	}else{
		    		console.log("Keyup 실패");
		    	}
		    }
		
		})
	}
  }
}
$("body").click(function(){
	$("tbody tr").each(function(index,item){
		if($(item).find('input').val()==''){
			getList(1);
		}
	})
	
})

function Plus(ccode,cremain){
		var id=$("#id").val()
		var total=Number($("#total").val());
		var cquantity=$("#"+ccode).find("#quantity").val();
		var cperpoint=Number($("#"+ccode).find(".price").text());
		console.log("plus="+cquantity)
		console.log("cremain="+ cremain)
		if(cquantity<99 && cquantity<cremain){
			cquantity++
			var ctotalpoint=Number(cquantity*cperpoint);
			total+=cperpoint;
			$.ajax({
				url: "Plus",
				data:{id:id,ccode:ccode,cquantity:cquantity,
					  ctotalpoint:ctotalpoint},	
			    type:"post",
			    dataType:"json",
			    success:function(rdata){
			    	if(rdata==1){
			    		$("#"+ccode).find("#quantity").val(cquantity);
			    		$("#total").val(total);
			    		$("#"+ccode).find(".total").text(ctotalpoint);
			    		
			    	}else{
			    		console.log("plus 실패");
			    	}
			    }
			
			})
			
		}else if(cquantity>=cremain){
			alert("남은 수량"+cremain+"개를 초과하였습니다")
		}else if(cquantity>99){
			alert("최대구매수량은 99개 입니다")
		}
	
}
function Minus(ccode,cremain){
	var id=$("#id").val()
	var total=Number($("#total").val());
	var cquantity=$("#"+ccode).find("#quantity").val();
	var cperpoint=Number($("#"+ccode).find(".price").text());
	if(cquantity>1){
		--cquantity
		var ctotalpoint=Number(cquantity*cperpoint);
		total-=cperpoint;
		$.ajax({
			url: "Minus",
			data:{id:id,ccode:ccode,cquantity:cquantity,
				  ctotalpoint:ctotalpoint},	
		    type:"post",
		    dataType:"json",
		    success:function(rdata){
		    	if(rdata==1){
		    		$("#"+ccode).find("#quantity").val(cquantity);
		    		$("#total").val(total);
		    		$("#"+ccode).find(".total").text(ctotalpoint);
		    		
		    	}else{
		    		console.log("Minus 실패");
		    	}
		    }
		
		})
		
	}else{
		alert("최소수량 1개까지 입니다.")
	}

}


$(".container").on("click","#submessage",function(){

	getList(++page);
	
})

$("#pay").click(function(){
	
		location.href="buynow";

})
