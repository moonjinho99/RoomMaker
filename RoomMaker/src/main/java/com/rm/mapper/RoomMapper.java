package com.rm.mapper;

import java.util.List;

import com.rm.model.AttachImageVO;
import com.rm.model.RoomVO;

public interface RoomMapper {
	
	//�����(room���̺� ����)
	public void makeRoom(RoomVO room);
	
	//�����_roomcode��������
	public int findRoomCode();
	
	//�����(roomdetail�� ����)
	public void makeRoomDetail(RoomVO room);
	
	/* �̹��� ��� */
	public void imageEnroll(AttachImageVO vo);
	
	//�� ���
	public List<RoomVO> getRoomList();
	
	//�� ��ȸ
	public RoomVO getRoomDetail(int roomcode);
}
