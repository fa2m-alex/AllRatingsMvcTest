package com.springapp.mvc.services;

import org.json.JSONObject;

import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

/**
 * Created by Alex on 13.05.2016.
 */
public class OpenDbTomatoReader {
    private String imdbID;
    private String tomatoMeter;

    public String getTomatoMeter() {
        return tomatoMeter;
    }

    public OpenDbTomatoReader(String imdbID){
        this.imdbID = imdbID;
        this.tomatoMeter = getTomatoByImdb(imdbID);
    }

    private String getTomatoByImdb(String imdbID) {

        String url = "http://www.omdbapi.com/";
        String charset = "UTF-8";

        String query = null;
        URLConnection connection = null;
        InputStream response = null;
        BufferedReader br = null;
        JSONObject recvObj = null;

        try {
            query = String.format("i=%s&tomatoes=true", URLEncoder.encode(imdbID, charset));
            connection = new URL(url + "?" + query).openConnection();
            connection.setRequestProperty("Accept-Charset", charset);
            response = connection.getInputStream();

            br = new BufferedReader(new InputStreamReader(response));

            String line;
            StringBuilder sb = new StringBuilder();
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }

            recvObj = new JSONObject(sb.toString());

            response.close();
            br.close();

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return recvObj.getString("tomatoMeter");
    }
}
