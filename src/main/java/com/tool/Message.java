package com.tool;

import com.model.UserEntity;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import java.util.regex.Matcher;  

import java.util.regex.Pattern; 
public class Message {
	
	//验证手机号码是否存在
	public static boolean isMobileNO(String mobiles) {
		Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0-9]))\\d{8}$");
		Matcher m = p.matcher(mobiles);
		return m.matches();
		}	
	
	public static boolean sendTel(UserEntity user, UserEntity guide, String rou_title)
	{
		Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0-9]))\\d{8}$");
		Matcher m = p.matcher(user.getUserTel());
		if(m.matches()==false)
			return false;
		m=p.matcher(guide.getUserTel());
		if(m.matches()==false)
			return false;
		String userContent=new String("【Fanfo网】您已成功购买美食路线”"+rou_title+"“，导游姓名："+guide.getUserName()+"，电话号码："+guide.getUserTel()+"。");
		String guideContent=new String("【Fanfo网】用户"+user.getUserName()+"购买了您的美食路线“"+rou_title+"”，"+"用户电话号码为："+user.getUserTel()+"。");
		String httpUrl = "http://api.smsbao.com/sms";
		StringBuffer userMsg = new StringBuffer();
		userMsg.append("u=").append("ansedon").append("&");
		userMsg.append("p=").append(md5("wsm1995")).append("&");
		userMsg.append("m=").append(user.getUserTel()).append("&");
		userMsg.append("c=").append(encodeUrlString(userContent, "UTF-8"));
		String result = request(httpUrl, userMsg.toString());
		System.out.println(result);
		
		StringBuffer guideMsg = new StringBuffer();
		guideMsg.append("u=").append("ansedon").append("&");
		guideMsg.append("p=").append(md5("wsm1995")).append("&");
		guideMsg.append("m=").append(guide.getUserTel()).append("&");
		guideMsg.append("c=").append(encodeUrlString(guideContent, "UTF-8"));
		result = request(httpUrl, guideMsg.toString());
		System.out.println(result);
		return true;
	}
	
	public static String request(String httpUrl, String httpArg) {
		BufferedReader reader = null;
		String result = null;
		StringBuffer sbf = new StringBuffer();
		httpUrl = httpUrl + "?" + httpArg;
		try {
			URL url = new URL(httpUrl);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.connect();
			InputStream is = connection.getInputStream();
			reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
			String strRead = reader.readLine();
			if (strRead != null) {
				sbf.append(strRead);
				while ((strRead = reader.readLine()) != null) {
					sbf.append("\n");
					sbf.append(strRead);
				}
			}
			reader.close();
			result = sbf.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public static String md5(String plainText) {
		StringBuffer buf = null;
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(plainText.getBytes());
			byte b[] = md.digest();
			int i;
			buf = new StringBuffer("");
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return buf.toString();
	}

	public static String encodeUrlString(String str, String charset) {
		String strret = null;
		if (str == null)
			return str;
		try {
			strret = java.net.URLEncoder.encode(str, charset);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return strret;
	}
}