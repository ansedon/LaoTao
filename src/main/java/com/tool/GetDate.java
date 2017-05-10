package com.tool;
import java.io.IOException;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Date;
public class GetDate {
    public static Date getNetworkTime(String webUrl) {
        try {
            URL url = new URL(webUrl);
            URLConnection conn = url.openConnection();
            conn.connect();
            long dateL = conn.getDate();
            Date date = new Date(dateL);
            return date;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
