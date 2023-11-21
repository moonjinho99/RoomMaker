package com.rm.service;

import com.rm.model.MemberVO;

public interface MemberService {
	
	//�쉶�썝媛�
	public void memberJoin(MemberVO member) throws Exception;
	
	public MemberVO MemberLogin(MemberVO member) throws Exception;

}
