package com.epam.lab.buyit.controller.security;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.log4j.Logger;

public class MD5Encryptor {
	private static final Logger LOGGER = Logger.getLogger(MD5Encryptor.class);
	
	public static String encrypt(String password) {
		try {
			MessageDigest messageDigest = MessageDigest.getInstance("MD5");
			messageDigest.update(password.getBytes());
	        byte byteData[] = messageDigest.digest();
	 
	        StringBuffer encrypted = new StringBuffer();
	        for (int i = 0; i < byteData.length; i++) {
	        	encrypted.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
	        }
	    	return encrypted.toString();
		} catch (NoSuchAlgorithmException e) {
			LOGGER.error(e);
		}
		return password;
	}

}
