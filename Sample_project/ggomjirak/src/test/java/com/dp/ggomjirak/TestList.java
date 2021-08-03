package com.dp.ggomjirak;

import java.util.ArrayList;
import java.util.List;

public class TestList {
	public static void main(String[] args) {
		List<String> list = new ArrayList<String>();
		list.add("hello");
		list.add(null);
		list.add("g");
		list.add("test");
		list.add(null);
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i) == null) {
				list.remove(i);
			}
		}
		
		System.out.println(list);
	}
}
