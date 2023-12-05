package com.rm.controller;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rm.mapper.RoomMapper;
import com.rm.model.RoomMemberVO;
import com.rm.model.RoomVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class RoomMapperTest {
	private static final Logger log = org.slf4j.LoggerFactory.getLogger(RoomMapper.class);

	@Autowired
	private RoomMapper mapper;
	
//	@Test
//	public void testRoom()
//	{
//		RoomVO vo = new RoomVO();
//		
////		vo.setTitle("�׽�Ʈ����");
////		vo.setId("�׽�Ʈ����");
////		vo.setMain_img("123");
////		vo.setMember_cnt(3);
////		vo.setExplanation("333");
////		
////		vo.setRoomcode(4);
////		vo.setRoompw("�׽�Ʈ��ȣ");
////		vo.setType(1);
////		
////		mapper.makeRoom(vo);
//		//mapper.makeRoomDetail(vo);
//		
//		System.out.println(mapper.findRoomCode());
//	}
	
//	@Test
//	public void testGetList()
//	{
//		
//		List list = mapper.getRoomList();
//		
//		for(int i=0; i<list.size(); i++)
//		{
//			log.info(""+list.get(i));
//		}
//	}
	
//	@Test
//	public void testGetPage() {
//		
//		int roomcode =44;
//		
//		log.info(""+mapper.getRoomDetail(roomcode));
//	}
	
//	@Test
//	public void testPaging()
//	{
//		System.out.println("�Խù� ���� : "+mapper.countRoom());
//		//System.out.println("�Խù� ����¡ ó�� : "+mapper.selectRoom(null));
//	}
	
//	@Test
//	public void testMemberIn()
//	{
//		RoomMemberVO rmvo = new RoomMemberVO();
//		
//		rmvo.setId("oo");
//		rmvo.setRoomcode(60);
//		rmvo.setRoomlevel(0);
//		
//		mapper.insertRoomMember(rmvo);
//	}
	
//	@Test
//	public void testSelectMember()
//	{
//		System.out.println(mapper.selectRoomMember());
//	}
	
//	@Test
//	public void testMemberCnt()
//	{
//		
//		mapper.updateMemberCnt(60);
//	}
	
//	@Test
//	public void testJoinRoom()
//	{
//		System.out.println(mapper.countJoinRoom("ok2241"));
//	}
	
	@Test
	public void testSelectName()
	{
		RoomVO vo = new RoomVO();
		
		vo.setRoomcode(73);
		vo.setTitle("�ڹ� ��ȭ��");
		vo.setRoompw("123");
		vo.setMember_cnt(10);
		vo.setJoin_member_cnt(1);
		vo.setExplanation("�ڹ� ��ȭ���Դϴ�.");
		
		mapper.updateRoom(vo);
	}
	
}
