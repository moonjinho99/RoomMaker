package com.rm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rm.mapper.RoomMapper;
import com.rm.model.RoomVO;

@Service
public class RoomServiceImpl implements RoomService{

	@Autowired
	private RoomMapper mapper;
	
	@Override
	public void makeRoom(RoomVO room) {
		mapper.makeRoom(room);
		
	}

	@Override
	public void makerRoomDetail(RoomVO room) {
		mapper.makeRoomDetail(room);
	}

}
