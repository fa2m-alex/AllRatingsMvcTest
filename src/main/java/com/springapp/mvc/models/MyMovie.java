package com.springapp.mvc.models;

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

    public MyMovie(SearchResult searchResult){
        //if(searchResult.getType().equals("movie")){
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
        //}
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
}
