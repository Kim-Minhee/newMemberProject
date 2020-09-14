package com.mh.member.controller;

import java.io.File;
import java.io.InputStream;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class FileUploadController {

	private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);
	
	@Autowired
	ServletContext sc;
	
	@GetMapping("/file/upload")
	public String fileUpload() {
		logger.info("FileUploadController_Post_/upload 실행");
		
		return "file/fileUpload";
	}
	
	@PostMapping("/file/upload")
	public String fileUploadPost(@RequestParam("file") MultipartFile multipartFile, Model model) {
		logger.info("FileUploadController_Post_/upload 실행");
		
		logger.info("업로드한  파일 이름 = " + multipartFile.getOriginalFilename());
		
		// import java.io
		// sc.getRealPath : browser deployment location에서 project명까지의 경로
		File targetFile = new File(sc.getRealPath("/resources/fileupload/") + multipartFile.getOriginalFilename());
		logger.info("파일의 실제 저장 위치(실행 디렉토리) = " + targetFile);
		
		try {
			// import java.io
			// 소스 디렉토리에 저장된 파일을 실행 디렉토리에 복사하라는 명령?
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
		} catch (Exception e) {
			FileUtils.deleteQuietly(targetFile);
			e.printStackTrace();
		}
		
		// jsp에서 해당 이미지를 출력할 수 있게.. /resources로 시작하는 경로를 model에 저장해놓기
		model.addAttribute("imgSrc", "/resources/fileupload/" + multipartFile.getOriginalFilename());
		
		return "file/fileUploadPost";
		
	}
	
	
//	@RequestMapping(value = "/upload", method = RequestMethod.POST , headers = "content-type=multipart/*")
//   //@PostMapping("/upload")
//   public String upload(@RequestParam("file") MultipartFile multipartFile,Model model) {
//      logger.info("### upload");
//      logger.info("실제 파일이름은 ? " + multipartFile.getOriginalFilename());
//      
//      File targetFile = new File(sc.getRealPath("/resources/fileupload/") + multipartFile.getOriginalFilename());
//	      logger.info("파일 저장위치는 :  " + targetFile);
//      try {
//         InputStream fileStream = multipartFile.getInputStream();
//         FileUtils.copyInputStreamToFile(fileStream, targetFile);
//      } catch (IOException e) {
//         FileUtils.deleteQuietly(targetFile);
//         e.printStackTrace();
//      }
//      
//      // 실제 디렉토리와 URL은 다르다.. 
//      // URL은 http://localhost:9999/resources/fileupload/실제파일명
//      // model에 담아서 jsp에서 img로 출력 
//      
//      model.addAttribute("imgSrc", "/resources/fileupload/" + multipartFile.getOriginalFilename());
//      return "upload";
//   }

}