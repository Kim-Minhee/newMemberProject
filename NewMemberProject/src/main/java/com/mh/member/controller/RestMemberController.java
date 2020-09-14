package com.mh.member.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mh.member.service.MemberService;
import com.mh.member.vo.MemberVO;

@RestController
@RequestMapping(value="/member/rest", produces="text/plain;charset=UTF-8")
public class RestMemberController {

	private static final Logger logger = LoggerFactory.getLogger(RestMemberController.class);

	@Autowired
	MemberService memberService;
	
	// import org.springframwork.http.MediaType
	@GetMapping(path="/listJson", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<MemberVO> memberRestListJson() {
		logger.info("RestMemberController_Get_/listJson 실행");
		
		return memberService.memberList();
	}
	
	@GetMapping(path="/listXml", produces=MediaType.APPLICATION_XML_VALUE)
	public List<MemberVO> memberRestListXml() {
		logger.info("RestMemberController_Get_/listXml 실행");
		
		return memberService.memberList();
	}
	
	
	// ajaxTestCheckEmail.jsp에서 바로 실행했을 때
	@GetMapping(path="/checkEmailJson", produces=MediaType.APPLICATION_JSON_VALUE)
	public String checkEmailJson(@RequestParam("email") String email) {
		logger.info("RestMemberController_Get_/checkEmailJson 실행");
		
		logger.info("Client에서 받은 email1 = " + email);
		
		return email;
	}
	
//	@GetMapping(path="/checkEmailJson", produces=MediaType.APPLICATION_JSON_VALUE)
//	public String checkEmailJson() {
//		logger.info("RestMemberController_Get_/checkEmailJson 실행");
//		
//		return "ajaxCheckEmail";
//	}
	
	@PostMapping(path="/checkEmailJson", produces=MediaType.APPLICATION_JSON_VALUE)
	public int checkEmailPostJson(@RequestParam("email") String email) {
		logger.info("RestMemberController_Post_/checkEmailPostJson 실행");
		
		logger.info("Client에서 보내온 값은 = " + email);
		// Client에서 보내온 email을 바탕으로
		// Service에서 있는지 체크해보고
		// 있으면?
		// 없으면?
		// 그냥 return하면 200인데..
		
		MemberVO checkMember = memberService.checkEmail(email);
		
		if ( checkMember==null ) {
			logger.info("중복되는 아이디 없음");
			return 0;
		} else {
			logger.info("중복되는 아이디 있음");
			return 1;
		}
		
	}
	
		// 강사님
	   @GetMapping(path="/checkIdDup" , produces = MediaType.APPLICATION_JSON_VALUE)
	   public String checkIdDup(@RequestParam("email") String email) { 
	   
	      
	      logger.info("-----------------");
	      logger.info("Client에서 보내온 값은 === " + email);
	      // client에서 보내온 email을 바탕으로 
	      // Service 에서 있는지 체크해보고... 
	      // 있으면 ???
	      // 없으면 ??? 
	      // 그냥 return 하면 200OK인데.. text를 구분해서 보내야 하나?
	      MemberVO member = memberService.checkIdDup(email);
	      if (member == null) { 
	         // 못찾았음... login과 반대
	         return "0"; // 못찾았음.
	      } else { 
	         return "1"; // 찾았음.. 중복임.. 아이디 바꿔야함.
	      }
	   }
	
}
