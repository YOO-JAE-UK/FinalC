//210924.금
package com.naver.myhome;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.myhome.MemberController;
import com.naver.myhome.service.MemberService;


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

	
	  @Autowired private MemberService memberservice;
	  
	 /* @Autowired private PasswordEncoder passwordEncoder;
	 */
	/*
	 * @Autowired private 
	 * SendMail sendMail;
	 */

	/*
	 * @CookieValue(value="saveid", required=false) Cookie readCookie 
	 * 이름이 saveid인 쿠키를 Cookie 타입으로 전달받습니다.
	 * 지정한 이름의 쿠키가 존재하지 않을 수도 있기 때문에 required=false로 설정해야 합니다.
	 * 즉, id 기억하기를 선택하지 않을 수도 있기 때문에 required=false로 설정해야 합니다. 
	 * required=true 상태에서 지정한 이름을 가진 쿠키가 존재하지 않으면 스프링 MVC는 익셉션을 발생시킵니다.
	 */
	// http://localhost:8088/myhome/member/login
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
	
	
	// 로그인 처리
		@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
		public String loginProcess(@RequestParam("id") String id, @RequestParam("password") String password,
				@RequestParam(value = "remember", defaultValue = "", required = false) String remember,
				HttpServletResponse response, HttpSession session, RedirectAttributes rattr) {

			int result = memberservice.isId(id, password);
			logger.info("결과 : " + result);

			if (result == 1) {
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
				//return "redirect:/board/write";
				return "redirect:/board/list";
			} else {
				rattr.addFlashAttribute("result", result);
				return "redirect:login";
			}
		}
	
	
	// http://localhost:8088/myhome4/member/join
	// 회원가입 폼 이동
		@RequestMapping(value = "/join", method = RequestMethod.GET)
		public String join() {
			return "member/joinForm"; // WEB-INF/views/member/joinForm.jsp
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
	
	// 회원정보 변경
		@RequestMapping(value = "/change_member_info", method = RequestMethod.GET)
		public String change_member_info() {
			return "member/change_member_info"; // WEB-INF/views/member/change_member_info.jsp
		}
	
	// 회원 탈퇴
		@RequestMapping(value = "/drop_member", method = RequestMethod.GET)
		public String drop_member() {
			return "member/drop_member"; // WEB-INF/views/member/drop_member.jsp
		}
		
	// 회원의 개인 정보 
		@RequestMapping(value = "/member_info", method = RequestMethod.GET)
		public String member_info() {
			return "member/member_info"; // WEB-INF/views/member/member_info.jsp
		}
		
	

}
