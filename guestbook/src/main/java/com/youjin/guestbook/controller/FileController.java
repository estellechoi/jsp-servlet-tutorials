package com.youjin.guestbook.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

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
	
	// 임시코드
	@GetMapping(path = "/download")
	public void download(HttpServletResponse response) {
		//db에서 읽어왔다고 가정
		String fileName = "wallpaper_beatles.jpeg";
		String saveFileName = "Users/youjin/tmp/wallpaper_beatles.jpeg";
		String contentType = "image/jpeg";
		int fileLength = 1116303;
		
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setHeader("Content-Type", contentType);
        response.setHeader("Content-Length", "" + fileLength);
        response.setHeader("Pragma", "no-cache;"); // 브라우저가 캐시를 읽지 못하도록 설정
        response.setHeader("Expires", "-1;");
        		
        try (FileInputStream fis = new FileInputStream(saveFileName);
    		OutputStream out = response.getOutputStream();
        ) {
        	int readCount = 0;
        	byte[] buffer = new byte[1024];
        	// 지정된 경로의 파일을 읽어 byte[] 변수에 저장하고, 읽은 바이트 수를 반환
        	while((readCount = fis.read(buffer)) != -1) {
        		out.write(buffer, 0, readCount);
        	}
        	
        	
        } catch (Exception e) {
        	throw new RuntimeException("파일 저장 오류");
        }
	}

}