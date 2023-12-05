package com.rm.mapper;

import com.rm.model.MemberVO;

public interface MemberMapper {

	//회원가입
	public void memberJoin(MemberVO member);
	
	//로그인
	public MemberVO memberLogin(MemberVO member);
	
	//아이디 중복 검사
	public int joinIdCheck(String id);
	
	//마이페이지에서 정보 수정
	public void modifyMember(MemberVO member);
	
	//회원탈퇴
	public void deleteMember(MemberVO member);
}
