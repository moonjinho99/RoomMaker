package com.rm.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

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
      log.info("방생성 페이지");
      
   }
   
   @PostMapping("/makeRoom")
   public String makerRoomPOST(RoomVO room)
   {
      log.info("RoomVO : "+room);
      roomService.makeRoom(room);
      room.setRoomcode(roomService.findRoomCode());
      roomService.makerRoomDetail(room);
      
      return "redirect:/main";
   }

   /* 첨부 파일 업로드 */
   @PostMapping("/uploadAjaxAction")
   public void uploadAjaxActionPOST(MultipartFile[] uploadFile) {
      
      log.info("uploadAjaxActionPOST..........");
      
      String uploadFolder = "C:\\upload";
      
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      
      Date date = new Date();
      
      String str = sdf.format(date);
      
      String datePath = str.replace("-", File.separator);
      
      
      /* 폴더 생성 */
      File uploadPath = new File(uploadFolder, datePath);
      
      if(uploadPath.exists() == false) {
         uploadPath.mkdirs();
      }
      
      for(MultipartFile multipartFile : uploadFile)
      {
         /* 파일 이름 */
         String uploadFileName = multipartFile.getOriginalFilename();         
         
         /* uuid 적용 파일 이름 */
         String uuid = UUID.randomUUID().toString();
         
         uploadFileName = uuid + "_" + uploadFileName;
         
         /* 파일 위치, 파일 이름을 합친 File 객체 */
         File saveFile = new File(uploadPath, uploadFileName);
         
         /* 파일 저장 */
         try {
            multipartFile.transferTo(saveFile);
         } catch (Exception e) {
            e.printStackTrace();
         } 
      
      }
   }
   
   
}