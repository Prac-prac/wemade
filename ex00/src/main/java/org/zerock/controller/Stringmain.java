package org.zerock.controller;

public class Stringmain {
	public static void main(String[] args) {
		StringForEach stringForEach = new StringForEach();
		stringForEach.setType("TC");
		
		for (String string : stringForEach.getTypeArr()) {
			System.out.println(string);
		}
		
		
	}
}
