package com.rm.mapper;

import java.util.List;

import com.rm.model.AttachImageVO;
import com.rm.model.RoomVO;

public interface RoomMapper {
	
	//방생성(room테이블에 대입)
	public void makeRoom(RoomVO room);
	
	//방생성_roomcode가져오기
	public int findRoomCode();
	
	//방생성(roomdetail에 대입)
	public void makeRoomDetail(RoomVO room);
	
	/* 이미지 등록 */
	public void imageEnroll(AttachImageVO vo);
	
	//방 목록
	public List<RoomVO> getRoomList();
	
	//방 조회
	public RoomVO getRoomDetail(int roomcode);
}
