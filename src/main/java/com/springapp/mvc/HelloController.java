package com.springapp.mvc;

import com.springapp.mvc.models.Constants;
import com.springapp.mvc.models.MyMovie;
import me.shib.java.lib.omdb.models.SearchResult;
import me.shib.java.lib.omdb.service.OMDbService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@Controller
@RequestMapping("/")
public class HelloController {

	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		//model.addAttribute("message", "Hello world!");
		return "result";
	}

	@RequestMapping(value = "/results", method = RequestMethod.POST)
	public String someMethod(@ModelAttribute("query") String query, ModelMap model) {

		OMDbService omDbService = new OMDbService();
		SearchResult[] results = omDbService.searchContent(query);
		ArrayList<MyMovie> movies = new ArrayList<MyMovie>();

		if(results != null){
			for (int i=0; i<results.length; i++) {
				if(results[i].getType()!=null && results[i].getType().toString().equals("movie")) {
					MyMovie temp = new MyMovie(results[i].getImdbID());
					movies.add(temp);
				}
			}
		}

		model.addAttribute("results", movies);

		return "result";
	}

	@RequestMapping(value = "/movies/{imdbID}", method = RequestMethod.GET)
	public String getMovie(@PathVariable("imdbID") String imdbID, Model model){

		MyMovie movie = new MyMovie(imdbID);

		String[] queryArr = movie.getTitle().toLowerCase().split(" ");

		String query = "";
		for (String str:queryArr) {
			query = query + "+" + str;
		}

		query = query + "+" + movie.getYear();

		model.addAttribute("movie", movie);
		model.addAttribute("rarbg", Constants.rarbg);
		model.addAttribute("toloka", Constants.toloka);
		model.addAttribute("rutracker", Constants.rutracker);
		model.addAttribute("searchQuery", query);

		return "movie";
	}
}