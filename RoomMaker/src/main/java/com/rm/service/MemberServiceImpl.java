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
	public MemberVO memberLogin(MemberVO member) throws Exception{
		return membermapper.memberLogin(member);
	}
	
	@Override
	public int joinIdCheck(String id) throws Exception{
		return membermapper.joinIdCheck(id);
	}
	
	@Override
	public void modifyMember(MemberVO member) {
		membermapper.modifyMember(member);
	}
	
	@Override
	public void deleteMember(MemberVO member) {
		membermapper.deleteMember(member);
	}
}
