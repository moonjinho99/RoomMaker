package com.rm.service;

import java.util.List;
import com.rm.model.PagingVO;
import com.rm.model.FileVO;
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
	
	//����ȸ
	public RoomVO getRoomDetail(int roomcode);
	
	//�� ����
	public int countRoom();
		
	//����¡ ó�� �� ��ȸ
	public List<RoomVO> selectRoom(PagingVO vo);
	//file insert
	public void uploadFile(FileVO file);
		
	//file code 가져오기
	public int selectFileCode(FileVO file);
		
	//filedetail insert
	public void uploadFileDetail(FileVO file);
	
	//fileList 가져오기
	public List<FileVO> getFileList(int roomcode);

	//filedetail 가져오기
	public FileVO getFileDetail(int roomcode,int filecode);

}
