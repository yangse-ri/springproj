package org.zerock.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

//자동생성 어노테이션 -@Controller : url mapping
@Controller
@Log4j
public class UploadController {

	@GetMapping("/uploadForm")
	// url에 jsp의 정보가 다 존재한다. 그럴때 리턴타입을 String 대신에void를 사용할 수 있다.
	public void uploadForm() throws Exception {
		log.info("uploadForm()"); 
	}
	
	//void형태로 반환값이 없는 것은 ???????? 매핑안의url이 jsp정보이댱
	@PostMapping("/uploadFormAction")//jsp의 폼의 엑션과 같이 맞춰주기 
								//MultipartFile에 해당하는 변수이름이 uploadForm.jsp의 name과 같아야 자동으로 들어옴
	public void uploadFormAction(MultipartFile uploadFile, HttpServletRequest request, 
			Model model) throws Exception {//변수는 jsp파일의 name과 일치해야해
		//메인 메모리(Ram)이나 임시 폴더에 저장된 상태 - 아직 저장은 하지 않았다.  (fileName,  )은 mondel에 담아서 간다
		log.info(uploadFile);
		log.info(uploadFile.getOriginalFilename());
		
		// 저장위치 - 서버 기준의 상대 위치 ->실제적으로 저장할때는 절대위치가 필요하다.
		String path = "/upload";
		
		//request를 이용해서 절대 위치를 구한다 ->request는 파라미터로 받는다
		String savePath = request.getServletContext().getRealPath(path);
		log.info(savePath);
		
		//파일을 저장해 보자. -원래 파일명으로 저장한다. 파일명이 같으면 덮어쓰기가 된다
		uploadFile.transferTo(new File(savePath,uploadFile.getOriginalFilename()));
		
		//DB에 저장 될 파일 정보
		String fileName = path + "/" + uploadFile.getOriginalFilename();
		log.info(fileName);//log로 찍어서 테스팅
		
		model.addAttribute("fileName", fileName);
		
	}
	
	//==============================  파일 여러개 받기  ================================
	
	@GetMapping("/uploadForms")
	// url에 jsp의 정보가 다 존재한다. 그럴때 리턴타입을 String 대신에void를 사용할 수 있다.
	public void uploadForms() throws Exception {
		log.info("uploadForms()"); 
	}
	
	//void형태로 반환값이 없는 것은 ???????? 매핑안의url이 jsp정보이댱
	@PostMapping("/uploadFormActions")//jsp의 폼의 엑션과 같이 맞춰주기 
								//MultipartFile에 해당하는 변수이름이 uploadForm.jsp의 name과 같아야 자동으로 들어옴
	public void uploadFormActions(List<MultipartFile> uploadFiles, HttpServletRequest request, Model model) throws Exception {//변수는 jsp파일의 name과 일치해야해
		//메인 메모리(Ram)이나 임시 폴더에 저장된 상태 - 아직 저장은 하지 않았다.  (fileName,  )은 mondel에 담아서 간다
//		log.info(uploadFiles);
//		log.info(uploadFiles.getOriginalFilename());
		
		//들어오는 파일 이름 출력해서 보기
		for(MultipartFile uploadFile : uploadFiles) {
			log.info(uploadFile.getOriginalFilename());
		}
		
		// 저장위치 - 서버 기준의 상대 위치 ->실제적으로 저장할때는 절대위치가 필요하다.
		String path = "/upload";
		
		//request를 이용해서 절대 위치를 구한다 ->request는 파라미터로 받는다
		String savePath = request.getServletContext().getRealPath(path);
		log.info(savePath);
		
		//파일을 저장해 보자. -원래 파일명으로 저장한다. 파일명이 같으면 덮어쓰기가 된다
//		uploadFiles.transferTo(new File(savePath,uploadFiles.getOriginalFilename()));
//		
//		//DB에 저장 될 파일 정보
//		String fileName = path + "/" + uploadFiles.getOriginalFilename();
//		log.info(fileName);//log로 찍어서 테스팅
//		
//		model.addAttribute("fileName", fileName);
		
	}
}
