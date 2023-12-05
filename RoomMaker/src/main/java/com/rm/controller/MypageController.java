package com.rm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rm.model.MemberVO;
import com.rm.service.MemberService;

@Controller
@RequestMapping(value="/mypage")
public class MypageController {
	
	@Autowired
	private MemberService memberService;
	
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);

	@GetMapping(value="/main")
	public void mypageGet(HttpServletRequest request) {
		log.info("마이 페이지 진입");
		
	}
	
	@GetMapping(value="/modify")
	public String mypageModifyGet() {
		log.info("마이페이지 수정 진입");
		return "/mypage/modify";
	}
	
	@PostMapping(value="/modify")
	public void mypageModifyPost(String id, String pw, String name, String email, String phonenum, HttpServletRequest request) {
		
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setPw(pw);
		member.setName(name);
		member.setEmail(email);
		member.setPhonenum(phonenum);
		
		memberService.modifyMember(member);
		
		HttpSession session = request.getSession();
		session.setAttribute("member", member);
	}
	
	@GetMapping(value="/leave")
	public String leaveMemberPOST(String id, String pw, HttpServletRequest request) {
		log.info("leave 진입");
		
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setPw(pw);
		
		memberService.deleteMember(member);
		
		HttpSession session = request.getSession();
		log.info("session......");
		session.invalidate();
		log.info("session......");
		
		return "redirect:/member/login";
	}
	
	 //마이페이지 이동 전 비밀번호 체크
    @GetMapping(value="/memberPwCheck")
    public void goMemberPwCheckBeforeMypage() {
    	log.info("마이페이지 비번 체크 진입");
    }


}
