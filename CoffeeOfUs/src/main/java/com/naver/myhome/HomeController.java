package com.naver.myhome;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.myhome.domain.Board_Tour;
import com.naver.myhome.domain.CRAWLER;
import com.naver.myhome.service.Main_Service;



@Controller
@RequestMapping(value = "main")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private Main_Service Main_Service;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView main(ModelAndView mv) {
		List<CRAWLER> boardlist = Main_Service.getlist();// 리스트를 받아옴
		
		mv.setViewName("main/main");
		mv.addObject("boardlist",boardlist);
		return mv;
	}
	
	@ResponseBody
	@GetMapping(value="/detail_ajax" )
	public Map<String,Object> detail_ajax(
			int CRAWLER_NUM) {
		System.out.println(CRAWLER_NUM);
		CRAWLER crawler= Main_Service.getDetail(CRAWLER_NUM);// 리스트를 받아옴
		Map<String, Object> map = new HashMap<String,Object>();
		
		map.put("crawler", crawler);
		return map;
	}
	
	
	
	
	

	
	

}
