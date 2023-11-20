package com.rm.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rm.model.RoomVO;
import com.rm.service.MemberService;
import com.rm.service.RoomService;
	
@Controller
@RequestMapping("/room/*")
public class RoomController {
	private static final Logger log = LoggerFactory.getLogger(RoomController.class);
	
	@Autowired
	private RoomService roomService;
	
	@GetMapping("/makeRoom")
	public void makeRoomGET()
	{
		log.info("规积己 其捞瘤");
		
	}
	
	@PostMapping("/makeRoom")
	public String makerRoomPOST(RoomVO room)
	{
		log.info("RoomVO : "+room);
		roomService.makeRoom(room);
		roomService.makerRoomDetail(room);
		
		return "redirect:/main";
	}

	
	
}
