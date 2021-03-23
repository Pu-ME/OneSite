package com.pu.blog.exception;

public class MeException extends Exception{

	private static final long serialVersionUID = 1L;
	//异常信息
	public String message;

	public MeException() {
		super();
	}

	public MeException(String message) {
		super();
		this.message = message;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
