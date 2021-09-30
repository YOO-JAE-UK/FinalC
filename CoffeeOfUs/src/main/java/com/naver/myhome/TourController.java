package com.naver.myhome;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/tour")
public class TourController {
	
	private static final Logger logger = LoggerFactory.getLogger(TourController.class);
	
	@RequestMapping(value = "/tour_view", method = RequestMethod.GET)
	public String board_list() {
			return "tour/tour_view";
	}
	
	@RequestMapping(value = "/tour_map", method = RequestMethod.GET)
	public String tour_map() {
			return "tour/tour_map";
	}
	
	@GetMapping(value = "/tour_board_write")
	public String tour_board_write() {
			return "tour/tour_board_write";
	}
	@RequestMapping(value = "/tour_board_list", method = RequestMethod.GET)
	public String tour_board_list() {
			return "tour/tour_board_list";
	}
}
