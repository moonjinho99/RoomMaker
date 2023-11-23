package com.rm.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rm.model.MemberVO;
import com.rm.service.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	//회원가입 페이지 이동
	@RequestMapping(value = "/join", method=RequestMethod.GET)
	public void joinGET() {
		
		logger.info("회원가입 페이지 진입");
		
	}
	
	//회원가입
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception{
		logger.info("memberVO : "+member);
		logger.info("join 진입");
		
		//회원가입 서비스 실행
		memberService.memberJoin(member);
		logger.info("join Service 성공");
		
		return "redirect:/member/login";
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
	        MemberVO memberVO = memberService.memberLogin(member);
	        
	        if(memberVO == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
	            System.out.println("로그인 실패");
	        	int result = 0;
	            rttr.addFlashAttribute("result", result);
	            return "redirect:/member/login";
	        }
	        
	        session.setAttribute("member", memberVO);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
	        
	        return "redirect:/main";
	    }
	    
	    /* 이메일 인증 */
	    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	    @ResponseBody
	    public String mailCheckGET(String email) throws Exception{
	    	
	    	/* 뷰(View)로부터 넘어온 데이터 확인 */
	    	logger.info("이메일 데이터 전송 확인");
	    	logger.info("인증번호 : " + email);
	    	
	    	/* 인증번호(난수) 생성 */
	    	Random random = new Random();
	    	int checkNum = random.nextInt(888888) + 111111;
	    	logger.info("인증번호 " + checkNum);
	    	
	    	/* 이메일 보내기 */
	    	String setFrom = ""; // root-context.xml에 기입한 본인의 이메일 계정
	    	String toMail = email;	// 수신받을 이메일입니다.뷰로부터 받은 이메일 주소인 변수 email을 사용.
	    	String title = "회원가입 인증 이메일 입니다.";	// 자신이 보낼 이메일 제목을 작성
	    	String content = 	// 자신이 보낼 이메일 내용
	    			"홈페이지를 방문해주셔서 감사합니다." +
	    			"<br><br>" +
	    			"인증 번호는 " + checkNum + "입니다." + 
	    			"<br>" +
	    			"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
	    	
	    	try {
	    		
	    		MimeMessage message = mailSender.createMimeMessage();
	    		MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	    		helper.setFrom(setFrom);
	    		helper.setTo(toMail);
	    		helper.setSubject(title);
	    		helper.setText(content,true);
	    		mailSender.send(message);
	    		
	    	}catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	
	    	String num = Integer.toString(checkNum);
	    	
	    	return num;
	    	
	    }
	    

	    //아이디 중복 검사 확인
	    @RequestMapping(value="/joinIdCheck", method=RequestMethod.POST)
	    @ResponseBody
	    public String joinIdCheckPOST(String id) throws Exception{
	    	logger.info("joinIdCheck 진입");
	    	
			
			int result = memberService.joinIdCheck(id);
			
			logger.info("결과값 = " + result);
			
			if(result != 0) {
				return "fail";	// 중복 아이디가 존재
			} else {
				return "success";	// 중복 아이디 비존재
			}	
	    
	    }

	
}