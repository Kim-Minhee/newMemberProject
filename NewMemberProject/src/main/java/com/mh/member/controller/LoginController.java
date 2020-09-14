package com.mh.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mh.member.service.MemberService;
import com.mh.member.vo.MemberVO;

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	MemberService memberService;

	// 로그인
	@GetMapping("/auth/login")
	public String authLogin() {
		logger.info("LoginController_Get_/auth/login 실행");
		
		return "auth/loginForm";
	}
	
	@PostMapping("/auth/login")
	public String authLoginPost(HttpServletRequest request, HttpSession session, MemberVO member) {
		logger.info("LoginController_Post_/auth/login 실행");
		
		logger.info("로그인할 member = " + member.toString());
		
//		// url이 잘 왔나?
//		String firstUrl = (String) request.getAttribute("firstUrl");
//		logger.info("로그인 완료 후, 보낼 url = " + firstUrl);
		
		MemberVO loginMember = memberService.authLogin(member);
		if ( loginMember!=null ) {
			logger.info("로그인 성공");
			
			session.setAttribute("loginMember", loginMember);
			// 로그인 성공 화면에 보이고 3초후 list로
			return "redirect:../member/list";
		} else {
			logger.info("로그인 실패");
			
			return "auth/loginFail";
		}
	}
	
	
	// 로그아웃
	@RequestMapping(value="/auth/logout", method = { RequestMethod.GET , RequestMethod.POST})
	public String authLogout(HttpSession session) {
		logger.info("LoginController_request_/auth/logout 실행");
		
		session.invalidate();
		
		return "auth/loginForm";
	}
	
}
