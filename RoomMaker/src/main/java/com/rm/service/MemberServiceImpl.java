package com.rm.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.rm.mapper.MemberMapper;
import com.rm.model.MemberVO;

public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberMapper membermapper;
	
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		
		membermapper.memberJoin(member);
		
	}

}
