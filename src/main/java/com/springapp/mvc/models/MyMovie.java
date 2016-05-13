package com.springapp.mvc.models;

import com.springapp.mvc.services.OpenDbTomatoReader;
import me.shib.java.lib.omdb.models.Movie;
import me.shib.java.lib.omdb.models.OMDbContent;
import me.shib.java.lib.omdb.models.SearchResult;
import me.shib.java.lib.omdb.service.OMDbService;

/**
 * Created by Alex on 06.05.2016.
 */
public class MyMovie {
    private String title;
    private String year;
    private String imdbID;
    private int metascore;
    private String poster;
    private int tomatoes;

    public MyMovie(SearchResult searchResult){
        this.title = searchResult.getTitle();
        this.year = searchResult.getYear();
        this.imdbID = searchResult.getImdbID();
        this.poster = searchResult.getPoster();

        OMDbService service = new OMDbService();
        Movie movie = service.getContentByID(searchResult.getImdbID()).getMovie();

        if (!movie.getMetascore().equals("N/A"))
            this.metascore = Integer.parseInt(movie.getMetascore());
        else
            this.metascore = 0;

        OpenDbTomatoReader openDbTomatoReader = new OpenDbTomatoReader(imdbID);
        //this.tomatoes = openDbTomatoReader.getTomatoMeter();

        if (!openDbTomatoReader.getTomatoMeter().equals("N/A"))
            this.tomatoes = Integer.parseInt(openDbTomatoReader.getTomatoMeter());
        else
            this.tomatoes = 0;
    }

    public String getTitle() {
        return title;
    }

    public String getYear() {
        return year;
    }

    public String getImdbID() {
        return imdbID;
    }

    public int getMetascore() {
        return metascore;
    }

    public String getPoster() {
        return poster;
    }

    public int getTomatoes() {
        return tomatoes;
    }
}
