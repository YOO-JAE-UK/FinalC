package com.naver.myhome;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.myhome.domain.Board_Event;
import com.naver.myhome.service.Board_Event_Service;

@Controller
@RequestMapping(value = "/board_event")
public class Board_Event_Controller {

	private static final Logger logger = LoggerFactory.getLogger(Board_Event_Controller.class);

	@Autowired
	private Board_Event_Service board_event_service;

	@RequestMapping(value = "list")
	public String board_list() {
		return "board_event/board_event_list";
	}

	// 글쓰기
	@ResponseBody
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	// @RequestMapping(value="/wrtie",method=RequestMethod.GET)
	public int board_add(Board_Event board) {
		int ok = board_event_service.insertEvent(board);
		return ok;
	}

	@ResponseBody
	@RequestMapping(value = "/getList", method = RequestMethod.POST)
	// @RequestMapping(value="/wrtie",method=RequestMethod.GET)
	public Map<String, Object> getList(@RequestParam(value = "state") int state,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) {
		Map<String, Object> map = new HashMap<String, Object>();

		int listcount = board_event_service.getListCount();
		int limit = 5;
		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / 3) * 3 + 1;
		int endpage = startpage + 3 - 1;
		if (endpage > maxpage)
			endpage = maxpage;

		List<Board_Event> list = board_event_service.getList(state, page, limit);
		map.put("listcount", listcount);
		map.put("list", list);
		map.put("limit", limit);
		map.put("maxpage", maxpage);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("page", page);
		map.put("state", state);
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/BoardUpdate", method = RequestMethod.POST)
	// @RequestMapping(value="/wrtie",method=RequestMethod.GET)
	public int BoardUpdate(Board_Event board) {
		return board_event_service.BoardUpdate(board);
	}

	@ResponseBody
	@RequestMapping(value = "/BoardReply", method = RequestMethod.POST)
	// @RequestMapping(value="/wrtie",method=RequestMethod.GET)
	public int BoardReply(Board_Event board) {
		return board_event_service.BoardReply(board);
	}

	@ResponseBody
	@RequestMapping(value = "/BoardDelete", method = RequestMethod.POST)
	// @RequestMapping(value="/wrtie",method=RequestMethod.GET)
	public int BoardDelete(Board_Event board) {
		return board_event_service.BoardDelete(board);
	}

}
