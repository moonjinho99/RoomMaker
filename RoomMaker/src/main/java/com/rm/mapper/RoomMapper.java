package com.rm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rm.model.AttachImageVO;
import com.rm.model.PagingVO;
import com.rm.model.RoomMemberVO;
import com.rm.model.FileVO;
import com.rm.model.RoomVO;

public interface RoomMapper {
	
	//占쏙옙占쏙옙占�(room占쏙옙占싱븝옙 占쏙옙占쏙옙)
	public void makeRoom(RoomVO room);
	
	//占쏙옙占쏙옙占�_roomcode占쏙옙占쏙옙占쏙옙占쏙옙
	public int findRoomCode();
	
	//占쏙옙占쏙옙占�(roomdetail占쏙옙 占쏙옙占쏙옙)
	public void makeRoomDetail(RoomVO room);
	
	/* 占싱뱄옙占쏙옙 占쏙옙占� */
	public void imageEnroll(AttachImageVO vo);
	
	//占쏙옙 占쏙옙占�
	public List<RoomVO> getRoomList();
	
	//占쏙옙 占쏙옙회
	public RoomVO getRoomDetail(int roomcode);
	
	//占쏙옙 占쏙옙占쏙옙
	public int countRoom(PagingVO vo);
	
	//占쏙옙占쏙옙징 처占쏙옙 占쏙옙 占쏙옙회
	public List<RoomVO> selectRoom(PagingVO vo);
	
	//file count
	public int countFile();
	
	//file insert
	public void uploadFile(FileVO file);
	
	//file code 媛��졇�삤湲�
	public int selectFileCode(FileVO file);
	
	//filedetail insert
	public void uploadFileDetail(FileVO file);
	
	//fileList 媛��졇�삤湲�
	public List<FileVO> getFileList(int roomcode);
	
	//fileList 가져오기
	public List<FileVO> getFileList(int roomcode, PagingVO vo);
	
	//fileDetail 媛��졇�삤湲�
	public FileVO getFileDetail(int roomcode, int filecode);
	
	//file Delete
	public void deleteFile(int roomcode, int filecode);
	
	//file modify
	public void updateFile(FileVO file, int filecode);
	
	//roomMember에 삽입
	public void insertRoomMember(RoomMemberVO roomVO);
	
	//roommember값 모두 가져오기
	public List<RoomMemberVO> selectRoomMember();
	
	//member_cnt증가
	public void updateMemberCnt(int roomcode);
	
	//내가 참여중인 방
	public List<RoomVO> joinRoomList(String id,PagingVO vo);
	
	//참여중인 방의 개수
	public int countJoinRoom(String id);
	
	
	//내가 만든방
	public List<RoomVO> makeRoomList(String id, PagingVO vo);
	
	//내가 만든 방의 수 
	public int countMakeRoom(String id);
	
	//회원의 이름
	public String selectName(String id);
	
	
}
