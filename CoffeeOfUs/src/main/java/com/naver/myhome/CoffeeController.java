package com.naver.myhome;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/coffee")
public class CoffeeController {
	
	private static final Logger logger = LoggerFactory.getLogger(CoffeeController.class);
	
	@RequestMapping(value = "/Test", method = RequestMethod.GET)
	public String Test() {
			return "coffee/Test";
	}
	
	@RequestMapping(value = "/Story", method = RequestMethod.GET)
	public String Story() {
			return "coffee/Story";
	}
	
	@RequestMapping(value = "/Fword", method = RequestMethod.GET)
	public String Fword() {
			return "coffee/Fword";
	}
	
	@RequestMapping(value = "/Beans", method = RequestMethod.GET)
	public String Beans() {
			return "coffee/Beans";
	}
	
	@RequestMapping(value = "/Machine", method = RequestMethod.GET)
	public String Machine() {
			return "coffee/Machine";
	}
	
	@RequestMapping(value = "/Recipes", method = RequestMethod.GET)
	public String Recipes() {
			return "coffee/Recipes";
	}
	
}
