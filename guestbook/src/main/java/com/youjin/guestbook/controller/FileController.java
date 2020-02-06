package com.youjin.guestbook.controller;

import java.io.FileOutputStream;
import java.io.InputStream;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
// commons-fileupload, commons-io 라이브러리 의존

@Controller
public class FileController {

	@GetMapping(path = "/uploadform")
	public String uploadForm() {
		return "uploadform";
	}

	@PostMapping(path = "/upload")
	public String upload(@RequestParam("file") MultipartFile file) {
		System.out.println("파일 이름 : " + file.getOriginalFilename());
		System.out.println("파일 크기 : " + file.getSize());
		
		try (FileOutputStream fos = new FileOutputStream("/Users/youjin/tmp/" + file.getOriginalFilename());
			InputStream is = file.getInputStream();
		) {
			int readCount = 0;
			byte[] buffer = new byte[1024]; // 1024?
			
			// InputStream.read(); 데이터를 읽어서 byte[] 변수에 저장하고, 읽은 바이트 수를 반환
			// readCount 변수에 읽은 바이트 수를 저장
			while((readCount = is.read(buffer)) != -1) {
				// 지정된 경로의 파일에 byte[] 데이터를 출력 
				fos.write(buffer, 0, readCount);
			}
			
		} catch (Exception e) {
			throw new RuntimeException("파일 저장 오류");
		}
		
		return "uploadformOk";
	}

}