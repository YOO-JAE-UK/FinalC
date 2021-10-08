package com.naver.myhome;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
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

import com.naver.myhome.domain.Board_Tour;
import com.naver.myhome.service.Board_Tour_Service;



@Controller
@RequestMapping(value = "/tour")
public class TourController {
	
	private static final Logger logger = LoggerFactory.getLogger(TourController.class);
	
	@Autowired
	private Board_Tour_Service Board_Tour_Service;
	
	//savefolder.properties에서 작성한 savefoldername 속성의 값을 String svaeFolder에 주입합니다.
	@Value("${savefoldername}")
	private String saveFolder;
	
	@RequestMapping(value = "get_img", method = RequestMethod.GET)
	 public @ResponseBody byte[] GetImage(String name) throws IOException
	 {
	  FileInputStream in = new FileInputStream( new File("C:\\upload"+name));
	  return IOUtils.toByteArray( in );
	 }

	
	@GetMapping(value = "/tour_board_write")
	public String tour_board_write() {
			return "tour/tour_board_write";
	}
	@GetMapping(value = "/tour_board_write_admin")
	public String tour_board_write_admin() {
			return "tour/tour_board_write_admin";
	}
	
	@PostMapping(value = "add")
	public String add(Board_Tour board) throws Exception {
		
		MultipartFile uploadfile = board.getUploadfile();
		board.setUSER_ID("admin");
		board.setUSER_NICKNAME("관리자");
		if(!uploadfile.isEmpty()) {
			String fileName = uploadfile.getOriginalFilename();//원래 파일명
			board.setTOUR_ORIGINAL(fileName);//원래 파일명 저장
			String fileDBName = fileDBName(fileName, saveFolder);
			logger.info("fileDBName = " +fileDBName);
			
			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			// 바뀐 파일명으로 저장			
			board.setTOUR_FILE(fileDBName); 	
		}
		
		
		Board_Tour_Service.add(board); //저장 메서드 호출
		
			return "redirect:tour_board_list";
	}
	
	//admin add
	@PostMapping(value = "add_admin")
	public String add_admin(Board_Tour board, RedirectAttributes rattr) throws Exception {
		
		MultipartFile uploadfile = board.getUploadfile();
		board.setUSER_ID("admin");
		board.setUSER_NICKNAME("관리자");
		if(!uploadfile.isEmpty()) {
			String fileName = uploadfile.getOriginalFilename();//원래 파일명
			board.setTOUR_ORIGINAL(fileName);//원래 파일명 저장
			String fileDBName = fileDBName(fileName, saveFolder);
			logger.info("fileDBName = " +fileDBName);
			
			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			// 바뀐 파일명으로 저장			
			board.setTOUR_FILE(fileDBName); 	
		}
		String result= Board_Tour_Service.isname(board.getTOUR_NAME());
		if(result!=null) { //등록된 글이 있다 =
			rattr.addFlashAttribute("message","exist");
			return "redirect:tour_map";
		}else {
			Board_Tour_Service.add_admin(board); //저장 메서드 호출
			return "redirect:tour_map";
		}
		
		
		
			
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
		
		//관리자 list관리 1만 관리하게 
		@GetMapping(value="/tour_board_manage_list")
		
		public ModelAndView tour_board_manage_list(
				@RequestParam(value="page",defaultValue = "1",required=false) int page,
				ModelAndView mv) {
			int limit =10; //한 화면에 출력할 레코드 갯수
			
			int listcount = Board_Tour_Service.getListCount(); //총 리스트 수를 받아옴
			//총 페이지 수
			
			int maxpage = (listcount + limit -1) / limit;

			//현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등 ...)
			int startpage =((page - 1) / 10) *10 +1;

			//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
			int endpage = startpage +10 - 1;
			
			if(endpage > maxpage)
				endpage = maxpage;
			
			List<Board_Tour> boardlist = Board_Tour_Service.getManage_List(page, limit);// 리스트를 받아옴
					
					mv.setViewName("tour/tour_board_manage_list");
					mv.addObject("page",page);
					mv.addObject("maxpage",maxpage);
					mv.addObject("startpage",startpage);
					mv.addObject("endpage",endpage);
					mv.addObject("listcount",listcount);
					mv.addObject("boardlist",boardlist);
					mv.addObject("limit",limit);
			return mv;
		}	
		
		//ajax 
		@ResponseBody
		@GetMapping(value="/list_map" )
		public Map<String,Object> list_map(
				String sido) {
			List<Board_Tour> boardlist = Board_Tour_Service.getBoardList(sido);// 리스트를 받아옴
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("list_map", boardlist);
			map.put("sido",sido);
			
			return map;
		}
		
		@RequestMapping(value = "/tour_board_list", method = RequestMethod.GET)
		public String tour_board_list() {
				return "tour/tour_board_list";
		}
		//ajax 스크롤내려서 확인하기 미완성
		@ResponseBody
		@GetMapping(value="/tour_board_list1")
		public Map<String, Object> boardListAjax(
				@RequestParam(value="page",defaultValue = "1",required=false) int page
				) {
			
			int listcount = Board_Tour_Service.getListCount(); //관리자(1)빼고 총 리스트 수를 받아옴 
			int limit =  (page*4)+4;
				//총 페이지 수
			//int maxpage = (listcount + limit -1) / limit;
			
				//현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등 ...) 지금은 필요없음
			//int startpage =((page - 1) / 10) *10 +1;
			
				//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...) 지금은 피료없음
			//int endpage = startpage +10 - 1;
			
			//if(endpage > maxpage)					//지금은 피룡업승ㅁ
			//	endpage = maxpage;
			
			List<Board_Tour> boardlist = Board_Tour_Service.getBoardList(page);// 리스트를 받아옴
					
			Map<String, Object> map = new HashMap<String,Object>();
			
			map.put("page",page);
		//	map.put("maxpage",maxpage);
		//	map.put("startpage",startpage);
		//	map.put("endpage",endpage);
			map.put("listcount",listcount);
			map.put("boardlist",boardlist);
			map.put("limit",limit);
			return map;
		}
		
		
		
		
		
	
		//detail?num=9요청시 파라미터 num의 값을 int num에 저장합니다.
		@GetMapping(value="/detail")
		public ModelAndView Detail(int num,ModelAndView mv,
					HttpServletRequest request, HttpSession session) {
			String admin = "admin";
			session.setAttribute("id", admin);
			
			Board_Tour board = Board_Tour_Service.getDetail(num);
			//board=null //error 페이지 이동 확인하고자 임의로 지정합니다.
			if(board == null) {
				logger.info("상세보기 실패");
				mv.setViewName("error/error");
				mv.addObject("url" , request.getRequestURL());
				mv.addObject("message","상세보기 실패입니다.");
			}else {
				logger.info("상세보기 성공");			
				mv.setViewName("tour/tour_board_view");
				mv.addObject("boarddata",board);
			}			
			return mv;
		}
		
		//ajax 
				@ResponseBody
				@GetMapping(value="/list_map_detail" )
				public Map<String,Object> list_map_detail(
						int num) {
					Board_Tour board = Board_Tour_Service.getDetail(num);
					Map<String, Object> map = new HashMap<String,Object>();
					map.put("list_map_detail", board);
					return map;
				}
				//ajax 
				@ResponseBody
				@GetMapping(value="/list_map_detail_one" )
				public Map<String,Object> list_map_detail_one(
						String name) {
					Board_Tour board = Board_Tour_Service.getDetail(name);
					Map<String, Object> map = new HashMap<String,Object>();
					map.put("list_map_detail", board);
					return map;
				}
		
	
		
		@GetMapping("/tour_board_modifyView")
		public ModelAndView BoardModifyView(int num,
				ModelAndView mv,
				HttpServletRequest request
				) {
			Board_Tour boarddata = Board_Tour_Service.getDetail(num);

			//글 내용 불러오기 실패한 경우입니다.
			if(boarddata == null) {
				logger.info("수정보기 실패");
				mv.setViewName("error/error");
				mv.addObject("url",request.getRequestURL());
				mv.addObject("message","수정보기 실패입니다.");
				return mv;
			}
			logger.info("(수정)상세보기 성공");
			int start =boarddata.getTOUR_ADDRESS().indexOf(" ")+1; //띄워쓰기포함된 4가 리턴됨(도당고등학교 검색시)
			int end =boarddata.getTOUR_ADDRESS().indexOf(" ",start); //8리턴
			 
			String sido = boarddata.getTOUR_ADDRESS().substring(start, end);
			// 수정 폼 페이지로 이동할 때 원문 글 내용을 보여주기 때문에 boarddata 객체를
			//ModelAndView 객체에 저장합니다.
			mv.addObject("boarddata",boarddata);
			mv.addObject("sido",sido);
			// 글 수정 폼 페이지로 이동하기 위해 경로를 설정합니다.
			mv.setViewName("tour/tour_board_modify");
			return mv;
		}
		
		
		
		@PostMapping("/modifyAction")
		public String boardModifyAction(Board_Tour boarddata, String before_file,
				String check, Model mv, HttpServletRequest request,
				RedirectAttributes rattr
				) throws Exception{
			String url="";
			MultipartFile uploadfile = boarddata.getUploadfile();
			
			//무언인가 있고  AND  ""아닐때
			if(check != null && !check.equals("")) {//기존파일 그대로 사용하는 경우입니다.
				logger.info("기존파일 그대로 사용합니다.");
				boarddata.setTOUR_ORIGINAL(check);
				//<input type="hidden" name="BOARD_FILE" value="${boarddata.BOARD_FILE}">
				//위 문장 때문에 board.setBOARD_FILE()값은 자동 저장됩니다.
			}else {
				
				if(uploadfile!=null && !uploadfile.isEmpty()) {
					logger.info("파일 변경되었습니다.");
					//답변글을 수정할 경우 <input type="file" id="upfile" name="uploadfile" > 엘리먼트가 존재하지 않아
					//private MultipartFile uploadfile;에서 uploadfile는 null 입니다.
				
				String fileName = uploadfile.getOriginalFilename();//원래 파일명
				boarddata.setTOUR_ORIGINAL(fileName);
				
				String fileDBName = fileDBName(fileName,saveFolder);
				
				//transferTo(File path) :업로드한 파일을 매개변수의 경로로 저장합니다.
				uploadfile.transferTo(new File(saveFolder + fileDBName));
				
				//바뀐 파일명으로 저장
				boarddata.setTOUR_FILE(fileDBName);
				}else { //uploadfile.isEmpty() 인경우 - 파일을 선택하지 않은 경우
					logger.info("선택 파일 없습니다.");
					//<input type="hidden" name="BOARD_FILE" value=${boarddata.BOARD_FILE}">
					//위 태그에 값이 있다면 ""로 값을 변경합니다.
					boarddata.setTOUR_FILE(""); //""로 초기화 합니다.
					boarddata.setTOUR_ORIGINAL("");//""로 초기화 합니다.
				}//else end
			}//else end	
			
			//DAO 에서 수정 메서드 호출하여 수정합니다.
			int result = Board_Tour_Service.boardModify(boarddata);
			//수정에 실패한 경우
			if(result ==0) {
				logger.info("게시판 수정 실패");
				mv.addAttribute("url", request.getRequestURL());
				mv.addAttribute("message","게시판 수정 실패");
				url="error/error";
			}else { //수정 성공의 경우
				logger.info("게시판 수정 완료");
				//수정한 글 내용을 보여주기 위해 글 내용 보기 보기페이지로 이동하기위해 경로를 설정합니다.
				url = "redirect:detail";
				rattr.addAttribute("num",boarddata.getTOUR_NUM());
				
				//수정 성공한 경우
					//파일 삭제를 위해 추가한 부분
				//수정 전에 파일이 있꼬 새로운 파일을 선택한 경우는 삭제할 목록을 테이블에 추가합니다.
				if(!before_file.equals("") && !before_file.equals(boarddata.getTOUR_FILE())) {
					Board_Tour_Service.insert_deleteFile(before_file);
				}
			}
			return url;
		}
		
		
		@PostMapping("/delete")
		public String BoardDeleteAction(int num,
				 RedirectAttributes rattr
				) throws Exception{
			
			int result = Board_Tour_Service.boardDelete(num);
			
			// 삭제 처리 실패한 경우
			if(result==0) {
				logger.info("게시판 삭제 실패");
				rattr.addFlashAttribute("message","deleteFail");
				return "redirect:tour_board_list";
			}
			
			// 삭제 처리 성공한 경우  -글 목록 보기 요청을 전송하는 부분입니다.
			logger.info("게시판 삭제 성공");
			rattr.addFlashAttribute("message","deleteSuccess");
			return "redirect:tour_board_list";
		}
		
		
		
		
	@RequestMapping(value = "/tour_map", method = RequestMethod.GET)
	public String tour_map() {
			return "tour/tour_map";
	}
	

	

}
