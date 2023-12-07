package com.rm.mapper;

import java.util.List;

import com.rm.model.MemberVO;

public interface MemberMapper {

	//�쉶�썝媛��엯
	public void memberJoin(MemberVO member);
	
	//濡쒓렇�씤
	public MemberVO memberLogin(MemberVO member);
	
	//�븘�씠�뵒 以묐났 寃��궗
	public int joinIdCheck(String id);
	
	//留덉씠�럹�씠吏��뿉�꽌 �젙蹂� �닔�젙
	public void modifyMember(MemberVO member);
	
	//�쉶�썝�깉�눜
	public void deleteMember(MemberVO member);
	
	//회원 탈퇴
	public List<Integer> getDeleteMemberRoomcode(String id);
}
