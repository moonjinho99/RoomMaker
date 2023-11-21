package com.rm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rm.model.MemberVO;
import com.rm.service.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	//회원가입 페이지 이동
	@RequestMapping(value = "/join", method=RequestMethod.GET)
	public void joinGET() {
		
		logger.info("회원가입 페이지 진입");
		
	}
	
	//회원가입
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception{
		
		logger.info("join 진입");
		
		//회원가입 서비스 실행
		memberService.memberJoin(member);
		
		logger.info("join Service 성공");
		
		return "redirect:/main";
	}
	
	
	//로그인 페이지 이동
		@RequestMapping(value = "/login", method = RequestMethod.GET)
		public void loginGET() {
			
			logger.info("로그인 GET 진입");
			
		}
		
	//로그인 기능 구현
	    @RequestMapping(value="login", method=RequestMethod.POST)
	    public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
	        
	        logger.info("로그인 POST 진입");
	        
	        HttpSession session = request.getSession();
	        MemberVO memberVO = memberService.MemberLogin(member);
	        
	        if(memberVO == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
	            System.out.println("로그인 실패");
	        	int result = 0;
	            rttr.addFlashAttribute("result", result);
	            return "redirect:/member/login";
	        }
	        
	        session.setAttribute("member", memberVO);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
	        
	        return "redirect:/main";
	    }

	
}