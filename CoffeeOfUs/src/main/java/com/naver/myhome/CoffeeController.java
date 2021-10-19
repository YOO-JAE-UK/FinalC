package com.naver.myhome;



import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.naver.myhome.domain.Bean;
import com.naver.myhome.domain.Coffee;
import com.naver.myhome.service.Coffee_Bean_Service;
import com.naver.myhome.service.Coffee_Service;


@Controller
@RequestMapping(value = "/coffee")
public class CoffeeController {
	
	private static final Logger logger = LoggerFactory.getLogger(CoffeeController.class);
	
	@Autowired
	private Coffee_Service Coffee_Service;
	
	@Autowired
	private Coffee_Bean_Service Coffee_Bean_Service;
	
	//savefolder.properties에서 작성한 savefoldername 속성의 값을 String svaeFolder에 주입합니다.
	//	@Value("${savefoldername}")
	//	private String saveFolder;
		
		@Value("#{folder['savefoldername']}")
		private String saveFolder;
	
	@RequestMapping(value = "/Test", method = RequestMethod.GET)
	public String Test() {
			return "coffee/Test";
	}
	//ajax
	@ResponseBody
	@PostMapping(value="/coffee_test" )
	public Map<String,Object> coffee_test(String cake, String apple, String roasting) {
	//	List<Board_Tour> boardlist = Board_Tour_Service.getBoardList(sido);// 리스트를 받아옴
		Bean board = Coffee_Bean_Service.getDetail(cake, apple, roasting);
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("board", board);		
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
	public ModelAndView Beans(
			@RequestParam(value="page",defaultValue = "1",required=false) int page,
			@RequestParam(value="search_text",defaultValue = "",required=false)String search_text,
			
			ModelAndView mv) {
		int limit =12; //한 화면에 출력할 레코드 갯수
		
		int listcount = Coffee_Bean_Service.getListCount(search_text); //총 리스트 수를 받아옴
		//총 페이지 수
		
		int maxpage = (listcount + limit -1) / limit;

		//현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등 ...)
		int startpage =((page - 1) / 10) *10 +1;

		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = startpage +10 - 1;
		
		if(endpage > maxpage)
			endpage = maxpage;
		
		List<Bean> boardlist = Coffee_Bean_Service.getList(page, limit,search_text);// 리스트를 받아옴
				
				mv.setViewName("coffee/Beans");
				mv.addObject("page",page);
				mv.addObject("maxpage",maxpage);
				mv.addObject("startpage",startpage);
				mv.addObject("endpage",endpage);
				mv.addObject("listcount",listcount);
				mv.addObject("boardlist",boardlist);
				mv.addObject("limit",limit);
		return mv;
	}  
	
	@RequestMapping(value = "/Beans_write", method = RequestMethod.GET)
	public String Beans_write() {
			return "coffee/Beans_write";
	}  
	
	@PostMapping(value = "bean_add")
	public String add(Bean bean) throws Exception {
			
			MultipartFile uploadfile = bean.getUploadfile();

			if(!uploadfile.isEmpty()) {
				String fileName = uploadfile.getOriginalFilename();//원래 파일명
				bean.setBEAN_ORIGINAL(fileName);//원래 파일명 저장
				String fileDBName = fileDBName(fileName, saveFolder);
				logger.info("fileDBName = " +fileDBName);
				
				// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
				uploadfile.transferTo(new File(saveFolder + fileDBName));
				// 바뀐 파일명으로 저장			
				bean.setBEAN_FILE(fileDBName); 	
			}
			
			
			Coffee_Bean_Service.add(bean); //저장 메서드 호출
			
				return "redirect:Beans";
		}
	
	//450
			private String fileDBName(String fileName, String saveFolder) {
				// 새로운 폴더 이름 : 오늘 년+월+일
				Calendar c = Calendar.getInstance();
				int year = c.get(Calendar.YEAR); //오늘 년도 구합니다.
				int month = c.get(Calendar.MONTH) + 1; //오늘 월 구합니다.
				int date = c.get(Calendar.DATE); //오늘 일 구합니다.
				
				String homedir = saveFolder + year + "-" + month + "-" +date;
				logger.info(homedir);
				File path1 = new File(homedir);
				if(!(path1.exists())) {
					path1.mkdir(); //새로운 폴더를 생성
				}
				
				// 난수를 구합니다.
				Random r = new Random();
				int random = r.nextInt(100000000);
				
				/**** 확장자 구하기 시작 ****/
				int index = fileName.lastIndexOf(".");
				// 문자열에서 특정 문자열의 위치 값(index)를 반환합니다.
				// indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
				// lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
				// (파일명에 점에 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.)
				logger.info("index = " + index);
				
				String fileExtension = fileName.substring(index + 1);
				logger.info("fileExtension = " + fileExtension);
				/**** 확장자 구하기 끝 ****/
				
				//새로운 파일명
				String refileName = "bbs" + year + month + date + random + "." + fileExtension;
				logger.info("refileName = " + refileName);
				
				// 오라클 디비에 저장될 파일 명
				//File.separatoror => /
				String fileDBName = "/" + year + "-" +month + "-" + date + "/" +refileName;
				logger.info("fileDBName =" + fileDBName);
				return fileDBName;
			}
	
	
	
			@RequestMapping(value = "/bean_detail", method = RequestMethod.GET)
			public ModelAndView bean_detail(int num, ModelAndView mv) {
				
				Bean board = Coffee_Bean_Service.getDetail(num);
				if(board == null) {
					mv.setViewName("error/error");
					mv.addObject("message","상세보기 실패입니다.");
				}			
					mv.setViewName("coffee/Beans_detail");
					mv.addObject("boarddata",board);
							
				return mv; 
			}
			
			
			@GetMapping("/Beans_modify")
			public ModelAndView Beans_modify(int num,
					ModelAndView mv
					) {
				Bean boarddata = Coffee_Bean_Service.getDetail(num);

				//글 내용 불러오기 실패한 경우입니다.
				if(boarddata == null) {
					mv.setViewName("error/error");
					mv.addObject("message","수정보기 실패입니다.");
					return mv;
				}
				mv.addObject("boarddata",boarddata);
				// 글 수정 폼 페이지로 이동하기 위해 경로를 설정합니다.
				mv.setViewName("coffee/Beans_modify");
				return mv;
			}
			
			
			
			@PostMapping("/bean_modifyAction")
			public String boardModifyAction(Bean boarddata, String before_file,
					String check, Model mv, HttpServletRequest request,
					RedirectAttributes rattr
					) throws Exception{
				String url="";
				MultipartFile uploadfile = boarddata.getUploadfile();
				
				//무언인가 있고  AND  ""아닐때
				if(check != null && !check.equals("")) {//기존파일 그대로 사용하는 경우입니다.
					logger.info("기존파일 그대로 사용합니다.");
					boarddata.setBEAN_ORIGINAL(check);
					//<input type="hidden" name="BOARD_FILE" value="${boarddata.BOARD_FILE}">
					//위 문장 때문에 board.setBOARD_FILE()값은 자동 저장됩니다.
				}else {
					
					if(uploadfile!=null && !uploadfile.isEmpty()) {
						logger.info("파일 변경되었습니다.");
						//답변글을 수정할 경우 <input type="file" id="upfile" name="uploadfile" > 엘리먼트가 존재하지 않아
						//private MultipartFile uploadfile;에서 uploadfile는 null 입니다.
					
					String fileName = uploadfile.getOriginalFilename();//원래 파일명
					boarddata.setBEAN_ORIGINAL(fileName);
					
					String fileDBName = fileDBName(fileName,saveFolder);
					
					//transferTo(File path) :업로드한 파일을 매개변수의 경로로 저장합니다.
					uploadfile.transferTo(new File(saveFolder + fileDBName));
					
					//바뀐 파일명으로 저장
					boarddata.setBEAN_FILE(fileDBName);
					}else { //uploadfile.isEmpty() 인경우 - 파일을 선택하지 않은 경우
						logger.info("선택 파일 없습니다.");
						//<input type="hidden" name="BOARD_FILE" value=${boarddata.BOARD_FILE}">
						//위 태그에 값이 있다면 ""로 값을 변경합니다.
						boarddata.setBEAN_FILE(""); //""로 초기화 합니다.
						boarddata.setBEAN_ORIGINAL("");//""로 초기화 합니다.
					}//else end
				}//else end	
				//DAO 에서 수정 메서드 호출하여 수정합니다.
				int result = Coffee_Bean_Service.boardModify(boarddata);
				//수정에 실패한 경우
				if(result ==0) {
					mv.addAttribute("message","게시판 수정 실패");
					url="error/error";

				}else { //수정 성공의 경우
					//수정한 글 내용을 보여주기 위해 글 내용 보기 보기페이지로 이동하기위해 경로를 설정합니다.
					url = "redirect:bean_detail";
					rattr.addAttribute("num",boarddata.getBEAN_NUM());
					
					//수정 성공한 경우
						//파일 삭제를 위해 추가한 부분
					//수정 전에 파일이 있꼬 새로운 파일을 선택한 경우는 삭제할 목록을 테이블에 추가합니다.
					if(!before_file.equals("") && !before_file.equals(boarddata.getBEAN_FILE())) {
						Coffee_Bean_Service.insert_deleteFile(before_file);
					}
				}
				return url;
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
