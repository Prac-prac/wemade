package org.zerock.controller;

public class StringForEach {
	
	private String type;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
		
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}

}
