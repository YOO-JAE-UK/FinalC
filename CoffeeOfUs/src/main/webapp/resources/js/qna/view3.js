$(function() {
	$("#comment table").hide(); //1
	var page=1;		//더 보기에서 보여줄 페이지를 기억할 변수
	count = parseInt($("#count").text());
	if (count != 0){ //댓글 갯수가 0이 아니면
		getList(1);	//첫 페이지의 댓글 구해 옵니다. (한 페이지에 3개씩 가져옵니다.)
	}else{ //댓글이 없는 경우
		$("#message").text("등록된 댓글이 없습니다.");
	}
	

	
	function getList(currentPage){ 
		$.ajax({
			type:"post",
			url:"../comment_qna/list",
			data : {
				"QNA_NUM" : $("#board_num").val(), 
				 "page" : currentPage
				 },
			dataType:"json",
			success:function(rdata){
				//alert(JSON.stringify(rdata)) 데이타 넘어온값  확인
				//댓글의 총 갯수가 표시 됩니다.
				$('#count').text(rdata.listcount);
			 if(rdata.listcount > 0){
				  $("#comment table").show() //문서가 로딩될 때 hide() 했던 부분을 보이게 합니다.(1)
				  $("#comment tbody").empty();
				  $(rdata.list).each(function() {
					  output='';
					  img = '';
					  if($("#loginid").val() == this.id){
						  img = "<img src='../resources/img/pencil2.png' width='15px' class='update'>"   
							  + "<img src='../resources/img/delete.png' width='15px' class='remove'>"
							  + "<input type='hidden' value='"		+ this.num + "'>";
					  }
					  output += "<tr><td>" + this.id +"</td>";
					  output += "<td></td>";
					  output += "<td>" + this.reg_DATE.substring(0,10) + img + "</td></tr>";
					  
					  $("#comment tbody").append(output);
					  //append한 마지막 tr의 2번째 자식 td를 찾아 text()메서드로 content를 넣습니다.
					  $("#comment tbody tr:last").find("td:nth-child(2)").text(this.content);
				 
				  }); //each end
				  
				  if(rdata.listcount > rdata.list.length){ //전체 댓글 갯수 > 현재까지 보여준 댓글 갯수
					  $("#message").text("더보기")
				  }else{
					  $("#message").text("")
				  }
			 }else{
				 $("#message").text("등록된 댓글이 없습니다.")
				 $("#comment tbody").empty();
				 $("#comment table").hide();//1
			 }
			}
		});//ajax end
                  	
	}//function getList(currentPage){  end
	
	
	//글자 수 50개 제한 하는 이벤트
	$("#content").on('keyup',function(){
		content = $(this).val();
		length =$(this).val().length;
		if(length > 50) {//엄청빠르게쳐서 50개가 넘어갔을 때  50개까지만짜름
			length = 50;
			content = content.substring(0,length);
		}
		$(".float-left").text(length + "/50")
	})//$("#content").on('keyup',function(){ end
	
		$("#message").click(function(){
		getList(++page);
	})
	
	
	//등록 또는 수정완료 버튼 클릭한 경우
	//버튼의 라벨이 '등록' 인 경우는 댓글을 추가하는 경우
	//버튼의 라벨이 '수정완료'인 경우는 댓글을 수정하는 경우
	$("#write").click(function() {
		buttonText = $("#write").text(); //버튼의 라벨로 add할지 update할지 결정
		
		$(".float-left").text('총 50자까지 가능합니다.');
		
		if(buttonText =="등록"){ //댓글을 추가하는 경우
			url = "../comment_qna/add";
			data={
					"CONTENT" : content, //content = $("#content").val();
					"ID"	: $("#loginid").val(),
					"QNA_NUM" : $("#board_num").val()
			};
		}else{//댓글을 수정하는 경우
			url="../comment_qna/update";
			data = {
					"NUM" : num,
					"CONTENT" : content
			};
			$("#write").text("등록"); //다시 등록으로 변경
		}
		
		$.ajax({
			type : "post",
			url : url,
			data : data,
			success : function(result){
				$("#content").val('');
				if(result == 1){
					//page=1
					getList(page); //등록, 수정완료 후 해당 페이지 보여줍니다.
				}//if
			}//success
		})//ajax end
	})//$("#write").click(function() { end
	
	
	//pencil2.png를 클릭하는 경우(수정)
	$("#comment").on('click','.update',function(){
			before = $(this).parent().prev().text(); //선택한 내용을 가져옵니다.
			$("#content").focus().val(before); //textarea에 수정된 내용을 보여줍니다.
			num = $(this).next().next().val() //수정할 댓글번호를 저장합니다.
			$("#write").text("수정완료"); //등록버튼의 라벨을 '수정완료'로 변경합니다.
			
			//$("#comment .update").parent().parent()
			//#comment 영역의 update클래스를 가진 엘리먼트의 부모의 부모 = ><tr>
			//not(this) : 테이블<tr>중에서 현재 선택한 <tr>을 제외한 <tr>에 배경색을 흰색으로 설정합니다.
			//즉, 선택한 수정(.update)만 'lightgray'의 배경색이 나타나도록 하고
			//선택하지 않은 수정의 <tr> 엘리먼트는 흰색으로 설정합니다.
			$("#comment .update").parent().parent().not(this).css('background', 'white');
			
			$(this).parent().parent().css('background', 'lightgray'); //수정할 행의 배경색을 변경합니다.
		})//$("#comment").on('click','.update',function(){ end
	
		//delete.png를 클릭하는 경우
		$("#comment").on('click','.remove',function(){
			if(!confirm("정말 삭제하시겠습니까?")){
				return;
			}
			var deleteNum = $(this).next().val(); //댓글번호
				$.ajax({
					type : "post",
					url : "../comment_qna/delete",
					data : {
						"num" : deleteNum
					},
					success : function(result){
						if(result == 1){
							//page=1
							getList(page); //삭제  후 해당 페이지 보여줍니다.
						}//if
					}//success
				})//ajax end
			})//$("#comment").on('click','.delete',function(){ end
				
	
});