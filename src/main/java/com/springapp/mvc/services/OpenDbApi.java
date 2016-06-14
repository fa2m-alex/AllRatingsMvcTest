package com.springapp.mvc.services;

import com.springapp.mvc.models.MyMovie;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;

/**
 * Created by Alex on 19.05.2016.
 */
public class OpenDbApi {
    private static final String URL = "http://www.omdbapi.com/";
    private static final String CHARSET = "UTF-8";

    public OpenDbApi(){

    }

    public ArrayList<MyMovie> searchMovies(String searchQ){
        ArrayList<MyMovie> movies = new ArrayList<MyMovie>();

        JSONArray moviesJSON = searchMoviesJSON(searchQ);

        for(Object movie : moviesJSON){
            JSONObject temp = (JSONObject) movie;

            if(temp.getString("Type").equals("movie"))
                movies.add(getMovieById(temp.getString("imdbID")));
        }

        return movies;
    }

    private JSONArray searchMoviesJSON(String searchQ){

        String query = null;
        URLConnection connection = null;
        InputStream response = null;
        BufferedReader br = null;
        JSONObject recvObj = null;

        try {
            query = String.format("s=%s", URLEncoder.encode(searchQ, CHARSET));
            connection = new URL(URL + "?" + query).openConnection();
            connection.setRequestProperty("Accept-Charset", CHARSET);
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

        return recvObj.getJSONArray("Search");
    }

    public MyMovie getMovieById(String imdb){
        String query = null;
        URLConnection connection = null;
        InputStream response = null;
        BufferedReader br = null;
        JSONObject recvObj = null;

        try {
            query = String.format("i=%s&tomatoes=true", URLEncoder.encode(imdb, CHARSET));
            connection = new URL(URL + "?" + query).openConnection();
            connection.setRequestProperty("Accept-Charset", CHARSET);
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

        MyMovie movie = new MyMovie();
        movie.setTitle(recvObj.getString("Title"));
        movie.setAge(recvObj.getString("Rated"));
        movie.setCast(recvObj.getString("Rated"));
        movie.setCountry(recvObj.getString("Country"));
        movie.setDirector(recvObj.getString("Director"));
        movie.setGenre(recvObj.getString("Genre"));
        movie.setImdbID(imdb);
        movie.setImdbRating(recvObj.getString("imdbRating"));
        movie.setPlot(recvObj.getString("Plot"));
        movie.setPoster(recvObj.getString("Poster"));
        movie.setReleased(recvObj.getString("Released"));
        movie.setRuntime(recvObj.getString("Runtime"));
        movie.setYear(recvObj.getString("Year"));

        if (!recvObj.getString("Metascore").equals("N/A"))
            movie.setMetascore(Integer.parseInt(recvObj.getString("Metascore")));
        else
            movie.setMetascore(0);

        if (!recvObj.getString("tomatoMeter").equals("N/A"))
            movie.setTomatoes(Integer.parseInt(recvObj.getString("tomatoMeter")));
        else
            movie.setTomatoes(0);

        return movie;
    }
}
