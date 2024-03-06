package com.smhrd.converter;

import java.io.File;
import java.io.IOException;
import java.util.Base64;

import org.apache.commons.io.FileUtils;

public class ImageToBase64 {
	
	// Image 파일을 Base64로 encoding해서 문자열로 만들어주는 Method
	public String convert(File f) {
		// 1. 파일(f)를 가져와서 바이트 배열형태로 읽기
		String result = null;
		try {
			// 바이트 배열 byte[]
			byte[] fileContent = FileUtils.readFileToByteArray(f);
			result = Base64.getEncoder().encodeToString(fileContent);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

}
