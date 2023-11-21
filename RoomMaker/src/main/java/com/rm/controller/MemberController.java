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
	@RequestMapping(value = "join", method=RequestMethod.GET)
	public void loginGET() {
		
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
	
	
	//인코딩 확인
	//濡쒓렇�씤 �럹�씠吏� �씠�룞
		@RequestMapping(value = "/login", method = RequestMethod.GET)
		public void joinGET() {
			
			logger.info("濡쒓렇�씤 GET 吏꾩엯");
			
		}
		
	//濡쒓렇�씤 湲곕뒫 援ы쁽
	    @RequestMapping(value="login", method=RequestMethod.POST)
	    public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
	        
	        logger.info("濡쒓렇�씤 POST 吏꾩엯");
	        
	        HttpSession session = request.getSession();
	        MemberVO memberVO = memberService.MemberLogin(member);
	        
	        if(memberVO == null) {                                // �씪移섑븯吏� �븡�뒗 �븘�씠�뵒, 鍮꾨�踰덊샇 �엯�젰 寃쎌슦
	            System.out.println("濡쒓렇�씤 �떎�뙣");
	        	int result = 0;
	            rttr.addFlashAttribute("result", result);
	            return "redirect:/member/login";
	        }
	        
	        session.setAttribute("member", memberVO);             // �씪移섑븯�뒗 �븘�씠�뵒, 鍮꾨�踰덊샇 寃쎌슦 (濡쒓렇�씤 �꽦怨�)
	        
	        return "redirect:/main";
	    }

	
}