package com.rm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rm.mapper.RoomMapper;
import com.rm.model.PagingVO;
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


	//规格废
	@Override
	public List<RoomVO> getRoomList() {
		
		return mapper.getRoomList();
		
	}


	//规炼雀
	@Override
	public RoomVO getRoomDetail(int roomcode) {
		
		return mapper.getRoomDetail(roomcode);
	}


	//傈眉 规 荐
	@Override
	public int countRoom() {
		
		return mapper.countRoom();
	}


	//其捞隆 贸府 规格废
	@Override
	public List<RoomVO> selectRoom(PagingVO vo) {
		System.out.println("其捞隆 : "+vo);
		return mapper.selectRoom(vo);
	}
	


}
