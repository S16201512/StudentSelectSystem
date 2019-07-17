package com.nchu.utils;

public enum MessageDigestType {
	MD5("MD5"), SHA1("SHA1") , SHA224( "SHA-224" ), SHA256( "SHA-256" ) , SHA384( "SHA-384" ) , SHA512( "SHA-512" );

	private String algorithmName;

	private MessageDigestType(String algorithmName) {
		this.algorithmName = algorithmName;
	}

	public String getAlgorithmName() {
		return algorithmName;
	}

	public void setAlgorithmName(String algorithmName) {
		this.algorithmName = algorithmName;
	}

}
