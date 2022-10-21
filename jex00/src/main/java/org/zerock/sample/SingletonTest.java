package org.zerock.sample;

public class SingletonTest {
	public static void main(String[] args) {
		System.out.println(Singleton.singletonObject);
		System.out.println(Singleton.getInstance());
		Singleton.singletonObject=null;
		System.out.println(Singleton.singletonObject);
	}
}
