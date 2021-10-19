
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

import com.naver.myhome.domain.Comment_Qna;
import com.naver.myhome.service.Comment_Qna_Service;

@Controller
@RequestMapping(value = "/comment_qna")
public class Comment_Qna_Controller {

	private static final Logger logger = LoggerFactory.getLogger(Comment_Qna_Controller.class);


	 @Autowired 
	private Comment_Qna_Service commentService;

	@ResponseBody
	@PostMapping(value="/list")
	public Map<String,Object> CommnetList(int QNA_NUM,	int page){
		List<Comment_Qna> list = commentService.getCommentList(QNA_NUM, page);
		int listcount = commentService.getListCount(QNA_NUM);
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("listcount", listcount);
		return map;
	}

	@PostMapping(value ="/add")
	public void CommentAdd(Comment_Qna co, HttpServletResponse response) 
			throws Exception{
		int ok =commentService.commentsInsert(co);
		response.getWriter().print(ok);
	}

	@PostMapping(value ="/delete")
	public void CommentDelete(HttpServletResponse response,
			int num) throws Exception{
			//int num => Integer.parseInt(request.getParameter("num"))
		int result =commentService.commentsDelete(num);
		response.getWriter().print(result);
	}

	@PostMapping(value ="/update")
	public void CommentUpdate(Comment_Qna co, HttpServletResponse response) throws Exception{
		int ok =commentService.commentsUpdate(co);
		response.getWriter().print(ok);
	}

}
