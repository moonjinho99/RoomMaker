package com.rm.mapper;

import com.rm.model.MemberVO;

public interface MemberMapper {

	//회원가입
	public void memberJoin(MemberVO member);
	
	//로그인 (가연)
	public MemberVO MemberLogin(MemberVO member);

}
