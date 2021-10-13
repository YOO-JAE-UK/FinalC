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

import com.naver.myhome.domain.Board_Qna;
import com.naver.myhome.service.Board_Qna_Service;
import com.naver.myhome.service.Comment_Qna_Service;

@Controller

@RequestMapping(value = "/board_qna")
public class Board_Qna_Controller {

	private static final Logger logger 
	= LoggerFactory.getLogger(Board_Qna_Controller.class);

	@Autowired
	private Board_Qna_Service Board_Qna_Service;

	@Autowired
	private Comment_Qna_Service commentService;

	// savefolder.properties에서 작성한 savefoldername 속성의 값을 String svaeFolder에 주입합니다.

	@Value("${savefoldername}")
	private String saveFolder;

	// 글쓰기
	@GetMapping(value = "/write")
	// @RequestMapping(value="/wrtie",method=RequestMethod.GET)
	public String board_wrtie() {
		return "board_qna/board_write";
	}
	/*
	 * 스프링 컨테이너는 매개변수Board객체를 생성하고 Board객체의 setter 메서드들을 호출하여 사용자 입력값을 설정합니다.매개변수의
	 * 이름과 setter의 property가 일치하면 됩니다.
	 */

	@PostMapping("/add")
	// @RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(Board_Qna board, HttpServletRequest request)
			throws Exception {

		MultipartFile uploadfile = board.getUploadFile();
		
		if (!uploadfile.isEmpty()) {
			String fileName = uploadfile.getOriginalFilename();// 원래 파일명
			board.setQNA_ORIGINAL(fileName);// 원래 파일명 저장
			String saveFolder =
					request.getSession().getServletContext().getRealPath("resources")
					+ "/upload/";
			String fileDBName = fileDBName(fileName, saveFolder);
			logger.info("fileDBName = " + fileDBName);

			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			// 바뀐 파일명으로 저장
			board.setQNA_FILE(fileDBName);
		}
		Board_Qna_Service.insertBoard(board); // 저장 메서드 호출

		return "redirect:list";
	}

	// 450
	private String fileDBName(String fileName, String saveFolder) {
		// 새로운 폴더 이름: 오늘 년+월+일
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR); // 오늘 년도 구합니다.
		int month = c.get(Calendar.MONTH) + 1; // 오늘 월 구합니다.
		int date = c.get(Calendar.DATE); // 오늘 일 구합니다.

		String homedir = saveFolder + year + "-" + month + "-" + date;
		logger.info(homedir);
		File path1 = new File(homedir);
		if (!(path1.exists())) {
			path1.mkdir(); // 새로운 폴더를 생성
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

		// 새로운 파일명
		String refileName = "bbs" + year + month + date + random + "." + fileExtension;
		logger.info("refileName = " + refileName);

		// 오라클 디비에 저장될 파일 명
		// File.separatoror => /
		String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
		logger.info("fileDBName =" + fileDBName);
		return fileDBName;
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView boardList(
			@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			ModelAndView mv) {
		// int result =1/0; 오류뜨게함
		int limit = 10; // 한 화면에 출력할 레코드 갯수

		int listcount = Board_Qna_Service.getListCount(); // 총 리스트 수를 받아옴

		// 총 페이지 수
		int maxpage = (listcount + limit - 1) / limit;

		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등 ...)
		int startpage = ((page - 1) / 10) * 10 + 1;

		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		List<Board_Qna> boardlist = Board_Qna_Service.getBoardList(page, limit); // 리스트를 받아옴

		mv.setViewName("board_qna/board_list");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("boardlist", boardlist);
		mv.addObject("limit", limit);
		return mv;
	}

	// ajax
	@ResponseBody
	@RequestMapping(value = "/list_ajax")
	public Map<String, Object> boardListAjax(
			@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "limit", defaultValue = "10", required = false) int limit) {

		int listcount = Board_Qna_Service.getListCount(); // 총 리스트 수를 받아옴

		// 총 페이지 수
		int maxpage = (listcount + limit - 1) / limit;

		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등 ...)
		int startpage = ((page - 1) / 10) * 10 + 1;

		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		List<Board_Qna> boardlist = Board_Qna_Service.getBoardList(page, limit); // 리스트를 받아옴

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("page", page);
		map.put("maxpage", maxpage);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("listcount", listcount);
		map.put("boardlist", boardlist);
		map.put("limit", limit);
		return map;
	}

	// detail?num=9요청시 파라미터 num의 값을 int num에 저장합니다.
	@GetMapping(value = "/detail")
	public ModelAndView Detail(int num, ModelAndView mv, HttpServletRequest request) {
		
		Board_Qna board = Board_Qna_Service.getDetail(num);
		// board=null //error 페이지 이동 확인하고자 임의로 지정합니다.
		if (board == null) {
			logger.info("상세보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "상세보기 실패입니다.");
		} else {
			logger.info("상세보기 성공");
			int count = commentService.getListCount(num);
			mv.setViewName("board_qna/board_view");
			mv.addObject("count", count);
			mv.addObject("boarddata", board);
		}
		return mv;
	}

	@GetMapping("replyView")
	public ModelAndView BoardReplyView(int num, ModelAndView mv, 
										HttpServletRequest request) {
		Board_Qna board = Board_Qna_Service.getDetail(num);
		if (board == null) {
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "게시판 답변글 가져오기 실패");
		} else {
			mv.addObject("boarddata", board);
			mv.setViewName("board_qna/board_reply");
		}

		return mv;
	}

	@PostMapping("/replyAction")
	public ModelAndView BoardReplyAction(Board_Qna board, ModelAndView mv,
                                          HttpServletRequest request) {
		int result = Board_Qna_Service.boardReply(board);
		if (result == 0) {
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "게시판 답변 처리실패");
		} else {
			// mv.setViewName("redirect:list");
			mv.setViewName("redirect:detail?num=" + board.getQNA_NUM());
		}

		return mv;
	}

	@GetMapping("/modifyView")
	public ModelAndView BoardModifyView(int num, 
			ModelAndView mv, 
			HttpServletRequest request
			) {
		Board_Qna boarddata = Board_Qna_Service.getDetail(num);

		// 글 내용 불러오기 실패한 경우입니다.
		if (boarddata == null) {
			logger.info("수정보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "수정보기 실패입니다.");
			return mv;
		}
		logger.info("(수정)상세보기 성공");
		// 수정 폼 페이지로 이동할 때 원문 글 내용을 보여주기 때문에 boarddata 객체를
		// ModelAndView 객체에 저장합니다.
		mv.addObject("boarddata", boarddata);
		// 글 수정 폼 페이지로 이동하기 위해 경로를 설정합니다.
		mv.setViewName("board_qna/board_modify");
		return mv;
	}

	@PostMapping("/modifyAction") 
	public String boardModifyAction(Board_Qna boarddata, String before_file, 
			String check, Model mv, HttpServletRequest request, 
			RedirectAttributes rattr 
			) throws Exception{
		boolean usercheck =
				Board_Qna_Service.isBoardWriter(boarddata.getQNA_NUM(), boarddata.getQNA_PASS()); 
		String url=""; 
		//비밀번호가 다른 경우
		if(usercheck == false) { 
			rattr.addFlashAttribute("result", "passFail");
		    rattr.addAttribute("num",boarddata.getQNA_NUM()); 
		    return "redirect:modifyView"; 
	    }
						  
		MultipartFile uploadfile = boarddata.getUploadFile(); 
		//String saveFolder =request.getSession().getServletContext().getRealPath("resources") + "/upload/";
						  
		if(check != null && !check.equals("")) {//기존파일 그대로 사용하는 경우입니다.
			logger.info("기존파일 그대로 사용합니다."); 
			boarddata.setQNA_ORIGINAL(check); 
			//<input type="hidden" name="BOARD_FILE" value="${boarddata.BOARD_FILE}"> 
			//위 문장 때문에 board.setBOARD_FILE()값은 자동 저장됩니다. 
		}else {
						  
						  
		   if(uploadfile!=null && !uploadfile.isEmpty()) { 
			   logger.info("파일 변경되었습니다.");
			   //답변글을 수정할 경우 <input type="file" id="upfile" name="uploadfile" > 엘리먼트가 존재하지 않아 
			   //private MultipartFile uploadfile;에서 uploadfile는 null 입니다.
						  
			String fileName = uploadfile.getOriginalFilename();//원래 파일명
			boarddata.setQNA_ORIGINAL(fileName);
						  
			String fileDBName = fileDBName(fileName,saveFolder);
						  
			//transferTo(File path) :업로드한 파일을 매개변수의 경로로 저장합니다. 
			uploadfile.transferTo(new File(saveFolder + fileDBName));
						  
			//바뀐 파일명으로 저장 
			boarddata.setQNA_FILE(fileDBName); 
			}else { //uploadfile.isEmpty() 인경우 - 파일을 선택하지 않은 경우 
				logger.info("선택 파일 없습니다.");
				//<input type="hidden" name="BOARD_FILE" value=${boarddata.BOARD_FILE}"> 
				//위 태그에 값이 있다면 ""로 값을 변경합니다. 
			boarddata.setQNA_FILE(""); 	//""로 초기화 합니다.
			boarddata.setQNA_ORIGINAL(""); //""로 초기화 합니다. 
		}//else end 
	}//else end
						  
	//DAO 에서 수정 메서드 호출하여 수정합니다. 
	int result = Board_Qna_Service.boardModify(boarddata); 
	//수정에 실패한 경우 
	if(result ==0) {
		logger.info("게시판 수정 실패"); 
		mv.addAttribute("url", request.getRequestURL());
		mv.addAttribute("message","게시판 수정 실패"); url="error/error"; 
		}else { //수정 성공의 경우 
			logger.info("게시판 수정 완료"); 
			//수정한 글 내용을 보여주기 위해 글 내용 보기 보기페이지로 이동하기위해 경로를 설정합니다. 
			url = "redirect:detail";
			rattr.addAttribute("num",boarddata.getQNA_NUM());
						  
			//수정 성공한 경우
			//파일 삭제를 위해 추가한 부분 
			//수정 전에 파일이 있고 새로운 파일을 선택한 경우는 삭제할 목록을 테이블에 추가합니다. 
			if(!before_file.equals("") && !before_file.equals(boarddata.getQNA_FILE())) {
				Board_Qna_Service.insert_deleteFile(before_file); 
			} 
		} 
	    return url; 
	}
	@PostMapping("/delete") 
	public String BoardDeleteAction(String BOARD_PASS, int num, 
			Model mv, RedirectAttributes rattr, 
			HttpServletRequest request
            ) throws Exception{ 
		// 글 삭제 명령을 요청한 사용자가 글을 작성한 사용자인지 판단하기 위해 
		// 입력한 비밀번호와 저정된  비밀번호를 비교하여 일치하면 삭제합니다. 
		boolean usercheck = Board_Qna_Service.isBoardWriter(num, BOARD_PASS);
						  
		 //비밀번호 일치하지 않는 경우 
		if(usercheck == false) {
			 rattr.addFlashAttribute("result","passFail"); 
			 rattr.addAttribute("num",num);
			 return "redirect:detail"; 
	    }

		// 비밀번호 일치하는 경우 삭제 처리 합니다. 
		int result = Board_Qna_Service.boardDelete(num);

		// 삭제 처리 실패한 경우 
		if(result==0) { 
			logger.info("게시판 삭제 실패");
			mv.addAttribute("url",request.getRequestURL());
			mv.addAttribute("meesage","삭제 실패");
			return"error/error";
		}

		// 삭제 처리 성공한 경우 -글 목록 보기 요청을 전송하는 부분입니다. 
		logger.info("게시판 삭제 성공");
		rattr.addFlashAttribute("result","deleteSuccess");
		return"redirect:list";
	}

	@PostMapping("/down")
	public void BoardFileDown(String filename,
			HttpServletRequest request, String original, 
			HttpServletResponse response) throws Exception{
						  
		//String savePath = "resources/upload"; 
		//서블릿의 실행 환경 정보를 담고 있는 객체를 리턴합니다.
		ServletContext context = request.getSession().getServletContext(); 
		//String sDownloadPath = context.getRealPath(savePath);
						  
		//String sFilePath = sDownloadPath + "\\" + fileName; 
		// "\" 추가하기 위해 "\\" 사용합니다. 
		//String sFilePath = sDownloadPath + "/" + filename; 
		String sFilePath = saveFolder + "/" + filename; 
		logger.info(sFilePath);
						  
		byte b[] = new byte[4096];
						  
		//sFilePath에 있는 파일의 MimeType을 구해옵니다. 
		String sMimeType =
		context.getMimeType(sFilePath); 
		logger.info("sMimeType>>>" + sMimeType);
						  
		 if(sMimeType ==null) 
			 sMimeType = "application/octet-stream";
						  
		response.setContentType(sMimeType);
						  
		// - 이 부분이 한글 파일명이 깨지는 것을 방지해 줍니다. 
		String sEncoding = new String(original.getBytes("utf-8"),"ISO-8859-1"); 
		//logger.info(sEncoding);
						  
		/*				  
		    Content-Disposition: attachment: 
			브라우저는 해당 Content를 처리하지 않고, 다운로드하게 됩니다.
		*/				  
		response.setHeader("Content-Disposition", "attachment; filename= " 
							+ sEncoding); 
		//Package Explorer- 프로젝트 우 클릭 - Properties - Project facets에서 자바 버전 1.8로 수정 
		try( 
				//웹 브라우저로의 출력 스트림 생성합니다. 
				BufferedOutputStream out2 = 
					new BufferedOutputStream(response.getOutputStream()); 
				//sFilePath로 지정한 파일에 대한 입력 스트림을 생성합니다. 
				BufferedInputStream in = 
						new BufferedInputStream(new FileInputStream(sFilePath));) 
		{ 
			int numRead; 
			//read(b, 0, b.length) : 바이트 배열  b의 0번 부터 b.length 
		    //크기 만큼 읽어옵니다. 
			while ((numRead = in.read(b,0,b.length)) !=	-1) { //읽을 데이터가 존재하는 경우 
				// 바이트 배열 b의 0번 부터 numRead크기 만큼 브라우저로 출력
				out2.write(b,0,numRead); 
			} 
		} catch (Exception e) { 
				e.printStackTrace(); 
		} 
	}
}
