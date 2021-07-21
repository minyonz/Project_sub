package com.kh.sample.main.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class MyFileUploadUtil {
	public static final String GGOMJIRAK_FOLDER = "//192.168.0.217/ggomjirak/";
	public static final String YJ_ACADEMY_FOLDER = "D:/ggomjirak/";
	public static final String YJ_HOME_FOLDER = "C:/Users/user/Desktop/";
	
	public static String uploadFile(String uploadPath, String originalFilename, byte[] fileData) throws Exception {
		String datePath = getDatePath(uploadPath);
		UUID uuid = UUID.randomUUID(); // 중복되지 않는 고유한 값
		// D:/ggomjirak/2021/07/20/hobby/main_img/uuid_메인이미지.png
		String filePath = datePath + "/" + uuid + "_" + originalFilename;
		System.out.println("filePath:" + filePath);
		File target = new File(filePath);
		FileCopyUtils.copy(fileData, target); // fileData를 target에 복사
//		boolean isImage = isImage(filePath);
//		if (isImage) {
			/*filePath =*/ makeThumbnail(filePath);
//		}
		return filePath;
	}
	
	public static String getDatePath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int date = cal.get(Calendar.DATE);
		
		String dateString = year + "/" + month + "/" + date; // 2021/07/20 
		// UPLOAD_FOLDER + dateString + uploadPath
		String datePath = GGOMJIRAK_FOLDER + uploadPath + dateString; // D:/ggomjirak/ + hobby/main_img/ + 2021/07/20 + 
		
		System.out.println("datePath:" + datePath);
		
		File f = new File(datePath);
		if (!f.exists()) {
			f.mkdirs();
		}
		
		return datePath;
	}
	
	//파일의 확장명 얻기
	private static String getExtName(String fileName) {
		int dotIndex = fileName.lastIndexOf(".");
		String ext = fileName.substring(dotIndex + 1);
		return ext.toUpperCase();
	}
	
//	//이미지파일인지 여부
//	public static boolean isImage(String fileName) {
//		String ext = getExtName(fileName);
//		if (ext.equals("JPG") || ext.equals("PNG") || ext.equals("GIF")) {
//			return true;
//		}
//		return false;
//	}
	
	// 썸네일 이미지 생성
	public static String makeThumbnail(String filePath) {
		// D:/ggomjirak/2021/07/20/hobby/main_img/uuid_메인이미지.png
		// D:/ggomjirak/2021/07/20/hobby/main_img/sm_uuid_메인이미지.png
		int slashIndex = filePath.lastIndexOf("/");
		String front = filePath.substring(0, slashIndex + 1);
		// -> D:/ggomjirak/2021/07/20/hobby/main_img/
		String rear = filePath.substring(slashIndex + 1);
		// -> uuid_메인이미지.png
		String thumbnailPath = front + "sm_" + rear;
		// -> D:/ggomjirak/2021/07/20/hobby/main_img/sm_uuid_메인이미지.png
		
		File orgFile = new File(filePath);
		File thumbFile = new File(thumbnailPath);
		
			// 이미 업로드 된 원본 파일을 메모리에 로딩
			BufferedImage srcImage = null;
			try {
				srcImage = ImageIO.read(orgFile);
			} catch (IOException e) {
				System.out.println("MyFileUploadUtil, makeThumbnail, srcImage = ImageIO.read(orgFile);");
				e.printStackTrace();
			}
			BufferedImage destImage = Scalr.resize(
					srcImage, // 원본 이미지
					Scalr.Method.AUTOMATIC, // 비율 맞추기
					Scalr.Mode.FIT_TO_HEIGHT, // 높이에 맞추기
					100); //해당 높이
			try {
				ImageIO.write(destImage, getExtName(thumbnailPath), thumbFile);
			} catch (IOException e) {
				System.out.println("MyFileUploadUtil, makeThumbnail, srcImage = ImageIO.read(orgFile);ImageIO.write(destImage, getExtName(thumbnailPath), thumbFile);");
				e.printStackTrace();
			}
			// -> 메모리상에 있는 썸네일의 이미지를 해당파일의 확장자형식을 썸네일파일에 저장

		return thumbnailPath;
	}
	
//	private static void deleteWhile(File f) {
//		while(true) {
//			if(f.exists()) {
//				boolean b = f.delete();
//				if (b) break;
//				try {
//					Thread.sleep(2000);
//				} catch (InterruptedException e) {
//					e.printStackTrace();
//				}
//			}
//		}
//	}
	
	// 첨부파일 삭제
//	public static void deleteFile(String fileName) throws Exception {
//		File f = new File(fileName) ;
//		
//		deleteWhile(f);
//		
//		if(isImage(fileName)) {
//			String[] names = fileName.split("sm_");
//			String orgFile = names[0] + names[1];
//			System.out.println("orgFile" + orgFile);
//			File f2 = new File(orgFile);
//			deleteWhile(f2);
//		}
//	}
}