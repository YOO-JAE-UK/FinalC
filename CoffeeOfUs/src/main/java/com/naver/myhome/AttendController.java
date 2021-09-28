package com.naver.myhome;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping(value="/event")
public class AttendController {
	
	
	private static final Logger logger 
	= LoggerFactory.getLogger(AttendController.class);
	@RequestMapping(value = "/attendCheck")
	//@RequestMapping(value="/wrtie",method=RequestMethod.GET)
	public String attendCheck(){
		return "event/attend_check";    
	}
	
}
