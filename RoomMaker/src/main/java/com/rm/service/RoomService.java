package com.rm.service;

import java.util.List;

import com.rm.model.RoomVO;

public interface RoomService {
	
	//规积己(room措涝)
	public void makeRoom(RoomVO room);
	
	//规积己_roomcode啊廉坷扁
	public int findRoomCode();
	
	//规积己(roomdetail措涝)
	public void makerRoomDetail(RoomVO room);
	
	//规格废
	public List<RoomVO> getRoomList();

}
