package com.rm.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rm.model.RoomVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class RoomServiceTest {

	@Autowired
	private RoomService service;
	
	@Test
	public void testMakeRoom()
	{
		
		RoomVO vo = new RoomVO();
		
		vo.setTitle("�׽�Ʈ����2");
		vo.setId("�׽�Ʈ����2");
		vo.setMain_img("1232");
		vo.setMember_cnt(32);
		vo.setExplanation("3332");
		
		vo.setRoomcode(42);
		vo.setRoompw("�׽�Ʈ��ȣ2");
		vo.setType(12);
		
		service.makeRoom(vo);
		service.makerRoomDetail(vo);
	}
}
