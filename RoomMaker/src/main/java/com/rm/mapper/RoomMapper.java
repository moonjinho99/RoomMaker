package com.rm.mapper;

import com.rm.model.RoomVO;

public interface RoomMapper {
	
	//방생성(room테이블에 대입)
	public void makeRoom(RoomVO room);
	
	//방생성(roomdetail에 대입)
	public void makeRoomDetail(RoomVO room);
}
