package com.rm.service;

import java.util.List;

import com.rm.model.RoomVO;

public interface RoomService {
	
	//�����(room����)
	public void makeRoom(RoomVO room);
	
	//�����_roomcode��������
	public int findRoomCode();
	
	//�����(roomdetail����)
	public void makerRoomDetail(RoomVO room);
	
	//����
	public List<RoomVO> getRoomList();

}
