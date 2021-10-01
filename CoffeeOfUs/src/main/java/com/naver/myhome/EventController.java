package com.naver.myhome;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naver.myhome.domain.AttendCheckMember;
import com.naver.myhome.service.EventService;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping(value="/event")
public class EventController {
	
	@Autowired
	private EventService eventservice;
	
	private static final Logger logger 
	= LoggerFactory.getLogger(EventController.class);

	@RequestMapping(value = "/attendCheck")
	//@RequestMapping(value="/wrtie",method=RequestMethod.GET)
	public String attendCheck(){
		return "event/attend_check";    
	}
	
	@ResponseBody
	@RequestMapping(value="/attendAdd",method=RequestMethod.POST)
	public Map<String,Integer> attendAdd(@RequestParam("id") String id){
								
		  Map<String,Integer> map= new HashMap<String,Integer>();
		 		  
		 int result = eventservice.add(id);
		  if(result==1) {
			  map.put("result",result);
			  
		  }else {
			logger.info("attendAdd 실패했습니다.");  
		  }
		  return map;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/attendList",method=RequestMethod.POST)
	public List<AttendCheckMember> attendList(@RequestParam("id") String id){
								
		List<AttendCheckMember> list= new ArrayList<>();
		 	  
		 list = eventservice.getList(id);
		 
		  logger.info("12");
		  return list;
		
	}
	@ResponseBody
	@RequestMapping(value="/isCheck",method=RequestMethod.POST)
	public  HashMap<String,Object> isCheck(@RequestParam("id") String id){
		 
		Date today = new Date();
	 	 SimpleDateFormat format= new SimpleDateFormat("YYYY-MM-dd");
		String attenddate= (String)format.format(today);
		
		logger.info("attend:" + attenddate);
		AttendCheckMember member = eventservice.isCheck(id,attenddate);
		
		HashMap<String,Object> map= new HashMap<String,Object>();
		map.put("member",member);
		return map;
		
	}
	@ResponseBody
	@RequestMapping(value="/attendCount",method=RequestMethod.POST)
	public  HashMap<String,Object> attendCount(@RequestParam("id") String id,
			@RequestParam("year") String year,
			@RequestParam("month") String month){
		 int nyear= Integer.parseInt(year);
		 int nmonth=Integer.parseInt(month);
		 String start="";
		 String end="";
		   if(nmonth<10) {
			 start= nyear + "-" + "0"+nmonth + "-" +"01";			 
			 end=  nyear + "-" + "0"+nmonth + "-" +"31";
		   }else {
			   start= nyear + "-" + nmonth + "-" +"01";			 
				 end=  nyear + "-" + nmonth + "-" +"31";
		   }
		 logger.info("start:" + start);	
		 logger.info("end:" + end);
		int count = eventservice.attendCount(id,start,end);
		
		logger.info("count:" + count);
		HashMap<String,Object> map= new HashMap<String,Object>();
		map.put("count",count);
		return map;
		
	}
	
}
