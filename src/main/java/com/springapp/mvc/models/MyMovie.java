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
    private String imdbRating;

    private String plot;
    private String director;
    private String cast;
    private String released;
    private String age;
    private String country;
    private String runtime;
    private String genre;

    public MyMovie(String imdbID){

        this.imdbID = imdbID;

        OMDbService service = new OMDbService();
        Movie movie = service.getContentByID(imdbID).getMovie();

        if (!movie.getMetascore().equals("N/A"))
            this.metascore = Integer.parseInt(movie.getMetascore());
        else
            this.metascore = 0;

        this.title = movie.getTitle();
        this.year = movie.getYear();
        this.poster = movie.getPoster();
        this.imdbRating = movie.getImdbRating();

        this.plot = movie.getPlot();
        this.director = movie.getDirector();
        this.cast = movie.getActors();
        this.released = movie.getReleased();
        this.age = movie.getRated();
        this.country = movie.getCountry();
        this.runtime = movie.getRuntime();
        this.genre = movie.getGenre();

        OpenDbTomatoReader openDbTomatoReader = new OpenDbTomatoReader(imdbID);

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

    public String getPlot() {
        return plot;
    }

    public String getDirector() {
        return director;
    }

    public String getCast() {
        return cast;
    }

    public String getReleased() {
        return released;
    }

    public String getAge() {
        return age;
    }

    public String getCountry() {
        return country;
    }

    public String getRuntime() {
        return runtime;
    }

    public String getGenre() {
        return genre;
    }

    public String getImdbRating() {
        return imdbRating;
    }
}
