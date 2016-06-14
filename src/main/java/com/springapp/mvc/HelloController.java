package com.springapp.mvc;

import com.springapp.mvc.models.Constants;
import com.springapp.mvc.models.MyMovie;
import com.springapp.mvc.services.OpenDbApi;
import me.shib.java.lib.omdb.models.SearchResult;
import me.shib.java.lib.omdb.service.OMDbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@Controller
@RequestMapping("/")
public class HelloController {

	@Autowired
	private OpenDbApi openDbApi;

	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		//model.addAttribute("message", "Hello world!");
		return "result";
	}

	@RequestMapping(value = "/results", method = RequestMethod.POST)
	public String searchMovies(@ModelAttribute("query") String query, ModelMap model) {

		model.addAttribute("results", openDbApi.searchMovies(query));

		return "result";
	}

	@RequestMapping(value = "/movies/{imdbID}", method = RequestMethod.GET)
	public String getMovie(@PathVariable("imdbID") String imdbID, Model model){

		MyMovie movie = openDbApi.getMovieById(imdbID);

		String query = movie.getTitle();
		query = query + " " + movie.getYear();

		model.addAttribute("movie", movie);
		model.addAttribute("rarbg", Constants.rarbg);
		model.addAttribute("toloka", Constants.toloka);
		model.addAttribute("rutracker", Constants.rutracker);
		model.addAttribute("kickass", Constants.kickass);
		model.addAttribute("subscene", Constants.subscene);
		model.addAttribute("searchQuery", query);

		return "movie";
	}
}