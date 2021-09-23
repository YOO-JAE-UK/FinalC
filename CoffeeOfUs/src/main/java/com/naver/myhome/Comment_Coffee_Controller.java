package com.naver.myhome;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/comment_coffee")
public class Comment_Coffee_Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(Comment_Coffee_Controller.class);
	
	//@Autowired
	//private BoardService boardService;
	
	//@Autowired
	//private CommentService commentService;
	
	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public String Test() {
			return "board/board_list";
	}
	
	
	
}
