package com.rm.service;

import com.rm.model.MemberVO;

public interface MemberService {
	
	//회원가입
	public void memberJoin(MemberVO member) throws Exception;
	
	public MemberVO memberLogin(MemberVO member) throws Exception;
	
	public int joinIdCheck(String id) throws Exception;
	
	

}
