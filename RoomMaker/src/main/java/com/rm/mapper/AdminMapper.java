package com.rm.mapper;

import java.util.List;

import com.rm.model.FileVO;
import com.rm.model.MemberVO;
import com.rm.model.RoomMemberVO;
import com.rm.model.RoomVO;

public interface AdminMapper {
	
	//모든 방 정보 가져오기
	public List<RoomVO> getRoomList();
	
	//모든 회원 정보 가져오기
	public List<MemberVO> getMemberList();
	
	//삭제할 회원 정보 가져오기
	public MemberVO getDeleteMemberList(String id);
	
	//회원 탈퇴
	public void deleteMemberDo(String id);
	
	//방의 정보 가져오기
	public List<RoomVO> getRoomInfList(int roomcode);
	
	//방의 파일정보 가져오기
	public List<FileVO> getRoomFileList(int roomcode);
	
	//방 참여자정보 가져오기
	public List<RoomMemberVO> getRoomMemberList(int roomcode);
	
	//방 참여자 탈퇴
	public void deleteRoomMemberList(int roomcode,String id);
	
	//탈퇴시 join_member_cnt 감소
	public void DownMemberCnt(int roomcode);

	//방의 파일 리스트 삭제
	public void deleteFileList(int roomcode,int filecode);
	
	//방 삭제
	public void deleteAll(int roomcode);
}
