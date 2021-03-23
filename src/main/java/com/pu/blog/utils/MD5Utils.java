package com.pu.blog.utils;

import java.math.BigInteger;
import java.security.MessageDigest;

public class MD5Utils {
	/**
	 * MD5加密,加密的结果是32位的16进制数
	 * @param source
	 * @return
	 */
	public static String getMD5Value(String source){
		try {
			//获得消息摘要算法工具类
			MessageDigest messageDigest = MessageDigest.getInstance("MD5");
			//加密的结果是十进制
			byte[] md5Source = messageDigest.digest(source.getBytes());
			//将十进制转换成十六进制
			BigInteger bigInteger = new BigInteger(1,md5Source);
			//返回加密结果
			return bigInteger.toString(16);
		} catch (Exception e) {
			e.printStackTrace();
			//出现错误，将默认值返回
			return source;
		}
	}
	
	public static void main(String[] args) {
		System.out.println(getMD5Value("123456"));
	}
}
