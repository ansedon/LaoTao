package com.tool;

import java.util.List;

public class StringUtil {
	public static String listToString(List list, char separator){
		StringBuilder sb = new StringBuilder();
		sb.append(list.get(0)).append(separator);
		
		return sb.toString().substring(0,sb.toString().length()-1);
	}

}