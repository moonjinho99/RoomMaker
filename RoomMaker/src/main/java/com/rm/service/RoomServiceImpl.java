package com.rm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	
	@Transactional
	@Override
	public void makerRoomDetail(RoomVO room) {
		mapper.makeRoomDetail(room);
		
		if(room.getImageList() == null || room.getImageList().size() <= 0) {
			return;
		}

		room.getImageList().forEach(attach ->{
			attach.setRoomcode(mapper.findRoomCode());
			mapper.imageEnroll(attach);
		});
		
	}

	@Override
	public int findRoomCode() {
		return mapper.findRoomCode();
	}


	//방목록
	@Override
	public List<RoomVO> getRoomList() {
		
		return mapper.getRoomList();
	}


	//방조회
	@Override
	public RoomVO getRoomDetail(int roomcode) {
		
		return mapper.getRoomDetail(roomcode);
	}
	
	

}
