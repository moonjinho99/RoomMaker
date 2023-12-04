package com.rm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rm.model.MemberVO;

@Controller
@RequestMapping(value="/mypage")
public class MypageController {
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);

	@GetMapping(value="/main")
	public void mypageGet(HttpServletRequest request) {
		log.info("마이페이지 진입");
		
	}

}
