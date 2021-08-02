package com.dp.ggomjirak.yj.util;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class UrlOGTag {
	private String url;
	private String title;
	private String image;
	private String desc;
	private int status;
	private static final int NOT_FOUND = 0;
	private static final int SUCCESS = 1;
	
	public UrlOGTag() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public UrlOGTag(String url) {
	  try {
		  	url = restructureUrl(url);
	        Connection con = Jsoup.connect(url);
	        Document doc = con.get();
	        Elements ogTags = doc.select("meta[property^=og:]");
	        if (ogTags.size() <= 0) {
	        	System.out.println("ogTag못찾음");
	        	this.status = NOT_FOUND;
	        	this.url = url;
	        } else {
	        	 this.status = SUCCESS;
	        	 for (int i = 0; i < ogTags.size(); i++) {
	 	            Element tag = ogTags.get(i);
	 	            String text = tag.attr("property");
	 	            if ("og:url".equals(text)) {
	 	            	this.url = tag.attr("content");
	 	            } else if ("og:image".equals(text)) {
	 	            	this.image = tag.attr("content");
	 	            } else if ("og:description".equals(text)) {
	 	            	this.desc = tag.attr("content");
	 	            } else if ("og:title".equals(text)) {
	 	            	this.title = tag.attr("content");
	 	            }
	 	        }
	        }
	       
	    } catch (Exception e) {
	    	e.printStackTrace();
	    	this.status = NOT_FOUND;
        	this.url = url;
	    }
	}
	public static void main(String[] args) {
		System.out.println(restructureUrl("https://blog.naver.com/psj9102/221203659771"));
		System.out.println(restructureUrl("https://m.blog.naver.com/psj9102/221203659771"));
		System.out.println(restructureUrl("https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=psj9102&logNo=221203659771"));
		System.out.println(restructureUrl("https://m.blog.naver.com/PostView.naver?blogId=psj9102&logNo=221203659771"));
		System.out.println(restructureUrl("https://blog.naver.com/PostView.naver?blogId=psj9102&logNo=221203659771"));
	}
	
	private static String restructureUrl(String url) {
		String naverBlog = 
				"^(https?:\\/\\/)(m\\.blog\\.naver\\.com\\/|blog\\.naver\\.com\\/)(.*)(\\/)(.*)";
		Pattern naverBlogPattern = Pattern.compile(naverBlog);
		Matcher matcher = naverBlogPattern.matcher(url);
		if (matcher.matches()) {
			url = matcher.group(1) + matcher.group(2) 
			+ "PostView.nhn?blogId=" + matcher.group(3)
					+ "&logNo=" + matcher.group(5);
		}
		
		return url;
	}

	public UrlOGTag(String url, String title, String image, String desc) {
		super();
		this.url = url;
		this.title = title;
		this.image = image;
		this.desc = desc;
	}


	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public String getDesc() {
		return desc;
	}


	public void setDesc(String desc) {
		this.desc = desc;
	}


	@Override
	public String toString() {
		return "UrlOGTag [url=" + url + ", title=" + title + ", image=" + image + ", desc=" + desc + "]";
	}
	

	
	
	
	
}
