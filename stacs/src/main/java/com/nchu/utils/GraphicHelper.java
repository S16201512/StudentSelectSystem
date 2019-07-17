package com.nchu.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;

/**
 * 这是一个 与图形、图像 有关的工具类
 */
public final class GraphicHelper {

	public static void main(String[] args) throws Exception {
		create( 4 , true , 180 , 50 , new FileOutputStream( "character.jpg" )  , 30);
		create( 6 , false , 180 , 50 , new FileOutputStream( "letter.jpg" )  , 30 );
	}

	/** 声明并创建一个随机数产生器 */
	private static final Random RANDOM = new Random();
	/** 声明并创建一个颜色数组，用于随机选取颜色 */
	private static final Color[] COLORS = { Color.BLUE,Color.GRAY,Color.GREEN,Color.RED, Color.BLACK,Color.ORANGE,Color.CYAN };
	/** 声明一个汉字字典，用来随机产生汉字验证码 */
	private static final String DICTIONARY = "\u65f6\u7ef4\u4e5d\u6708\u5e8f\u5c5e\u4e09\u79cb\u6f66\u6c34\u5c3d\u800c\u5bd2\u6f6d\u6e05\u70df\u5149\u51dd\u800c\u66ae\u5c71\u7d2b\u4fe8\u9a96\u9a11\u4e8e\u4e0a\u8def\u8bbf\u98ce\u666f\u4e8e\u5d07\u963f\u4e34\u5e1d\u5b50\u4e4b\u957f\u6d32\u5f97\u5929\u4eba\u4e4b\u65e7\u9986\u5c42\u5ce6\u8038\u7fe0\u4e0a\u51fa\u91cd\u9704\u98de\u9601\u6d41\u4e39\u4e0b\u4e34\u65e0\u5730\u9e64\u6c40\u51eb\u6e1a\u7a77\u5c9b\u5c7f\u4e4b\u8426\u56de\u6842\u6bbf\u5170\u5bab\u5373\u5188\u5ce6\u4e4b\u4f53\u52bf" ;
	/** 声明并创建一个字符缓冲区 */
	private static final StringBuffer BUFFER = new StringBuffer();
	/** 声明并指定 180 度对应的浮点数 */
	private static final double DEGREES = Math.PI / 180 ;
	/** 指定默认的英文字体 */
	private static final Font ENGLISH_FONT = new Font("Comic Sans MS",Font.BOLD,30) ;
	/** 指定默认的中文字体 */
	private static final Font SINAEAN_FONT = new Font("宋体",Font.BOLD,30) ;


	/**
	 * 以字符串形式返回生成的验证码，同时输出一个图片
	 * @param n 字符个数
	 * @param isSinaean 所产生验证码是否为中文字符 ( true 表示中文字符，false 表示字符英文 )
	 * @param width 图片的宽度
	 * @param height 图片的高度
	 * @param output 图片的输出流(图片将输出到这个流中)
	 * @param interfere 干扰线个数
	 * @return 返回所生成的验证码(由英文字符组成的字符串)
	 */
	public static final String create( final int n , boolean isSinaean , final int width,final int height , OutputStream output , final int interfere ){
		// 创建"画板"
		BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
		// 获取"画笔"
		Graphics graphic = image.getGraphics();
		// 设置"画板"背景色
		graphic.setColor(Color.getColor("F8F8F8"));
		// 填充整个"画板"
		graphic.fillRect(0,0,width,height);
		// 绘制干扰线
		drawRandomLine( graphic , width , height , 30 , interfere );
		
		// 设置字体样式( 中文验证码使用 SINAEAN_FONT ，英文验证码使用 ENGLISH_FONT )
		graphic.setFont( isSinaean ? SINAEAN_FONT : ENGLISH_FONT );
		
		String code = isSinaean ? characters(n) : letters(n) ;
		
		// 绘制字符
		drawCharacters( graphic , width , height );
		
		try{
			ImageIO.write(image,"JPEG",output);
		}catch(IOException e){
			e.printStackTrace();
		}
		return code ;
	}

	/**
	 * 专门用来绘制干扰线条的方法
	 * @param graphic 画笔
	 * @param width 画板宽度
	 * @param height 画板高度
	 * @param length 线条的水平长度或竖直长度
	 * @param n 线条数目
	 */
	private static final void drawRandomLine( final Graphics graphic ,final int width , final int height , final int length , final int  n ) {
		// 在 "画板"上生成干扰线条
		for (int i = 0; i < n ; i++) {
			graphic.setColor(COLORS[RANDOM.nextInt(COLORS.length)]);
			final int x = RANDOM.nextInt(width);
			final int y = RANDOM.nextInt(height);
			final int w = RANDOM.nextInt(length);
			final int h = RANDOM.nextInt(length);
			final int signA = RANDOM.nextBoolean() ? 1 : -1;
			final int signB = RANDOM.nextBoolean() ? 1 : -1;
			graphic.drawLine(x, y, x + w * signA, y + h * signB);
		}
	}
	
	/**
	 * 将字符缓冲区中的字符"绘制"到画板上
	 * @param graphic 画笔
	 * @param width 画板宽度
	 * @param height 画板高度
	 * @return
	 */
	private static final String drawCharacters( final Graphics graphic ,final int width , final int height ){
		String s = "" ;
		Graphics2D g = (Graphics2D) graphic ;
		// 获取字符个数
		final int n = BUFFER.length();
		// 以"画板"高度的六分之一为图片内边距(每条边)
		final int padding = height / 6 ;
		// 计算每个字符所占的宽度
		final int w = ( width - padding * 2 ) / n ;
		// 计算每个字符所占的高度
		final int h = height - padding * 2 ;
		// 计算单个字所占宽度的中心位置(水平)
		final int m = w / 2 ;
		// 每个字符所占高度的一半即为中心位置
		final int y = h / 2 ;
		//在 "画板"上绘制字母
		for( int i = 0 ; i < n ; i++ ){
			// 获取单个字符
			char temp = BUFFER.charAt( i ) ;
			// 随机选择一个颜色设置为当前字符的颜色
			g.setColor(COLORS[RANDOM.nextInt(COLORS.length)]);
			// 计算即将显示的字符的中心位置(水平)
			int x = padding + w * ( i + 1 ) - m ; 
			// 设置字体旋转角度
            double deg = RANDOM.nextInt() % 30 * DEGREES ;
            // 正向角度
            g.rotate( deg , x ,  y );
			// 绘制字符
			g.drawString( temp + "" ,  padding + w * i , h );
			// 反向角度
            g.rotate( -deg , x , y );
		}
		g.dispose();
		s = BUFFER.toString() ;
		return s ;
	}
	
	/**
	 * @param n 指定所产生的字符个数
	 * @return 返回验证码字符串
	 */
	private static final String letters( final int n ){
		BUFFER.setLength( 0 );
		for( int i = 0 ; i < n  ; i++ ){
			int s = RANDOM.nextBoolean() ? 'A' : 'a' ;
			int x = RANDOM.nextInt( 26 );
			char ch = (char)( s + x );
			boolean notExists = true ;
			// 检查本次产生的字符在字符缓冲区中是否存在
			for( int j = 0 ; j < i ; j++ ) {
				char t = BUFFER.charAt( j ) ;
				if( t == ch ) {
					notExists = false ;
					break ;
				}
			}
			if( notExists ) {
				BUFFER.append( ch );
			} else {
				i-- ;
			}
		}
		return BUFFER.toString() ;
	}
	
	/**
	 * @param n 指定所产生的字符个数
	 * @return 返回验证码字符串
	 */
	private static final String characters( final int n ){
		BUFFER.setLength( 0 );
		for( int i = 0 ; i < n ; i++ ){
			char ch = DICTIONARY.charAt( RANDOM.nextInt( DICTIONARY.length() ) );
			boolean notExists = true ;
			// 检查本次产生的字符在字符缓冲区中是否存在
			for( int j = 0 ; j < i ; j++ ) {
				char t = BUFFER.charAt( j ) ;
				if( t == ch ) {
					notExists = false ;
					break ;
				}
			}
			if( notExists ) {
				BUFFER.append( ch );
			} else {
				i-- ;
			}
		}
		return BUFFER.toString() ;
	}
	
	protected static final void gbk(final int width,final int height,final String imgType,OutputStream output) throws IOException{
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);
        Graphics g=image.getGraphics();
        Random randome = new Random();
        Font myFont = new Font("宋体",Font.ITALIC,26);
        g.fillRect(0, 0, width, height);
        g.setFont(myFont);
        String sRand = "";
        String ctmp = "";
        for(int i=0;i<4;i++){
             
            String[] rBase={"0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"};
            int r1=randome.nextInt(3)+11;
            String str_r1=rBase[r1];
            int r2;
            if(r1==13){
                r2=randome.nextInt(7);
            }else{
                r2=randome.nextInt(16);
            }
            String str_r2=rBase[r2];
            int r3=randome.nextInt(6)+10;
            String str_r3=rBase[r3];
            int r4;
            if(r3==10){
                r4=randome.nextInt(15)+1;
            }else if(r3==15){
                r4=randome.nextInt(15);
            }else{
                r4=randome.nextInt(16);
            }
            String str_r4=rBase[r4];
            byte[] bytes = new byte[2];
            String r12=str_r1+str_r2;
            int tempLow=Integer.parseInt(r12, 16);
            bytes[0]=(byte) tempLow;
            String r34=str_r3+str_r4;
            int tempHeigh=Integer.parseInt(r34, 16);
            bytes[1]=(byte) tempHeigh;
            ctmp=new String(bytes , "GBK");
            sRand+=ctmp;
            Color color = new Color(20+randome.nextInt(110));
            g.setColor(color);
            g.drawString(ctmp, width/6*i+23, height/3);
             
        }
        g.dispose();
        System.out.println( sRand );
        ImageIO.write(image, imgType, output );
	}

}
