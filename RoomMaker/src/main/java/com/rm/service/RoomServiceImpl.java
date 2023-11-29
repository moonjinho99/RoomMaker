package com.rm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rm.mapper.RoomMapper;
import com.rm.model.PagingVO;
import com.rm.model.RoomMemberVO;
import com.rm.model.FileVO;
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


	//占쏙옙占쏙옙
	@Override
	public List<RoomVO> getRoomList() {
		
		return mapper.getRoomList();
		
	}


	//占쏙옙占쏙옙회
	@Override
	public RoomVO getRoomDetail(int roomcode) {
		
		return mapper.getRoomDetail(roomcode);
	}


	//占쏙옙체 占쏙옙 占쏙옙
	@Override
	public int countRoom(PagingVO vo) {
		
		return mapper.countRoom(vo);
	}


	//占쏙옙占쏙옙징 처占쏙옙 占쏙옙占쏙옙
	@Override
	public List<RoomVO> selectRoom(PagingVO vo) {
		System.out.println("占쏙옙占쏙옙징 : "+vo);
		return mapper.selectRoom(vo);
	}
	
	//file insert
	@Override
	public void uploadFile(FileVO file) {
		mapper.uploadFile(file);
	}
		
	//file code 媛��졇�삤湲�
	@Override
	public int selectFileCode(FileVO file) {
		return mapper.selectFileCode(file);
	}
		
	//filedetail insert
	@Override
	public void uploadFileDetail(FileVO file) {
		mapper.uploadFileDetail(file);
	}
	
	//fileList 媛��졇�삤湲�
	@Override
	public List<FileVO> getFileList(int roomcode, PagingVO vo){
		return mapper.getFileList(roomcode,vo);
	}
	
	//fileDetail 媛��졇�삤湲�
	@Override
	public FileVO getFileDetail(int roomcode, int filecode) {
		   System.out.println("serviceroomcode :"+roomcode);
		return mapper.getFileDetail(roomcode, filecode);
	}
	
	//fileList 갯수 가져오기
	@Override
	public int countFile() {
		return mapper.countFile();
	}
	
	//방 입장시 roommember 삽입
	@Override
	public void insertRoomMember(RoomMemberVO roommember) {
		mapper.insertRoomMember(roommember);;
	}


	//모든 roommember값 가져오기
	@Override
	public List<RoomMemberVO> selectRoomMember() {
		
		return mapper.selectRoomMember();
	}

	//join_member_cnt 증가
	@Override
	public void updateMemberCnt(int roomcode) {
		mapper.updateMemberCnt(roomcode);
	}
	
	
	
	
	

}
