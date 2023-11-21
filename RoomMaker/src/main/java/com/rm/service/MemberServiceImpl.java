package com.rm.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.rm.mapper.MemberMapper;
import com.rm.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberMapper membermapper;
	
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		
		membermapper.memberJoin(member);
		
	}
	
	@Override
	public MemberVO MemberLogin(MemberVO member) throws Exception{
		return membermapper.MemberLogin(member);
	}
}
