package team.dlrow.foodstore.util;

import java.io.UnsupportedEncodingException;
import org.apache.tomcat.util.codec.binary.Base64;
/**
 * @author dlrow
 * @date 2018年12月24日
 * 
 * 
 */
public class CookieEncryptTool {
	public static String encodeBase64(String cleartext){
		try {
			cleartext = new String(Base64.encodeBase64(cleartext.getBytes("UTF-8")));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return cleartext;
	}
	public static String decodeBase64(String ciphertext){
		try {
			ciphertext = new String(Base64.decodeBase64(ciphertext.getBytes()),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return ciphertext;
	}
}