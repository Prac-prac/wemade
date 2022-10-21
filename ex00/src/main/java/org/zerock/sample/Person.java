package org.zerock.sample;

public class Person {

	private String occupation;
	
	public Person(String occupation) {
		this.occupation = occupation;
	}

	public String getOccupation() {
		return occupation;
	}

	@Override
	public String toString() {
		return  occupation;
	}
	
	

}
