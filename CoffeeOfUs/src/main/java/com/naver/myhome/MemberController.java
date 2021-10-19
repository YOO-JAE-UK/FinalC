//210924.금
package com.naver.myhome;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.naver.myhome.domain.Email;
import com.naver.myhome.domain.MailVO;
import com.naver.myhome.domain.MailVO2;
import com.naver.myhome.domain.Member;
import com.naver.myhome.naverlogin.NaverLoginBO;
import com.naver.myhome.service.MemberService;
import com.naver.myhome.task.EmailSender;
import com.naver.myhome.task.SendMail;


/* Model(값만넣음)- m 담고 String으로리턴
   ModelAndView(값넣고보여줌)- setViewName보여줌, addObject담음  */

/*
 @Component를 이용해서 스프링 컨테이너가 해당 클래스 객체를 생성하도록 설정할 수 있지만
 모든 클래스에 @Component를 할당하면 어떤 클래스가 어떤 역할을 수행하는지 파악하기 
 어렵습니다. 스프링 프레임워크에서는 이런 클래스들을 분류하기 위해서
 @Component를 상속하여 다음과 같은 세 개의 에노테이션을 제공합니다.
 
 1. @Controller - 사용자의 요청을 제어하는 Controller 클래스
 2. @Repository - 데이터 베이스 연동을 처리하는 DAO클래스
 3. @Service - 비지니스 로직을 처리하는 Service 클래스
  
 */
@Controller
@RequestMapping(value = "/member") // http://localhost:8088/myhome/member/로 시작하는 주소 매핑
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	  @Autowired 
	  private MemberService memberservice;
	  
	  @Autowired 
	  private PasswordEncoder passwordEncoder;
	
	  @Autowired 
	  private SendMail sendMail;
	  
	  @Autowired
	  private EmailSender emailSender;
			  
	  private NaverLoginBO naverLoginBO; 
		private String apiResult = null; 
		
		@Autowired 
		private void setNaverLoginBO(NaverLoginBO naverLoginBO) { 
				this.naverLoginBO = naverLoginBO; 
		} 
	  
	  //savefolder.properties에서 작성한 savefoldername 속성의 값을 String svaeFolder에 주입합니다.
	  @Value("#{folder['savefoldername']}")

	  private String saveFolder;
	  


	// http://localhost:8088/myhome/member/loginForm
	// 로그인 폼이동
	@RequestMapping(value = "/login",  method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView login(ModelAndView mv, 
			@CookieValue(value = "saveid", required = false) Cookie readCookie,HttpSession session
			) {
		if (readCookie != null) {
			mv.addObject("saveid", readCookie.getValue());
			logger.info("cookie time=" + readCookie.getMaxAge());
		}
		
		System.out.println("여기는 네이버 로그인");
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */ 
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session); 
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************& 
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=
		//  e68c269c-5ba9-4c31-85da-54c16c658125 
		//
		System.out.println("네이버:" + naverAuthUrl); 
		mv.addObject("url",naverAuthUrl);
		mv.setViewName("member/loginForm"); // WEB-INF/views/member/loginForm.jsp
		return mv;
	}
	
@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST }) 
	
	public String callback(Model model, 
							@RequestParam String code, 
			    			@RequestParam String state, 
			    			HttpSession session)  throws IOException, ParseException { 
		
		System.out.println("여기는 callback"); 
		OAuth2AccessToken oauthToken; 
		oauthToken = naverLoginBO.getAccessToken(session, code, state); 
		
		//1. 로그인 사용자 정보를 읽어온다. 
		apiResult = naverLoginBO.getUserProfile(oauthToken); 
		//String형식의 json데이터 
		
			/** apiResult json 구조 
			   {"resultcode":"00", 
			   "message":"success", 
			   "response":{"id":"33666449",
			   				"nickname":"shinn****",
			   				"age":"20-29",
			   				"gender":"M",
			   				"email":"sh@naver.com",
			   				"name":"\uc2e0\ubc94\ud638"}} **/ 
		System.out.println("apiResult:"+ apiResult);
		//2. String형식인 apiResult를 json형태로 바꿈 
		JSONParser parser = new JSONParser(); 
		Object obj = parser.parse(apiResult); 
		JSONObject jsonObj = (JSONObject) obj; 
		
		//3. 데이터 파싱 
		//Top레벨 단계 _response 파싱 
		JSONObject response_obj = (JSONObject)jsonObj.get("response"); 
		//response의 nickname값 파싱
		String id = (String)response_obj.get("id"); 
		String email = (String)response_obj.get("email"); 
		String name = (String)response_obj.get("name"); 
		
		System.out.println(id); 
		
		//4.파싱 닉네임 세션으로 저장 
		session.setAttribute("id",id); //세션 생성 
		session.setAttribute("name", name);
		Member member= new Member();
		member.setUSER_ID(id);
		member.setUSER_EMAIL(email);
		member.setUSER_NAME(name);
	    int data=memberservice.isEmail(email);
		if(data!=1) {
		memberservice.insert(member);
		}
		model.addAttribute("result", apiResult); 
		return "main/main"; 
	}
	
	// 로그인 처리
	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public String loginProcess(
			@RequestParam("id") String id, 
			@RequestParam("password") String password,
			@RequestParam(value = "remember", defaultValue = "", required = false) 
			String remember,
			HttpServletResponse response,
			HttpSession session, 
			RedirectAttributes rattr) {

		int result = memberservice.isId(id, password);
		String nickname = memberservice.Nickname(id);
		logger.info("결과 : " + result);
          int mailresult = memberservice.verifyKeyCheck(id);
		if (result == 1 && mailresult==1) {
			// 로그인 성공
			session.setAttribute("id", id);
			session.setAttribute("name", nickname);
			logger.info("id =" + id);
			Cookie savecookie = new Cookie("saveid", id);
			if (!remember.equals("")) {
				savecookie.setMaxAge(60 * 60);
				logger.info("쿠키저장 : 60*60");
			} else {
				logger.info("쿠키저장 : 0");
				savecookie.setMaxAge(0);
			}
			response.addCookie(savecookie);
			//return "redirect:/main/main";
			return "redirect:/main/main";  //jsp
		} else {
			rattr.addFlashAttribute("result", result);
			rattr.addFlashAttribute("mailresult", mailresult);
			return "redirect:login";
		}
	}
	
	
	/*
	 * @CookieValue(value="saveid", required=false) Cookie readCookie 
	 * 이름이 saveid인 쿠키를 Cookie 타입으로 전달받습니다.
	 * 지정한 이름의 쿠키가 존재하지 않을 수도 있기 때문에 required=false로 설정해야 합니다.
	 * 즉, id 기억하기를 선택하지 않을 수도 있기 때문에 required=false로 설정해야 합니다. 
	 * required=true 상태에서 지정한 이름을 가진 쿠키가 존재하지 않으면 스프링 MVC는 익셉션을 발생시킵니다.
	 */
	
	// 회원가입폼에서 아이디 중복 검사
	@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
	public void idcheck(@RequestParam("id") String id, 
			HttpServletResponse response) throws Exception {
		int result = memberservice.isId(id);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}	
	
	
	// http://localhost:8088/myhome4/member/joinForm
	// 회원가입 폼 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "member/joinForm"; // WEB-INF/views/member/joinForm.jsp
	}
		
	// 회원가입처리
	@RequestMapping(value = "/joinProcess", method = RequestMethod.POST)
	public String joinProcess(Member member, 
	   @RequestParam("tel_1") String tel1,
	   @RequestParam("tel_2") String tel2,
	   @RequestParam("tel_3") String tel3,
	   RedirectAttributes rattr, 
	   Model model, 
	   HttpServletRequest request) throws Exception {
		
		MultipartFile uploadfile = member.getUploadfile();
		
		if(!uploadfile.isEmpty()) {
			String fileName = uploadfile.getOriginalFilename();//원래 파일명
			member.setUSER_IMG(fileName);//원래 파일명 저장
			logger.info("saveFolder = " + saveFolder);
			String fileDBName = fileDBName(fileName, saveFolder);
			logger.info("fileDBName = " + fileDBName);
			
			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			
			// 바뀐 파일명으로 저장
			member.setUSER_FILE(fileDBName);
		}

		String user_phone=tel1+"-" + tel2+"-"+tel3;
		
		member.setUSER_PHONE(user_phone);
		int result = memberservice.insert(member);
		
		String key = getKey(50,false);
		int mail_result=memberservice.email_insert(member.getUSER_ID(),member.getUSER_EMAIL(),key);
		
	// 삽입이 된 경우
		if (result == 1 && mail_result==1) {
			MailVO vo = new MailVO();
			vo.setTo(member.getUSER_EMAIL());
			vo.setContent(new StringBuffer()
					.append("아이디는 : " + member.getUSER_ID() + "입니다." + "<br>" )
					.append("비밀번호는 : " + member.getUSER_PASS() +"입니다." + "<br>" )
					.append("이름은 : " + member.getUSER_NAME() + "입니다." + "<br>" )
					.append("닉네임은 : " + member.getUSER_NICKNAME() + "입니다." + "<br>" )
			        .append("<a href='http://localhost:8088/myhome/member/emailConfirm?email=")
			        .append(member.getUSER_EMAIL()).append("&key=").append(key)
			        .append("' target='_blenk'>가입 완료를 위해 이메일 이곳을 눌러주세요</a>").toString()); 
			sendMail.sendMail(vo);
			
			rattr.addFlashAttribute("result", "emailSuccess");
			return "redirect:login";
		} else {
			model.addAttribute("url", request.getRequestURL());
			model.addAttribute("message", "회원 가입 실패");
			return "error/error";
		}
	}	
		
	private String fileDBName(String fileName, String saveFolder) {
		// 새로운 폴더 이름 : 오늘 년+월+일
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
	
    //이메일 인증키
	public String getKey(int size, boolean lowerCheck) {
	       int rsize = size;
	       boolean rlowerCheck = lowerCheck;
	        return init(rsize, rlowerCheck);
	    }
	 
	  private String init(int rsize, boolean rlowerCheck) {
	        Random ran = new Random();
	        StringBuffer sb = new StringBuffer();
	        int num = 0;
	        do {
	            num = ran.nextInt(75)+48;
	            if((num>=48 && num<=57) || (num>=65 && num<=90) || (num>=97 && num<=122)) {
	                sb.append((char)num);
	            }else {
	                continue;
	            }
	        } while (sb.length() < rsize);
	        if(rlowerCheck) {
	            return sb.toString().toLowerCase();
	        }
	        return sb.toString();
	    }
	  
	  
	// 회원가입폼에서 닉네임 중복 검사
	@RequestMapping(value = "/nicknamecheck", method = RequestMethod.GET)
	public void nicknamecheck(@RequestParam("nickname") 
	            String nickname, HttpServletResponse response) throws Exception {
	   int result = memberservice.isNickname(nickname);
	   response.setContentType("text/html;charset=utf-8");
	   PrintWriter out = response.getWriter();
	   out.print(result);
	}		
		
	// 회원가입폼에서 이메일 중복 검사
	@RequestMapping(value = "/emailcheck", method = RequestMethod.GET)
	public void emailcheck(@RequestParam("email") 
	            String email, HttpServletResponse response) throws Exception {
		int result = memberservice.isEmail(email);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}	
		
	// 회원가입 이메일 인증 
	@RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(@RequestParam("email") String email, 
			                   @RequestParam("key") String key,
		RedirectAttributes rattr, HttpServletResponse response) throws Exception {
		Email remail=memberservice.emailverify(email,key);
		if(remail !=null ) {
			memberservice.updateKey(email);
			rattr.addFlashAttribute("result", "joinSuccess");
			return "redirect:login";
		}else {
			return "error/error";
		}
	}	
	
	/*
	 * 1. header.jsp에서 이동하는 경우 href="${pageContext.request.contextPath}/member/list"
	 * 2. memberList.jsp에서 이동하는 경우 <a
	 * href="list?page=2$search_field=-1&search_word=" class="page-link">2</a>
	 */
	//관리자용 회원 목록 보기
	@RequestMapping(value = "/list")
	public ModelAndView memberList(
			@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "limit", defaultValue = "3", required = false) int limit, 
			ModelAndView mv,
			@RequestParam(value = "search_field", defaultValue = "-1", required = false) int index,
			@RequestParam(value = "search_word", defaultValue = "", required = false) String search_word
			) {
		List<Member> list = null;
		int listcount = 0;

		list = memberservice.getSearchList(index, search_word, page, limit);
		listcount = memberservice.getSearchListCount(index, search_word);

		// 총 페이지 수
		int maxpage = (listcount + limit - 1) / limit;

		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = ((page - 1) / 10) * 10 + 1;

		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		mv.setViewName("member/memberList");  //jsp
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("memberlist", list);
		mv.addObject("search_field", index);
		mv.addObject("search_word", search_word);
		return mv;
	}
	
	// 회원의 개인 정보 
	@RequestMapping(value = "/member_info", method = RequestMethod.GET)
	public ModelAndView member_info(@RequestParam("id") String id, 
									ModelAndView mv, 
									HttpServletRequest request) {
		Member m = memberservice.member_info(id);
		// m=null; //오류 확인하는 값
		if (m != null) {
			mv.setViewName("member/member_info"); // jsp주소
			mv.addObject("memberinfo", m);
		} else {
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "해당 정보가 없습니다.");
			mv.setViewName("error/error");
		}
		return mv;
	}	
	// 회원의 개인 정보 이미지 미리보기
	@RequestMapping(value = "get_img", method = RequestMethod.GET)
    public @ResponseBody byte[] GetImage(String name) throws IOException{
     FileInputStream in = new FileInputStream( new File("C:\\upload"+name));
     return IOUtils.toByteArray( in );
    }
	
	//정보수정폼 
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView member_update(HttpSession session,
			                          ModelAndView mv) {
		String id = (String) session.getAttribute("id");
		if(id==null) {
			mv.setViewName("redierect:login");
		}else {
			Member m = memberservice.member_info(id);
			mv.setViewName("member/update"); // WEB-INF/views/member/update.jsp
			mv.addObject("memberinfo", m);
		}
		return mv;
	}
	
	//수정처리
	@RequestMapping(value = "/updateProcess", method = RequestMethod.POST)
	                             // 커맨드 객체
	public String updateProcess(Member member, Model model,
			                   HttpServletRequest request,
			                   RedirectAttributes rattr, 
			                   String check) throws Exception {
		                              // 서비스인플 의 update(Member m)에 들어감
		
		MultipartFile uploadfile = member.getUploadfile();
		logger.info("수정오류 확인" +member.getUSER_ADDRESS());
		logger.info("수정오류 확인" +member.getUSER_ADDRESS_POST());
		logger.info("수정오류 확인" +member.getUSER_EMAIL());
		logger.info("수정오류 확인 file : " +member.getUSER_FILE());
		logger.info("수정오류 확인" +member.getUSER_ID());
		logger.info("수정오류 확인 img : " +member.getUSER_IMG()); //original
		logger.info("수정오류 확인" +member.getUSER_NAME());
		logger.info("수정오류 확인" +member.getUSER_NICKNAME());
		logger.info("수정오류 확인 pass : " +member.getUSER_PASS());
		if (check != null && !check.equals("")) { // 기존파일 그대로 사용하는 경우입니다.  	
	        logger.info("기존파일 그대로 사용합니다.");
	        member.setUSER_IMG(check);
	        //<input type="hidden" name="BOARD_FILE" value="${boarddata.BOARD_FILE}>
	        //jsp의 위 문장 때문에 board.setBOARD_FILE()값은 자동 저장됩니다.
	} else {
		  if(uploadfile != null && !uploadfile.isEmpty()) { 
		String fileName =  uploadfile.getOriginalFilename(); 
		member.setUSER_IMG(fileName);

		  String fileDBName = fileDBName(fileName, saveFolder);
		  logger.info("fileDBName = " + fileDBName);
		  
		  // transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
		  uploadfile.transferTo(new File(saveFolder + fileDBName));
		   member.setUSER_FILE(fileDBName); 
		   } else {
			  member.setUSER_FILE("");
			  member.setUSER_IMG("");
		   }
	}
		  
		int result = memberservice.update(member);
		if (result == 1) {
			rattr.addFlashAttribute("result", "updateSuccess");
			rattr.addAttribute("id", member.getUSER_ID());
			return "redirect:/member/member_info";
		} else {
			model.addAttribute("url", request.getRequestURL());
			model.addAttribute("message", "정보 수정 실패");
			return "error/error";
		}
	}
	
	// 로그인시 id/pw찾기 버튼 클릭시 아이디 찾기 페이지로 이동
	@RequestMapping(value = "/findId", method = {RequestMethod.GET, RequestMethod.POST})  
	public String findId() throws Exception{
		return "member/findidForm"; // WEB-INF/views/member/findidForm.jsp
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/findIdProcess", method = {RequestMethod.GET, RequestMethod.POST})
	public String findIdProcess(
			RedirectAttributes rattr, 
			@RequestParam("findemail") String email,
			Model md) {
		logger.info("아이디 찾기 findIdProcess");
		md.addAttribute("id", memberservice.findId(email));
		md.addAttribute("rr", "findid_IdFail");
		
		return "/member/findidForm";
	}
	
	
	// 비밀번호 찾기 이메일 
	@RequestMapping(value = "/findpwProcess", method = RequestMethod.POST) 
	  public String findpwProcess(
			   @RequestParam("id") String id,
			   @RequestParam("email") String email,
			   RedirectAttributes rattr, 
			   Model model, 
			   HttpServletRequest request) throws Exception {
	
		Member member=memberservice.findpass_email(id, email);     
			        
	     // 아이디와 메일이 맞는 경우
		if (member != null) { 
				MailVO2 vo = new MailVO2();
				vo.setTo(email);
				vo.setContent(new StringBuffer()
					.append(id + " 님의 " + "<br>" )
					.append("비밀번호는 : " + member.getUSER_PASS() +" 입니다." + "<br>" )
			        .append("<a href='http://localhost:8088/myhome/member/login?email=")
			        .append("' target='_blenk'>로그인을 위해 이곳을 눌러주세요</a>").toString()); 
				emailSender.emailSender(vo);
				rattr.addFlashAttribute("result", "findpass_EmailSuccess");
		}else {
			rattr.addFlashAttribute("result", "findpass_EmailFail");
			return "redirect:findId";
		}
		return "redirect:login";
	  }
	 
	
	// 비밀번호 변경
	@RequestMapping(value = "/changepass", method = RequestMethod.GET)
	public String changepass() {
		return "member/changepass"; // WEB-INF/views/member/changepass.jsp
	}
	
	@RequestMapping(value = "/changepassProcess", method = RequestMethod.POST)
	public String changepassProcess(
		@RequestParam("id") String id, 
		@RequestParam("curpass") String pass,
		@RequestParam("newpass") String newpass) {
		int result=memberservice.isId(id, pass);
		
		logger.info("비밀번호 변경 changepassProcess");
		logger.info("result="+ result);
		if(result==1) {
			memberservice.changepass(id,newpass);
			
			return "redirect:member_info?id="+id; 
		}else {
			logger.info("비밀번호 변경 실패");
			return "member/changepass";
		}
	}
	
	//비밀번호 체크
	@ResponseBody	
	@RequestMapping(value="/passCheck", method = RequestMethod.POST)
		public String passCheck(
				@RequestParam("USER_ID") String id,
				@RequestParam("USER_PASS") String pass) throws JsonProcessingException {
			int result = memberservice.isId(id);
			ObjectMapper mapper = new ObjectMapper();
			String none =""+result;
			return mapper.writeValueAsString(none);
		}
	
	
		
	// 회원 탈퇴 jsp 페이지 이동
	@RequestMapping(value = "/drop", method = RequestMethod.GET)
	public String drop () {
		return "member/drop";
	}
	    
	// 회원 탈퇴 처리
	@RequestMapping(value = "/dropProcess", method = RequestMethod.POST)
	public String dropProcess (
		 String USER_ID, 
		 String USER_PASS,
		HttpSession session,
		RedirectAttributes redirectAttr, 
		RedirectAttributes rattr) {
		
		int result=memberservice.isId(USER_ID, USER_PASS);
	
		if(result==1) {
			memberservice.delete(USER_ID);
			logger.info("탈퇴 성공, 세션값 무효화 성공");
			redirectAttr.addFlashAttribute("message", "성공적으로 탈퇴했습니다.");
			//세션 삭제
			session.invalidate();

			rattr.addFlashAttribute("message", "abc");
			return "redirect:../main/main";
		}else {
			redirectAttr.addFlashAttribute("message", "탈퇴 실패했습니다.");
			logger.info("탈퇴 실패");
			return "member/drop";

		}
	}
		
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String loginout(HttpSession session) {
		session.invalidate();
		return "redirect:login";
	}
	

}
