package com.rm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rm.mapper.RoomMapper;
import com.rm.model.PagingVO;
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


	//����
	@Override
	public List<RoomVO> getRoomList() {
		
		return mapper.getRoomList();
		
	}


	//����ȸ
	@Override
	public RoomVO getRoomDetail(int roomcode) {
		
		return mapper.getRoomDetail(roomcode);
	}


	//��ü �� ��
	@Override
	public int countRoom() {
		
		return mapper.countRoom();
	}


	//����¡ ó�� ����
	@Override
	public List<RoomVO> selectRoom(PagingVO vo) {
		System.out.println("����¡ : "+vo);
		return mapper.selectRoom(vo);
	}
	
	//file insert
	@Override
	public void uploadFile(FileVO file) {
		mapper.uploadFile(file);
	}
		
	//file code 가져오기
	@Override
	public int selectFileCode(FileVO file) {
		return mapper.selectFileCode(file);
	}
		
	//filedetail insert
	@Override
	public void uploadFileDetail(FileVO file) {
		mapper.uploadFileDetail(file);
	}
	
	//fileList 가져오기
	@Override
	public List<FileVO> getFileList(int roomcode){
		return mapper.getFileList(roomcode);
	}
	
	//fileDetail 가져오기
	@Override
	public FileVO getFileDetail(int roomcode, int filecode) {
		   System.out.println("serviceroomcode :"+roomcode);
		return mapper.getFileDetail(roomcode, filecode);
	}
	
	


}
