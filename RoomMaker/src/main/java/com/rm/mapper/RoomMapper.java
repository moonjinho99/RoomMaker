package com.rm.mapper;

import com.rm.model.RoomVO;

public interface RoomMapper {
	
	//�����(room���̺� ����)
	public void makeRoom(RoomVO room);
	
	//�����_roomcode��������
	public int findRoomCode();
	
	//�����(roomdetail�� ����)
	public void makeRoomDetail(RoomVO room);
}
