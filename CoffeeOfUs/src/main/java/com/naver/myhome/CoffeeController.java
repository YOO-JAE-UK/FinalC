package com.naver.myhome;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.naver.myhome.domain.Coffee;
import com.naver.myhome.service.Coffee_Service;


@Controller
@RequestMapping(value = "/coffee")
public class CoffeeController {
	
	private static final Logger logger = LoggerFactory.getLogger(CoffeeController.class);
	
	@Autowired
	private Coffee_Service Coffee_Service;
	
	@RequestMapping(value = "/Test", method = RequestMethod.GET)
	public String Test() {
			return "coffee/Test";
	}
	//ajax
	@ResponseBody
	@PostMapping(value="/coffee_test" )
	public Map<String,Object> coffee_test(String cake, String apple, String roasting) {
	//	List<Board_Tour> boardlist = Board_Tour_Service.getBoardList(sido);// 리스트를 받아옴
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("cake", cake);
		map.put("apple",apple);
		map.put("roasting", roasting);
		
		return map;
	}
	
	
	
	@RequestMapping(value = "/Fword", method = RequestMethod.GET)
	public ModelAndView Fword(ModelAndView mv) {
		
		List<Coffee> list = Coffee_Service.getList();
	
	
		mv.setViewName("coffee/Fword");
		mv.addObject("list",list);

			return mv;
	}
	//ajax 해당단어에 맞는 내용을 가져옴
	@ResponseBody
	@PostMapping(value = "/target_word")
	public Map<String,String> target_word(String word) {
		
		String content = Coffee_Service.getword_content(word);
		
		Map<String, String> map = new HashMap<String,String>();
		
		map.put("content",content);
		map.put("word",word);
		return map;
	}
	

	//스프링 컨트롤러 부분
	@RequestMapping(value = "json", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String json( Model model) throws JsonProcessingException { 
		List<Coffee> list = Coffee_Service.getList();
	    String[] array = new String[list.size()];
	    
	    for(int i=0; i< list.size(); i++) {
	    	array[i]= list.get(i).getFWORD_WORD();
	    }
	    
	      //  Gson gson = new Gson(); Gson 사용방법 나는 다른 Json이여서 아래방법씀 직렬화
	    	ObjectMapper mapper = new ObjectMapper();
	   return  mapper.writeValueAsString(array);
	   // return gson.toJson(array);
	}
		
		
		

	@PostMapping(value = "/add_word")
	public String add_word(ModelAndView mv,Coffee coffee, RedirectAttributes rattr) {
		
		coffee.setFWORD_CONSONANT(getch(coffee.getFWORD_WORD()));
		int result = Coffee_Service.add_word(coffee);
		if(result == 1) {
			rattr.addFlashAttribute("message","addFail");
			return "redirect:Fword";
		}else {
			
		}
		rattr.addFlashAttribute("message","addSuccess");
		return "redirect:Fword";
	}
	
	String getch(String text) {
	    String[] chs = { 
	        "ㄱ", "ㄲ", "ㄴ", "ㄷ", "ㄸ", 
	        "ㄹ", "ㅁ", "ㅂ", "ㅃ", "ㅅ", 
	        "ㅆ", "ㅇ", "ㅈ", "ㅉ", "ㅊ", 
	        "ㅋ", "ㅌ", "ㅍ", "ㅎ" 
	    };
			
	    if(text.length() > 0) {
	        char chName = text.charAt(0);
	        if(chName >= 0xAC00)
	        {
	            int uniVal = chName - 0xAC00;
	            int cho = ((uniVal - (uniVal % 28))/28)/21;

	            return chs[cho];
	        }
	    }
	   		
	    return null; 
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
	
	
	@RequestMapping(value = "/Story", method = RequestMethod.GET)
	public String Story() {
			return "coffee/Story";
	}
	
}
