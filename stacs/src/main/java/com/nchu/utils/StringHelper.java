package com.nchu.utils;

import java.math.BigInteger;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Base64;
import java.util.UUID;



/**
 * 这是一个用来操作字符串的工具类
 */
public final class StringHelper {

	public static final Charset UTF8 = Charset.forName( "UTF-8" );
	public static final Charset GBK = Charset.forName( "GBK" );
	
    protected static final Base64.Encoder ENCODER = Base64.getUrlEncoder();
    protected static final Base64.Decoder DECODER = Base64.getUrlDecoder() ;
	
	/**
	 * 判断一个字符串是否为 null 或 空串 或 空白
	 * @param source 需要判断的字符串
	 * @return 当字符串为 null 或 为 空白、空串 时返回 true
	 */
	public static final boolean empty( String source ) {
		return source == null || source.trim().isEmpty()  ;
	}
	
	/**
	 * 判断一个字符串是否不是null且不是空串、不是空白
	 * @param source 需要判断的字符串
	 * @return 当 字符串是不是null且不是空串也不是空白时返回 true
	 */
	public static final boolean notEmpty( String source ) {
		return source != null && source.trim().length() > 0 ;
	}
	
	/**
	 * 判断一个字符串变量是否为 null
	 * @param source 需要判断的字符串
	 * @return 当 字符串变量 为 null 时返回 true
	 */
	public static final boolean isNull( String source ) {
		return source == null ;
	}
	
	/**
	 * 判断一个字符串是否为 空串
	 * @param source 需要判断的字符串
	 * @return 当字符串中的值是 空串 或 空白 串时返回 true
	 */
	public static final boolean emptyString( String source ) {
		return ( source != null ) && source.length() == source.trim().length() ;
	}
	
	/**
	 * 判断一个字符串是否为 空白 串
	 * @param source 需要判断的字符串
	 * @return 当字符串中的值是 空白 串时返回 true
	 */
	public static final boolean blank( String source ){
		return ( source != null ) && source.length() > source.trim().length()  ;
	}
	
	/**
	 * 比较两个非空(不是null，不是空串、不是空白)字符串是否"相等"
	 * @param one 第一个需要比较的字符串
	 * @param theOther 另一个参与比较的字符串
	 * @return 当 两个字符串 都不为空串 且 内容完全一致 (剔除首尾空白后、大小写也一致)时返回 true
	 */
	public static final boolean equals( String one , String theOther) {
		return equals(one, theOther,true,false);
	}
	
	/**
	 * 比较两个字符串是否 "相等"
	 * @param one 参与比较的第一个字符串
	 * @param theOther 参与比较的另一个字符串
	 * @param escapeSpace 是否需要剔除首尾空白 ( true 表示需要剔除首尾空白，false 表示不剔除 )
	 * @param ignoreCase 是否忽略大小写 ( true 表示忽略大小写 ，false 表示不忽略大小写 )
	 * @return
	 */
	public static final boolean equals( String one , String theOther , boolean escapeSpace , boolean ignoreCase) {
		
		if( one == null || theOther == null ){
			return false ;
		}
		
		if( escapeSpace ){
			one = one.trim();
			theOther = theOther.trim();
		}
		
		return ignoreCase ? one.equalsIgnoreCase( theOther ) : one.equals( theOther ) ;
	}
	
	public static final String uuid() {
		// 随机产生一个 UUID 实例
		UUID uuid = UUID.randomUUID(); 
		// 获得 UUID 实例中的字符串 ( 是一个包含了 4 个 - 好的36位长度的字符串 )
		String uuidString = uuid.toString() ; 
		// 剔除 字符串中的 - 字符 (用空串替换)
		uuidString = uuidString.replace( "-", "" );
		// 将字符串全部转换成大写字母
		uuidString = uuidString.toLowerCase() ;
		return uuidString ;
	}
	
	/**
	 * 根据指定的算法名称获取对应的 "信息摘要" 对象
	 * @param algorithmName 指定的算法名称
	 * @return
	 */
	public static final MessageDigest digest( String algorithmName ){
		try {
			MessageDigest digest = MessageDigest.getInstance( algorithmName );
			return digest ;
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException( "不支持[ " + algorithmName + " ]算法" , e );
		}
	}
	
	/**
	 * 使用 MD5 加密算法对 字符串进行加密 ( 如果被加密的字符串中含有中文，则使用 UTF-8 编码处理 )
	 * @param source 需要被加密的字符串
	 * @return 返回采用 MD5 加密算法加密后的 新字符串
	 */
	public static final String encrypt( String source ) {
		return encrypt(source , MessageDigestType.MD5 , UTF8 ) ;
	}
	
	/**
	 * 使用指定的 加密算法 对字符串进行加密处理
	 * @param source 需要加密的字符串
	 * @param type 需要采用的加密算法
	 * @param cs 字符编码对象(用来将字符串转换为字节序列) ，如果参数为 null 则表示采用默认编码
	 * @return 返回采用指定加密算法加密后的字符串
	 */
	public static final String encrypt( String source ,MessageDigestType type , Charset cs ){
		if( StringHelper.empty( source ) ){
			throw new RuntimeException( "被加密的字符串不能为空" );
		}
		// 获得指定 算法名称 对应的 信息摘要对象
		MessageDigest md = digest( type.getAlgorithmName() ) ;
		// 使用指定的字符编码将字符串转换为字节序列
		byte[] bytes = null ;
		if( cs == null ) { 
			bytes = source.getBytes();
		} else { 
			bytes = source.getBytes( cs ) ;
		}
		// 使用 信息摘要对象 对字节序列 进行加密处理
		md.update( bytes );
		// 获取加密后的字节序列
		byte[] mdBytes = md.digest();
		// 采用 big-endian 将 mdBytes 中的字节转换成一个非负整数 ( 1 表示非负数 )
		BigInteger bigInt = new BigInteger( 1 , mdBytes );
		// 将 非负整数 转换成 16进制形式字符串
		return bigInt.toString(16) ;
	}

	/**
	 * 将字符序列中的所有字符全部转大写
	 * @param cs 需要转换的字符序列，可以是 String 、StringBuffer 、StringBuilder 等
	 * @return 返回转换为大写后的字符串
	 */
	public static final String upperCase( CharSequence cs ){
		
		String result = "" ;
		
		if( cs != null ) {
			
			Class<?> type = cs.getClass() ;
		
			if( type == String.class ){
				String s = (String) cs ;
				result = s.toUpperCase();
			} else if( type == StringBuffer.class ){
				StringBuffer buffer = (StringBuffer) cs;
				for( int i = 0 , n = buffer.length() ; i < n ; i++ ){
					char ch = buffer.charAt( i );
					if( isLowerCase( ch ) ) {
						buffer.deleteCharAt( i );
						buffer.insert( i ,  (char) ( ch - 32 ) );
					}
				}
				result = buffer.toString();
			} else if( type == StringBuilder.class ){
				StringBuilder builder = (StringBuilder) cs;
				for( int i = 0 , n = builder.length() ; i < n ; i++ ){
					char ch = builder.charAt( i );
					if( isLowerCase( ch ) ) {
						builder.deleteCharAt( i );
						builder.insert( i ,  (char) ( ch - 32 ) );
					}
				}
				result = builder.toString();
			} 
		}
		
		return result ;

	}
	
	/**
	 * 判断指定字符是否是小写字符
	 * @param c 需要判断的字符
	 * @return 如果被判断的字符是小写字符就返回 true
	 */
	public static final boolean isLowerCase( char c ) {
		if( c >= 'a' && c <= 'z' ){
			return true ;
		} else {
			return false ;
		}
	}
	

	@Deprecated
	protected static final String MD5(String source){
		if(source != null){
			StringBuffer md5 = new StringBuffer();
			MessageDigest md = null;
			md = digest("MD5");
			byte[] bytes = source.getBytes() ;
			System.out.println( Arrays.toString( bytes ) );
			md.update( bytes );
			byte[] mdBytes = md.digest();
			System.out.println( Arrays.toString( mdBytes ) );

			for (int i = 0; i < mdBytes.length; i++) {
				int temp;
				if (mdBytes[i] < 0) {
					temp = 256 + mdBytes[i];
				} else {
					temp = mdBytes[i];
				}
				if (temp < 16) {
					md5.append("0");
				}
				md5.append(Integer.toString(temp, 16));
			}
			return md5.toString().toUpperCase();
		}
		return null;
	}
	
	@Deprecated
	protected static String sha1(String source) {
		MessageDigest md = digest("SHA1");
		return ENCODER.encodeToString( md.digest(source.getBytes()) );
	}
	
	@Deprecated
	protected static String md524(String source ){
		MessageDigest md = digest("MD5");
		return ENCODER.encodeToString( md.digest(source.getBytes()) );
	}
	
}
