package com.rm.service;

import java.util.List;
import com.rm.model.PagingVO;
import com.rm.model.RoomMemberVO;
import com.rm.model.FileVO;
import com.rm.model.RoomVO;

public interface RoomService {
	
	//占쏙옙占쏙옙占�(room占쏙옙占쏙옙)
	public void makeRoom(RoomVO room);
	
	//占쏙옙占쏙옙占�_roomcode占쏙옙占쏙옙占쏙옙占쏙옙
	public int findRoomCode();
	
	//占쏙옙占쏙옙占�(roomdetail占쏙옙占쏙옙)
	public void makerRoomDetail(RoomVO room);
	
	//占쏙옙占쏙옙
	public List<RoomVO> getRoomList();
	
	//占쏙옙占쏙옙회
	public RoomVO getRoomDetail(int roomcode);
	
	//占쏙옙 占쏙옙占쏙옙
	public int countRoom(PagingVO vo);
		
	//占쏙옙占쏙옙징 처占쏙옙 占쏙옙 占쏙옙회
	public List<RoomVO> selectRoom(PagingVO vo);
	//file insert
	public void uploadFile(FileVO file);
		
	//file code 媛��졇�삤湲�
	public int selectFileCode(FileVO file);
		
	//filedetail insert
	public void uploadFileDetail(FileVO file);
	
	//fileList 가져오기
	public List<FileVO> getFileList(int roomcode, PagingVO vo);

	//filedetail 媛��졇�삤湲�
	public FileVO getFileDetail(int roomcode,int filecode);
	
	//roommember 삽입
	public void insertRoomMember(RoomMemberVO roommember);
	//fileList 갯수
	public int countFile();

	//roommember 가져오기
	public List<RoomMemberVO> selectRoomMember();
	
	//join_member_cnt 증가
	public void updateMemberCnt(int roomcode);
	
	//참여중인 방
	public List<RoomVO> joinRoomList(String id, PagingVO vo);
	
	//참여중인 방의 개수
	public int countJoinRoom(String id);
	
	//내가 만든방
	public List<RoomVO> makeRoomList(String id, PagingVO vo);
		
	//내가 만든 방의 수 
	public int countMakeRoom(String id);
}
