package com.rm.mapper;

import com.rm.model.MemberVO;

public interface MemberMapper {

	//회원가입
	public void memberJoin(MemberVO member);
	
	//로그인 (가연)
	public MemberVO memberLogin(MemberVO member);
	
	//아이디 중복 검사(가연)
	public int joinIdCheck(String id);
}
