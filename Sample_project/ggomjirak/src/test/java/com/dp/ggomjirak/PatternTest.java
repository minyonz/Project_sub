package com.dp.ggomjirak;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PatternTest {
	public static void main(String[] args) {
		System.out.println(getYoutubeV("https://www.youtube.com/watch?v=SPOiFpF51fM"));
		System.out.println(getYoutubeV("https://youtu.be/voceyAq-R9E"));
		System.out.println(getYoutubeV("https://www.youtube.com/embed/f7dWJcJgEjE"));
		System.out.println(getYoutubeV("https://youtu.be/watch?v=DKbQFMOEFTs"));
		System.out.println(getYoutubeV("https://m.youtube.com/watch?v=J-Ou2I_D0cE"));
		
			
			
			
	}
	
	private static String getYoutubeV(String url) {
		String youtube = 
				"(?:https?:\\/\\/(?:[a-z]+.)?)(?:youtu\\.?be(?:\\.com)?\\/)(?:embed\\/)?(?:(?:(?:(?:watch\\?)?(?:time_continue=(?:[0-9]+))?.+v=)?([a-zA-Z0-9_-]+))(?:\\?t\\=(?:[0-9a-zA-Z]+))?)";
		Pattern youtubePattern = Pattern.compile(youtube);
		Matcher matcher = youtubePattern.matcher(url);
		if (matcher.matches()) {
			return matcher.group(1);
		}
		return null;
	}
}
