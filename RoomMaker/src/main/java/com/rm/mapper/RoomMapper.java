package com.rm.mapper;

import com.rm.model.RoomVO;

public interface RoomMapper {
	
	//�����(room���̺� ����)
	public void makeRoom(RoomVO room);
	
	//�����(roomdetail�� ����)
	public void makeRoomDetail(RoomVO room);
}
