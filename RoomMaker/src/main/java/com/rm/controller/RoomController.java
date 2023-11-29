package com.rm.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.UUID;
import java.net.URLEncoder;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.rm.mapper.AttachMapper;
import com.rm.model.AttachImageVO;
import com.rm.model.MemberVO;
import com.rm.model.RoomMemberVO;
import com.rm.model.PagingVO;
import com.rm.model.FileVO;
import com.rm.model.RoomVO;
import com.rm.service.MemberService;
import com.rm.service.RoomService;
import net.coobird.thumbnailator.Thumbnails;
	

@Controller
@RequestMapping("/room/*")
public class RoomController{
   private static final Logger log = LoggerFactory.getLogger(RoomController.class);
   
   
   
   @Autowired
   private AttachMapper attachMapper;
   
   @Autowired
   private RoomService roomService;
   
   @GetMapping("/makeRoom")
   public void makeRoomGET()
   {
      log.info("방생성(room)");
      
   }
   
   //방생성 메소드
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
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		
		log.info("uploadAjaxActionPOST..........");
		
		/* 이미지 파일 체크 */
		for(MultipartFile multipartFile: uploadFile) {
			
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
				log.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(!type.startsWith("image")) {
				
				List<AttachImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
				
			}
			
		}// for
		
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
		
		/* 이미저 정보 담는 객체 */
		List<AttachImageVO> list = new ArrayList();
		
		for(MultipartFile multipartFile : uploadFile)
		{
			
			AttachImageVO vo = new AttachImageVO();
			
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();			
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);
			
			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);
			
			uploadFileName = uuid + "_" + uploadFileName;
			
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);
			
			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);
				
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);	
				
				BufferedImage bo_image = ImageIO.read(saveFile);

					//비율 
					double ratio = 3;
					//넓이 높이
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);					
				
				
				Thumbnails.of(saveFile)
		        .size(width, height)
		        .toFile(thumbnailFile);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			
			list.add(vo);
		
		}
		
		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);

		return result;
	}
	
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
		File file = new File("c:\\upload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* 이미지 파일 삭제 */
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		
		log.info("deleteFile........" + fileName);
		
		
		File file = null;
		
		try {
			//썸네일 파일 삭제
			file = new File("c:\\upload\\"+URLDecoder.decode(fileName,"UTF-8"));
			
			file.delete();
			
			//원본 파일 삭제
			String originFileName = file.getAbsolutePath().replace("s_", "");
			
			log.info("originFileName : " + originFileName);
			
			file = new File(originFileName);
			
			file.delete();
			
		} catch(Exception e)
		{
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail",HttpStatus.NOT_IMPLEMENTED);
			
		}
		
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
		
		//방 상세 페이지
	   @GetMapping("/roomDetail")
	   public void roomDetailGET(int roomcode, Model model)
	   {
	      log.info("방상세");
	      
	      model.addAttribute("roomDetail",roomService.getRoomDetail(roomcode));
	      
	   }
	   
	   //방 입장
	   @GetMapping("/roomMemberIn")
	   public String roomMemberIn(String id, int roomcode, Model model)
	   {
		   System.out.println("방 입장");
		   
		   RoomMemberVO roommembervo = new RoomMemberVO();
		   
		   //방장의 아이디
		   String masterId = roomService.getRoomDetail(roomcode).getId();
		   
		   //방안의 참여자 아이디
		   List<RoomMemberVO> roomMemberList = roomService.selectRoomMember();
		   
		   //방안의 참여자 인지 구분
		   boolean room_in_member = false;
		   
		   for(int i=0; i<roomMemberList.size(); i++)
		   {
			   if(id.equals(roomMemberList.get(i).getId()))
			   {
				   room_in_member = true;
			   }
		   }
		   
		   
		   //입장한 참여자가 방장일때 1 
		   if(masterId.equals(id) && !room_in_member)
		   {	
			   roommembervo.setId(id);
			   roommembervo.setRoomcode(roomcode);
			   roommembervo.setRoomlevel(1);
			   
			   roomService.insertRoomMember(roommembervo);
			   roomService.updateMemberCnt(roomcode);
		   }
		   //일반 참여자는 0
		   else if(!room_in_member){
			   
			   roommembervo.setId(id);
			   roommembervo.setRoomcode(roomcode);
			   roommembervo.setRoomlevel(0);
			   
			   roomService.insertRoomMember(roommembervo);
			   roomService.updateMemberCnt(roomcode);
		   }
		   
		   model.addAttribute("roomDetail",roomService.getRoomDetail(roomcode));

		   return "redirect:/room/roomDetail?roomcode="+roomcode;
	   }
	   
	   //방 암호 체크
	   @GetMapping("/roomPwCheck")
	   public void roomPwCheck(int roomcode,Model model)
	   {
		   log.info("방 암호 체크");
		   
		   model.addAttribute("roomDetail",roomService.getRoomDetail(roomcode));
	   }
	   
	   @GetMapping("/loadDynamicJSP")
	    public String loadDynamicJSP(@RequestParam String buttonValue,int roomcode, Model model) {
	        // Your logic to determine which JSP to include based on buttonValue
	        String jspToInclude = determineJSP(buttonValue,roomcode,model);
	        
	        System.out.println("넘어온 코드 : "+roomcode);
	        
	        // Add any model attributes if needed
	        model.addAttribute("someAttribute", "someValue");
	        
           // Return the name of the JSP file to include (without .jsp extension)
           return jspToInclude;
       }

       // Your method to determine which JSP to include based on the buttonValue
       private String determineJSP(String buttonValue,int roomcode,Model model) {
          System.out.println("넘어온 buttonValue의 값 : "+buttonValue);
              String jspToInclude = "";
              
              
              // 버튼에 따라 로드할 JSP 결정
              if ("일정보기".equals(buttonValue)) {
                  jspToInclude = "/room/roomSchedule";
              } else if (("자료공유".equals(buttonValue))||("취소".equals(buttonValue))) {
                  jspToInclude = "/room/fileList";
                  
                  PagingVO paging = new PagingVO();
                  String nowPage = null;
                  String cntPerPage = null;
                  System.out.println("자료공유 roomcode="+roomcode);
                  
                  fileListAction(paging,model,roomcode,nowPage,cntPerPage);
                  
              } else if ("채팅하기".equals(buttonValue)) {
                  jspToInclude = "/room/roomChatting";
              } else if ("질문확인".equals(buttonValue)) {
                  jspToInclude = "/room/question";
              } else if ("공지보기".equals(buttonValue)) {
                  jspToInclude = "/room/roomNotice";
              } else if ("자료등록".equals(buttonValue)) {
            	  model.addAttribute("roomcode",roomcode);
            	  jspToInclude = "/room/fileUpload";
              }

           return jspToInclude; 
       }
	   
	   @GetMapping("/roomAIQuestion")
	   private void questionAI()
	   {
		   log.info("AI 질문 페이지");
	   }
	   
	   @PostMapping("/fileListPaging")
	   public String fileListPaging(
	       @RequestParam(value = "nowPage", required = false) Integer nowPage,
	       @RequestParam(value = "cntPerPage", required = false) Integer cntPerPage,
	       int roomcode,
	       Model model) {
	       PagingVO paging = new PagingVO();

	       String nowPageStr = Integer.toString(nowPage);
	       String cntPerPageStr = Integer.toString(cntPerPage);
	       System.out.println("fileListPaging 이동함");
	       
	       fileListAction(paging, model, roomcode, nowPageStr, cntPerPageStr);

	       return "room/fileList";
	   }
	   
	   public void fileListAction(PagingVO vo, Model model, int roomcode,
			   @RequestParam(value="nowPage", required=false)String nowPage,
				@RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		   
		   int total = roomService.countFile();
		   System.out.println("fileListAction 이동함");
		   System.out.println("File total: "+total);
		   if(nowPage == null && cntPerPage == null) {
				nowPage="1";
				cntPerPage = "6";
			} else if(nowPage == null) {
				nowPage = "1";
			} else if(cntPerPage == null) {
				cntPerPage="6";
			}
		   
		   vo = new PagingVO(total,Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			
			model.addAttribute("paging",vo);
			System.out.println(vo);
		   
		   
		   List<FileVO> fileList = new ArrayList<FileVO>();
   		   fileList = roomService.getFileList(roomcode,vo);
   		   System.out.println("fileList : "+fileList);
   			model.addAttribute("list",fileList);
	   }
	   
	 //등록 버튼 누르고 자료 공유방 파일 등록/VO 올리기
	   //자료 공유방 등록 POST
	   @PostMapping("/loadDynamicFileJSP")
	   public String loadDynamicFileJSP(@RequestParam int roomcode, MultipartFile[] uploadFile, String filetitle, String filemember, String content, String uploadPath, Model model) throws Exception {
		 //파일 등록
		   log.info("파일 등록 중..................");
		   //오늘 날짜로 등록
		   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String Date = sdf.format(date);
			
			String uploadFileName = null;
			
			//폴더 생성
			File CreateDateFolder = new File(uploadPath, Date);
			
			//해당 폴더가 이미 있지 않다면 폴더 생성
			if(CreateDateFolder.exists() == false) {
				CreateDateFolder.mkdirs();
			}	
			
			uploadPath += "/"+Date;
	
			
			//기본 for
			for(int i = 0; i < uploadFile.length; i++) {
				log.info("-----------------------------------------------");
				log.info("파일 이름 : " + uploadFile[i].getOriginalFilename());
				log.info("파일 타입 : " + uploadFile[i].getContentType());
				log.info("파일 크기 : " + uploadFile[i].getSize());	
				
				//파일 이름 저장
				uploadFileName = uploadFile[i].getOriginalFilename();
				// uuid 적용 파일 이름 
				String uuid = UUID.randomUUID().toString();
				uploadFileName = uuid + "_" + uploadFileName;
				
				//파일 위치, 파일 이름을 합친 File 객체
				File saveFile = new File(uploadPath, uploadFileName);
				
				//파일 저장 
				try {
					uploadFile[i].transferTo(saveFile);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		   
		   //DB에 저장
		   log.info("file 등록 완료 VO 등록.................");
		   System.out.println("roomcode : "+roomcode);
		   System.out.println("filetitle : "+filetitle);
		   System.out.println("filemember : "+filemember);
		   System.out.println("content : "+content);
		   System.out.println("uploadPath : "+uploadPath);
		   System.out.println("FileName : "+uploadFileName);
		   
		   FileVO file = new FileVO();
		   file.setContent(content);
		   file.setFilemember(filemember);
		   file.setFileName(uploadFileName);
		   file.setFiletitle(filetitle);
		   file.setRoomcode(roomcode);
		   file.setUploadPath(uploadPath);
		   
		   roomService.uploadFile(file);
		   int filecode = roomService.selectFileCode(file);
		   file.setFilecode(filecode);
		   roomService.uploadFileDetail(file);
				
		   String result = determineJSP("자료공유", roomcode, model);
		   
		   return result;
	   }
	   
	 //자료 공유방 등록 GET
	   @GetMapping("/fileDetail")
	   public String fileDetailGET(@RequestParam int roomcode, @RequestParam int filecode, Model model){
		   
		   log.info("fileDetail 진입");
		   FileVO fileDetail = roomService.getFileDetail(roomcode, filecode);
		   model.addAttribute("file",fileDetail);
		 System.out.println(fileDetail);
		 
		 return "/room/fileDetail";
		 
	   }
	   
	   //자료 다운로드
	   @PostMapping("/fileDownload")
	   public void fileDownloadPOST(@RequestParam int roomcode, @RequestParam int filecode, HttpServletRequest request, HttpServletResponse response) throws Exception{
		   log.info("fileDownloading.............");
		   FileVO uploadedFile = roomService.getFileDetail(roomcode, filecode);
		   String filePath = uploadedFile.getUploadPath();
		   String fileName = uploadedFile.getFileName();
		   File file = new File(filePath,fileName);
		   System.out.println(file);
		   BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));

		   //User-Agent : 어떤 운영체제로  어떤 브라우저를 서버( 홈페이지 )에 접근하는지 확인함
		   String header = request.getHeader("User-Agent");
		   String storeToFileName;
		   
		   if ((header.contains("MSIE")) || (header.contains("Trident")) || (header.contains("Edge"))) {
			    //인터넷 익스플로러 10이하 버전, 11버전, 엣지에서 인코딩 
			    storeToFileName = URLEncoder.encode(uploadedFile.getFileName(), "UTF-8");
			  } else {
			    //나머지 브라우저에서 인코딩
			    storeToFileName = new String(uploadedFile.getFileName().getBytes("UTF-8"), "iso-8859-1");
			  }
		   
		   response.setContentType("application/download");
		   response.setHeader("Content-Disposition", "attachment; filename=\"" + storeToFileName + "\"");
		   response.setHeader( "Content-Transfer-Encoding", "binary" );
		   
		 //파일복사
		   FileCopyUtils.copy(in, response.getOutputStream());
		   in.close();
		   response.getOutputStream().flush();
		   response.getOutputStream().close();
		   
	   }
	   
	   //파일 삭제
		@PostMapping("/deleteUploadedFile")
		public ResponseEntity<String> deleteUploadedFile(String fileName){
			
			log.info("deleteFile........" + fileName);
			File file = null;
			
			try {
				file = new File("/Users/hangayeon/RoomMaker/RoomMaker/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/webapp/upload" 
			+ URLDecoder.decode(fileName, "UTF-8"));
				//원본파일삭제
				String FileName = file.getAbsolutePath();
				log.info("FileName : " + FileName);
				file = new File(FileName);
				file.delete();
			} catch(Exception e) {
				e.printStackTrace();
				return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
			}
			
			return new ResponseEntity<String>("success", HttpStatus.OK);
			
		}
	   
	   
	   
	
	
}

