package com.green.domain;

public class DataVo {
	private  String  a;
	private  int     b;
	public String getA() {
		return a;
	}
	public void setA(String a) {
		this.a = a;
	}
	public int getB() {
		return b;
	}
	public void setB(int b) {
		this.b = b;
	}
	@Override
	public String toString() {
		return "DataVo [a=" + a + ", b=" + b + "]";
	}	
}
