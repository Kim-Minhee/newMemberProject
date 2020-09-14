package com.mh.member.controller;

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
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService memberService;	// MemberService 쓰고 싶어... -> 자동으로 new 해주는 autowired
	
	// 1) @Controller Annotation 추가 (import org.springframework.stereotype.Controller;)
	// 2) URL 설정 (Get or Post or both )
	// 		- Get만 지정 : @GetMapping
	// 		- Post만 지정 : @PostMapping
	// 		- 둘 다 지정 : @RequestMapping
	//	/member/list -> full URL은 "htt://localhost:9999/member/list"
	// 	( * URL에 공통인 부분들이 있으면 그것만 뺄 수도 있음... )
	
	// 전체 목록
//	@RequestMapping(value = "/member/list", method = RequestMethod.GET)
	@GetMapping("/member/list")
	public String memberList(Model model) {
		logger.info("MemberController_Get_/member/list 실행");
		// 3-1) DB 접속 필요 여부 확인 -> 필요하다면... Service 모듈, Repository-DAO, DTO 만들어야 됨
		// 3-2) 출력 화면 필요 여부 확인 -> 필요하다면... views 폴더 아래에 JSP 만들어야 됨
		//	둘 다 필요 없으면... RestFul + Ajax
		
		// DB 접속 필요함
		// Service 모듈 : Repository에 있는 이름과 동일하게 작성... 별도의 transaction 작성... (table 2개 이상 사용하여 연결하는 작업)
		// Repository 모듈 : DAO를 직접 만들지, myBatis를 사용할지...
		//		myBatis를 사용한다면..
		//			- pom.xml에 관련 package를 설정 (spring-jdbc, spring-mybatis, mybatis, hikari, Datasource 등등..)
		//			- root-context.xml에서 DB 관련 설정
		//			- 상세 sql logging을 보려면 별도의  package를 설정
		//			- Mapper interface 만들기
		//			- Mapper.xml 만들기
		
		// DB JDBC Driver : ojdbc6 or ojdbc8 (Oracle 11G XE)
		// Spring-JDBC (Spring 버전을 따라감...)
		// myBatis-JDBC
		// myBatis
		// Hikari CP (JDBC 성능향상을 위해.. Datasource DBCP2)
		// log4jdbc (SQL 실행하게 되면 log4j에 나오게 해주는 클래스)
		
		// DTO : table하고 1:1 Mapping (getter/setter를 편하게 만들게 하기 위해서.. lombok이라는 별도의 class를 사용할 수 있음)
		
		// Service 호출  ( List<MemberVO> 타입으로.. -> DB에서 읽어온 내용은 jsp에서 출력만 하면 되니까 일반 변수에는 담을 필요가 없다!)
		// .jsp에서 값을 꺼내가려면.. sc/session/request라는 곳에 저장을 해두면 꺼낼 수 있었는데.. 지금 만들 controller는 servlet이 아니라서 꺼낼수없음..
		// 그래서 spring에서는 model이라는 이름으로 저장하고 꺼낼 수 있도록 지원함
		model.addAttribute("members", memberService.memberList());
		
		// jsp파일을 리턴함 -> servlet-context.xml에 설정
		// 만약에 화면 출력 따로 필요없다? -> "redirect:/member/list"
		return "memberList";	// full : WEB-INF/views/memberList.jsp
	}
	
	// 회원 가입 (interceptor에서 안 걸리려고 /member 빼줌)
	@GetMapping("/register")
	public String memberRegister() {
		logger.info("MemberController_Get_/member/register 실행");
		
		//return "memberRegister";
		return "memberRegisterAjax";	// 중복 체크 기능 추가
	}
	
	@PostMapping("/register")
	public String memberRegisterPost(Model model, MemberVO member, @RequestParam("mname") String mname) {
		logger.info("MemberController_Post_/member/register 실행");
		
		logger.info("새로 등록할 member = " + member.toString());
		
		memberService.memberRegister(member);
		model.addAttribute("mname", mname);
		
		return "memberRegisterPost";
	}
	
	// 정보 수정
	@GetMapping("/member/update")
	public String memberUpdate(Model model, @RequestParam("mno") int mno) {
		logger.info("MemberController_Get_/member/update 실행");
		
		logger.info("수정할 회원 번호 = " + mno);
		
		model.addAttribute("selectedMember", memberService.memberGetOne(mno));
		
		return "memberUpdate";
	}
	
	@PostMapping("/member/update")
	public String memberUpdatePost(Model model, MemberVO member) {
		logger.info("MemberController_Post_/member/update 실행");
		
		logger.info("수정된 member = " + member.toString());
		
		memberService.memberUpdate(member);
		model.addAttribute("updatedMember", member);
		
		return "memberUpdatePost";
	}
	
	// 회원 삭제
	@GetMapping("/member/delete")
	public String memberDelete(Model model, @RequestParam("mno") int mno) {
		logger.info("MemberController_Get_/member/delete 실행");
		
		logger.info("삭제할 회원 번호 =" + mno);
		
		model.addAttribute("selectedMember", memberService.memberGetOne(mno));
		
		return "memberDelete";
	}
	
	@PostMapping("/member/delete")
	public String memberDeletePost(Model model, @RequestParam("mno") int mno, @RequestParam("mname") String mname) {
		logger.info("MemberController_Post_/member/delete 실행");
		
		logger.info("삭제된 회원 번호 = " + mno + "삭제된 회원 이름 = " + mname);
		
		model.addAttribute("deleteMname", mname);
		memberService.memberDelete(mno);
		
		return "memberDeletePost";
	}
	
	
}
