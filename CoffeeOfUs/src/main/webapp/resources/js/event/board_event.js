$('.CommentBox').on('keyup', '.comment_inbox_text', function() {
	var length = $(this).val().length;
	$(this).prev().text(length + "/200");

});
function del(num) {
	if (!confirm("정말 삭제하시겠습니까?")) {
		return;
	}
	$.ajax({
		url : 'BoardDelete',
		type : 'post',
		dataType : 'json',
		data : {
			event_board_num : num
		},
		success : function(rdata) {
			if (rdata >= 1) {
				getList(1, 1);
			}
		}

	})
}

$("#content").keyup(function() {
	var content = $(this).val();
	length = $(this).val().length;
	if (length > 50) {
		length = 50;
		content = content.substring(0, length);
	}
	$(".float-left").text(length + "/50")

})

$("#content")
		.focus(
				function() {
					if ($(".comment_list").find("div.CommentWriter").css(
							'display') == 'block') {
						alert("작업완료후 입력하세요");
						$(".comment_list").find("textarea").focus();

					}
				})

$("#write").click(function() {
	var content = $("#content").val();
	var id=$("#id").val();
	if (!content) {
		alert("게시글을 입력하시오");
		return;
	}
	if(id==''){
		alert("로그인후 사용해주세요");
		location.href="../member/login";
	}else{
    
	$.ajax({
		url : 'add',
		data : {
			"id" : $("#id").val(),
			"content" : content,
			"event_re_lev" : 0,
			"event_re_seq" : 0
		},
		type : 'post',
		success : function(rdata) {
			if (rdata == 1) {
				getList(1, 1);
			}
		}
	})
	$("#content").val('');
	$(".float-left").text('총 50자까지 가능합니다.');
   }
	
})

function getList(page, state) {
	option = state;// 현재 선택한 댓글 정렬방식을 저장합니다. 1=>최신순, 2=>등록순

	$
			.ajax({
				type : "post",
				url : "getList",
				data : {
					"page" : page,
					"state" : state
				},
				dataType : "json",
				success : function(rdata) {
					// 댓글의 총 갯수가 표시 됩니다.
					$('#count').text(rdata.listcount).css('font-family',
							'arial,sans-serif')
					var red1 = 'red';
					var red2 = 'red';
					if (option == 1) { // 등록순인 경우 등록순이 'red', 최신순이 'gray'로 글자색을
										// 나타냅니다.
						red2 = 'gray';
					} else if (option == 2) { // 최신순인 경우 등록순이 'gray', 최신순이
												// 'red'로 글자색을 나타냅니다.
						red1 = 'gray';
					}
					var output = "";

					if (rdata.list.length > 0) {
						output += '<li class="comment_tab_item '
								+ red1
								+ '" >'
								+ '   <a href="javascript:getList(1,1)" class="comment_tab_button">최신순 </a>'
								+ '</li>'
								+ '<li class="comment_tab_item '
								+ red2
								+ '" >'
								+ '   <a href="javascript:getList(1,2)" class="comment_tab_button">등록순</a>'
								+ '</li>';
						$('.comment_tab_list').html(output);// 댓글 수 등록순 최신순 출력

						output = '';
						$(rdata.list)
								.each(
										function() {
											var lev = this.event_re_lev;
											var comment_reply = '';
											// 레벨에 따라 왼쪽 여백줍니다.
											if (lev == 1) {
												comment_reply = ' CommentItem--reply lev1';// margin-left:
																							// 46px;
											} else if (lev == 2) {
												comment_reply = ' CommentItem--reply lev2';// margin-left:
																							// 92px;
											}

											// 선택한 파일이 나타날지 기본 그림이 나타날지 결정합니다.
											var profile = this.user_file;
											var src = '../resources/img/profile.png';
											if (profile) {
												src = '../upload' + profile;
											}

											output += '<li id="'
													+ this.event_board_num
													+ '" class="CommentItem'
													+ comment_reply
													+ '">'
													+ '   <div class="comment_area">'
													+ '    <img  src="'
													+ src
													+ '" alt="프로필 사진" width="36" height="36">'
													+ '    <div class="comment_box">'
													+ '      <div class="comment_nick_box">'
													+ '            <div class="comment_nick_info">'
													+ '               <div class="comment_nickname">'
													+ this.id
													+ '</div>'
													+ '            </div>' // comment_nick_info
													+ '       </div>' // comment_nick_box
													+ '     </div>' // comment_box
													+ '    <div class="comment_text_box">'
													+ '       <p class="comment_text_view">'
													+ '         <span class="text_comment">'
													+ this.content
													+ '</span>'
													+ '       </p>'
													+ '    </div>' // comment_text_box
													+ '    <div class="comment_info_box">'
													+ '      <span class="comment_info_date">'
													+ this.reg_date + '</span>';
											if (lev < 2) { // 답글쓰기는 답글의 답글까지만
															// 사용하도록 합니다.
												output += '  <a href="javascript:replyform('
														+ this.event_board_num
														+ ','
														+ lev
														+ ','
														+ this.event_re_seq
														+ ','
														+ this.event_re_ref
														+ ')"  class="comment_info_button">답글쓰기</a>'
											}
											output += '   </div>' // comment_info_box;

											// 글쓴이가 로그인한 경우 나타나는 더보기입니다.
											// 수정과 삭제 기능이 있습니다.
											if ($("#id").val() == this.id
													|| $("#id").val() == 'admin') {
												output += '<div class="comment_tool">'
														+ '    <div title="더보기" class="comment_tool_button">'
														+ '       <div>&#46;&#46;&#46;</div>'
														+ '    </div>'
														+ '    <div id="commentItem'
														+ this.event_board_num
														+ '"  class="LayerMore">' // 스타일에서
																					// display:none;
																					// 설정함
														+ '     <ul class="layer_list">'
														+ '      <li class="layer_item">'
														+ '       <a href="javascript:updateForm('
														+ this.event_board_num
														+ ')"'
														+ '          class="layer_button">수정</a>&nbsp;&nbsp;'
														+ '       <a href="javascript:del('
														+ this.event_board_num
														+ ')"'
														+ '          class="layer_button">삭제</a></li></ul>'
														+ '     </div>'// LayerMore
														+ '   </div>'// comment_tool
											}

											output += '</div>'// comment_area
													+ '</li>'// li
										})// each
						$('.comment_list').html(output);

						output = '';
						if (page != 1)
							output += '<li class="page-item">'
									+ '<a href="javascript:getList('
									+ (rdata.page - 1) + ',' + rdata.state
									+ ')"'
									+ ' class="page-link">이전&nbsp;</a></li>'
						for (var i = rdata.startpage; i <= rdata.endpage; i++) {
							if (i == rdata.page) {
								output += '<li class="page-item ">'
										+ '<a class="page-link gray">' + i
										+ '</a></li>'
							} else {
								output += '<li class="page-item ">'
										+ '<a href="javascript:getList(' + i
										+ ',' + rdata.state + ')"'
										+ ' class="page-link">' + i
										+ '</a></li>'
							}
						}
						if (rdata.maxpage > rdata.endpage) {
							output += '<li class="page-item">'
									+ '<a href="javascript:getList('
									+ (rdata.page + 1) + ',' + rdata.state
									+ ')"'
									+ ' class="page-link">다음&nbsp;</a></li>'
						}
						$(".pagination").html(output);

					}// if(rdata.boardlist.length>0)
					else { // 댓글 1개가 있었는데 삭제하는 경우 갯수는 0이라 if문을 수행하지 않고 이곳으로
							// 옵니다.
						// 이곳에서 아래의 두 영역을 없앱니다.

						$('.comment_list').html("아직 등록된 글이 없습니다.");
						$('.comment_tab_list').empty();
					}
				}// success end
			});// ajax end
}// function(getList) end

$(".comment_list")
		.on(
				'click',
				'.comment_tool_button',
				function() {
					var selector = $(this).next();

					if ($(".comment_list").find("div.CommentWriter").css(
							'display') == 'block') {
						console.log(1);
						alert("작업완료후 시도해주세요")
					} else {

						selector.toggle();

						if (selector.css('display') == 'block') {

							$(".LayerMore").not(selector)
									.css('display', 'none');// 선택자외의 layermore은
															// 사라짐
						}
					}

				});
$('.comment_list').on('click', '.LayerMore', function() {
	$(this).hide();

});// 수정이나 삭제 클릭시 layerMore 이 사라짐

function updateForm(num) {
	var content = $('#' + num).find('.text_comment').text();
	var selector = '#' + num + ' .comment_area';
	$(selector).hide();

	selector = $('#' + num);
	selector.append($('.comment_list+.CommentWriter').clone().css('display',
			'block'));

	selector.find('textarea').val(content);

	selector.find('.btn_register').attr('data-id', num).addClass('update')
			.text('수정완료');

	selector.find('.btn_cancel').css('display', 'block').addClass(
			'update_cancel');

	selector.find('.comment_inbox_count').text(content.length + "/50");
}

$('.CommentBox').on('click', '.update', function() {
	console.log("수정완료2")

	$(this).parent().parent().css("display", "none");

	var content = $(this).parent().parent().find('textarea').val();
	if (!content) {
		alert('수정할 내용을 입력하세요');
		return;
	}
	$.ajax({
		url : 'BoardUpdate',
		type : 'post',
		data : {
			event_board_num : $(this).attr('data-id'),
			content : content
		},
		dataType : 'json',
		success : function(rdata) {
			if (rdata == 1) {
				getList(1, 1);
			}
		}

	});

})

function replyform(num, lev, seq, ref) {

	if ($(".comment_list").find("div.CommentWriter").css('display') == 'block') {
		alert('다른 작업 완료 후 선택하세요');

	} else {
		var output = '<li class="CommentItem CommentItem--reply lev' + lev
				+ ' CommentItem-form"></li>'

		var selector = $('#' + num);

		selector.after(output);

		output = $('.comment_list+.CommentWriter').clone().css("display",
				"block");

		$(".CommentBox .LayerMore").css('display', 'none');

		selector.next().html(output);

		selector.next().find('textarea').attr('placeholder', '답글을 남겨보세요');

		selector.next().find('.btn_cancel').css('display', 'block').addClass(
				'reply_cancel');

		selector.next().find('.btn_register').addClass('reply').text('답글완료')
				.attr('data-ref', ref).attr('data-lev', lev).attr('data-seq',
						seq);
		selector.find('a.comment_info_button').hide();
	}
}

$('.CommentBox').on('click', '.reply', function() {

	var content = $(this).parent().parent().find('.comment_inbox_text').val();
	if (!content) {
		alert('답변 내용을 입력하세요');
		return;
	}

	$(this).parent().parent().parent().css("display", "none");

	$.ajax({
		url : 'BoardReply',
		type : 'post',
		data : {
			id : $("#id").val(),
			content : content,
			event_re_lev : $(this).attr('data-lev'),
			event_re_ref : $(this).attr('data-ref'),
			event_re_seq : $(this).attr('data-seq'),
		},
		success : function(rdata) {
			if (rdata == 1) {
				getList(1, 1);
			}
		}

	})

})
$('.CommentBox').on(
		'click',
		'.reply_cancel',
		function() {
			$(this).parent().parent().parent().prev().find(
					'a.comment_info_button').show();
			$(this).parent().parent().parent().remove();

		});
$('.CommentBox').on('click', '.update_cancel', function() {

	var num = $(this).next().attr('data-id');
	var selector = '#' + num;

	$(selector + ' .CommentWriter').remove();

	$(selector + '>.comment_area').css('display', 'block');

});

getList(1, 1)