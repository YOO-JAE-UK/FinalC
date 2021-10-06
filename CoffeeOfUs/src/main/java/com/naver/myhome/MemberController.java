//210924.금
package com.naver.myhome;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.myhome.domain.Email;
import com.naver.myhome.domain.MailVO;
import com.naver.myhome.domain.Member;
import com.naver.myhome.service.MemberService;
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
	 

	/*
	 * @CookieValue(value="saveid", required=false) Cookie readCookie 
	 * 이름이 saveid인 쿠키를 Cookie 타입으로 전달받습니다.
	 * 지정한 이름의 쿠키가 존재하지 않을 수도 있기 때문에 required=false로 설정해야 합니다.
	 * 즉, id 기억하기를 선택하지 않을 수도 있기 때문에 required=false로 설정해야 합니다. 
	 * required=true 상태에서 지정한 이름을 가진 쿠키가 존재하지 않으면 스프링 MVC는 익셉션을 발생시킵니다.
	 */
	// http://localhost:8088/myhome/member/loginForm
	// 로그인 폼이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(ModelAndView mv, 
			@CookieValue(value = "saveid", required = false) Cookie readCookie
			) {
		if (readCookie != null) {
			mv.addObject("saveid", readCookie.getValue());
			logger.info("cookie time=" + readCookie.getMaxAge());
		}
		mv.setViewName("member/loginForm"); // WEB-INF/views/member/loginForm.jsp
		return mv;
	}
	
	
	// http://localhost:8088/myhome4/member/joinForm
	// 회원가입 폼 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "member/joinForm"; // WEB-INF/views/member/joinForm.jsp
	}
	
	
	// 회원가입폼에서 아이디 중복 검사
	@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
	// 파라미터 값과 String id 변수 이름이 같으면 생략가능 (delete에 생략함)
	public void idcheck(@RequestParam("id") String id, 
						HttpServletResponse response) throws Exception {
		int result = memberservice.isId(id);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}	
	
	
	// 로그인 처리
	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public String loginProcess(@RequestParam("id") String id, @RequestParam("password") String password,
			@RequestParam(value = "remember", defaultValue = "", required = false) String remember,
			HttpServletResponse response, HttpSession session, RedirectAttributes rattr) {

		int result = memberservice.isId(id, password);
		logger.info("결과 : " + result);
          int mailresult = memberservice.verifyKeyCheck(id);
		if (result == 1 && mailresult==1) {
			// 로그인 성공
			session.setAttribute("id", id);
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
	
	
	
	// 회원가입처리
	@RequestMapping(value = "/joinProcess", method = RequestMethod.POST)
	public String joinProcess(Member member, 
	   @RequestParam("tel_1") String tel1,
	   @RequestParam("tel_2") String tel2,
	   @RequestParam("tel_3") String tel3,
	   RedirectAttributes rattr, 
	   Model model, 
	   HttpServletRequest request) throws Exception {
		
		String user_phone=tel1+"-" + tel2+"-"+tel3;
		
		member.setUSER_PHONE(user_phone);
		//비밀번호 암호화 추가
		//String encPassword = passwordEncoder.encode(member.getUSER_PASS());
		//logger.info(encPassword);
		//member.setUSER_PASS(encPassword);
		int result = memberservice.insert(member);
		
		String key = getKey(50,false);
		int mail_result=memberservice.email_insert(member.getUSER_ID(),member.getUSER_EMAIL(),key);
		
		// result=0;
	/*
	 * 스프링에서 제공하는 RedirectAttributes는 기존의 Servlet에서 사용되던 response.sendRedirect()를
	 * 사용할 때와 동일한 용도로 사용합니다. 리다이렉트로 전송하면 파라미터를 전달하고자 할 때 addAttribute()나
	 * addFlashAtribute()를 사용합니다. 예) response.sendRedirect("/test?result=1"); =>
	 * rattr.addAttribute("result",1)"
	 */
			
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
	public ModelAndView memberList(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "limit", defaultValue = "3", required = false) int limit, ModelAndView mv,
			@RequestParam(value = "search_field", defaultValue = "-1", required = false) int index,
			@RequestParam(value = "search_word", defaultValue = "", required = false) String search_word) {
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
			                   RedirectAttributes rattr) {
		
		                              // 서비스인플 의 update(Member m)에 들어감
		int result = memberservice.update(member);
		if (result == 1) {
			rattr.addFlashAttribute("result", "updateSucess");
			return "redirect:/board/list";
		} else {
			model.addAttribute("url", request.getRequestURL());
			model.addAttribute("message", "정보 수정 실패");
			return "error/error";
		}
	}
	
	
	// 아이디 찾기
	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public String findId() {
		return "member/findidForm"; // WEB-INF/views/member/findidForm.jsp
	}
		
	// 비밀번호 재확인
	@RequestMapping(value = "/passcheck", method = RequestMethod.GET)
	public String passcheck() {
		return "member/passcheck"; // WEB-INF/views/member/passcheck.jsp
	}
		
	// 비밀번호 변경
	@RequestMapping(value = "/changepass", method = RequestMethod.GET)
	public String changepass() {
		return "member/changepass"; // WEB-INF/views/member/changepass.jsp
	}
	
	
	
	// 회원 탈퇴
	@RequestMapping(value = "/drop_member", method = RequestMethod.GET)
	public String drop_member() {
		return "member/drop_member"; // WEB-INF/views/member/drop_member.jsp
	}
		
	// 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String member_delete(String id) {
		memberservice.delete(id);
		return "redirect:list";
	}
		
		
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String loginout(HttpSession session) {
		session.invalidate();
		return "redirect:login";
	}
	

}
