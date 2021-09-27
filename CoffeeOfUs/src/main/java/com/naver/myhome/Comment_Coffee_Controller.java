package com.naver.myhome;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naver.myhome.domain.Comment_Coffee;

import com.naver.myhome.service.Comment_Coffee_Service;


@Controller
@RequestMapping(value = "/comment_coffee")
public class Comment_Coffee_Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(Comment_Coffee_Controller.class);
	
	
	@Autowired
	private Comment_Coffee_Service commentService;
	
	/*
	@ResponseBody와 jackson을 이용하여 JSON 사용하기
 */

@ResponseBody
@PostMapping(value="/list")
public Map<String,Object> CommnetList(int COFFEE_NUM,	int page){
	List<Comment_Coffee> list = commentService.getCommentList(COFFEE_NUM, page);
	int listcount = commentService.getListCount(COFFEE_NUM);
	Map<String, Object> map = new HashMap<String,Object>();
	map.put("list", list);
	map.put("listcount", listcount);
	return map;
}

@PostMapping(value ="/add")
public void CommentAdd(Comment_Coffee co, HttpServletResponse response) throws Exception{
	int ok =commentService.commentsInsert(co);
	response.getWriter().print(ok);
}

@PostMapping(value ="/delete")
public void CommentDelete(int num, HttpServletResponse response) throws Exception{
							//int num => Integer.parseInt(request.getParameter("num"))
	int result =commentService.commentsDelete(num);
	response.getWriter().print(result);
}

@PostMapping(value ="/update")
public void CommentUpdate(Comment_Coffee co, HttpServletResponse response) throws Exception{
	int ok =commentService.commentsUpdate(co);
	response.getWriter().print(ok);
}
	
	
	
}
